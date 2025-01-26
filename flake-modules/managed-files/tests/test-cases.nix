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
}
