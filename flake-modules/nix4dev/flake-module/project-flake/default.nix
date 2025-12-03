{ flake-parts-lib, lib, ... }:
let
  l = lib // builtins;
  t = lib.types;
in
{
  options.perSystem = flake-parts-lib.mkPerSystemOption (
    {
      config,
      pkgs,
      ...
    }:
    let
      cfg = config.nix4dev.projectFlake;
      flakeOptionsBase = config.nix4dev.lib.internal.flakeNixOptions;
      flakeOptions = {
        imports = [ flakeOptionsBase ];

        options = {
          enable = l.mkEnableOption "project flake";
        };

        config = {
          inputs = {
            flake-parts = l.mkDefault {
              url = "github:hercules-ci/flake-parts";
              inputs.nixpkgs-lib.follows = "nixpkgs";
            };

            nixpkgs = l.mkDefault {
              url = "github:NixOS/nixpkgs/nixos-25.11";
            };
          };

          flakeConfigPath = [
            "nix4dev"
            "projectFlake"
          ];
        };
      };
    in
    {
      options.nix4dev.projectFlake = l.mkOption {
        type = t.submodule flakeOptions;

        description = ''
          Configuration of projects's flake.
          For the configuration of the nix4dev's flake see the `nix4dev.flake` option.
        '';
        default = { };
      };

      config = l.mkIf cfg.enable {
        nix4dev = {
          checkCommands = l.mkIf cfg.enable (
            let
              nixFlakeCheck = pkgs.writeShellApplication {
                name = "nix-flake-check";
                runtimeInputs = [ pkgs.nix ];
                text = ''
                  ( cd "$PRJ_ROOT" && nix flake check . )
                '';
              };
            in
            [ "${nixFlakeCheck}/bin/nix-flake-check" ]
          );

          updateCommands =
            let
              cmd = pkgs.writeShellApplication {
                name = "update-project-inputs";
                runtimeInputs = [ pkgs.nix ];
                text = ''
                  ( cd "$PRJ_ROOT" && nix flake update )
                '';
              };
            in
            [ "${cmd}/bin/${cmd.name}" ];

          managedFiles.files = {
            "flake.nix".source.file = cfg.flakeNixFile;
          };
        };
      };
    }
  );
}
