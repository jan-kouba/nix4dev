{
  lib,
  makeFlakeNix,
  ...
}:
let
  l = lib // builtins;
  t = l.types;
in
{
  flakePartsInputPathString,
  nixpkgsInputPathString,
  flakeConfigPathString,
}:
{ config, ... }:
{
  options = {
    extraInputs = l.mkOption {
      type = t.attrsOf t.anything;
      description = ''
        Extra inputs for the flake.
        The format of this option must be attrset of valid flake inputs.
      '';
      example = ''
        {
          foo.url = "github:NixOS/nixpkgs/nixos-24.11";
        }
      '';
      default = { };
      defaultText = l.literalExpression "{}";
    };

    extraFlakeModules = l.mkOption {
      type = t.listOf t.str;
      description = ''
        Extra flake modules to import from the generated flake.nix file.
      '';
      default = [ ];
      defaultText = l.literalExpression "[]";
    };

    description = l.mkOption {
      type = t.nullOr t.str;
      description = ''
        Flake description. This will be set into flake's `description` attribute.
      '';
      example = "A very cool flake!";
      default = null;
    };

    baseFlakeInputs = l.mkOption {
      type = t.attrsOf t.anything;
      description = ''
        The list of flake inputs to add into the generated flake.nix file.
      '';
      visible = false;
      readOnly = true;
    };

    baseFlakeModules = l.mkOption {
      type = t.listOf t.str;
      description = ''
        Flake modules to import from the generated flake.nix file.
      '';
      visible = false;
      readOnly = true;
    };

    flakeNixFile = l.mkOption {
      type = t.pathInStore;
      description = ''
        Generated content of the `flake.nix` file.
      '';
      visible = false;
      readOnly = true;
    };
  };

  config = {
    flakeNixFile = makeFlakeNix {
      flakeInputs = config.baseFlakeInputs // config.extraInputs;
      flakeDescription = config.description;
      flakeModulesStrings = config.baseFlakeModules ++ config.extraFlakeModules;
      inherit flakePartsInputPathString nixpkgsInputPathString flakeConfigPathString;
    };
  };
}
