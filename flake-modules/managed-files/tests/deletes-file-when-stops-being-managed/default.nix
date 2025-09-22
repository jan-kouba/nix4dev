{
  perSystem.nix4dev.flakePartsTests.suites."managed-files".tests."deletes-file-when-stops-being-managed" =
    {
      steps = [
        {
          perSystem.nix4dev.managedFiles.files."first.nix".source.text = ''
            "first"
          '';
        }
        {
          perSystem.nix4dev.managedFiles.files."second.nix".source.text = ''
            "second"
          '';
        }
      ];
      expected = ./expected;
    };
}
