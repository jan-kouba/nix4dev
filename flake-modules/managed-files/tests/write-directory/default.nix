{
  perSystem.nix4dev.flakePartsTests.suites."managed-files".tests."write-directory" = {
    steps = [
      {
        perSystem = {
          test.enableTreefmt = false;

          nix4dev.managedFiles.files."dir".source.file = ./test-dir;
        };
      }
    ];

    expected = ./expected;
  };
}
