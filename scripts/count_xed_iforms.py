#!/usr/bin/env python3

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path


KIT_GLOB = "xed-install-base-*"
HEADER_RELATIVE_PATH = Path("include/xed/xed-iform-enum.h")
IFORM_ENTRY_RE = re.compile(r"^\s*XED_IFORM_[A-Za-z0-9_]+(?:\s*=.*)?\s*,\s*$")


def repo_root() -> Path:
    return Path(__file__).resolve().parents[1]


def find_kits(search_root: Path) -> list[Path]:
    return sorted(path for path in search_root.rglob(KIT_GLOB) if path.is_dir())


def count_iforms(header_path: Path) -> int:
    in_enum = False
    entries = 0

    for raw_line in header_path.read_text(encoding="utf-8").splitlines():
        line = raw_line.strip()

        if not in_enum:
            if line.startswith("typedef enum {"):
                in_enum = True
            continue

        if line.startswith("XED_IFORM_LAST"):
            break

        if IFORM_ENTRY_RE.match(line):
            entries += 1

    if entries == 0:
        raise ValueError(f"could not parse iform entries from {header_path}")

    # The enum starts with XED_IFORM_INVALID at index 0.
    return entries - 1


def main() -> int:
    root = repo_root()
    parser = argparse.ArgumentParser(
        description="Count XED iforms across xed-install-base-* kit directories."
    )
    parser.add_argument(
        "--kits-root",
        type=Path,
        default=root / "external" / "xed" / "kits",
        help="Directory under which xed-install-base-* kits are searched.",
    )
    args = parser.parse_args()

    kits_root = args.kits_root.resolve()
    kits = find_kits(kits_root)
    if not kits:
        print(f"no kit directories matching '{KIT_GLOB}' found under {kits_root}", file=sys.stderr)
        return 1

    results: list[tuple[Path, int]] = []
    missing_headers: list[Path] = []
    for kit in kits:
        header_path = kit / HEADER_RELATIVE_PATH
        if not header_path.is_file():
            missing_headers.append(header_path)
            continue
        results.append((kit, count_iforms(header_path)))

    if missing_headers:
        for header_path in missing_headers:
            print(f"missing header: {header_path}", file=sys.stderr)

    if not results:
        print("found kit directories, but none contained a parseable iform header", file=sys.stderr)
        return 1

    print(f"Found {len(results)} XED kit version(s) under {kits_root}:")
    for kit, iform_count in results:
        print(f"{kit.name}: {iform_count} iforms")

    distinct_counts = sorted({iform_count for _, iform_count in results})
    if len(distinct_counts) == 1:
        print(f"\nAll discovered kits agree: {distinct_counts[0]} total x86-64 iforms.")
    else:
        joined = ", ".join(str(count) for count in distinct_counts)
        print(f"\nDiscovered differing iform counts across kits: {joined}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
