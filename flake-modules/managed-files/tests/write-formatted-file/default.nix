{lib, ...}:
lib.managedFilesTest {
  testDescription = "can write formatted file";

  managedFilesConfigs = [
    {
      files."test.nix".source.text = ''
        {
        foo = [  "barr"    ];
        }
      '';
    }
  ];

  testDir = ./.;
}
