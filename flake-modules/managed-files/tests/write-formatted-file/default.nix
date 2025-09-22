{
  perSystem.nix4dev.flakePartsTests.suites."managed-files".tests."write-formatted-file" = {
    steps = [
      {
        perSystem.nix4dev.managedFiles.files."test.nix".source.text = ''
          {
          foo = [  "barr"    ];
          }
        '';
      }
    ];

    expected = ./expected;
  };
}
