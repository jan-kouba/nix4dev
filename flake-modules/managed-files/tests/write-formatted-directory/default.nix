{
  steps = [
    {
      perSystem.nix4dev.managedFiles.files."dir".source.file = ./test-dir;
    }
  ];
}
