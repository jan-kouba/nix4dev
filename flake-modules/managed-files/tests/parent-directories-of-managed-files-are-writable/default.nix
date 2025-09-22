{
  perSystem.nix4dev.flakePartsTests.suites."managed-files".tests."parent-directories-of-managed-files-are-writable" =
    {
      steps = [
        {
          perSystem = {
            test.enableTreefmt = false;

            nix4dev.managedFiles.files."dir/foo".source.text = ''
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

      expected = ./expected;
    };
}
