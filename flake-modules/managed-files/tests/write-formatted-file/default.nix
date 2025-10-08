{
  perSystem.nix4dev.flakePartsTests.suites."managed-files".tests."write-formatted-file" = {
    steps = [
      {
        perSystem.nix4dev.managedFiles.files = {
          "test.nix".source.text = ''
            {
            foo = [  "barr"    ];
            }
          '';
          "test.md".source.file = ./test.md;
        };
      }
    ];

    expected = ./expected;
  };
}
