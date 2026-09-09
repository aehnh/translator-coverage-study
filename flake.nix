{
  description = "Development shell for translator-coverage-study and bundled XED dependencies";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = f:
        nixpkgs.lib.genAttrs systems (system:
          f {
            pkgs = import nixpkgs { inherit system; };
          });
    in {
      devShells = forAllSystems ({ pkgs }: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            python3
            gcc          # scripts/calculate_remill_x86-64_coverage.py preprocesses C++
            gnumake
            binutils
            git          # scripts/count_xed_instructions.py reads XED-to-XML history
            curl         # scripts/fetch_a64_specs.sh downloads ARM's ISA XML
            gzip
            gnutar
            librsvg      # optional: rasterise figures/coverage_series.svg
            pkg-config
          ];

          shellHook = ''
            echo "Dev shell ready. Python: $(python3 --version)"
          '';
        };
      });
    };
}
