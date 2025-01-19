{
  "can write file" = {
    expected = ./expected/write-file;
    managedFilesConfig = {
      files."test.nix".source.text = ''
        {
        foo = [  "bar"    ];
        }
      '';
    };
    enableTreefmt = false;
  };

  "can write formatted file" = {
    expected = ./expected/write-formatted-file;
    managedFilesConfig = {
      files."test.nix".source.text = ''
        {
        foo = [  "bar"    ];
        }
      '';
    };
  };
}
