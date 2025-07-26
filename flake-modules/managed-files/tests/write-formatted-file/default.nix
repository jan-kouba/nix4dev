{
  testDescription = "managed files can write formatted file";

  steps = [
    {
      perSystem.managedFiles.files."test.nix".source.text = ''
        {
        foo = [  "barr"    ];
        }
      '';
    }
  ];
}
