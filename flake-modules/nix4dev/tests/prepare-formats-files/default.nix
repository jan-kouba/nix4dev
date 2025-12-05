{
  perSystem.config.nix4dev.flakePartsTests.suites."nix4dev".tests."prepare-formats-files" = {
    init = ./init;
    expected = ./expected;
    steps = [
      {
        perSystem =
          { config, ... }:
          {
            nix4dev.opentofu.enable = true;

            test.commandsToExecute = [
              ''
                cd $out

                # Allow prepare to find project root
                mkdir .git
                touch .git/config

                # run prepare
                TREEFMT_NO_CACHE=true ${config.devShells.default}/bin/prepare
              ''
            ];
          };
      }
    ];

    excludeFiles = [
      ".git"
    ];
  };
}
