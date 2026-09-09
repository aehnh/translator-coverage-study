#!/usr/bin/env python3
"""Assert that the generalised scripts still reproduce the original measurements.

The study began as two points per ISA.  Everything here is generalised to a time
series now, so these assertions exist to prove the generalisation did not change
any number that was already published.

NOTE on the A64 coverage figures: the README originally quoted 370/2336 and
359/4331.  Those numbers are NOT reproducible from the committed code -- the
script and README were added in the same commit (beaa494) and already disagreed.
Running the committed calculate_remill_a64_coverage.py at the pinned submodules
yields 380/2336 and 380/4331, which is what is asserted below.  See README.
"""

from __future__ import annotations

import csv
import importlib
import importlib.util
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
REPO = Path(__file__).resolve().parents[1]

count_asl = importlib.import_module("count_asl_instructions")
count_xed = importlib.import_module("count_xed_instructions")
cov_a64 = importlib.import_module("calculate_remill_a64_coverage")


def _load_hyphenated(name, filename):
    path = Path(__file__).resolve().parent / filename
    spec = importlib.util.spec_from_file_location(name, path)
    mod = importlib.util.module_from_spec(spec)
    sys.modules[name] = mod
    spec.loader.exec_module(mod)
    return mod


cov_x86 = _load_hyphenated("remill_x86_coverage", "calculate_remill_x86-64_coverage.py")

failures: list[str] = []


def check(label, got, want):
    ok = got == want
    print(f"[{'PASS' if ok else 'FAIL'}] {label}: {got}" + ("" if ok else f"  (expected {want})"))
    if not ok:
        failures.append(label)


def main() -> int:
    # --- ISA sizes -------------------------------------------------------------
    check("x86-64 iforms @2020-03", len(count_xed.load_instruction_iforms("2020-03")), 6135)
    check("x86-64 iforms @2026 (HEAD)", len(count_xed.load_instruction_iforms("2026")), 8465)
    check("A64 variants @arch8.6", len(count_asl.load_a64_variants("2020-03")), 2336)
    check("A64 variants @arch9.7", len(count_asl.load_a64_variants("2026")), 4331)

    # the same two x86 points reached through the generalised commit-based path
    check("x86-64 iforms @commit dfedf9f3",
          len(count_xed.load_iforms_at_commit(count_xed.MARCH_2020_COMMIT)), 6135)

    # the 2019-12 ARM release must reproduce the committed arch8.6 decode tree
    if "2019-12" in count_asl.available_releases():
        regen = count_asl.extract_a64_variants(count_asl.resolve_decode_file("2019-12"))
        anchor = count_asl.load_a64_variants("2020-03")
        check("specs/a64/2019-12 variant set == external/arch8.6", regen == anchor, True)

    # arch9.7's encoding set is shared by the 2025-09 / 2025-12 / 2026-03 releases
    for release in ("2025-09", "2025-12", "2026-03"):
        if release in count_asl.available_releases():
            got = count_asl.extract_a64_variants(count_asl.resolve_decode_file(release))
            check(f"specs/a64/{release} variant set == external/arch9.7",
                  got == count_asl.load_a64_variants("2026"), True)

    # --- Remill coverage -------------------------------------------------------
    x86_2020 = cov_x86.coverage_summary("2020-03", "c++", False)
    x86_2026 = cov_x86.coverage_summary("2026", "c++", False)
    check("Remill covers x86-64 @2020-03", x86_2020["supported_iforms"], 1635)
    check("Remill covers x86-64 @2026", x86_2026["supported_iforms"], 1919)

    a64_2020 = cov_a64.coverage_summary("2020-03")
    a64_2026 = cov_a64.coverage_summary("2026")
    check("Remill covers A64 @arch8.6", a64_2020["supported_variants"], 380)
    check("Remill covers A64 @arch9.7", a64_2026["supported_variants"], 380)

    # Remill's AArch64 DEF_ISEL set has not changed since 2018; the 2020 and latest
    # checkouts are identical, which is why holding Remill fixed costs nothing for A64.
    r20 = set(cov_a64.extract_remill_a64_variants(REPO / "external/remill_2020/remill/Arch/AArch64"))
    r26 = set(cov_a64.extract_remill_a64_variants(REPO / "external/remill/lib/Arch/AArch64"))
    check("Remill A64 DEF_ISEL count", len(r26), 682)
    check("Remill A64 DEF_ISEL set identical 2020 vs latest", r20 == r26, True)

    # --- Intel-native (primary) x86 series -------------------------------------
    # These pin the Intel measure itself: the size of xed_iform_enum_t at each dated
    # upstream-XED anchor, independent of the third-party export.
    expected_enum = {
        "2019": 6339, "2020": 6398, "2021": 6866, "2022": 6958,
        "2023": 8074, "2024": 8955, "2025": 8863, "2026": 9002,
    }
    manifest = {r["label"]: r for r in count_xed.x86_manifest()}
    for label, want in expected_enum.items():
        if label in manifest:
            check(f"Intel xed_iform_enum @{label} ({manifest[label]['xed_version']})",
                  len(count_xed.load_enum_iforms(label)), want)

    if manifest:
        runtime = REPO / "external/remill/lib/Arch/X86/Runtime/Instructions.cpp"
        for label, want in (("2020", 2027), ("2025", 2040)):
            if label in manifest:
                s_ = cov_x86.coverage_against(count_xed.load_enum_iforms(label), runtime)
                check(f"Remill covers Intel x86 @{label}", s_["supported_iforms"], want)

    # --- A64 unit reconciliation (the paper quotes both 4,331 and 1,143) --------
    recon = importlib.import_module("a64_unit_reconciliation")
    v86_instrs = REPO / "external/arch8.6/arch_instrs.asl"
    if v86_instrs.is_file():
        _, pairs, masks = recon.mask_units(v86_instrs)
        check("v8.6 ASL identifiers (RQ2 corpus)", pairs, 1152)
        check("v8.6 opcode masks (RQ2 denominator)", masks, 1143)
    if "2019-12" in count_asl.available_releases():
        arm, asl = recon.decode_units(count_asl.resolve_decode_file("2019-12"))
        check("v8.6 collapse chain 2336 -> 1152", (arm, asl), (2336, 1152))

    # --- series file contains the anchors --------------------------------------
    csv_path = REPO / "data" / "series.csv"
    if csv_path.is_file():
        rows = list(csv.DictReader(csv_path.open(encoding="utf-8")))
        x86 = [r for r in rows if r["isa"] == "x86-64" and r["source"] == "xed-to-xml-export"]
        a64 = [r for r in rows if r["isa"] == "a64"]
        intel = [r for r in rows if r["source"] == "intel-xed-enum"]
        if intel:
            check("series: intel x86 latest ISA size", int(intel[-1]["isa_instruction_count"]), 9002)
        check("series: x86-64 latest ISA size", int(x86[-1]["isa_instruction_count"]), 8465)
        check("series: x86-64 latest covered", int(x86[-1]["remill_covered_count"]), 1919)
        check("series: a64 first ISA size (2019-12)", int(a64[0]["isa_instruction_count"]), 2336)
        anchor = [r for r in x86 if r["spec_ref"] == count_xed.MARCH_2020_COMMIT[:12]]
        check("series: 2020-03 x86 anchor present with 6135",
              anchor and int(anchor[0]["isa_instruction_count"]) == 6135, True)
    else:
        print("[SKIP] data/series.csv not built yet")

    ann = REPO / "data" / "series_annual.csv"
    if ann.is_file():
        arows = list(csv.DictReader(ann.open(encoding="utf-8")))
        years = {(r["source"], r["isa"]): sorted(int(x["year"]) for x in arows
                                                 if (x["source"], x["isa"]) == (r["source"], r["isa"]))
                 for r in arows}
        check("annual grid: intel x86 covers 2020-2025",
              years.get(("intel-xed-enum", "x86-64")), list(range(2020, 2026)))
        check("annual grid: a64 covers 2020-2025",
              years.get(("arm-mra", "a64")), list(range(2020, 2026)))
        check("annual grid: xed-to-xml export is missing 2023 (not interpolated)",
              2023 not in years.get(("xed-to-xml-export", "x86-64"), []), True)

    print()
    if failures:
        print(f"{len(failures)} REGRESSION(S): " + ", ".join(failures))
        return 1
    print("all regression checks passed")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
