# Library for tests.
{
  flake-parts-lib,
  inputs,
  lib,
  ...
}:
{
  options = {
    perSystem = flake-parts-lib.mkPerSystemOption (
      { ... }:
      {
        options.nix4devTestLib = lib.mkOption {
          type = lib.types.lazyAttrsOf lib.types.anything;
          default = { };
          description = ''
            Test library for nix4dev.
          '';
        };
      }
    );
  };

  config = {
    perSystem =
      {
        pkgs,
        system,
        ...
      }:
      let
        evalFlakeModules =
          modules:
          flake-parts-lib.evalFlakeModule { inherit inputs; } {
            imports = modules;
            systems = [ system ];
          };
      in
      {
        nix4devTestLib = {
          /**
            Runs flake-parts test.
            Starts with optional initial directory, then applies modification steps and in the end checks that the end result
            is equal to the expected directory.
            Each modification step is defined as the list of flake-parts modules configuring a flake and a list of functions
            that given the flake produced by the modules returns command that modifies the project.
            The commands must assume the project is at path specified in the `$out` environment variable.

            # Arguments

            `testDescription` (String)
            : The description of this test

            `initDirectory` (Path)
            : The directory to start this test with.

            `steps` (ListOf { modules (ListOf Any); commandsToExecute (ListOf (Any -> String)) })
            : The steps to sequentionally apply to produce the output directory of this test.

            `expectedDir`
            : The expected output of this test.

            # Example

            ```
            nix4devTest {
              testDescription = "managed-files-work";
              initDir = ./init;
              steps = [
                {
                  flakeModules = [
                    nix4devModule
                    { nix4dev.managedFiles.files."foo".source.text = "bar"; }
                  ];
                  commandsToExecute = [
                    ( flake: ''
                        ${flake.packages.${system}.updateManagedFiles} "$out"
                      ''
                    )
                  ];
                }
              ];
              expectedDir = ./expected;
            }
            ```
          */
          testFlakeParts =
            {
              testDescription,
              initDir,
              steps,
              expectedDir,
            }:
            let
              step =
                step:
                let
                  flake = evalFlakeModules step.flakeModules;
                in
                builtins.trace (builtins.attrNames flake.config.perSystem) ''
                  ${lib.strings.concatStringsSep "\n" (step.commandsToExecute flake.config.flake)}
                '';

              actual = pkgs.runCommand "${testDescription}-actual" { } ''
                mkdir -p "$out"

                # Copy initial files
                ${lib.strings.optionalString (initDir != null) "${pkgs.rsync}/bin/rsync -r ${initDir}/ \"$out\""}

                # Apply updates
                ${lib.strings.concatMapStringsSep "\n" step steps}
              '';
            in
            pkgs.testers.testEqualContents {
              inherit actual;

              assertion = testDescription;

              # This copying is needed in order for the tests to not fail on OSX,
              # because the actual and expected files have different group owner.
              expected = pkgs.runCommand "${testDescription}-expected" { } ''
                set -euo pipefail

                mkdir -p "$out"

                ${pkgs.rsync}/bin/rsync -r "${expectedDir}/" "$out"
              '';
            };
        };
      };
  };
}
