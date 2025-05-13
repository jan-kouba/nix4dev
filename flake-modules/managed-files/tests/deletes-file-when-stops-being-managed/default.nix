{
  testDescription = "deletes file when stops being managed";

  steps = [
    {
      flakeModule.perSystem.nix4dev.managedFiles.files."first.nix".source.text = ''
        "first"
      '';
    }
    {
      flakeModule.perSystem.nix4dev.managedFiles.files."second.nix".source.text = ''
        "second"
      '';
    }
  ];
}
