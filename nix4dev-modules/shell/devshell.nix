nix4devInputs: {lib, ...}: let
  l = lib // builtins;
  t = l.types;
in {
  config = {
    systems = l.mkDefault (import nix4devInputs.systems);

    perSystem = {
      config,
      pkgs,
      ...
    }: let
      sysConfig = config;
      cfg = config.nix4dev;

      nix4devLib = import ../../nix4dev-lib {inherit pkgs;};

      baseFlakeOptions = nix4devLib.flakeNixOptions {
        treefmtConfig = sysConfig.treefmt;
        flakePartsInputPathString = "inputs.nix4dev.inputs.flake-parts";
        nixpkgsInputPathString = "inputs.nix4dev.inputs.nixpkgs";
        flakeConfigPathString = "nix4dev.flake";
      };

      flakeOptions = {
        imports = [baseFlakeOptions];

        config = {
          baseFlakeInputs = {
            nix4dev.url = "github:jan-kouba/nix4dev";
          };

          baseFlakeModules = [
            "inputs.nix4dev.flakeModules.default"
          ];
        };
      };

      flakeType = t.submodule flakeOptions;
    in {
      options.nix4dev = {
        envrc = {
          preamble = l.mkOption {
            type = t.lines;
            description = ''
              Lines to put into the beginning of .envrc.
              Can be used to watch for additional files.
            '';
            default = "";
            internal = true;
          };

          watchDirectories = l.mkOption {
            type = t.listOf t.str;
            description = ''
              List of directories to watch for changes that will trigger
              direnv reload. The directories must be relative paths to the project root.
            '';
            default = [];
            example = ["./flake-modules/common"];
          };
        };

        flake = l.mkOption {
          type = flakeType;
          description = ''
            Configuration of nix4dev's flake.
            For the configuration of the project's flake see the `nix4dev.projectFlake` option.
          '';
          default = {};
        };
      };

      config = {
        nix4dev.managedFiles.files = {
          "nix4dev/flake.nix".source.file = cfg.flake.flakeNixFile;

          ".envrc".source.text = let
            allWatchDirs = ["nix4dev"] ++ cfg.envrc.watchDirectories;
          in ''
            #!/usr/bin/env bash
            # ^ added for shellcheck and file-type detection

            ${cfg.envrc.preamble}

            # Watch & reload direnv on change
            set_watch() {
              TO_WATCH=""
            ${
              l.strings.concatLines (
                l.lists.concatMap (dir: [
                  ("  " + ''mapfile -td "" TO_WATCH < <(find "./${dir}" -type f -print0)'')
                  ("  " + ''watch_file "''${TO_WATCH[@]}"'')
                ])
                allWatchDirs
              )
            }
            }
            set_watch

            if [[ $(type -t use_flake) != function ]]; then
              echo "ERROR: use_flake function missing."
              echo "Please update direnv to v2.30.0 or later."
              exit 1
            fi
            use flake ./nix4dev
          '';

          ".gitignore".source.lines = ''
            /.direnv
          '';
        };

        nix4dev.updateCommands = let
          cmd = pkgs.writeShellApplication {
            name = "update-nix4dev-inputs";
            runtimeInputs = [pkgs.nix];
            text = ''
              ( cd "$PRJ_ROOT"/nix4dev && nix flake update )
            '';
          };
        in ["${cmd}/bin/${cmd.name}"];
      };
    };
  };
}
