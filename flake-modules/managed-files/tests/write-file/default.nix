{
  testDescription = "managed files can write file";

  steps = [
    {
      perSystem = {
        test.enableTreefmt = false;

        managedFiles.files."./test.nix".source.text = ''
          {
          foo = [  "barr"    ];
          }
        '';
      };
    }
  ];
}
