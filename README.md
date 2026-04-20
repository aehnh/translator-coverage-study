# Coverage Scripts

Clone with submodules:

```sh
git clone --recurse-submodules <repo-url>
cd translator-coverage-study
```

Run from the repo root:

```sh
nix develop
python3 scripts/count_xed_instructions.py
python3 scripts/calculate_remill_x86-64_coverage.py
python3 scripts/count_asl_instructions.py
python3 scripts/calculate_remill_a64_coverage.py
```

Current output:

```text
2020-03: 6135 x86-64 iforms
2026: 8465 x86-64 iforms

2020-03: 1635 / 6135 x86-64 iforms covered (26.65%)
2026: 1919 / 8465 x86-64 iforms covered (22.67%)

external/arch8.6/arch_decode.asl: 2336 unique A64 instruction variants
external/arch9.7/arch_decode.asl: 4331 unique A64 instruction variants

2020-03: 370 / 2336 A64 instruction variants covered (15.84%)
2026: 359 / 4331 A64 instruction variants covered (8.29%)
```

`count_xed_instructions.py` counts x86-64 iforms from `external/XED-to-XML`. `calculate_remill_x86-64_coverage.py` measures Remill x86-64 iform coverage against those sets. `count_asl_instructions.py` counts unique A64 instruction variants from `external/arch8.6` and `external/arch9.7`. `calculate_remill_a64_coverage.py` measures Remill A64 coverage against those ASL variant sets.
