#!/usr/bin/env python3
"""Compare the third-party XED-to-XML export against Intel's own XED iform enum.

The x86 series in data/series.csv counts distinct `iform=` values in XED-to-XML's
committed `instructions.xml`.  That file is produced by a third party on its own
schedule, so it can lag Intel's ISA in two ways: the snapshot can be taken late, and
the exporter can fail to export a newly added extension at all.

This script measures the second, more serious effect.  It reads `xed-iform-enum.h`
from pristine upstream-XED builds (see .work/xedbuild/enum-*, produced by
.work/xedenum.sh) and reports, per XED version, Intel's own iform count next to the
count XED-to-XML exported at the same XED version.

Intel's enum is NOT the same unit as the series: it includes iforms reachable only in
16- and 32-bit modes, which XED-to-XML deliberately excludes.  In every year where the
exporter was current that difference is a stable ~200 iforms; where it is far larger,
the exporter had not caught up.
"""

from __future__ import annotations

import csv
import re
import subprocess
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parents[1]
ENUM_RE = re.compile(r"^\s*XED_IFORM_[A-Za-z0-9_]+=\d+,", re.M)
IFORM_RE = re.compile(r'\biform="([^"]+)"')

# XED-to-XML snapshots, by the XED VERSION they were generated from.
FORK_XML_AT_XED = {
    "8.30.0-18-g47be2133": ("2019-01-02", "afad088655ae07b9078ddb7473fc28591d58d00f"),
    "11.0.1": ("2019-08-21", "dfedf9f33a74adead8bd6c17f43be3afe799a706"),  # the paper's 2020-03 anchor
    "12.0.1": ("2020-11-06", "1cbef1740886b2ac71a5a4bd99b42a6398ac5e9e"),
    # 13.0.0 is deliberately unpaired: the fork snapshot carrying VERSION 13.0.0 sits on
    # July 2021 datafiles, well past the February 2021 release, so pairing it with the
    # 13.0.0 release build would compare different ISA content and yield a bogus
    # negative difference.
    "13.0.0": ("2021-02-17", ""),
    "v2022.10.11": ("2022-10-12", "35283e45b233a96666ca379f2eaf507ea8d8bb2f"),
    "v2023.12.19": ("2023-12-20", ""),   # the fork never exported this XED
    "v2024.11.04": ("2024-11-05", "fe0014209c73592075f424b4d341203f83cf13f4"),
    "v2025.06.08": ("2025-06-11", "eba916c28be3147577833974fd768dabb6790a08"),
}


def enum_count(build_dir: Path) -> tuple[str, int] | None:
    version_file = build_dir / "VERSION"
    headers = list(build_dir.glob("obj/**/xed-iform-enum.h"))
    if not version_file.is_file() or not headers:
        return None
    version = version_file.read_text().strip()
    return version, len(ENUM_RE.findall(headers[0].read_text(encoding="utf-8", errors="replace")))


def fork_xml_count(commit: str) -> int:
    out = subprocess.run(
        ["git", "-C", str(REPO / "external" / "XED-to-XML"), "show", f"{commit}:instructions.xml"],
        capture_output=True, text=True, check=True).stdout
    return len(set(IFORM_RE.findall(out)))


def main() -> int:
    rows = []
    for build_dir in sorted((REPO / ".work" / "xedbuild").glob("enum-*")):
        got = enum_count(build_dir)
        if got is None:
            continue
        version, n_enum = got
        date, commit = FORK_XML_AT_XED.get(version, ("", ""))
        n_xml = fork_xml_count(commit) if commit else ""
        rows.append({
            "xed_version": version,
            "xed_release_date": date,
            "intel_xed_iform_enum": n_enum,
            "xed_to_xml_iforms_64bit": n_xml,
            "difference": (n_enum - n_xml) if n_xml != "" else "",
        })

    rows.sort(key=lambda r: r["xed_release_date"] or "9999")
    out = REPO / "data" / "xed_native_comparison.csv"
    with out.open("w", newline="", encoding="utf-8") as fh:
        w = csv.DictWriter(fh, fieldnames=list(rows[0]))
        w.writeheader(); w.writerows(rows)

    print(f"{'XED version':<24}{'date':<12}{'Intel enum':>11}{'XED-to-XML':>12}{'diff':>8}")
    for r in rows:
        print(f"{r['xed_version']:<24}{r['xed_release_date'] or '-':<12}"
              f"{r['intel_xed_iform_enum']:>11}{str(r['xed_to_xml_iforms_64bit'] or '-'):>12}"
              f"{str(r['difference'] or '-'):>8}")
    print(f"\nwrote {out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
