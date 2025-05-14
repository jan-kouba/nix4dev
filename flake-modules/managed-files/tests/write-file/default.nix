{
  testDescription = "can write file";

  steps = [
    {
      flakeModules = [
        {
          perSystem = {
            test.enableTreefmt = false;

            nix4dev.managedFiles.files."test.nix".source.text = ''
              {
              foo = [  "barr"    ];
              }
            '';
          };
        }
      ];
    }
  ];
}
