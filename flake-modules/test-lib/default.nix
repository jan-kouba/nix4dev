{
  imports = [ ./flake-module.nix ];

  flake.flakeModules.testLib = ./flake-module.nix;
}
