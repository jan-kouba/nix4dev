nix4devInputs:
{
  config,
  flake-parts-lib,
  inputs,
  lib,
  ...
}:
{
  options.perSystem = flake-parts-lib.mkPerSystemOption (
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
          The nix flake templates that will be provided by this project's flake.

          Every template contains the common nix4dev files and optionally also some extra files
          configured using the `extraFiles` option.

          The template is constructed as if a basic nix4dev devshell was initialized in a directory,
          the extra files were added into the directory
          and the `setup` command was called in such devshell.
          The default flake module provided by the nix4dev flake is imported automatically.

          The devshell (in which the setup command is run) has only the nix4dev flake as input.
          It is not possible to add other inputs. However, it is possible to configure
          the `perSystem.nix4dev.flake.extraInputs` option which will add the extra inputs into
          the generated template, so they can be used in the devshells initialized using the generated template.
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

  config.perSystem =
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
          templateExtraFiles = pkgs.runCommand "template-extra-files-dir" { } ''
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
          '';

          templateFlakeDefaultNix =
            let
              defaultNixRelPath = "nix4dev/flake-modules/default.nix";
              defaultNixFile = "${templateExtraFiles}/${defaultNixRelPath}";
            in
            assert (
              lib.asserts.assertMsg (lib.filesystem.pathIsRegularFile defaultNixFile) ''
                The template `${template.templateName}` did not provide the `${defaultNixRelPath}` file.
                Please add it using the `extraFiles` option.
              ''
            );
            defaultNixFile;

          templateFlakeModule = flake-parts-lib.evalFlakeModule { inputs = nix4devInputs; } {
            imports = [
              (flake-parts-lib.importApply ../flake-module nix4devInputs)
              templateFlakeDefaultNix
            ];
          };

          templateProjectDir = pkgs.runCommand "template-project" { } ''
            mkdir -p $out
            cd $out

            ${pkgs.rsync}/bin/rsync \
              -r \
              --perms --chmod=u=rwX \
              ${templateExtraFiles}/ \
              .

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
}
