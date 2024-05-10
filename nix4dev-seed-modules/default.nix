{nix4devFlake}: {
  config,
  lib,
  flake-parts-lib,
  ...
}: let
  l = lib // builtins;
  t = l.types;

  cfg = config.nix4dev.seed;
in {
  options = {
    nix4dev.seed = {
      extraFixedFlakeInputs = l.mkOption {
        type = t.attrsOf t.anything;
        description = ''
          Extra flake inputs to add into the ./nix4dev/flake.nix.
          The format of this option must be attrset of valid flake inputs.
        '';
        example = l.literalExpression ''
          {
            foo.url = "github:NixOS/nixpkgs/nixos-23.11";
          }
        '';
      };

      extraFixedModules = l.mkOption {
        type = t.listOf t.str;
        description = ''
          Extra modules to add into the ./nix4dev/flake.nix file.
          The string values will be writen verbatim into the file.
        '';
        example = l.literalExpression ''
          [
            "my-flake.flakeModules.default"
          ]
        '';
        default = [];
        defaultText = l.literalExpression "[]";
      };
    };
  };

  config = {
    perSystem = {system, ...}: {
      config = {
        # Setup project to use nix4dev shell.
        packages.init = let
          initialSetupProjectFlake =
            nix4devFlake.inputs.flake-parts.lib.mkFlake
            {
              inputs =
                nix4devFlake.inputs
                // {self = initialSetupProjectFlake;};
            }
            {
              imports = [
                nix4devFlake.flakeModules.default
                (flake-parts-lib.importApply ./init-package.nix {inherit (cfg) extraFixedFlakeInputs extraFixedModules;})
              ];
            };
        in
          initialSetupProjectFlake.packages.${system}.init;
      };
    };
  };
}
