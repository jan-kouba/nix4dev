{
  imports = [
    ./flake-module.nix
    ./tests
  ];

  flake.flakeModules.testLib = ./flake-module.nix;
}
