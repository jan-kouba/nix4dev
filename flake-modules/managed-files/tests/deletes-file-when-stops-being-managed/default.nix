{
  testDescription = "deletes file when stops being managed";

  steps = [
    {
      flakeModules = [
        {
          perSystem.nix4dev.managedFiles.files."first.nix".source.text = ''
            "first"
          '';
        }
      ];
    }
    {
      flakeModules = [
        {
          perSystem.nix4dev.managedFiles.files."second.nix".source.text = ''
            "second"
          '';
        }
      ];
    }
  ];
}
