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
        templateType = lib.types.submodule (
          { name, ... }:
          {
            options = {
              templateName = lib.mkOption {
                type = lib.types.str;
                description = ''
                  Name of this template.
                '';
                default = name;
                defaultText = "\${attrName}";
              };

              description = lib.mkOption {
                type = lib.types.str;
                description = ''A one-line description of the template, in CommonMark syntax.'';
                example = "A simple nix4dev template";
              };

              welcomeText = lib.mkOption {
                type = lib.types.str;
                description = ''
                  A block of markdown text to display when a user initializes a new flake based on this template.
                '';
                example = ''
                  # Simple nix4dev Template

                  To start using nix4dev run ...
                '';
              };

              extraFiles = options.nix4dev.managedFiles.files // {
                description = ''
                  The extra files to add to this template.
                '';
              };
            };
          }
        );
      in
      {
        options.nix4dev.templates = lib.mkOption {
          type = lib.types.attrsOf templateType;
          description = ''
            The nix flake templates that should be provided by this project's flake.
            Every template contains the common nix4dev files and optionally also some extra files.
          '';
          default = { };
          example = {
            default = {
              description = "A simple nix4dev template";
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
        hasTemplates = config.nix4dev.templates != { };

        templateFiles =
          template:
          let
            templateFlakeModule = flake-parts-lib.evalFlakeModule { inputs = nix4devInputs; } {
              imports = [
                (flake-parts-lib.importApply ../../nix4dev-modules nix4devInputs)
              ];
            };

            templateProjectDir = pkgs.runCommand "template-project" { } ''
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
              ) template.extraFiles}

              ${templateFlakeModule.config.allSystems.${system}.nix4dev.managedFiles.updateFiles} $out
            '';
          in
          {
            "nix4dev/templates/${template.templateName}" = {
              source.file = templateProjectDir;
            };
          };

        generatedTemplatesDirs = lib.concatMapAttrs (_: templateFiles) config.nix4dev.templates;

        escapeNixIndentedString = s: "''${lib.strings.replaceStrings [ "''" "$" ] [ "'''" "\\$" ] s} ''";

        templateDef = template: ''
          ${lib.strings.escapeNixIdentifier template.templateName} = {
            description = ${lib.strings.escapeNixString template.description};
            welcomeText = ${escapeNixIndentedString template.welcomeText};
            path = ../nix4dev/templates + ${lib.strings.escapeNixString "/${template.templateName}"};
          };
        '';

        templatesNixFile = pkgs.writeText "templates.nix" ''
          {
            flake.templates = {
              ${lib.strings.concatMapAttrsStringSep "" (_: templateDef) config.nix4dev.templates}
            };
          }
        '';
      in
      {
        nix4dev.managedFiles.files = {
          "flake-modules/templates.nix" = lib.mkIf hasTemplates {
            source.file = templatesNixFile;
          };
        } // generatedTemplatesDirs;

        nix4dev.projectFlake = lib.mkIf hasTemplates {
          enable = true;
          extraFlakeModules = [ "./flake-modules/templates.nix" ];
        };
      };
  };
}
