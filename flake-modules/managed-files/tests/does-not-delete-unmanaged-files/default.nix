{
  perSystem.nix4dev.flakePartsTests.suites."managed-files".tests."does-not-delete-unmanaged-files" = {
    steps = [
      {
        perSystem.nix4dev.managedFiles.files."second.nix".source.text = ''
          "second"
        '';
      }
    ];

    init = ./init;
    expected = ./expected;
  };
}
