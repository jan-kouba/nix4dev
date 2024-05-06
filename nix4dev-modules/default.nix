nix4devInputs: {flake-parts-lib, ...}: let
  fpl = flake-parts-lib;
in {
  imports = [
    nix4devInputs.devshell.flakeModule
    nix4devInputs.treefmt-nix.flakeModule

    ./bash.nix
    ./conventional-commits
    ./managed-files.nix
    ./markdown.nix
    ./nixlang.nix
    (fpl.importApply ./pkgs.nix nix4devInputs)
    ./project-flake
    ./terraform.nix
    (fpl.importApply ./shell nix4devInputs)
  ];
}
