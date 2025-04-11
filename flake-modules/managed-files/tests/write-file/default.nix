{lib, ...}:
lib.managedFilesTest {
  testDescription = "can write file";

  managedFilesConfigs = [
    {
      files."test.nix".source.text = ''
        {
        foo = [  "barr"    ];
        }
      '';
    }
  ];
  enableTreefmt = false;

  testDir = ./.;
}
