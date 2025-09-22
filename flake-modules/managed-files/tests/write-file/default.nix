{
  perSystem.nix4dev.flakePartsTests.suites."managed-files".tests."write-file" = {
    steps = [
      {
        perSystem = {
          test.enableTreefmt = false;

          nix4dev.managedFiles.files."./test.nix".source.text = ''
            {
            foo = [  "barr"    ];
            }
          '';
        };
      }
    ];

    expected = ./expected;
  };
}
