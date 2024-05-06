{
  inputs,
  self,
  ...
}: {
  imports = [inputs.nix4dev.flakeModules.nix4devSeed];

  config = {
    systems = import inputs.nix4dev.inputs.systems;

    flake.flakeModules.default = ./seed-module.nix;

    nix4dev.seed = {
      extraFixedFlakeInputs = {
        my-seed.url = "${self}";
      };
      extraFixedModules = ["inputs.my-seed.flakeModules.default"];
    };
  };
}
