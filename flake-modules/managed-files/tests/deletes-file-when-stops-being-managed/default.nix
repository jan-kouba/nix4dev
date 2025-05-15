{
  testDescription = "managed files deletes file when it stops being managed";

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
}
