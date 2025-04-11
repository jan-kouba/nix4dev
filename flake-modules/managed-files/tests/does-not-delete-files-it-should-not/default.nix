{
  testDescription = "does not delete files it should not";

  managedFilesConfigs = [
    {
      # Check that the file name is not used as rsync pattern
      files."star*".source.text = "star*";
      files."starstar**".source.text = "starstar**";
      files."questionmark?".source.text = "questionmark?";
      files."bracket[0-9]".source.text = "bracket[0-9]";

      # Checks that newline can be used in file names
      files."new\nline".source.text = "new\nline";

      # Check that the file names are rooted to the root directory
      files."file".source.text = "file";
    }
  ];

  testDir = ./.;
}
