#!/usr/bin/env bash
# Populate specs/x86/<year>/iforms.txt.gz from pristine upstream-XED builds.
#
# Each file is the full set of iform names in Intel's generated xed_iform_enum_t at one
# dated upstream XED commit - i.e. the x86-64 instruction set as Intel itself defines
# it, with no third-party export step in between.  Committing these means the series
# rebuilds without rebuilding XED (each build is ~90 s).
#
# Rebuild the underlying builds with .work/xedenum.sh <commit> <label> first.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
XED="$ROOT/external/XED-to-XML"
MAN="$ROOT/specs/x86/manifest.csv"
mkdir -p "$ROOT/specs/x86"
echo "label,xed_commit,xed_version,intel_date" > "$MAN"

# label -> upstream XED commit.  One anchor per calendar year: the newest commit Intel
# had published by the end of that year.
anchors="2019:b4109c0823ff35df7416a157178c87f77421994b
2020:93c0b83e8544eeb26140b1bce74aab40c4931404
2021:d57a3bd0a8ad7a1f0c6e2a1b58060d9014021098
2022:9fc12ab6c0ba7a9eaadb20135369b4b4107fa670
2023:2b5c29a1ab4ede026050c857306912da77503eaf
2024:d4d502003bfff51c55c2808804301a62878d7cc8
2025:95ca7183f6e27834f9bfad7095eefa057f09a88b
2026:0bcb6237345c5066726dcc08b3d87928df3b5b26"
for entry in $anchors; do
  label="${entry%%:*}"; commit="${entry#*:}"
  bd=""
  for d in "$ROOT/.work/xedbuild"/enum-*; do
    [ -d "$d" ] || continue
    if [ "$(git -C "$d" rev-parse HEAD 2>/dev/null)" = "$commit" ]; then bd="$d"; break; fi
  done
  [ -n "${bd:-}" ] || { echo "no build for $label ($commit); run .work/xedenum.sh" >&2; continue; }
  hdr=$(find "$bd/obj" -name xed-iform-enum.h 2>/dev/null | head -1)
  [ -n "$hdr" ] || { echo "no xed-iform-enum.h for $label" >&2; continue; }

  mkdir -p "$ROOT/specs/x86/$label"
  grep -oE '^[[:space:]]*XED_IFORM_[A-Za-z0-9_]+=' "$hdr" \
    | sed 's/[[:space:]=]//g; s/^XED_IFORM_//' | sort -u \
    | gzip -9c > "$ROOT/specs/x86/$label/iforms.txt.gz"

  ver=$(cat "$bd/VERSION" 2>/dev/null | tr -d '\r\n')
  idate=$(git -C "$XED" log -1 --no-merges --format=%ad --date=short "$commit" -- datafiles/)
  echo "$label,$commit,$ver,$idate" >> "$MAN"
  echo "built specs/x86/$label ($ver, $idate): $(gunzip -c "$ROOT/specs/x86/$label/iforms.txt.gz" | wc -l) iforms"
done
