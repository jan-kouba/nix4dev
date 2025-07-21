{
  perSystem.nix4dev.flake = {
    extraInputs.dummy-flake.url = "github:jan-kouba/dummy-repo";
    extraFlakeModules = [ "inputs.dummy-flake.flakeModules.default" ];
  };

  # Add your config here
}
