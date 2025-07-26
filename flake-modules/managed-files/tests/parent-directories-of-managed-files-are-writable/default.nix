{
  steps = [
    {
      perSystem = {
        test.enableTreefmt = false;

        managedFiles.files."dir/foo".source.text = ''
          foo
        '';
      };
    }
    (
      { lib, ... }:
      {
        perSystem.test.commandsToExecute = lib.mkForce [
          ''
            if ! touch "$out"/dir/bar; then
              echo 'Parent directory of managed file not writable!'
              exit 1
            fi
          ''
        ];
      }
    )
  ];
}
