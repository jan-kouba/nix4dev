{
  testDescription = "managed files can write file";

  steps = [
    {
      perSystem = {
        test.enableTreefmt = false;

        nix4dev.managedFiles.files."./test.nix".source.text = ''
          {
          foo = [  "barr"    ];
          }
        '';
      };
    }
  ];
}
