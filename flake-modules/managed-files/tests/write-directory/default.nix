{
  steps = [
    {
      perSystem = {
        test.enableTreefmt = false;

        managedFiles.files."dir".source.file = ./test-dir;
      };
    }
  ];
}
