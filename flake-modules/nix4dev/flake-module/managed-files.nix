{ lib, ... }:
{
  imports = [ ../../managed-files/flake-module.nix ];

  perSystem =
    { config, pkgs, ... }:
    let
      lazyWriteManagedFiles = pkgs.writeScriptBin "lazy-write-managed-files" ''
        ${pkgs.nix}/bin/nix run \
          --extra-experimental-features nix-command \
          --extra-experimental-features flakes \
          "$PRJ_ROOT"/nix4dev#eager-write-managed-files
      '';
    in
    {
      config = {
        nix4dev.managedFiles = {
          treefmt.enable = true;
          fileListPaths = [
            "./nix4dev/.managed-files.list"
          ];
        };

        # Disable treefmt for managed files, because they are formated on every write.
        treefmt.settings.global.excludes = lib.attrsets.mapAttrsToList (
          _: file: file.target
        ) config.nix4dev.managedFiles.files;

        devshells.default.commands = [
          {
            name = "write-managed-files";
            help = "(Over)writes managed files.";
            package = lazyWriteManagedFiles;
            category = "setup sub-commands";
          }
        ];

        nix4dev.setupCommands = [ "${lazyWriteManagedFiles}/bin/lazy-write-managed-files" ];

        packages = {
          eager-write-managed-files = config.nix4dev.managedFiles.writeFiles;
        };
      };
    };
}
