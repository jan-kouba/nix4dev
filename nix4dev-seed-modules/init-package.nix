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

    seededModule = pkgs.runCommand "default.nix" {} ''
      cat ${seededModuleNotFormatted} | ${config.treefmt.package}/bin/treefmt --config-file ${config.treefmt.build.configFile} --stdin out.nix > $out
    '';

    init = pkgs.writeShellApplication {
      name = "setup";
      runtimeInputs = [self'.packages.setup];
      text = ''
        PRJ_ROOT="$(pwd)" setup

        install -D "${seededModule}" nix4dev/flake-modules/default.nix

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
      nix4dev.flake = {
        extraInputs = extraFixedFlakeInputs;
        extraFlakeModules = extraFixedModules;
      };
    };
  };
}
