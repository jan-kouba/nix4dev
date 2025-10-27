{
  imports = [
    inputs.flake-parts.flakeModules.flakeModules
  ];

  config.flake.flakeModules = {
    testModule = ./test-module.nix;
  };
}
