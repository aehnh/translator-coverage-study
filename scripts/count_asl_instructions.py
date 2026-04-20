#!/usr/bin/env python3

from __future__ import annotations

import argparse
import re
from pathlib import Path


ENCODING_COMMENT_RE = re.compile(r"=>\s+__encoding\s+\S+\s+//\s+([A-Za-z0-9_]+)\s*$")
SNAPSHOT_DECODE_FILES = {
    "2020-03": Path("external/arch8.6/arch_decode.asl"),
    "2026": Path("external/arch9.7/arch_decode.asl"),
}


def extract_a64_variants(path: Path) -> set[str]:
    variants: set[str] = set()
    in_a64 = False

    with path.open("r", encoding="utf-8") as handle:
        for raw_line in handle:
            line = raw_line.rstrip("\n")

            if line.startswith("__decode "):
                in_a64 = line == "__decode A64"
                continue

            if not in_a64:
                continue

            match = ENCODING_COMMENT_RE.search(line)
            if match:
                variants.add(match.group(1))

    return variants


def load_a64_variants(snapshot_name: str) -> set[str]:
    return extract_a64_variants(SNAPSHOT_DECODE_FILES[snapshot_name])


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Count unique A64 instruction variants from generated ASL decode files."
    )
    parser.add_argument(
        "--decode-file",
        action="append",
        dest="decode_files",
        help="Path to an arch_decode.asl file. Defaults to external/arch8.6 and external/arch9.7.",
    )
    parser.add_argument(
        "--emit-names",
        action="store_true",
        help="Print the sorted variant names for each decode file.",
    )
    args = parser.parse_args()

    decode_files = (
        [Path(p) for p in args.decode_files]
        if args.decode_files
        else list(SNAPSHOT_DECODE_FILES.values())
    )

    for path in decode_files:
        variants = extract_a64_variants(path)
        print(f"{path}: {len(variants)} unique A64 instruction variants")
        if args.emit_names:
            for name in sorted(variants):
                print(name)
            print()

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
