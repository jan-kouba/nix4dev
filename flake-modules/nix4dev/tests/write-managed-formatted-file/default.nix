{
  perSystem.config.nix4dev.flakePartsTests.suites."nix4dev".tests."write-managed-formatted-file" = {
    expected = ./expected;

    steps = [
      {
        perSystem =
          { config, ... }:
          {
            nix4dev.managedFiles.files = {
              "test.nix".source.file = ./test-dir/test.nix;
              "test.yaml".source.file = ./test-dir/test.yaml;
              "test.md".source.file = ./test-dir/test.md;
            };

            test.commandsToExecute = [ ''${config.nix4dev.managedFiles.updateFiles} "$out"'' ];
          };
      }
    ];

    excludeFiles = [
      ".editorconfig"
      ".envrc"
      ".gitignore"
      "nix4dev/.managed-files.list"
      "nix4dev/flake.nix"
    ];
  };
}
