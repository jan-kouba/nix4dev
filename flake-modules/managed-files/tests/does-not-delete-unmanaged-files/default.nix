{
  testDescription = "managed files does not delete unmanaged files";

  steps = [
    {
      perSystem.nix4dev.managedFiles.files."second.nix".source.text = ''
        "second"
      '';
    }
  ];
}
