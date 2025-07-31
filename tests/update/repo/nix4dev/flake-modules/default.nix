{ lib, ... }:
let
  l = lib // builtins;

  inputs = {
    dep = {
      url = "${l.head (l.splitString "\n" (l.readFile ./repo_root))}/../dep-repo";
      flake = false;
    };
  };
in
{
  imports = [
    ./inputs.nix
    ../../test-module.nix
  ];

  perSystem = {
    nix4dev.flake = {
      inherit inputs;
    };

    nix4dev.projectFlake = {
      enable = true;
      inputs = inputs // {
        systems.url = "github:nix-systems/default";
      };
    };
  };
}
