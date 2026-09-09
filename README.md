# Translator coverage study

How fast does an instruction set grow, and does a hand-written binary translator keep
up?  This repository measures, over time, (a) how many instructions an ISA defines and
(b) how many of them [Remill](https://github.com/lifting-bits/remill) lifts.

Clone with submodules:

```sh
git clone --recurse-submodules <repo-url>
cd translator-coverage-study
nix develop
```

## Headline

Remill is held **fixed at its latest checkout**, so the series isolates one variable:
the target moved.

| ISA | first point | last point | ISA growth | Remill covers |
|---|---|---|---|---|
| x86-64 | 2019-01: 6092 iforms, 31.30% covered | 2026-02: 8465 iforms, 22.67% covered | +39% | 1907 -> 1919 (+0.6%) |
| A64 | 2019-12: 2336 encodings, 16.27% covered | 2026-06: 4332 encodings, 8.77% covered | +85% | 380 -> 380 (unchanged) |

The covered-instruction count is essentially a flat line in both cases while the ISA
grows underneath it, so coverage falls purely because the denominator moves.

Figure: `figures/coverage_series.svg` (LaTeX table: `figures/coverage_series.tex`).
Data: `data/series.csv`, `data/series.json`.

## Reproducing

```sh
python3 scripts/check_regression.py     # asserts every previously published number
python3 scripts/build_series.py         # -> data/series.{csv,json}
python3 scripts/plot_series.py          # -> figures/coverage_series.{svg,tex}
```

The original two-point outputs still work unchanged:

```sh
python3 scripts/count_xed_instructions.py
python3 scripts/calculate_remill_x86-64_coverage.py
python3 scripts/count_asl_instructions.py
python3 scripts/calculate_remill_a64_coverage.py
```

`scripts/fetch_a64_specs.sh` rebuilds `specs/a64/` from ARM's published XML
(~915 MB of downloads); the generated decode trees are committed so this is not
normally needed.

## What is counted

**x86-64 - one distinct `iform=` value in XED-to-XML's `instructions.xml`.**
`external/XED-to-XML` is a fork of `intelxed/xed` that additionally commits a
generated `instructions.xml` covering the variants usable in 64-bit mode.  It has
full git history, so the identical measurement can be taken at any past commit.  The
series samples **every commit that touched `instructions.xml`** (41 commits,
2019-01-10 to 2026-02-15).

**A64 - one `__encoding` entry in the `__decode A64` tree.**  ARM publishes the
machine-readable architecture specification as one XML tarball per quarterly release.
`external/mra_tools` converts a release into ASL; the decode tree names every A64
encoding.  The series samples **every ARM release we could retrieve** (25 releases,
2019-12 to 2026-06), one point per release.

Sampling is per release boundary, not on a calendar grid, because ISA growth is a step
function: the count is constant between releases and jumps at one.  Interpolating
monthly points would invent data.  `is_change_point` in the CSV marks the rows where
the count actually changed.

## Coverage definition

Remill declares one `DEF_ISEL`/`ISEL_` symbol per instruction form it lifts.  The
coverage scripts extract those symbols (for x86 by running the C++ preprocessor over
`Runtime/Instructions.cpp`, since the names are macro-generated), normalise Remill's
naming to the ISA's naming, and count how many distinct ISA instructions are hit.
The normalisation tables are in the two `calculate_remill_*_coverage.py` scripts.

## Remill: fixed or contemporaneous?

`data/series.csv` holds Remill fixed at the latest commit.
`data/series_remill_contemporaneous.csv` instead uses, for each date, the newest Remill
commit that existed then.  Both are provided; the fixed one is the headline because:

* **For A64 the choice is a no-op.**  Remill's AArch64 `DEF_ISEL` set has been
  **byte-identical since mid-2018** - 682 names, and the 2020 and 2026 checkouts differ
  by zero entries.  The two A64 series are therefore numerically identical.
* **For A64 the two series are identical point for point** even though the
  contemporaneous run really does use 24 distinct dated Remill commits across the 25
  points: every one of them covers exactly 380 encodings.
* **For x86 it only moves the starting point.**  Contemporaneous Remill covers
  1628 iforms in 2019 rising to 1885 in 2026 (vs. 1907 -> 1919 fixed).  Coverage still
  falls, 26.72% -> 22.27%.  Fixing Remill at its latest is the *charitable* choice: it
  credits the lifter with work it had not yet done at the earlier dates.

## Known gaps and caveats

Read these before quoting a number.

1. **The README's old A64 coverage figures (370 and 359) are not reproducible.**  The
   A64 script and those figures were added in the same commit (`beaa494`) and already
   disagreed.  Running the committed code at the pinned submodules gives **380** for
   both `arch8.6` and `arch9.7`.  The 380 values are what `check_regression.py`
   asserts.  Every other originally published number (6135, 8465, 2336, 4331, 1635,
   1919) reproduces exactly.
2. **A64 runs 2019-12 to 2026-06; nothing earlier is obtainable, and two releases in
   the middle are missing.**  ARM published the first machine-readable architecture
   specification on **2017-04-20**, for Armv8.2-A (build `00bet3.1`), so no A64 point
   earlier than that can exist at all - 2016 is impossible in principle, not just in
   practice.  The 2017-04 to 2019-09 releases did exist but are not served any more:
   probing every quarter from 2017-04 across both filename prefixes and all version
   labels returns 404 until 2019-12.  **2024-03 and 2025-03 are the only gaps inside
   the covered range** - both releases exist, but neither ARM's CDN nor the Wayback
   Machine has a copy under any filename we could find.  Nothing is interpolated
   across them.

   ARM moved the download location three times, which is why the fetch script has
   three URL shapes:

   | releases | location |
   |---|---|
   | 2019-12 .. 2021-12 | `.../armv8-a-architecture/<date>/` |
   | 2022-03 .. 2023-12 | `.../armv9-a-architecture/<date>/` |
   | 2024-06 .. 2026-06 | `/-/cdn-downloads/permalink/Exploration-Tools-A64-ISA/ISA_A64/` |

   The permalink directory only keeps the most recent few releases (2025-09 onward at
   time of writing); 2024-06 .. 2025-06 come from the Wayback Machine's `id_` replay,
   which returns the original gzip body.  `developer.arm.com/documentation/ddi0602/<date>/`
   looks like a release index but is not usable as one: it returns HTTP 200 for any
   string, including `notadate`.
3. **`external/arch9.7` is the 2025-09 / 2025-12 / 2026-03 A64 encoding set.**  Those
   three consecutive releases have *identical* A64 encoding sets (4331), and each is
   byte-identical to `arch9.7`, so the encoding count alone cannot single one out.  The
   series carries all three as separate dated points; `arch9.7` is retained only as the
   original anchor in `check_regression.py`.
4. **The 2020-09 A64 count dips to 2311.**  This is real, not a tooling artefact:
   ARM's 2020-09 release ships 1252 instruction XML files against 1270 in 2020-06 and
   1276 in 2020-12, with the SVE matrix/BF16 files (`bfdot_z_*`, `*mmla_z_*`, `ld1ro*`)
   absent.  All 31 missing encodings return in 2020-12.
5. **x86 has a 2022-11 to 2025-03 hole.**  XED-to-XML did not regenerate
   `instructions.xml` for 28 months; upstream Intel XED kept releasing.  The gap is in
   the *measurement*, not the ISA.  The `spec_version` column records which upstream XED
   release each snapshot was generated from - e.g. the 2025-03-24 snapshot is built on
   XED 2024.11.04 - so the AVX10 and APX jumps that appear in 2025 correspond to ISA
   content Intel published earlier.  Nothing was interpolated to fill the hole.
6. **One x86 point is non-monotonic**: 2025-05-14 reports 8612 iforms and the next
   snapshot 8465.  That is an APX commit later reconciled against upstream, and it is
   left in the data as measured.
7. **`external/mra_tools` is patched** by `patches/mra_tools-missing-ps.patch` so that
   alias iclasses shipped without pseudocode (2020-09) do not abort the run.  The patch
   is verified inert: regenerating releases that do not need it produces byte-identical
   decode trees, and the 2019-12 release reproduces `external/arch8.6`'s variant set
   exactly.

## Layout

```
scripts/count_xed_instructions.py            x86-64 ISA size (--history for the series)
scripts/count_asl_instructions.py            A64 ISA size (--all-releases for the series)
scripts/calculate_remill_x86-64_coverage.py  Remill x86-64 coverage (--commit)
scripts/calculate_remill_a64_coverage.py     Remill A64 coverage (--release)
scripts/build_series.py                      drives all four -> data/series.{csv,json}
scripts/plot_series.py                       -> figures/coverage_series.{svg,tex}
scripts/check_regression.py                  asserts the previously published numbers
scripts/fetch_a64_specs.sh                   rebuilds specs/a64 from ARM's XML
specs/a64/<YYYY-MM>/arch_decode.asl.gz       generated ASL decode tree per ARM release
external/arch8.6, external/arch9.7           the original two A64 anchors
```
