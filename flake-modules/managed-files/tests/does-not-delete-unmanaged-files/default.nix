{
  testDescription = "managed files does not delete unmanaged files";

  steps = [
    {
      perSystem.managedFiles.files."second.nix".source.text = ''
        "second"
      '';
    }
  ];
}
