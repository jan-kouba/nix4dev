{
  perSystem.nix4dev.flake = {
    inputs = {
      nix4dev.url = "github:jan-kouba/nix4dev";
    };

    modules = [
      "inputs.nix4dev.flakeModules.default"
    ];
  };
}
