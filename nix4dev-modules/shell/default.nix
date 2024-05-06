# This directory contains base settings that are always applied.
nix4devInputs: {flake-parts-lib, ...}: {
  imports = [
    ./commands.nix
    (flake-parts-lib.importApply ./devshell.nix nix4devInputs)
    ./documentation.nix
    ./treefmt.nix
  ];
}
