#!/usr/bin/env bash
# Rebuild specs/a64/<YYYY-MM>/arch_decode.asl.gz from ARM's published A64 ISA XML.
#
# ARM ships one "ISA exploration tools" tarball per quarterly A-profile release.
# We download the A64 tarball only (the AArch32 and SysReg tarballs do not affect
# the A64 encoding count -- verified: generating with and without the AArch32 XML
# yields the identical variant set), run mra_tools over the canonical XML directory,
# and keep just the generated decode tree.
#
# Total download for the full set is ~620 MB.  Already-built releases are skipped.
#
# Usage: scripts/fetch_a64_specs.sh [YYYY-MM ...]      (default: every known release)
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CACHE="${A64_XML_CACHE:-$ROOT/.work/armxml}"
MRA="$ROOT/external/mra_tools"

# release -> download URL.  ARM moved hosts twice: the v8.x releases live under
# armv8-a-architecture, the A-profile releases under armv9-a-architecture.  Releases
# from 2024-03 onward are no longer served from either path (see README).
BASE8="https://developer.arm.com/-/media/developer/products/architecture/armv8-a-architecture"
BASE9="https://developer.arm.com/-/media/developer/products/architecture/armv9-a-architecture"

url_for() {
  case "$1" in
    2019-12) echo "$BASE8/2019-12/A64_ISA_xml_v86A-2019-12.tar.gz" ;;
    2020-03) echo "$BASE8/2020-03/A64_ISA_xml_v86A-2020-03.tar.gz" ;;
    2020-06) echo "$BASE8/2020-06/A64_ISA_xml_v86A-2020-06.tar.gz" ;;
    2020-09) echo "$BASE8/2020-09/A64_ISA_xml_v87A-2020-09.tar.gz" ;;
    2020-12) echo "$BASE8/2020-12/A64_ISA_xml_v87A-2020-12.tar.gz" ;;
    2021-03) echo "$BASE8/2021-03/A64_ISA_xml_v87A-2021-03.tar.gz" ;;
    2021-06) echo "$BASE8/2021-06/A64_ISA_xml_v87A-2021-06.tar.gz" ;;
    2021-09) echo "$BASE8/2021-09/ISA_A64_xml_v88A-2021-09.tar.gz" ;;
    2021-12) echo "$BASE8/2021-12/ISA_A64_xml_v88A-2021-12.tar.gz" ;;
    2022-03|2022-06|2022-09|2022-12|2023-03|2023-06|2023-09|2023-12)
             echo "$BASE9/$1/ISA_A64_xml_A_profile-$1.tar.gz" ;;
    *) return 1 ;;
  esac
}

ALL="2019-12 2020-03 2020-06 2020-09 2020-12 2021-03 2021-06 2021-09 2021-12 \
2022-03 2022-06 2022-09 2022-12 2023-03 2023-06 2023-09 2023-12"

# mra_tools aborts on releases that ship alias iclasses without pseudocode (2020-09).
if ! grep -q "alias iclass with no decode pseudocode" "$MRA/bin/instrs2asl.py"; then
  echo "applying patches/mra_tools-missing-ps.patch to external/mra_tools" >&2
  python3 - "$MRA/bin/instrs2asl.py" <<'PY'
import sys, pathlib
p = pathlib.Path(sys.argv[1]); s = p.read_text()
old = "        dec_asl = readASL(iclass.find('ps_section/ps'))\n"
new = ("        _ps = iclass.find('ps_section/ps')\n"
       "        if _ps is None:\n"
       "            # alias iclass with no decode pseudocode (see patches/mra_tools-missing-ps.patch)\n"
       "            dec_asl = ASL(encoding.attrib.get('psname', exec.name) + ':decode', \"\", set(), set())\n"
       "        else:\n"
       "            dec_asl = readASL(_ps)\n")
assert s.count(old) == 1
p.write_text(s.replace(old, new))
PY
fi

mkdir -p "$CACHE"
for rel in "${@:-$ALL}"; do
  out="$ROOT/specs/a64/$rel/arch_decode.asl.gz"
  [ -f "$out" ] && { echo "skip $rel (already built)"; continue; }
  url="$(url_for "$rel")" || { echo "unknown release $rel" >&2; exit 1; }
  tar="$CACHE/$(basename "$url")"
  [ -f "$tar" ] || { echo "downloading $rel"; curl -fSL --retry 3 -o "$tar" "$url"; }

  mkdir -p "$ROOT/.work"
  tmp="$(mktemp -d "$ROOT/.work/xml.XXXXXX")"
  tar xzf "$tar" -C "$tmp"
  # Each tarball also ships the PREVIOUS release's directory and an _OPT (beta)
  # directory; the canonical one is ISA_A64_xml_<ver>-<release> with no suffix.
  xd=""
  for d in "$tmp"/ISA_A64_xml_*-"$rel"; do
    [ -f "$d/encodingindex.xml" ] || continue
    case "$(basename "$d")" in *_OPT|*diff*) continue;; esac
    xd="$d"; break
  done
  [ -n "$xd" ] || { rm -rf "$tmp"; echo "no canonical XML dir for $rel" >&2; exit 1; }

  mkdir -p "$ROOT/specs/a64/$rel"
  python3 "$MRA/bin/instrs2asl.py" --altslicesyntax --demangle \
      -o"$tmp/arch" "$xd" >/dev/null 2>&1
  gzip -9c "$tmp/arch_decode.asl" > "$out"
  rm -rf "$tmp"
  echo "built $rel -> $out"
done
