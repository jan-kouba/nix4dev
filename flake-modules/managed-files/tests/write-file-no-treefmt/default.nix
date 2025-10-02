{
  perSystem.nix4dev.flakePartsTests.suites."managed-files-no-treefmt".tests."write-file" = {
    steps = [
      {
        perSystem = {
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
