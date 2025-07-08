{
  config,
  flake-parts-lib,
  inputs,
  lib,
  ...
}:
let
  topCfg = config;
in
{
  options =
    let
      seedType = lib.types.submodule (
        { name, ... }:
        {
          options = {
            templateName = lib.mkOption {
              type = lib.types.str;
              description = ''
                Name of template produced by this seed.
              '';
              default = name;
              defaultText = "\${attrName}";
            };
          };
        }
      );
    in
    {
      nix4dev.seeds = lib.mkOption {
        type = lib.types.attrsOf seedType;
        description = ''
          The nix4dev seeds that should be provided by this project's flake.
        '';
        default = { };
        example = {
          default = {
            description = "A simple nix4dev seed";
            welcomeText = ''
              # Simple nix4dev Template

              To start using nix4dev run ...
            '';
          };
        };
      };
    };

  config = {
    perSystem =
      { pkgs, system, ... }:
      let
        seedFlake = flake-parts-lib.mkFlake { inputs = { }; } {
          imports = [
            (flake-parts-lib.importApply ../../nix4dev-modules inputs)
          ];
        };
        seedProjectDir = pkgs.runCommand "seed-project" { } ''
          PRJ_ROOT="$out" ${seedFlake.packages.${system}.setup}/bin/setup
        '';
      in
      {
        nix4dev.managedFiles.files = lib.concatMapAttrs (_: seed: {
          "nix4dev/seeds/${seed.templateName}" = {
            source.file = seedProjectDir;
          };
        }) topCfg.nix4dev.seeds;
      };
  };
}
