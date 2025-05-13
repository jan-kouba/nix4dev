{
  testDescription = "does not delete unmanaged files";

  managedFilesConfigs = [
    {
      files."second.nix".source.text = ''
        "second"
      '';
    }
  ];
}
