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
            gcc
            gnumake
            binutils
            git
            pkg-config
          ];

          shellHook = ''
            echo "Dev shell ready. Python: $(python3 --version)"
          '';
        };
      });
    };
}
