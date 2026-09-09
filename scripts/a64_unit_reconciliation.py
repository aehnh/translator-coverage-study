#!/usr/bin/env python3
"""Reconcile the two A64 sizes the paper quotes: 4,331 encodings vs 1,143 opcode masks.

Both come from the same mra_tools output; they are three nested units, and the two
published numbers additionally come from two different spec versions.

  ARM encoding name   the `// NAME` comment on each `__encoding` row of the A64 decode
                      tree - one per encoding as ARM's own XML names it (ASRV_32_dp_2src).
                      This is the unit the ISA-size series uses.
  ASL identifier      the `__encoding <ident>` on the same row - mra_tools' block
                      identity (aarch64_integer_shift_variable).  Several ARM encodings
                      share one.  This is RQ2's corpus unit.
  opcode mask         the `__opcode '...'` bit pattern of that block in arch_instrs.asl.
                      This is RQ2's denominator: what a decoder can be asked to tell apart.

At v8.6 (2019-12) the chain is 2,336 -> 1,152 -> 1,143, reproducing RQ2's corpus and
denominator exactly.  Masks are NOT stable across spec versions: newer ARM XML pushes
discrimination out of the opcode mask into the decode tree, so the mask count FALLS as
the ISA grows (1,143 at v8.6 against 803 at 2025-12).  Mask counts must therefore not
be used as a size unit in a time series - see the README.
"""

from __future__ import annotations

import csv
import gzip
import re
from pathlib import Path

REPO = Path(__file__).resolve().parents[1]
DECODE_RE = re.compile(r'=>\s+__encoding\s+(\S+)\s+//\s+([A-Za-z0-9_]+)\s*$')
ENC_RE = re.compile(r'^\s{4}__encoding (\S+)')
ISET_RE = re.compile(r'^\s+__instruction_set (\S+)')
OPCODE_RE = re.compile(r"^\s+__opcode '([^']+)'")


def _open(path: Path):
    return gzip.open(path, "rt", encoding="utf-8") if path.suffix == ".gz" \
        else path.open("r", encoding="utf-8")


def decode_units(path: Path) -> tuple[int, int]:
    """(distinct ARM encoding names, distinct ASL identifiers) in the A64 decode tree."""
    arm, asl, in_a64 = set(), set(), False
    with _open(path) as fh:
        for line in fh:
            line = line.rstrip("\n")
            if line.startswith("__decode "):
                in_a64 = line == "__decode A64"
                continue
            if not in_a64:
                continue
            m = DECODE_RE.search(line)
            if m:
                asl.add(m.group(1))
                arm.add(m.group(2))
    return len(arm), len(asl)


def mask_units(path: Path) -> tuple[int, int, int]:
    """(A64 encoding AST nodes, distinct (identifier, mask) pairs, distinct masks)."""
    encs, cur = [], None
    with _open(path) as fh:
        for line in fh:
            m = ENC_RE.match(line)
            if m:
                if cur:
                    encs.append(cur)
                cur = {"enc": m.group(1), "iset": None, "op": None}
                continue
            if cur is None:
                continue
            m = ISET_RE.match(line)
            if m:
                cur["iset"] = m.group(1); continue
            m = OPCODE_RE.match(line)
            if m:
                cur["op"] = m.group(1); continue
            if line.startswith("__instruction "):
                encs.append(cur); cur = None
    if cur:
        encs.append(cur)
    a64 = [e for e in encs if e["iset"] == "A64"]
    return len(a64), len({(e["enc"], e["op"]) for e in a64}), len({e["op"] for e in a64 if e["op"]})


def main() -> int:
    rows = []
    spec_dir = REPO / "specs" / "a64"
    for d in sorted(spec_dir.iterdir()) if spec_dir.is_dir() else []:
        f = d / "arch_decode.asl.gz"
        if not f.is_file():
            continue
        arm, asl = decode_units(f)
        rows.append({"release": d.name, "arm_encoding_names": arm,
                     "asl_identifiers": asl, "opcode_masks": ""})

    # the two full ASL trees carry __opcode, so masks are computable there
    for release, base in (("2019-12", "external/arch8.6"), ("2025-12", "external/arch9.7")):
        instrs = REPO / base / "arch_instrs.asl"
        if not instrs.is_file():
            continue
        nodes, pairs, masks = mask_units(instrs)
        for r in rows:
            if r["release"] == release:
                r["opcode_masks"] = masks
                r["asl_identifiers_from_instrs"] = pairs
                r["encoding_ast_nodes"] = nodes

    out = REPO / "data" / "a64_units.csv"
    fields = ["release", "arm_encoding_names", "asl_identifiers", "opcode_masks"]
    with out.open("w", newline="", encoding="utf-8") as fh:
        w = csv.DictWriter(fh, fieldnames=fields, extrasaction="ignore")
        w.writeheader(); w.writerows(rows)

    print(f"{'release':<10}{'ARM encodings':>14}{'ASL identifiers':>17}{'opcode masks':>14}")
    for r in rows:
        print(f"{r['release']:<10}{r['arm_encoding_names']:>14}{r['asl_identifiers']:>17}"
              f"{str(r['opcode_masks'] or '-'):>14}")
    print(f"\nwrote {out}")

    v86 = next((r for r in rows if r["release"] == "2019-12"), None)
    if v86 and v86["opcode_masks"]:
        print(f"\nv8.6 collapse chain: {v86['arm_encoding_names']} ARM encodings"
              f" -> {v86['asl_identifiers']} ASL identifiers"
              f" -> {v86['opcode_masks']} opcode masks"
              f"   (RQ2 quotes 1,152 and 1,143)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
