{
  perSystem.nix4dev.flakePartsTests.suites."managed-files".tests."write-formatted-directory" = {
    steps = [
      {
        perSystem.nix4dev.managedFiles.files."dir".source.file = ./test-dir;
      }
    ];

    expected = ./expected;
  };
}
