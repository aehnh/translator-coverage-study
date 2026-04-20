#!/usr/bin/env python3

from __future__ import annotations

import argparse
import os
import re
import shlex
import subprocess
import sys
from pathlib import Path

from count_xed_instructions import load_instruction_iforms


DEFAULT_RUNTIME_CPP = {
    "2026": Path("external/remill/lib/Arch/X86/Runtime/Instructions.cpp"),
    "2020-03": Path("external/remill_2020/remill/Arch/X86/Runtime/Instructions.cpp"),
}

ISEL_RE = re.compile(r'extern\s+"C"\s+constexpr\s+auto\s+ISEL_([A-Za-z0-9_]+)\b')

IGNORED_INTERNAL_IFORMS = {
    "INVALID_INSTRUCTION",
    "UNSUPPORTED_INSTRUCTION",
    "CALL_POP_FUSED_32",
    "CALL_POP_FUSED_64",
}

MNEMONIC_ALIASES = {
    "CMOVE": "CMOVZ",
    "CMOVNE": "CMOVNZ",
    "SETE": "SETZ",
    "JAE": "JNB",
    "JNAE": "JB",
    "JE": "JZ",
    "JNE": "JNZ",
    "JNA": "JBE",
    "JPE": "JP",
    "JPO": "JNP",
    "JNGE": "JL",
    "JNG": "JLE",
    "JNL": "JGE",
    "JNLE": "JG",
}

TOKEN_REPLACEMENTS = {
    "VGPR32d": "GPR32d",
    "VGPR64q": "GPR64q",
    "XMMpd": "XMMxuq",
    "MEMpd": "MEMxuq",
    "XMMps": "XMMxud",
    "MEMps": "MEMxud",
    "YMMdd": "YMMqq",
    "MEMdd": "MEMqq",
}

SPECIAL_CASE_MAP = {
    "FADD_ST0_MEMm64real": "FADD_MEMm64real",
    "FADD_ST0_MEMmem32real": "FADD_MEMmem32real",
    "LDDQU_XMMdq_MEMdq": "LDDQU_XMMpd_MEMdq",
    "VLDDQU_XMMpd_MEMdq": "VLDDQU_XMMdq_MEMdq",
    "VLDDQU_YMMdd_MEMdd": "VLDDQU_YMMqq_MEMqq",
    "VMOVHLPS_XMMdq_XMMq_XMMq": "VMOVHLPS_XMMdq_XMMdq_XMMdq",
    "VMOVLHPS_XMMdq_XMMdq_XMMdq": "VMOVLHPS_XMMdq_XMMq_XMMq",
    "MOV_GPR8_IMMb_D0": "MOV_GPR8_IMMb_B0",
}


def repo_root() -> Path:
    return Path(__file__).resolve().parents[1]


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Calculate Remill x86-64 iform coverage from the Remill repositories."
    )
    parser.add_argument(
        "--snapshot",
        choices=tuple(DEFAULT_RUNTIME_CPP),
        action="append",
        help="Limit output to one or more snapshots. Defaults to both.",
    )
    parser.add_argument(
        "--cxx",
        default=os.environ.get("CXX", "c++"),
        help="C++ compiler/preprocessor command to use.",
    )
    parser.add_argument(
        "--show-command",
        action="store_true",
        help="Print the preprocessor command before running it.",
    )
    return parser.parse_args()


def remill_root_for_runtime(runtime_cpp: Path) -> Path:
    for parent in runtime_cpp.parents:
        if (parent / "include").is_dir():
            return parent
        if (parent / "remill").is_dir() and runtime_cpp.is_relative_to(parent / "remill"):
            return parent
    raise ValueError(f"could not infer Remill repository root from {runtime_cpp}")


def build_preprocess_command(runtime_cpp: Path, cxx: str) -> list[str]:
    remill_root = remill_root_for_runtime(runtime_cpp)
    return [
        cxx,
        "-std=c++17",
        "-E",
        "-P",
        "-DADDRESS_SIZE_BITS=64",
        f"-I{remill_root}",
        f"-I{remill_root / 'include'}",
        str(runtime_cpp),
    ]


def preprocess(runtime_cpp: Path, cxx: str, show_command: bool) -> str:
    command = build_preprocess_command(runtime_cpp, cxx)
    if show_command:
        print("Running:", shlex.join(command), file=sys.stderr)
    result = subprocess.run(command, check=False, capture_output=True, text=True)
    if result.returncode != 0:
        if result.stdout:
            sys.stderr.write(result.stdout)
        if result.stderr:
            sys.stderr.write(result.stderr)
        raise RuntimeError(f"preprocessor failed for {runtime_cpp}")
    return result.stdout


def extract_iform_names(preprocessed_text: str) -> list[str]:
    return sorted(set(ISEL_RE.findall(preprocessed_text)))


def replace_mnemonic_alias(name: str) -> str | None:
    parts = name.split("_", 1)
    alias = MNEMONIC_ALIASES.get(parts[0])
    if alias is None:
        return None
    if len(parts) == 1:
        return alias
    return f"{alias}_{parts[1]}"


def apply_token_replacements(name: str) -> str:
    result = name
    for old, new in TOKEN_REPLACEMENTS.items():
        result = result.replace(old, new)
    return result


def apply_pattern_special_cases(name: str) -> str | None:
    if re.fullmatch(r"MOV_CR_CR_GPR(?:32|64)_CR[0-9]+", name):
        return re.sub(r"_CR[0-9]+$", "", name)
    if re.fullmatch(r"MOV_SEG_(?:GPR16|MEMw)_[A-Z]{2}", name):
        return re.sub(r"_[A-Z]{2}$", "", name)
    if re.fullmatch(r"MOVSXD_GPRv_GPR(?:32|z)_(?:32|64)", name):
        return "MOVSXD_GPRv_GPRz"
    if name == "MOVSXD_GPR64_MEMd" or re.fullmatch(r"MOVSXD_GPRv_MEMd_(?:32|64)", name):
        return "MOVSXD_GPR64_MEMd"
    if re.fullmatch(r"MOVSXD_GPRv_MEMz_64", name):
        return "MOVSXD_GPRz_MEMz"
    if re.fullmatch(r"POP_GPRv_51_(?:16|64)", name):
        return "POP_GPRv_58"
    if re.fullmatch(r"POP_MEM_XSP_(?:16|64)", name):
        return "POP_MEMv"
    if re.fullmatch(r"NOP_GPRv_GPRv_0F1F_(?:8|16|32|64)", name):
        return "NOP_GPRv_0F1F"
    if re.fullmatch(r"NOP_MEMv_GPRv_0F1F_(?:8|16|32|64)", name):
        return "NOP_MEMv_0F1F"
    if re.fullmatch(r"MOV_MEMv_GPRv_8B_(?:8|16|32|64)", name):
        return "MOV_MEMv_GPRv"
    return None


def normalization_candidates(name: str) -> set[str]:
    candidates = {name}

    special = SPECIAL_CASE_MAP.get(name)
    if special is not None:
        candidates.add(special)

    pattern_special = apply_pattern_special_cases(name)
    if pattern_special is not None:
        candidates.add(pattern_special)

    alias = replace_mnemonic_alias(name)
    if alias is not None:
        candidates.add(alias)

    if re.fullmatch(r"MOVSXD_GPRv_MEMd_(?:32|64)", name):
        candidates.update({"MOVSXD_GPR64_MEMd", "MOVSXD_GPRv_MEMz", "MOVSXD_GPRz_MEMz"})
    if re.fullmatch(r"MOVSXD_GPRv_MEMz_64", name):
        candidates.update({"MOVSXD_GPRv_MEMz", "MOVSXD_GPRz_MEMz"})

    expanded = set(candidates)
    for candidate in list(expanded):
        replaced = apply_token_replacements(candidate)
        expanded.add(replaced)
        alias = replace_mnemonic_alias(candidate)
        if alias is not None:
            expanded.add(apply_token_replacements(alias))

    for candidate in list(expanded):
        match = re.fullmatch(r"(.*)_(8|16|32|64)", candidate)
        if match:
            expanded.add(match.group(1))

    return expanded


def normalize_to_xed_to_xml_iforms(raw_iforms: list[str], xed_iforms: set[str]) -> tuple[dict[str, str], list[str]]:
    matched: dict[str, str] = {}
    unmatched: list[str] = []

    for raw_name in raw_iforms:
        if raw_name in IGNORED_INTERNAL_IFORMS:
            continue

        normalized = None
        for candidate in sorted(normalization_candidates(raw_name)):
            if candidate in xed_iforms:
                normalized = candidate
                break

        if normalized is None:
            unmatched.append(raw_name)
        else:
            matched[raw_name] = normalized

    return matched, sorted(unmatched)


def coverage_summary(snapshot_name: str, cxx: str, show_command: bool) -> dict[str, object]:
    runtime_cpp = repo_root() / DEFAULT_RUNTIME_CPP[snapshot_name]
    if not runtime_cpp.is_file():
        raise FileNotFoundError(f"missing Remill runtime file: {runtime_cpp}")

    xed_iforms = load_instruction_iforms(snapshot_name)
    preprocessed = preprocess(runtime_cpp, cxx, show_command)
    raw_iforms = extract_iform_names(preprocessed)
    matched, unmatched = normalize_to_xed_to_xml_iforms(raw_iforms, xed_iforms)
    supported_iforms = set(matched.values())

    return {
        "snapshot": snapshot_name,
        "raw_remill_iforms": len(raw_iforms),
        "matched_raw_iforms": len(matched),
        "unmatched_raw_iforms": len(unmatched),
        "supported_iforms": len(supported_iforms),
        "total_iforms": len(xed_iforms),
        "coverage_percent": (len(supported_iforms) / len(xed_iforms)) * 100.0 if xed_iforms else 0.0,
    }


def main() -> int:
    args = parse_args()
    snapshots = args.snapshot or ["2020-03", "2026"]

    for snapshot_name in snapshots:
        summary = coverage_summary(snapshot_name, args.cxx, args.show_command)
        print(
            f"{summary['snapshot']}: {summary['supported_iforms']} / {summary['total_iforms']} "
            f"x86-64 iforms covered ({summary['coverage_percent']:.2f}%)"
        )
        print(
            f"  Remill raw iforms: {summary['raw_remill_iforms']}, matched after normalization: "
            f"{summary['matched_raw_iforms']}, unmatched: {summary['unmatched_raw_iforms']}"
        )

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
