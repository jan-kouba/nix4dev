{
  perSystem = {config, ...}: {
    treefmt = {
      projectRootFile = ".git/config";
    };

    devshells.default = {
      commands = [
        {
          package = config.treefmt.build.wrapper;
          help = "Format source codes";
          category = "prepare sub-commands";
        }
      ];
    };

    nix4dev.prepareCommands = [
      "${config.treefmt.build.wrapper}/bin/treefmt"
    ];
  };
}
