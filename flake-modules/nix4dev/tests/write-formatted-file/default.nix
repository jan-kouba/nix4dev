{
  testDescription = "managed files can write formatted file";

  steps = [
    {
      perSystem =
        { config, ... }:
        {
          managedFiles.files = {
            "test.nix".source.file = ./test-dir/test.nix;
            "test.yaml".source.file = ./test-dir/test.yaml;
          };

          test.commandsToExecute = [ ''${config.managedFiles.updateFiles} "$out"'' ];
        };
    }
  ];

  excludeFiles = [
    ".editorconfig"
    ".envrc"
    ".gitignore"
    "nix4dev/.managed-files.list"
    "nix4dev/flake.nix"
  ];
}
