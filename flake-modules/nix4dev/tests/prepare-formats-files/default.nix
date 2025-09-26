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

                # run prepare
                mkdir .git
                touch .git/config
                TREEFMT_NO_CACHE=true ${config.devShells.default}/bin/prepare
              ''
            ];
          };
      }
    ];

    excludeFiles = [
      ".editorconfig"
      ".envrc"
      ".git"
      ".gitignore"
      "nix4dev"
    ];
  };
}
