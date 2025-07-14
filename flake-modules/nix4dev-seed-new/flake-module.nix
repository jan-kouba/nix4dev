nix4devInputs:
{
  config,
  flake-parts-lib,
  inputs,
  lib,
  ...
}:
{
  options = {
    perSystem = flake-parts-lib.mkPerSystemOption (
      { options, ... }:
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

              extraFiles = options.nix4dev.managedFiles.files // {
                description = ''
                  The extra files to add to the template created by the seed.
                '';
              };
            };
          }
        );
      in
      {
        options.nix4dev.seeds = lib.mkOption {
          type = lib.types.attrsOf seedType;
          description = ''
            The nix4dev seeds that should be provided by this project's flake.
            Every seed defines a new nix flake template which contains the common nix4dev files
            and optionally also some extra files.
          '';
          default = { };
          example = {
            default = {
              description = "A simple nix4dev seed";
              welcomeText = ''
                # Simple nix4dev Template

                To start using nix4dev run ...
              '';

              extraFiles = {
                "nix4dev/flake-modules/default.nix".source.text = ''
                  { }
                '';
              };
            };
          };
        };
      }
    );
  };

  config = {
    perSystem =
      {
        config,
        pkgs,
        system,
        ...
      }:
      let
        hasSeeds = config.nix4dev.seeds != { };

        seedTemplateFiles =
          seed:
          let
            seedFlakeModule = flake-parts-lib.evalFlakeModule { inputs = nix4devInputs; } {
              imports = [
                (flake-parts-lib.importApply ../../nix4dev-modules nix4devInputs)
              ];
            };

            seedProjectDir = pkgs.runCommand "seed-project" { } ''
              mkdir -p $out
              cd $out

              ${lib.concatMapAttrsStringSep "\n" (
                _: extraFile:
                let
                  srcFileArg = lib.strings.escapeShellArg "${extraFile.source.file}";
                  targetFileRelPathArg = lib.strings.escapeShellArg extraFile.target;
                in
                ''
                  mkdir -p "$(dirname ${targetFileRelPathArg})"
                  ${pkgs.rsync}/bin/rsync \
                    -r \
                    ${srcFileArg} \
                    ${targetFileRelPathArg}
                ''
              ) seed.extraFiles}

              ${seedFlakeModule.config.allSystems.${system}.nix4dev.managedFiles.updateFiles} $out
            '';
          in
          {
            "nix4dev/seeds/${seed.templateName}" = {
              source.file = seedProjectDir;
            };
          };

        generatedTemplatesDirs = lib.concatMapAttrs (_: seedTemplateFiles) config.nix4dev.seeds;

        escapeNixIndentedString = s: "''${lib.strings.replaceStrings [ "''" "$" ] [ "'''" "\\$" ] s} ''";

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
              ${lib.strings.concatMapAttrsStringSep "" (_: templateDef) config.nix4dev.seeds}
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
