{
  testDescription = "can write formatted file";

  steps = [
    {
      flakeModules = [
        {
          perSystem.nix4dev.managedFiles.files."test.nix".source.text = ''
            {
            foo = [  "barr"    ];
            }
          '';
        }
      ];
    }
  ];
}
