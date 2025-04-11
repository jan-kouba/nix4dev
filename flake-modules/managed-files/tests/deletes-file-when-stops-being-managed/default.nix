{lib, ...}:
lib.managedFilesTest {
  testDescription = "deletes file when stops being managed";

  managedFilesConfigs = [
    {
      files."first.nix".source.text = ''
        "first"
      '';
    }
    {
      files."second.nix".source.text = ''
        "second"
      '';
    }
  ];

  testDir = ./.;
}
