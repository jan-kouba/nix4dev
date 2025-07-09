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

            description = lib.mkOption {
              type = lib.types.str;
              description = ''A one-line description of the template, in CommonMark syntax.'';
              example = "A simple nix4dev seed";
            };

            welcomeText = lib.mkOption {
              type = lib.types.str;
              description = ''
                A block of markdown text to display when a user initializes a new flake based on this seed.
              '';
              example = ''
                # Simple nix4dev Template

                To start using nix4dev run ...
              '';
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
        hasSeeds = topCfg.nix4dev.seeds != { };

        nix4devInputs = inputs.nix4dev.inputs;

        seedFlake = flake-parts-lib.mkFlake { inputs = nix4devInputs; } {
          imports = [
            (flake-parts-lib.importApply ../../nix4dev-modules nix4devInputs)
          ];
        };
        seedProjectDir = pkgs.runCommand "seed-project" { } ''
          PRJ_ROOT="$out" ${seedFlake.packages.${system}.setup}/bin/setup
        '';

        generatedTemplatesDirs = lib.concatMapAttrs (_: seed: {
          "nix4dev/seeds/${seed.templateName}" = {
            source.file = seedProjectDir;
          };
        }) topCfg.nix4dev.seeds;

        escapeNixIndentedString =
          s:
          let
            s' = lib.strings.replaceStrings [ "''" ] [ "'''" ] s;
            s'' = lib.strings.replaceStrings [ "$" ] [ "\\$" ] s';
          in
          "''${s''}''";

        templateDef = seed: ''
          ${lib.strings.escapeNixIdentifier seed.templateName} = {
            description = ${lib.strings.escapeNixString seed.description};
            welcomeText = ${escapeNixIndentedString seed.welcomeText};
            path = ../nix4dev/seeds + ${lib.strings.escapeNixString "/${seed.templateName}"};
          };
        '';

        seedsNixFile = pkgs.writeText "seeds.nix" ''
          {
            flake.templates = {
              ${lib.strings.concatMapAttrsStringSep "" (_: templateDef) topCfg.nix4dev.seeds}
            };
          }
        '';
      in
      {
        nix4dev.managedFiles.files = {
          "flake-modules/seeds.nix" = lib.mkIf hasSeeds {
            source.file = seedsNixFile;
          };
        } // generatedTemplatesDirs;

        nix4dev.projectFlake = lib.mkIf hasSeeds {
          enable = true;
          extraFlakeModules = [ "./flake-modules/seeds.nix" ];
        };
      };
  };
}
