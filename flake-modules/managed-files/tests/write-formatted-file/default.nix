{
  testDescription = "can write formatted file";

  steps = [
    {
      perSystem.nix4dev.managedFiles.files."test.nix".source.text = ''
        {
        foo = [  "barr"    ];
        }
      '';
    }
  ];
}
