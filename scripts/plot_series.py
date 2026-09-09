#!/usr/bin/env python3
"""Render data/series_annual.csv as a static SVG figure (and a LaTeX table).

One panel per ISA, side by side, sharing the year axis.  In each panel the upper
line is the size of the ISA as the vendor's own machine-readable specification
defines it; the filled band beneath is the number of those instructions Remill
lifts.  The band is what a hand-written lifter covers, the widening gap above it
is what it does not, and the coverage percentage is the ratio of the two - so
counts and percentages appear in one plot without a second y-axis.

Remill is CONTEMPORANEOUS: each year's ISA is measured against the newest Remill
commit that existed when the vendor published that release, so the band shows the
lifter actually developing rather than today's Remill projected backwards.  The
fixed-at-latest variant stays in data/ in the *_fixed columns as a sensitivity
check; it is not plotted.

Sampling rule, applied identically to both ISAs: one point per calendar year,
2020-2025, taking the last release the vendor published in that year.  Full
density stays in data/series.csv; nothing is interpolated, so a year with no
obtainable release leaves a break in the line.

The third-party XED-to-XML export is deliberately NOT plotted: with Intel's own
xed_iform_enum_t as the primary x86 measure the export is provenance, not a
result.  It remains in data/ and in the regression assertions, and the finding
that it lagged Intel by two years is documented in the README.
"""

from __future__ import annotations

import argparse
import csv
from pathlib import Path

REPO = Path(__file__).resolve().parents[1]

SURFACE, INK, INK_2 = "#fcfcfb", "#0b0b0b", "#52514e"
GRID, AXIS = "#e4e3df", "#b9b8b2"

C_SIZE = "#2a78d6"     # slot 1 - ISA size as the vendor defines it
C_COVER = "#eb6834"    # slot 2 - instructions Remill lifts

ISA_TITLE = {"x86-64": "x86-64 — Intel XED iforms", "a64": "A64 — ARM ASL encodings"}
PRIMARY = {"x86-64": "intel-xed-enum", "a64": "arm-mra"}
YEARS = list(range(2020, 2026))


def esc(s: str) -> str:
    return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")


class Panel:
    def __init__(self, x0, y0, w, h, xmin, xmax, ymax):
        self.x0, self.y0, self.w, self.h = x0, y0, w, h
        self.xmin, self.xmax, self.ymax = xmin, xmax, ymax

    def px(self, x):
        return self.x0 + (x - self.xmin) / (self.xmax - self.xmin) * self.w

    def py(self, y):
        return self.y0 + self.h - (y / self.ymax) * self.h


def nice_ticks(hi, target=5):
    raw = hi / target
    mag = 10 ** (len(str(int(raw))) - 1) if raw >= 1 else 1
    step = mag
    for mult in (1, 2, 2.5, 5, 10):
        step = mag * mult
        if hi / step <= target * 1.4:
            break
    ticks, v = [], 0.0
    while v <= hi:
        ticks.append(round(v, 6))
        v += step
    return ticks


def draw(out, p, title, rows):
    out.append(f'<rect x="{p.x0}" y="{p.y0}" width="{p.w}" height="{p.h}" fill="{SURFACE}"/>')
    for t in nice_ticks(p.ymax):
        y = p.py(t)
        out.append(f'<line x1="{p.x0}" y1="{y:.1f}" x2="{p.x0+p.w}" y2="{y:.1f}" '
                   f'stroke="{GRID}" stroke-width="1"/>')
        out.append(f'<text x="{p.x0-8}" y="{y+4:.1f}" text-anchor="end" font-size="11" '
                   f'fill="{INK_2}">{t:,.0f}</text>')
    for t in YEARS:
        x = p.px(t)
        out.append(f'<line x1="{x:.1f}" y1="{p.y0+p.h}" x2="{x:.1f}" y2="{p.y0+p.h+4}" '
                   f'stroke="{AXIS}" stroke-width="1"/>')
        out.append(f'<text x="{x:.1f}" y="{p.y0+p.h+18}" text-anchor="middle" font-size="11" '
                   f'fill="{INK_2}">{t}</text>')
    out.append(f'<line x1="{p.x0}" y1="{p.y0+p.h}" x2="{p.x0+p.w}" y2="{p.y0+p.h}" '
               f'stroke="{AXIS}" stroke-width="1"/>')
    out.append(f'<text x="{p.x0}" y="{p.y0-26}" font-size="13" font-weight="600" '
               f'fill="{INK}">{esc(title)}</text>')
    out.append(f'<text x="{p.x0-48}" y="{p.y0+p.h/2}" font-size="11" fill="{INK_2}" '
               f'text-anchor="middle" transform="rotate(-90 {p.x0-48} {p.y0+p.h/2})">'
               f'instructions</text>')

    size = [(r["y"], r["n"]) for r in rows]
    cov = [(r["y"], r["c"]) for r in rows]

    # filled band: what Remill lifts
    d = " ".join(("M" if i == 0 else "L") + f"{p.px(x):.1f},{p.py(y):.1f}"
                 for i, (x, y) in enumerate(cov))
    d += f" L{p.px(cov[-1][0]):.1f},{p.py(0):.1f} L{p.px(cov[0][0]):.1f},{p.py(0):.1f} Z"
    out.append(f'<path d="{d}" fill="{C_COVER}" fill-opacity="0.20" stroke="none"/>')

    for colour, pts in ((C_SIZE, size), (C_COVER, cov)):
        dd = " ".join(("M" if i == 0 else "L") + f"{p.px(x):.1f},{p.py(y):.1f}"
                      for i, (x, y) in enumerate(pts))
        out.append(f'<path d="{dd}" fill="none" stroke="{colour}" stroke-width="2" '
                   f'stroke-linejoin="round" stroke-linecap="round"/>')
        for x, y in pts:
            out.append(f'<circle cx="{p.px(x):.1f}" cy="{p.py(y):.1f}" r="4" fill="{colour}" '
                       f'stroke="{SURFACE}" stroke-width="2"/>')

    # endpoint counts
    out.append(f'<text x="{p.px(size[-1][0])+9:.1f}" y="{p.py(size[-1][1])+4:.1f}" font-size="11" '
               f'font-weight="600" fill="{INK}">{size[-1][1]:,}</text>')
    out.append(f'<text x="{p.px(cov[-1][0])+9:.1f}" y="{p.py(cov[-1][1])+4:.1f}" font-size="11" '
               f'font-weight="600" fill="{INK}">{cov[-1][1]:,}</text>')

    # the ratio, stated at both ends: inside the band when it is tall enough to hold
    # the text, otherwise just above the covered line so it never sits on the stroke
    for r, anchor, dx in ((rows[0], "start", 6), (rows[-1], "end", -6)):
        xm = p.px(r["y"]) + dx
        band = p.py(0) - p.py(r["c"])
        ym = p.py(r["c"]) + band * 0.55 + 4 if band >= 30 else p.py(r["c"]) - 9
        out.append(f'<text x="{xm:.1f}" y="{ym:.1f}" text-anchor="{anchor}" font-size="11.5" '
                   f'font-weight="600" fill="{INK}">{r["p"]:.1f}%</text>')

    # label the gap once, in the widest part
    gap = max(rows, key=lambda r: r["n"] - r["c"])
    gx = p.px(gap["y"])
    gy = (p.py(gap["n"]) + p.py(gap["c"])) / 2
    out.append(f'<text x="{gx:.1f}" y="{gy:.1f}" text-anchor="middle" font-size="11" '
               f'fill="{INK_2}">not lifted</text>')


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--csv", default="data/series_annual.csv")
    ap.add_argument("--out", default="figures/coverage_series.svg")
    ap.add_argument("--tex", default="figures/coverage_series.tex")
    args = ap.parse_args()

    all_rows = list(csv.DictReader((REPO / args.csv).open(encoding="utf-8")))
    for r in all_rows:
        r["y"] = int(r["year"]); r["n"] = int(r["isa_instruction_count"])
        r["c"] = int(r["remill_covered_count"]); r["p"] = float(r["coverage_pct"])
    rows = [r for r in all_rows if r["source"] == PRIMARY.get(r["isa"])]

    isas = [i for i in ("x86-64", "a64") if any(r["isa"] == i for r in rows)]
    xmin, xmax = YEARS[0] - 0.25, YEARS[-1] + 0.55

    PW, PH = 400, 250
    W, H = 100 + len(isas) * (PW + 90), PH + 172
    out = [f'<svg xmlns="http://www.w3.org/2000/svg" width="{W}" height="{H}" viewBox="0 0 {W} {H}" '
           f'font-family="Inter, Helvetica, Arial, sans-serif">',
           f'<rect width="{W}" height="{H}" fill="{SURFACE}"/>',
           f'<text x="72" y="28" font-size="15" font-weight="700" fill="{INK}">'
           f'The ISA grows; the hand-written lifter does not</text>',
           f'<text x="72" y="46" font-size="11.5" fill="{INK_2}">'
           f'Shaded band = instructions Remill lifts; the gap above it = the rest of the ISA. '
           f'One point per year, the last release each vendor published, measured against the Remill of that year.</text>']

    for k, isa in enumerate(isas):
        rs = sorted((r for r in rows if r["isa"] == isa), key=lambda r: r["y"])
        p = Panel(72 + k * (PW + 90), 96, PW, PH, xmin, xmax, max(r["n"] for r in rs) * 1.16)
        draw(out, p, ISA_TITLE[isa], rs)

    ly = H - 22
    out.append(f'<g font-size="11.5" fill="{INK_2}">')
    for i, (colour, label) in enumerate([(C_SIZE, "ISA size (vendor specification)"),
                                         (C_COVER, "lifted by Remill")]):
        x = 72 + i * 260
        out.append(f'<line x1="{x}" y1="{ly-4}" x2="{x+22}" y2="{ly-4}" stroke="{colour}" stroke-width="2"/>')
        out.append(f'<circle cx="{x+11}" cy="{ly-4}" r="4" fill="{colour}" stroke="{SURFACE}" stroke-width="2"/>')
        out.append(f'<text x="{x+30}" y="{ly}" fill="{INK_2}">{esc(label)}</text>')
    out.append("</g></svg>")

    (REPO / args.out).parent.mkdir(parents=True, exist_ok=True)
    (REPO / args.out).write_text("\n".join(out) + "\n", encoding="utf-8")

    tex = [r"% generated by scripts/plot_series.py",
           r"% one point per calendar year: the last release the vendor published that year",
           r"\begin{tabular}{lllrrr}", r"\toprule",
           r"ISA & year & release & ISA size & Remill covers & coverage \\", r"\midrule"]
    for isa in isas:
        for r in sorted((r for r in rows if r["isa"] == isa), key=lambda r: r["y"]):
            tex.append(f'{esc(isa)} & {r["y"]} & {r["spec_date"]} & {r["n"]:,} & {r["c"]:,} '
                       f'& {r["p"]:.2f}\\% \\\\')
        tex.append(r"\midrule")
    tex[-1] = r"\bottomrule"
    tex.append(r"\end{tabular}")
    (REPO / args.tex).write_text("\n".join(tex) + "\n", encoding="utf-8")

    print(f"wrote {REPO / args.out}\nwrote {REPO / args.tex}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
