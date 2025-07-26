{
  testDescription = "managed files deletes file when it stops being managed";

  steps = [
    {
      perSystem.managedFiles.files."first.nix".source.text = ''
        "first"
      '';
    }
    {
      perSystem.managedFiles.files."second.nix".source.text = ''
        "second"
      '';
    }
  ];
}
