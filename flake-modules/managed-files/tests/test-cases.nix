{
  "can write file" = {
    expected = ./expected/write-file;
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
  };

  "can write formatted file" = {
    expected = ./expected/write-formatted-file;
    managedFilesConfigs = [
      {
        files."test.nix".source.text = ''
          {
          foo = [  "barr"    ];
          }
        '';
      }
    ];
  };

  "deletes file when stops being managed" = {
    expected = ./expected/deletes-file-when-stops-being-managed;
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
  };

  "does not delete unmanaged files" = {
    expected = ./expected/does-not-delete-unmanaged-files;
    initDirectory = ./init/does-not-delete-unmanaged-files;
    managedFilesConfigs = [
      {
        files."second.nix".source.text = ''
          "second"
        '';
      }
    ];
  };

  "does not delete files it should not" = {
    expected = ./expected/does-not-delete-files-it-should-not;
    initDirectory = ./init/does-not-delete-files-it-should-not;
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
  };

  # "does not allow newline in file names" = {
  #   managedFilesConfigs = [
  #     {
  #       files."new\nline".source.text = "new\nline";
  #     }
  #   ];
  #   expected = null;
  # };
}
