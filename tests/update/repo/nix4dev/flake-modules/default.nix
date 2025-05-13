{ lib, ... }:
let
  l = lib // builtins;

  extraInputs = {
    dep = {
      url = "${l.head (l.splitString "\n" (l.readFile ./repo_root))}/../dep-repo";
      flake = false;
    };
  };
in
{
  imports = [ ../../test-module.nix ];

  perSystem =
    { ... }:
    {
      nix4dev.flake = {
        inherit extraInputs;
      };

      nix4dev.projectFlake = {
        enable = true;
        extraInputs = extraInputs // {
          systems.url = "github:nix-systems/default";
        };
      };
    };
}
