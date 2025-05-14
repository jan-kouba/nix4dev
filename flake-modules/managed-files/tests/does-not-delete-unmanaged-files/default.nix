{
  testDescription = "does not delete unmanaged files";

  steps = [
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
