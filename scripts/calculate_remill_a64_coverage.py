#!/usr/bin/env python3

from __future__ import annotations

import argparse
import re
from pathlib import Path

from count_asl_instructions import load_a64_variants


DEFAULT_ARCH_ROOTS = {
    "2026": Path("external/remill/lib/Arch/AArch64"),
    "2020-03": Path("external/remill_2020/remill/Arch/AArch64"),
}

ISEL_RE = re.compile(r"DEF_ISEL\(([A-Za-z0-9_]+)\)")
TRAILING_VECTOR_SUFFIX_RE = re.compile(r"_(?:16b|8b|4b|4h|8h|2h|4s|2s|1s|2d|1d|1q)$")
IGNORED_INTERNAL_VARIANTS = {
    "unsupported_instruction",
    "invalid_instruction",
}


def repo_root() -> Path:
    return Path(__file__).resolve().parents[1]


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Calculate Remill A64 coverage against ASL instruction variants."
    )
    parser.add_argument(
        "--snapshot",
        choices=tuple(DEFAULT_ARCH_ROOTS),
        action="append",
        help="Limit output to one or more snapshots. Defaults to both.",
    )
    return parser.parse_args()


def extract_remill_a64_variants(arch_root: Path) -> list[str]:
    files = [arch_root / "Runtime" / "Instructions.cpp"]
    files.extend(sorted((arch_root / "Semantics").glob("*.cpp")))

    variants: set[str] = set()
    for path in files:
        if not path.is_file():
            raise FileNotFoundError(f"missing Remill AArch64 source file: {path}")
        variants.update(ISEL_RE.findall(path.read_text(encoding="utf-8")))

    return sorted(variants)


def normalization_candidates(name: str) -> set[str]:
    lowered = name.lower()
    candidates = {lowered}

    if re.fullmatch(r"b_only_condbranch_[a-z]+", lowered):
        candidates.add("b_only_condbranch")

    if re.fullmatch(r"tbnz_only_testbranch_(?:32|64)", lowered):
        candidates.add("tbnz_only_testbranch")
    if re.fullmatch(r"tbz_only_testbranch_(?:32|64)", lowered):
        candidates.add("tbz_only_testbranch")

    if lowered == "dmb_bo_system":
        candidates.add("dmb_bo_barriers")

    if lowered.startswith("hint_"):
        candidates.add("hint_hm_hints")

    if lowered in {"nop", "nop_hi_system"}:
        candidates.update({"nop_hi_hints", "hint_hm_hints"})

    if re.fullmatch(r"ins_asimdins_ir_r_[bdhs]", lowered):
        candidates.add("ins_asimdins_ir_r")

    if re.fullmatch(r"smov_asimdins_[wx]_[wx]_[bhs]", lowered):
        if "_x_x_" in lowered:
            candidates.add("smov_asimdins_x_x")
        candidates.add("smov_asimdins_w_w")

    if re.fullmatch(r"umov_asimdins_[wx]_[wx]_[bhsd]", lowered):
        if "_x_x_" in lowered:
            candidates.add("umov_asimdins_x_x")
        candidates.add("umov_asimdins_w_w")

    if re.fullmatch(r"mrs_rs_system_[a-z0-9_]+", lowered):
        candidates.add("mrs_rs_systemmove")
    if re.fullmatch(r"msr_sr_system_[a-z0-9_]+", lowered):
        candidates.add("msr_sr_systemmove")

    if re.fullmatch(r"ldar[bh]?_lr(?:32|64)_ldstexcl", lowered):
        candidates.add(lowered.replace("_ldstexcl", "_ldstord"))
    if re.fullmatch(r"stlr_sl(?:32|64)_ldstexcl", lowered):
        candidates.add(lowered.replace("_ldstexcl", "_ldstord"))
    if re.fullmatch(r"ld(?:xr|axr|xrb|axrb|xrh|axrh)_lr(?:32|64)_ldstexcl", lowered):
        candidates.add(lowered.replace("_ldstexcl", "_ldstexclr"))
    if re.fullmatch(r"stlx?r_sr(?:32|64)_ldstexcl", lowered):
        candidates.add(lowered.replace("_ldstexcl", "_ldstexclr"))

    stripped = lowered
    while True:
        updated = TRAILING_VECTOR_SUFFIX_RE.sub("", stripped)
        if updated == stripped:
            break
        candidates.add(updated)
        stripped = updated

    return candidates


def normalize_to_asl_variants(raw_variants: list[str], asl_variants: set[str]) -> tuple[dict[str, str], list[str]]:
    matched: dict[str, str] = {}
    unmatched: list[str] = []

    for raw_name in raw_variants:
        raw_lower = raw_name.lower()
        if raw_lower in IGNORED_INTERNAL_VARIANTS:
            continue

        normalized = None
        for candidate in sorted(normalization_candidates(raw_name)):
            if candidate in asl_variants:
                normalized = candidate
                break

        if normalized is None:
            unmatched.append(raw_name)
        else:
            matched[raw_name] = normalized

    return matched, sorted(unmatched)


def coverage_summary(snapshot_name: str) -> dict[str, object]:
    arch_root = repo_root() / DEFAULT_ARCH_ROOTS[snapshot_name]
    raw_variants = extract_remill_a64_variants(arch_root)
    asl_variants = {name.lower() for name in load_a64_variants(snapshot_name)}
    matched, unmatched = normalize_to_asl_variants(raw_variants, asl_variants)
    supported_variants = set(matched.values())

    return {
        "snapshot": snapshot_name,
        "raw_remill_variants": len(raw_variants),
        "matched_raw_variants": len(matched),
        "unmatched_raw_variants": len(unmatched),
        "supported_variants": len(supported_variants),
        "total_variants": len(asl_variants),
        "coverage_percent": (len(supported_variants) / len(asl_variants)) * 100.0 if asl_variants else 0.0,
    }


def main() -> int:
    args = parse_args()
    snapshots = args.snapshot or ["2020-03", "2026"]

    for snapshot_name in snapshots:
        summary = coverage_summary(snapshot_name)
        print(
            f"{summary['snapshot']}: {summary['supported_variants']} / {summary['total_variants']} "
            f"A64 instruction variants covered ({summary['coverage_percent']:.2f}%)"
        )
        print(
            f"  Remill raw variants: {summary['raw_remill_variants']}, matched after normalization: "
            f"{summary['matched_raw_variants']}, unmatched: {summary['unmatched_raw_variants']}"
        )

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
