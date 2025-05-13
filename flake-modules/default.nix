{
  flake-parts-lib,
  inputs,
  self,
  ...
}:
{
  systems = import inputs.systems;

  imports = [
    inputs.flake-parts.flakeModules.flakeModules

    (flake-parts-lib.importApply ../nix4dev-seed-modules { nix4devFlake = self; })
    ./output.nix
    ./managed-files
    ./test-lib
  ];

  nix4dev.seed = {
    extraFixedFlakeInputs = { };
  };
}
