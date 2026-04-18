#!/usr/bin/env python3

from __future__ import annotations

import argparse
import re
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path


MARCH_2020_COMMIT = "dfedf9f33a74adead8bd6c17f43be3afe799a706"
IFORM_RE = re.compile(r'\biform="([^"]+)"')


@dataclass(frozen=True)
class Snapshot:
    name: str
    label: str
    commit: str | None = None


SNAPSHOTS = {
    "2026": Snapshot(name="2026", label="current"),
    "2020-03": Snapshot(
        name="2020-03",
        label="march_2020",
        commit=MARCH_2020_COMMIT,
    ),
}


def repo_root() -> Path:
    return Path(__file__).resolve().parents[1]


def xed_to_xml_root() -> Path:
    return repo_root() / "external" / "XED-to-XML"


def load_snapshot_text(snapshot: Snapshot) -> str:
    if snapshot.commit is None:
        xml_path = xed_to_xml_root() / "instructions.xml"
        if not xml_path.is_file():
            raise FileNotFoundError(f"missing instructions XML: {xml_path}")
        return xml_path.read_text(encoding="utf-8")

    result = subprocess.run(
        ["git", "-C", str(xed_to_xml_root()), "show", f"{snapshot.commit}:instructions.xml"],
        check=False,
        capture_output=True,
        text=True,
    )
    if result.returncode != 0:
        if result.stderr:
            sys.stderr.write(result.stderr)
        raise RuntimeError(f"failed to load instructions.xml from {snapshot.commit}")
    return result.stdout


def load_instruction_iforms(snapshot_name: str) -> set[str]:
    snapshot = SNAPSHOTS[snapshot_name]
    return set(IFORM_RE.findall(load_snapshot_text(snapshot)))


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Count x86-64 iforms from XED-to-XML snapshots."
    )
    parser.add_argument(
        "--snapshot",
        choices=tuple(SNAPSHOTS),
        action="append",
        help="Limit output to one or more snapshots. Defaults to both.",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    snapshots = args.snapshot or ["2020-03", "2026"]

    for snapshot_name in snapshots:
        snapshot = SNAPSHOTS[snapshot_name]
        iforms = load_instruction_iforms(snapshot_name)
        print(
            f"{snapshot.name} ({snapshot.label}, {snapshot.commit or 'HEAD'}): "
            f"{len(iforms)} x86-64 iforms"
        )

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
