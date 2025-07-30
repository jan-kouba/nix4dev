{
  steps = [
    {
      perSystem = {
        test.enableTreefmt = false;

        nix4dev.managedFiles.files."dir".source.file = ./test-dir;
      };
    }
  ];
}
