nix4devInputs: {flake-parts-lib, ...}: let
  fpl = flake-parts-lib;
in {
  imports = [
    nix4devInputs.devshell.flakeModule
    nix4devInputs.treefmt-nix.flakeModule

    ./bash.nix
    ./conventional-commits
    ./json.nix
    ./managed-files.nix
    (fpl.importApply ./markdown.nix nix4devInputs)
    ./nixlang.nix
    (fpl.importApply ./pkgs.nix nix4devInputs)
    ./project-flake
    ./terraform.nix
    (fpl.importApply ./shell nix4devInputs)
  ];
}
