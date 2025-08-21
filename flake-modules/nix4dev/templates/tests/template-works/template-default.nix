{
  perSystem.nix4dev.flake = {
    inputs = {
      dummy-flake.url = "github:jan-kouba/dummy-repo";
      nix4dev.url = "github:jan-kouba/nix4dev";
    };

    modules = [
      "inputs.nix4dev.flakeModules.default"
      "inputs.dummy-flake.flakeModules.default"
    ];
  };

  # Add your config here
}
