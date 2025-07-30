{ lib, ... }:
{
  imports = [ ../../managed-files/flake-module.nix ];

  perSystem =
    { config, ... }:
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
            package = config.nix4dev.managedFiles.writeFiles;
            category = "setup sub-commands";
          }
        ];

        nix4dev.setupCommands = [ "${config.nix4dev.managedFiles.writeFiles}/bin/write-managed-files" ];
      };
    };
}
