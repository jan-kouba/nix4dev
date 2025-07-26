{ lib, ... }:
{
  imports = [ ../../managed-files/flake-module.nix ];

  perSystem =
    { config, ... }:
    {
      config = {
        managedFiles = {
          treefmt.enable = true;
          fileListPaths = [
            "./nix4dev/.managed-files.list"
          ];
        };

        # Disable treefmt for managed files, because they are formated on every write.
        treefmt.settings.global.excludes = lib.attrsets.mapAttrsToList (
          _: file: file.target
        ) config.managedFiles.files;

        devshells.default.commands = [
          {
            name = "write-managed-files";
            help = "(Over)writes managed files.";
            package = config.managedFiles.writeFiles;
            category = "setup sub-commands";
          }
        ];

        nix4dev.setupCommands = [ "${config.managedFiles.writeFiles}/bin/write-managed-files" ];
      };
    };
}
