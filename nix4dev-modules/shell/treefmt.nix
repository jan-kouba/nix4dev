{ self, ... }:
{
  perSystem =
    { config, ... }:
    {
      treefmt = {
        projectRootFile = ".git/config";

        # Set projectRoot to point to the whole repository, not just the `nix4dev` directory
        projectRoot = self + "/..";

        # Do not print the warning when a file with no configured formatter is found
        settings.global.on-unmatched = "debug";
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
