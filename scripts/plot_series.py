#!/usr/bin/env python3
"""Render data/series.csv as a static SVG figure (and a LaTeX table).

Layout is 2 rows (one per ISA) x 2 columns:
  left   absolute counts  - ISA size and the number Remill lifts
  right  coverage percent - the same data as a share of the ISA

Counts and percentages are deliberately kept on separate panels rather than
sharing one plot with two y-axes.  Colour follows the entity across the whole
figure: blue = ISA size, orange = instructions Remill lifts, aqua = coverage %.
The figure is static: it targets a paper, so there is no hover layer.
"""

from __future__ import annotations

import argparse
import csv
from pathlib import Path

REPO = Path(__file__).resolve().parents[1]

SURFACE = "#fcfcfb"
INK = "#0b0b0b"
INK_2 = "#52514e"
GRID = "#e4e3df"
AXIS = "#b9b8b2"

C_SIZE = "#2a78d6"     # categorical slot 1 - ISA size
C_COVER = "#eb6834"    # categorical slot 2 - lifted by Remill
C_PCT = "#1baf7a"      # categorical slot 3 - coverage %  (low contrast: always direct-labelled)

ISA_TITLE = {"x86-64": "x86-64 (XED iforms)", "a64": "A64 (ASL encodings)"}


def year_frac(date: str) -> float:
    y, m, d = (int(x) for x in date.split("-"))
    return y + (m - 1) / 12.0 + (d - 1) / 365.0


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
    for mult in (1, 2, 2.5, 5, 10):
        step = mag * mult
        if span / step <= target * 1.4:
            break
    start = (int(lo / step)) * step
    ticks = []
    v = start
    while v <= hi + step * 0.001:
        if v >= lo - step * 0.001:
            ticks.append(round(v, 6))
        v += step
    return ticks


def draw_panel(out, p, title, series, ylab, pct=False, xticks=None):
    out.append(f'<rect x="{p.x0}" y="{p.y0}" width="{p.w}" height="{p.h}" fill="{SURFACE}"/>')
    for t in nice_ticks(p.ymin, p.ymax):
        y = p.py(t)
        if not (p.y0 - 1 <= y <= p.y0 + p.h + 1):
            continue
        out.append(f'<line x1="{p.x0}" y1="{y:.1f}" x2="{p.x0+p.w}" y2="{y:.1f}" stroke="{GRID}" stroke-width="1"/>')
        lab = f"{t:g}%" if pct else f"{t:,.0f}"
        out.append(f'<text x="{p.x0-8}" y="{y+4:.1f}" text-anchor="end" font-size="11" fill="{INK_2}">{lab}</text>')
    for t in (xticks or []):
        x = p.px(t)
        out.append(f'<line x1="{x:.1f}" y1="{p.y0+p.h}" x2="{x:.1f}" y2="{p.y0+p.h+4}" stroke="{AXIS}" stroke-width="1"/>')
        out.append(f'<text x="{x:.1f}" y="{p.y0+p.h+18}" text-anchor="middle" font-size="11" fill="{INK_2}">{int(t)}</text>')
    out.append(f'<line x1="{p.x0}" y1="{p.y0+p.h}" x2="{p.x0+p.w}" y2="{p.y0+p.h}" stroke="{AXIS}" stroke-width="1"/>')
    out.append(f'<text x="{p.x0}" y="{p.y0-10}" font-size="12.5" font-weight="600" fill="{INK}">{esc(title)}</text>')
    out.append(f'<text x="{p.x0-46}" y="{p.y0+p.h/2}" font-size="11" fill="{INK_2}" text-anchor="middle" '
               f'transform="rotate(-90 {p.x0-46} {p.y0+p.h/2})">{esc(ylab)}</text>')

    for colour, pts, label in series:
        if not pts:
            continue
        d = " ".join(("M" if i == 0 else "L") + f"{p.px(x):.1f},{p.py(y):.1f}" for i, (x, y) in enumerate(pts))
        out.append(f'<path d="{d}" fill="none" stroke="{colour}" stroke-width="2" '
                   f'stroke-linejoin="round" stroke-linecap="round"/>')
        for x, y in (pts[0], pts[-1]):
            out.append(f'<circle cx="{p.px(x):.1f}" cy="{p.py(y):.1f}" r="4" fill="{colour}" '
                       f'stroke="{SURFACE}" stroke-width="2"/>')
        lx, ly = pts[-1]
        txt = f"{ly:.1f}%" if pct else f"{ly:,.0f}"
        out.append(f'<text x="{p.px(lx)+8:.1f}" y="{p.py(ly)+4:.1f}" font-size="11" font-weight="600" '
                   f'fill="{INK}">{esc(txt)}</text>')


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--csv", default="data/series.csv")
    ap.add_argument("--out", default="figures/coverage_series.svg")
    ap.add_argument("--tex", default="figures/coverage_series.tex")
    args = ap.parse_args()

    rows = list(csv.DictReader((REPO / args.csv).open(encoding="utf-8")))
    for r in rows:
        r["t"] = year_frac(r["date"])
        r["n"] = int(r["isa_instruction_count"])
        r["c"] = int(r["remill_covered_count"])
        r["p"] = float(r["coverage_pct"])

    isas = [i for i in ("x86-64", "a64") if any(r["isa"] == i for r in rows)]
    xmin = min(r["t"] for r in rows) - 0.15
    xmax = max(r["t"] for r in rows) + 0.55
    xticks = list(range(int(xmin) + 1, int(xmax) + 1))

    W, H = 980, 300 * len(isas) + 70
    PW, PH = 360, 210
    out = [f'<svg xmlns="http://www.w3.org/2000/svg" width="{W}" height="{H}" viewBox="0 0 {W} {H}" '
           f'font-family="Inter, Helvetica, Arial, sans-serif">',
           f'<rect width="{W}" height="{H}" fill="{SURFACE}"/>']

    out.append(f'<text x="70" y="30" font-size="15" font-weight="700" fill="{INK}">'
               f'ISA growth vs. hand-written lifter coverage (Remill)</text>')

    for k, isa in enumerate(isas):
        rs = sorted((r for r in rows if r["isa"] == isa), key=lambda r: r["t"])
        top = 74 + k * 290
        ymax_n = max(r["n"] for r in rs) * 1.12
        pL = Panel(70, top, PW, PH, xmin, xmax, 0, ymax_n)
        draw_panel(out, pL, f'{ISA_TITLE[isa]} - instruction count', [
            (C_SIZE, [(r["t"], r["n"]) for r in rs], "ISA size"),
            (C_COVER, [(r["t"], r["c"]) for r in rs], "lifted by Remill"),
        ], "instructions", xticks=xticks)

        ymax_p = max(r["p"] for r in rs) * 1.25
        pR = Panel(70 + PW + 120, top, PW, PH, xmin, xmax, 0, ymax_p)
        draw_panel(out, pR, f'{ISA_TITLE[isa]} - coverage', [
            (C_PCT, [(r["t"], r["p"]) for r in rs], "coverage %"),
        ], "% of ISA covered", pct=True, xticks=xticks)

    ly = H - 22
    out.append(f'<g font-size="11.5" fill="{INK_2}">')
    for i, (colour, label) in enumerate([(C_SIZE, "ISA size"), (C_COVER, "lifted by Remill"),
                                         (C_PCT, "coverage % (right panels)")]):
        x = 70 + i * 210
        out.append(f'<line x1="{x}" y1="{ly-4}" x2="{x+22}" y2="{ly-4}" stroke="{colour}" stroke-width="2"/>')
        out.append(f'<circle cx="{x+11}" cy="{ly-4}" r="4" fill="{colour}" stroke="{SURFACE}" stroke-width="2"/>')
        out.append(f'<text x="{x+30}" y="{ly}" fill="{INK_2}">{esc(label)}</text>')
    out.append("</g>")
    out.append("</svg>")

    svg_path = REPO / args.out
    svg_path.parent.mkdir(parents=True, exist_ok=True)
    svg_path.write_text("\n".join(out) + "\n", encoding="utf-8")

    tex = [r"% generated by scripts/plot_series.py -- ISA size vs Remill coverage",
           r"\begin{tabular}{llrrr}", r"\toprule",
           r"ISA & date & ISA size & Remill covers & coverage \\", r"\midrule"]
    for isa in isas:
        rs = [r for r in sorted((r for r in rows if r["isa"] == isa), key=lambda r: r["t"])
              if r["is_change_point"] == "1"]
        for r in rs:
            tex.append(f'{esc(isa)} & {r["date"]} & {r["n"]:,} & {r["c"]:,} & {r["p"]:.2f}\\% \\\\')
        tex.append(r"\midrule")
    tex[-1] = r"\bottomrule"
    tex += [r"\end{tabular}"]
    tex_path = REPO / args.tex
    tex_path.write_text("\n".join(tex) + "\n", encoding="utf-8")

    print(f"wrote {svg_path}")
    print(f"wrote {tex_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
