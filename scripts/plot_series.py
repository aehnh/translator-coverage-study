#!/usr/bin/env python3
"""Render data/series_annual.csv as a static SVG figure (and a LaTeX table).

Sampling rule, applied identically to both ISAs: **one point per calendar year,
2020-2025, taking the last release the vendor published in that year.**  The full
density (every ARM quarterly release, every XED-to-XML snapshot, every dated XED
anchor) stays in data/series.csv; this is presentation only.  Nothing is
interpolated: a year with no obtainable release leaves a break in the line.

Layout is 2 rows (one per ISA) x 2 columns:
  left   absolute counts  - ISA size and the number Remill lifts
  right  coverage percent - the same data as a share of the ISA

Counts and percentages are kept on separate panels rather than sharing one plot
with two y-axes.  Colour follows the entity across the whole figure: blue = ISA
size as the vendor defines it, orange = instructions Remill lifts, aqua =
coverage %, violet = the third-party XED-to-XML export (secondary, x86 only).
The figure is static: it targets a paper, so there is no hover layer.
"""

from __future__ import annotations

import argparse
import csv
from pathlib import Path

REPO = Path(__file__).resolve().parents[1]

SURFACE, INK, INK_2 = "#fcfcfb", "#0b0b0b", "#52514e"
GRID, AXIS = "#e4e3df", "#b9b8b2"

C_SIZE = "#2a78d6"     # slot 1 - ISA size (vendor spec)
C_COVER = "#eb6834"    # slot 2 - lifted by Remill
C_PCT = "#1baf7a"      # slot 3 - coverage % (low contrast: always direct-labelled)
C_FORK = "#4a3aa7"     # slot 7 - third-party XED-to-XML export (secondary)

ISA_TITLE = {"x86-64": "x86-64 (Intel XED iforms)", "a64": "A64 (ARM ASL encodings)"}
PRIMARY = {"x86-64": "intel-xed-enum", "a64": "arm-mra"}
YEARS = list(range(2020, 2026))


def esc(s: str) -> str:
    return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")


class Panel:
    def __init__(self, x0, y0, w, h, xmin, xmax, ymin, ymax):
        self.x0, self.y0, self.w, self.h = x0, y0, w, h
        self.xmin, self.xmax, self.ymin, self.ymax = xmin, xmax, ymin, ymax

    def px(self, x):
        return self.x0 + (x - self.xmin) / (self.xmax - self.xmin) * self.w

    def py(self, y):
        return self.y0 + self.h - (y - self.ymin) / (self.ymax - self.ymin) * self.h


def nice_ticks(lo, hi, target=5):
    span = hi - lo
    if span <= 0:
        return [lo]
    raw = span / target
    mag = 10 ** (len(str(int(raw))) - 1) if raw >= 1 else 0.1
    step = mag
    for mult in (1, 2, 2.5, 5, 10):
        step = mag * mult
        if span / step <= target * 1.4:
            break
    ticks, v = [], int(lo / step) * step
    while v <= hi + step * 0.001:
        if v >= lo - step * 0.001:
            ticks.append(round(v, 6))
        v += step
    return ticks


def runs(points):
    """Split (year, value) points into runs of consecutive years, so a missing
    year leaves a visible break instead of a straight line across it."""
    out, cur = [], []
    for pt in points:
        if cur and pt[0] != cur[-1][0] + 1:
            out.append(cur); cur = []
        cur.append(pt)
    if cur:
        out.append(cur)
    return out


def draw_panel(out, p, title, series, ylab, pct=False):
    out.append(f'<rect x="{p.x0}" y="{p.y0}" width="{p.w}" height="{p.h}" fill="{SURFACE}"/>')
    for t in nice_ticks(p.ymin, p.ymax):
        y = p.py(t)
        if not (p.y0 - 1 <= y <= p.y0 + p.h + 1):
            continue
        out.append(f'<line x1="{p.x0}" y1="{y:.1f}" x2="{p.x0+p.w}" y2="{y:.1f}" stroke="{GRID}" stroke-width="1"/>')
        out.append(f'<text x="{p.x0-8}" y="{y+4:.1f}" text-anchor="end" font-size="11" '
                   f'fill="{INK_2}">{f"{t:g}%" if pct else f"{t:,.0f}"}</text>')
    for t in YEARS:
        x = p.px(t)
        out.append(f'<line x1="{x:.1f}" y1="{p.y0+p.h}" x2="{x:.1f}" y2="{p.y0+p.h+4}" stroke="{AXIS}" stroke-width="1"/>')
        out.append(f'<text x="{x:.1f}" y="{p.y0+p.h+18}" text-anchor="middle" font-size="11" fill="{INK_2}">{t}</text>')
    out.append(f'<line x1="{p.x0}" y1="{p.y0+p.h}" x2="{p.x0+p.w}" y2="{p.y0+p.h}" stroke="{AXIS}" stroke-width="1"/>')
    out.append(f'<text x="{p.x0}" y="{p.y0-10}" font-size="12.5" font-weight="600" fill="{INK}">{esc(title)}</text>')
    out.append(f'<text x="{p.x0-46}" y="{p.y0+p.h/2}" font-size="11" fill="{INK_2}" text-anchor="middle" '
               f'transform="rotate(-90 {p.x0-46} {p.y0+p.h/2})">{esc(ylab)}</text>')

    labels = []
    for colour, pts in series:
        if not pts:
            continue
        for run in runs(pts):
            d = " ".join(("M" if i == 0 else "L") + f"{p.px(x):.1f},{p.py(y):.1f}"
                         for i, (x, y) in enumerate(run))
            out.append(f'<path d="{d}" fill="none" stroke="{colour}" stroke-width="2" '
                       f'stroke-linejoin="round" stroke-linecap="round"/>')
        for x, y in pts:
            out.append(f'<circle cx="{p.px(x):.1f}" cy="{p.py(y):.1f}" r="4" fill="{colour}" '
                       f'stroke="{SURFACE}" stroke-width="2"/>')
        lx, ly = pts[-1]
        labels.append([p.px(lx) + 9, p.py(ly) + 4, f"{ly:.1f}%" if pct else f"{ly:,.0f}", colour])

    labels.sort(key=lambda l: l[1])
    for i in range(1, len(labels)):
        if labels[i][1] - labels[i - 1][1] < 13:
            labels[i][1] = labels[i - 1][1] + 13
    for x, y, txt, colour in labels:
        out.append(f'<text x="{x:.1f}" y="{y:.1f}" font-size="11" font-weight="600" fill="{INK}">{esc(txt)}</text>')


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--csv", default="data/series_annual.csv")
    ap.add_argument("--out", default="figures/coverage_series.svg")
    ap.add_argument("--tex", default="figures/coverage_series.tex")
    args = ap.parse_args()

    all_rows = list(csv.DictReader((REPO / args.csv).open(encoding="utf-8")))
    for r in all_rows:
        r["y"] = int(r["year"])
        r["n"] = int(r["isa_instruction_count"])
        r["c"] = int(r["remill_covered_count"])
        r["p"] = float(r["coverage_pct"])

    rows = [r for r in all_rows if r["source"] == PRIMARY.get(r["isa"])]
    fork = [r for r in all_rows if r["source"] == "xed-to-xml-export"]

    isas = [i for i in ("x86-64", "a64") if any(r["isa"] == i for r in rows)]
    xmin, xmax = YEARS[0] - 0.35, YEARS[-1] + 0.95

    W, H, PW, PH = 1010, 300 * len(isas) + 82, 360, 210
    out = [f'<svg xmlns="http://www.w3.org/2000/svg" width="{W}" height="{H}" viewBox="0 0 {W} {H}" '
           f'font-family="Inter, Helvetica, Arial, sans-serif">',
           f'<rect width="{W}" height="{H}" fill="{SURFACE}"/>',
           f'<text x="70" y="26" font-size="15" font-weight="700" fill="{INK}">'
           f'ISA growth vs. hand-written lifter coverage (Remill)</text>',
           f'<text x="70" y="44" font-size="11.5" fill="{INK_2}">'
           f'One point per calendar year: the last release the vendor published that year. '
           f'Remill fixed at its latest checkout. Line breaks mark years with no obtainable release.</text>']

    for k, isa in enumerate(isas):
        rs = sorted((r for r in rows if r["isa"] == isa), key=lambda r: r["y"])
        fk = sorted((r for r in fork if r["isa"] == isa), key=lambda r: r["y"])
        top = 88 + k * 290

        ymax_n = max([r["n"] for r in rs] + [r["n"] for r in fk]) * 1.14
        pL = Panel(70, top, PW, PH, xmin, xmax, 0, ymax_n)
        series = [(C_SIZE, [(r["y"], r["n"]) for r in rs])]
        if fk:
            series.append((C_FORK, [(r["y"], r["n"]) for r in fk]))
        series.append((C_COVER, [(r["y"], r["c"]) for r in rs]))
        draw_panel(out, pL, f'{ISA_TITLE[isa]} - instruction count', series, "instructions")

        pR = Panel(70 + PW + 120, top, PW, PH, xmin, xmax, 0, max(r["p"] for r in rs) * 1.3)
        draw_panel(out, pR, f'{ISA_TITLE[isa]} - coverage',
                   [(C_PCT, [(r["y"], r["p"]) for r in rs])], "% of ISA covered", pct=True)

    ly = H - 20
    out.append(f'<g font-size="11.5" fill="{INK_2}">')
    for i, (colour, label) in enumerate([(C_SIZE, "ISA size (vendor spec)"),
                                         (C_COVER, "lifted by Remill"),
                                         (C_PCT, "coverage % (right panels)"),
                                         (C_FORK, "XED-to-XML export (secondary)")]):
        x = 70 + i * 228
        out.append(f'<line x1="{x}" y1="{ly-4}" x2="{x+22}" y2="{ly-4}" stroke="{colour}" stroke-width="2"/>')
        out.append(f'<circle cx="{x+11}" cy="{ly-4}" r="4" fill="{colour}" stroke="{SURFACE}" stroke-width="2"/>')
        out.append(f'<text x="{x+30}" y="{ly}" fill="{INK_2}">{esc(label)}</text>')
    out.append("</g></svg>")

    svg_path = REPO / args.out
    svg_path.parent.mkdir(parents=True, exist_ok=True)
    svg_path.write_text("\n".join(out) + "\n", encoding="utf-8")

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

    print(f"wrote {svg_path}\nwrote {REPO / args.tex}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
