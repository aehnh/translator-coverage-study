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

Both ISAs are measured from the **vendor's own machine-readable specification**, and
Remill is held **fixed at its latest checkout**, so the series isolates one variable:
the target moved.

Presentation grid - **one point per calendar year, 2020-2025, taking the last release
the vendor published in that year** (the same rule for both ISAs):

| year | x86-64 iforms | Remill | coverage | A64 encodings | Remill | coverage |
|---|---|---|---|---|---|---|
| 2020 | 6398 | 2027 | 31.68% | 2343 | 380 | 16.22% |
| 2021 | 6866 | 2029 | 29.55% | 2462 | 380 | 15.43% |
| 2022 | 6958 | 2027 | 29.13% | 3613 | 380 | 10.52% |
| 2023 | 8074 | 2030 | 25.14% | 3762 | 380 | 10.10% |
| 2024 | 8955 | 2029 | 22.66% | 4296 | 380 | 8.85% |
| 2025 | 8863 | 2040 | 23.02% | 4331 | 380 | 8.77% |

The covered-instruction count is a flat line in both cases while the ISA grows
underneath it, so coverage falls purely because the denominator moves: x86-64
31.68% -> 23.02% and A64 16.22% -> 8.77% over the same six years.

Figure: `figures/coverage_series.svg` (LaTeX table: `figures/coverage_series.tex`).
Data: `data/series_annual.csv` (presentation grid) and `data/series.csv` (full
density - every measured point, nothing discarded).

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

**x86-64 (primary) - one entry in Intel's own `xed_iform_enum_t`.**  Building
pristine upstream XED at a dated commit generates `xed-iform-enum.h`, Intel's
enumeration of every x86 iform it decodes.  `scripts/extract_x86_specs.sh` builds one
anchor per calendar year - the newest commit Intel had published by the end of that
year - and stores the resulting name sets in `specs/x86/<year>/iforms.txt.gz`
(manifest: `specs/x86/manifest.csv`).  Each build takes ~90 s; the extracted sets are
committed so the series rebuilds without them.

**x86-64 (secondary) - one distinct `iform=` value in XED-to-XML's
`instructions.xml`.**  `external/XED-to-XML` is a third-party fork of `intelxed/xed`
that commits a generated `instructions.xml` covering the variants usable in 64-bit
mode; it is what the paper's originally published x86 numbers came from.  It is
retained as `source=xed-to-xml-export` because the contrast between what Intel defined
and what a third-party exporter had actually published is itself a result - see
caveat 5.  The two differ in unit (Intel's enum also counts iforms reachable only in
16- and 32-bit modes, a stable ~200) and in currency (the export lagged APX by two
years).

**A64 - one `__encoding` entry in the `__decode A64` tree.**  ARM publishes the
machine-readable architecture specification as one XML tarball per quarterly release.
`external/mra_tools` converts a release into ASL; the decode tree names every A64
encoding.  The series samples **every ARM release we could retrieve** (25 releases,
2019-12 to 2026-06), one point per release.

`data/series.csv` samples **every** release: 25 ARM releases, 41 XED-to-XML snapshots
and 8 dated Intel XED anchors, with a `source` column distinguishing `arm-mra`,
`intel-xed-enum` and `xed-to-xml-export`.  Sampling is per release boundary, not on a
calendar grid, because ISA growth is a step function: the count is constant between
releases and jumps at one.  `is_change_point` marks rows where the count changed.

`data/series_annual.csv` is the **presentation** downsample used by the figure and the
paper table: one point per calendar year, 2020-2025, taking the last release the
vendor published that year - the same rule for both ISAs.  A year with no obtainable
release is left absent rather than interpolated, which is why the secondary
XED-to-XML curve has a visible break at 2023.  Nothing measured is discarded;
`data/series.csv` remains the record.

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
* **For x86 it only moves the level, not the trend.**  Against the Intel measure,
  contemporaneous Remill covers 1800 iforms in 2020 rising to 2003 in 2025 (vs.
  2027 -> 2040 fixed); coverage still falls, 28.13% -> 22.60%.  Fixing Remill at its
  latest is the *charitable* choice: it credits the lifter with work it had not yet
  done at the earlier dates.  `data/series_annual_remill_contemporaneous.csv` carries
  the annual grid for that variant.

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
5. **The x86 series is an *export* curve, not Intel's ISA curve - and it lags.**
   `data/series.csv` now carries `spec_version` (the XED `VERSION` string the snapshot
   was built from) and `spec_date` (the date of the newest non-merge commit touching
   XED's `datafiles/`, i.e. when Intel last changed the ISA tables that snapshot
   contains).  `spec_date` rather than VERSION is the honest content date: VERSION only
   moves at XED releases, so the fork's "13.0.0" snapshot reports February 2021 while
   actually carrying July 2021 datafiles - and it has 6661 iforms, more than the
   13.0.0 release itself.

   Dating by Intel's cadence rather than the fork's changes the picture: XED-to-XML's
   2025-03-24 snapshot really carries XED **v2024.11.04** content (2024-11-05), so on
   an Intel axis the x86 points fall at 2019-01, 2019-10, 2020-04, 2020-11, 2021-07,
   2022-10, 2024-11, 2025-03 and 2025-06 - an annual grid with exactly **one** hole,
   2023, not the two the fork's own dates suggest.

   Worse than the date lag is a *content* lag.  `scripts/xed_native_compare.py`
   (data: `data/xed_native_comparison.csv`) builds pristine upstream XED and counts
   Intel's own `xed_iform_enum_t`:

   | XED version | Intel date | Intel iform enum | XED-to-XML exported | diff |
   |---|---|---|---|---|
   | 8.30.0 | 2019-01-02 | 6293 | 6092 | 201 |
   | 11.0.1 | 2019-08-21 | 6339 | 6135 | 204 |
   | 12.0.1 | 2020-11-06 | 6398 | 6193 | 205 |
   | v2022.10.11 | 2022-10-12 | 6958 | 6755 | 203 |
   | v2023.12.19 | 2023-12-20 | 8074 | *(never exported)* | - |
   | v2024.11.04 | 2024-11-05 | 8955 | 6825 | **2130** |
   | v2025.06.08 | 2025-06-11 | 8694 | 8465 | 229 |

   Intel's enum is a different unit - it includes iforms reachable only in 16- and
   32-bit modes, which XED-to-XML deliberately excludes - but that difference is a
   stable ~200 in every year the exporter was current.  The 2130 at v2024.11.04 is not
   that: XED 2023.12 already defined **1233 new iforms, 1062 of them APX**, and the
   fork's 2024.11-based export contains only 138 of them.  The APX jump the export
   shows in May 2025 happened in Intel's XED by December 2023.  **This is why the
   Intel enum is the primary measure**; the export is kept only as a labelled
   secondary curve.

   Regenerating the export at 2023/2024 XED was tried and rejected as unsound: the
   XED-to-XML generator is a patch to XED's own `pysrc/generator.py` and does not port
   across XED versions in either direction (the 2024-era generator fails on 2022 XED
   with an `ImportError`; the 2022-era generator fails on 2023/2024 XED in
   decoder generation), and 3-way merges leave 9-24 conflicts in the very file that
   produces the measurement.  Filling 2023 that way would mean hand-authoring a merge
   that never existed and publishing its output as data.
6. **The secondary XED-to-XML series has a 2022-11 to 2025-03 hole.**  This affects
   only `source=xed-to-xml-export`; the primary Intel series has a point in every year
   2019-2026.  XED-to-XML did not regenerate
   `instructions.xml` for 28 months; upstream Intel XED kept releasing.  The gap is in
   the *measurement*, not the ISA.  The `spec_version` column records which upstream XED
   release each snapshot was generated from - e.g. the 2025-03-24 snapshot is built on
   XED 2024.11.04 - so the AVX10 and APX jumps that appear in 2025 correspond to ISA
   content Intel published earlier.  Nothing was interpolated to fill the hole.
7. **One x86 point is non-monotonic**: 2025-05-14 reports 8612 iforms and the next
   snapshot 8465.  That is an APX commit later reconciled against upstream, and it is
   left in the data as measured.
8. **`external/mra_tools` is patched** by `patches/mra_tools-missing-ps.patch` so that
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
