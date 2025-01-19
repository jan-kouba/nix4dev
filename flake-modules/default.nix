{
  flake-parts-lib,
  inputs,
  self,
  ...
}: {
  systems = import inputs.systems;

  imports = [
    (flake-parts-lib.importApply ../nix4dev-seed-modules {nix4devFlake = self;})
    ./output.nix
    ./managed-files
  ];

  nix4dev.seed = {
    extraFixedFlakeInputs = {};
  };
}
