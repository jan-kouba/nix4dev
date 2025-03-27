{self, ...}: {
  perSystem = {config, ...}: {
    treefmt = {
      projectRootFile = ".git/config";

      # Set projectRoot to point to the whole repository, not just the `nix4dev` directory
      projectRoot = self + "/..";
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
