#!/usr/bin/env python3
"""Count x86-64 iforms from XED-to-XML snapshots.

`external/XED-to-XML` is a fork of intelxed/xed that additionally commits a generated
`instructions.xml`.  Every distinct `iform="..."` value in that file is one x86-64
iform (the fork only emits variants usable in 64-bit mode).  Because the fork has full
git history we can take the same measurement at any past commit, which is what the
time series is built from.
"""

from __future__ import annotations

import argparse
import re
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path


MARCH_2020_COMMIT = "dfedf9f33a74adead8bd6c17f43be3afe799a706"
IFORM_RE = re.compile(r'\biform="([^"]+)"')
RELEASE_RE = re.compile(r"External Release v(\d{4})\.(\d{2})\.(\d{2})")


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


def _git(*args: str) -> str:
    result = subprocess.run(
        ["git", "-C", str(xed_to_xml_root()), *args],
        check=False,
        capture_output=True,
        text=True,
    )
    if result.returncode != 0:
        if result.stderr:
            sys.stderr.write(result.stderr)
        raise RuntimeError(f"git {' '.join(args)} failed in {xed_to_xml_root()}")
    return result.stdout


def load_snapshot_text(snapshot: Snapshot) -> str:
    if snapshot.commit is None:
        xml_path = xed_to_xml_root() / "instructions.xml"
        if not xml_path.is_file():
            raise FileNotFoundError(f"missing instructions XML: {xml_path}")
        return xml_path.read_text(encoding="utf-8")

    return _git("show", f"{snapshot.commit}:instructions.xml")


def load_instruction_iforms(snapshot_name: str) -> set[str]:
    snapshot = SNAPSHOTS[snapshot_name]
    return set(IFORM_RE.findall(load_snapshot_text(snapshot)))


def load_iforms_at_commit(commit: str) -> set[str]:
    """Iform set as of an arbitrary XED-to-XML commit."""
    return set(IFORM_RE.findall(_git("show", f"{commit}:instructions.xml")))


def instructions_xml_history() -> list[tuple[str, str]]:
    """(commit, YYYY-MM-DD) for every commit that touched instructions.xml, oldest first."""
    out = _git("log", "--format=%H %ad", "--date=short", "--", "instructions.xml")
    rows = [line.split() for line in out.splitlines() if line.strip()]
    return [(c, d) for c, d in reversed(rows)]


def underlying_xed_release(commit: str) -> str | None:
    """Newest upstream 'External Release vYYYY.MM.DD' reachable from `commit`.

    XED-to-XML merges intelxed/xed periodically; this identifies which XED the
    committed instructions.xml was generated from.  Upstream only adopted that commit
    subject in 2022, so older snapshots return None.
    """
    out = _git("log", "--format=%s", commit)
    for line in out.splitlines():
        match = RELEASE_RE.search(line)
        if match:
            return f"{match.group(1)}.{match.group(2)}.{match.group(3)}"
    return None


def xed_version_at_commit(commit: str) -> str | None:
    """Intel's own XED version string (the VERSION file) at a XED-to-XML commit.

    This is the Intel-native identity of a snapshot: it says which XED - and so which
    Intel ISA drop - the committed instructions.xml was generated from, independently
    of when the fork got round to regenerating it.
    """
    try:
        v = _git("show", f"{commit}:VERSION").strip()
    except RuntimeError:
        return None
    return v or None


_VERSION_DATE_CACHE: dict[str, str | None] = {}


def xed_version_date(version: str) -> str | None:
    """Date upstream XED first set VERSION to `version` - i.e. that release's date."""
    if version not in _VERSION_DATE_CACHE:
        try:
            out = _git("log", "--format=%ad", "--date=short", "-S", version, "--", "VERSION")
        except RuntimeError:
            _VERSION_DATE_CACHE[version] = None
        else:
            rows = [line.strip() for line in out.splitlines() if line.strip()]
            _VERSION_DATE_CACHE[version] = rows[-1] if rows else None
    return _VERSION_DATE_CACHE[version]


def xed_datafiles_date(commit: str) -> str | None:
    """Date of the newest non-merge commit touching XED's ISA tables at `commit`.

    This is the Intel-native date of a snapshot's *content*.  It is preferred over the
    VERSION file, which only changes at XED releases: a snapshot sitting on a
    post-release development commit still reports the older VERSION (the fork's
    "13.0.0" snapshot really carries July 2021 datafiles, and has more iforms than the
    February 2021 13.0.0 release does).  datafiles/ holds Intel's ISA tables and the
    fork edits them essentially never (one line, in xed-amd-prefetch.txt).
    """
    try:
        out = _git("log", "-1", "--no-merges", "--format=%ad", "--date=short",
                   commit, "--", "datafiles/")
    except RuntimeError:
        return None
    out = out.strip()
    return out or None


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Count x86-64 iforms from XED-to-XML snapshots."
    )
    parser.add_argument(
        "--snapshot",
        choices=tuple(SNAPSHOTS),
        action="append",
        help="Limit output to one or more named snapshots. Defaults to both.",
    )
    parser.add_argument(
        "--commit",
        action="append",
        help="Count iforms at an arbitrary XED-to-XML commit. May be repeated.",
    )
    parser.add_argument(
        "--history",
        action="store_true",
        help="Count iforms at every commit that touched instructions.xml.",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()

    if args.history:
        for commit, date in instructions_xml_history():
            iforms = load_iforms_at_commit(commit)
            version = xed_version_at_commit(commit) or "?"
            ddate = xed_datafiles_date(commit) or "?"
            print(f"{date} {commit[:8]} xed={version:<22} intel_content={ddate:<11} "
                  f"{len(iforms)} x86-64 iforms")
        return 0

    if args.commit:
        for commit in args.commit:
            iforms = load_iforms_at_commit(commit)
            print(f"{commit[:8]}: {len(iforms)} x86-64 iforms")
        return 0

    for snapshot_name in args.snapshot or ["2020-03", "2026"]:
        snapshot = SNAPSHOTS[snapshot_name]
        iforms = load_instruction_iforms(snapshot_name)
        print(
            f"{snapshot.name} ({snapshot.label}, {snapshot.commit or 'HEAD'}): "
            f"{len(iforms)} x86-64 iforms"
        )

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
