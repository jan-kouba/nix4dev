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
    ./nix4dev-templates
    ./test-lib
  ];

  nix4dev.seed = {
    extraFixedFlakeInputs = { };
  };
}
