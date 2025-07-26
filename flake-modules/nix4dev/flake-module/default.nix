nix4devInputs:
{ flake-parts-lib, ... }:
let
  fpl = flake-parts-lib;
in
{
  imports = [
    nix4devInputs.devshell.flakeModule
    nix4devInputs.treefmt-nix.flakeModule

    (fpl.importApply ../templates/flake-module.nix nix4devInputs)
    ./bash.nix
    ./conventional-commits
    ./editorconfig.nix
    ./json.nix
    ./lib
    ./managed-files.nix
    ./markdown.nix
    ./nixlang.nix
    (fpl.importApply ./pkgs.nix nix4devInputs)
    ./project-flake
    (fpl.importApply ./shell nix4devInputs)
    ./terratofu.nix
    ./yaml.nix
  ];
}
