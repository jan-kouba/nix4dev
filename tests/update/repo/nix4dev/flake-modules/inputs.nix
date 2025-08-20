{
  perSystem.nix4dev.flake = {
    extraInputs = {
      nix4dev.url = "github:jan-kouba/nix4dev";
    };

    extraFlakeModules = [
      "inputs.nix4dev.flakeModules.default"
    ];
  };
}
