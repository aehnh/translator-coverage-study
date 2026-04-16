# Counting x86-64 Instruction Variants

This repository uses Intel XED to obtain the number of x86-64 instruction forms ("iforms").

## Clone the repository

Clone with submodules so `external/mbuild`, `external/xed`, and `external/remill` are present immediately:

```sh
git clone --recurse-submodules <repo-url>
cd translator-coverage-study
```

If you already cloned without submodules, initialize them from the repository root:

```sh
git submodule update --init --recursive
```

## Prerequisites

Use the Nix dev shell from the repository root so `python3` and the native build tools are available:

```sh
nix develop
```

## Build the XED kit

From the repository root:

```sh
cd external/xed
./mfile.py install
cd ../..
```

This creates a kit directory under `external/xed/kits/` with a name like:

```text
external/xed/kits/xed-install-base-2026-04-16-lin-x86-64
```

## Count instruction variants

Run the counting script from the repository root:

```sh
python3 scripts/count_xed_iforms.py
```

The script:

- finds every `xed-install-base-*` directory under `external/xed/kits/`
- reads the generated `include/xed/xed-iform-enum.h` header in each kit
- counts the non-invalid XED iform entries
- reports the count for each discovered kit

You can also run it in one command without manually entering the dev shell:

```sh
nix develop --command python3 scripts/count_xed_iforms.py
```

## Expected result

On the current XED kit in this repository, the script reports:

```text
8863 iforms
```

## Notes

- `./mfile.py install` must be run before the script, because the script reads the generated installed kit headers.
- If multiple `xed-install-base-*` directories exist, the script reports all of them.
- To scan a different kits directory, use:

```sh
python3 scripts/count_xed_iforms.py --kits-root /path/to/kits
```
