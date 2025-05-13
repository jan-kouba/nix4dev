{
  testDescription = "can write formatted file";

  steps = [
    {
      flakeModule.perSystem.nix4dev.managedFiles.files."test.nix".source.text = ''
        {
        foo = [  "barr"    ];
        }
      '';
    }
  ];
}
