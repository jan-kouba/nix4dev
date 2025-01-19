{
  imports = [../flake-modules/managed-files/module.nix];

  perSystem = {config, ...}: {
    config = {
      devshells.default.commands = [
        {
          name = "write-managed-files";
          help = "(Over)writes managed files.";
          package = config.nix4dev.managedFiles.writeFiles;
          category = "setup sub-commands";
        }
      ];

      nix4dev.setupCommands = ["${config.nix4dev.managedFiles.writeFiles}/bin/write-managed-files"];
    };
  };
}
