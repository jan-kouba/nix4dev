{
  perSystem.nix4dev.flake = {
    inputs.dummy-flake.url = "github:jan-kouba/dummy-repo";

    modules = [
      "inputs.nix4dev.flakeModules.default"
      "inputs.dummy-flake.flakeModules.default"
    ];
  };

  # Add your config here
}
