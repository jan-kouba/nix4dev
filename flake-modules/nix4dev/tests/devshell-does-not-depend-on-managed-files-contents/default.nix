{
  # Test that the devshell (and the setup command) does not depend
  # on the derivations that build the contents of the files.
  perSystem.config.nix4dev.flakePartsTests.suites."nix4dev".tests."devshell-does-not-depend-on-managed-files-contents" =
    {
      expected = null;

      steps = [
        ({
          perSystem =
            { config, ... }:
            {
              nix4dev.managedFiles.files = {
                "test.txt".source.file =
                  assert false;
                  "ignore";
              };

              test.commandsToExecute = [
                "${config.devShells.default}/entrypoint true"

              ];
            };
        })
      ];
    };
}
