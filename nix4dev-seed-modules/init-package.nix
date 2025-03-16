/*
This module must be applied in the nix4dev flake.
It creates the init package, that initializes nix4dev in the current repository.
*/
{
  extraFixedFlakeInputs,
  extraFixedModules,
}: {lib, ...}: let
  l = lib // builtins;
in {
  config.perSystem = {
    config,
    pkgs,
    self',
    ...
  }: let
    nix4devLib = import ../nix4dev-lib {inherit pkgs;};

    seededModuleNotFormatted = pkgs.writeText "not-formatted-default.nix" ''
      { inputs, ... }: {
        perSystem.nix4dev.flake = {
          extraInputs = ${nix4devLib.printFlakeInputs extraFixedFlakeInputs};
          extraFlakeModules = [
            ${l.strings.concatMapStringsSep " " (x: ''"${x}"'') extraFixedModules}
          ];
        };
      }
    '';

    seededModule = nix4devLib.writeFormattedFile {
      treefmtConfig = config.treefmt;
      fileToFormat = seededModuleNotFormatted;
      outputFileName = "default.nix";
    };

    init = pkgs.writeShellApplication {
      name = "setup";
      runtimeInputs = [self'.packages.setup];
      text = ''
        PRJ_ROOT="$(pwd)" setup

        ${pkgs.coreutils}/bin/install -D "${seededModule}" nix4dev/flake-modules/default.nix

        echo '# Welcome to nix4dev dev-shell!'
        echo
        echo '* Tune ./nix4dev/flake-modules'
        echo '* run "direnv allow" or "nix develop"'
        echo '* Enjoy!'
      '';
    };
  in {
    config = {
      packages.init = init;

      # nix4dev.managedFiles.files = let
      #   initTemplate = pkgs.runCommand "init-template" {} ''
      #     mkdir $out

      #     export PRJ_ROOT
      #     PRJ_ROOT="$out"

      #     ${self'.packages.setup}

      #     ${pkgs.coreutils}/bin/install -D "${seededModule}" "$out"/nix4dev/flake-modules/default.nix
      #   '';
      #   initFiles = lib.filesystem.listFilesRecursive initTemplate;
      # in lib.listToAttrs (
      #   lib.lists.map (path: let
      #       relPath = lib.path.removePrefix initTemplate path;
      #     in {
      #       name = relPath;
      #       value = {
      #         source.file = path;
      #       };
      #     }
      #   ) initFiles
      # );

      nix4dev.flake = {
        extraInputs = extraFixedFlakeInputs;
        extraFlakeModules = extraFixedModules;
      };
    };
  };

  config.flake.templates.default = {
        description = "Initial nix4dev setup";
        welcomeText = ''
          # Welcome to **nix4dev dev-shell**!

          * Tune `./nix4dev/flake-modules`
          * run `direnv allow` or `nix develop`
          * **Enjoy!**
        '';
        path = ./templates/init;
      };
}
