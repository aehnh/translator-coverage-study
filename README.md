# Counting x86-64 Iforms

Clone with submodules:

```sh
git clone --recurse-submodules <repo-url>
cd translator-coverage-study
```

Run from the repo root:

```sh
nix develop
python3 scripts/count_xed_instructions.py
python3 scripts/calculate_remill_coverage.py
```

Current output:

```text
2020-03: 6135 x86-64 iforms
2026: 8465 x86-64 iforms

2020-03: 1635 / 6135 x86-64 iforms covered (26.65%)
2026: 1919 / 8465 x86-64 iforms covered (22.67%)
```

`count_xed_instructions.py` gets distinct iforms from `external/XED-to-XML` for the March 2020 snapshot and the current snapshot. `calculate_remill_coverage.py` extracts Remill `ISEL_*` forms directly from `external/remill` and `external/remill_2020`, normalizes them to XED-to-XML iform names, and reports coverage.
