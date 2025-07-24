{
  testDescription = "managed files can write formatted file";

  steps = [
    {
      perSystem.nix4dev.managedFiles.files = {
        "test.nix".source.file = ./test-dir/test.nix;
        "test.yaml".source.file = ./test-dir/test.yaml;
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
