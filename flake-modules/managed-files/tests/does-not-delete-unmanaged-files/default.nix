{
  testDescription = "does not delete unmanaged files";

  steps = [
    {
      flakeModule.perSystem.nix4dev.managedFiles.files."second.nix".source.text = ''
        "second"
      '';
    }
  ];
}
