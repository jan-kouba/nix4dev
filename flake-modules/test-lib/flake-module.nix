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
        /**
          Runs flake-parts test on a directory.
          Starts with optional initial directory, then applies modification steps and in the end checks that the end result
          is equal to the expected directory.
          Each modification step is defined as a flake-parts module configuring a flake and a list of commands to modify or test the test directory.
          The commands must assume the project is at path specified in the `$out` environment variable.
          The check fails if the produced directory differs from the expected directory, or if any of the configured steps commands fails.

          # Arguments

          `testDescription` (String)
          : The description of this test

          `initDirectory` (NullOr Path)
          : Optional directory to start this test with.
            If specified, the contents of the directory will be copied into the test directory at the start of the test.

          `steps` (ListOf FlakePartsModule)
          : The steps to sequentionally apply to produce the output directory of this test.
            Every step is defined as a flake-parts module configuring a flake.
            The `config.perSystem.test.commandsToExecute` option must be defined for every step.

          `expectedDir`
          : The expected output of this test.

          # Example

          ```
          testFlakePartsWithDir {
            testDescription = "managed-files-work";
            initDir = ./init;
            steps = [
              {
                import = [
                  nix4devModule
                ];

                perSystem = { config, ...}: {
                  nix4dev.managedFiles.files."foo".source.text = "bar";
                  test.commandsToExecute = [
                    ''${flake.packages.${system}.updateManagedFiles} "$out"''
                  ];
                };
              }
            ];
            expectedDir = ./expected;
          }
          ```
        */
        testFlakePartsWithDir =
          {
            testDescription,
            initDir,
            steps,
            expectedDir,
          }:
          let
            evalFlakeModules =
              modules:
              flake-parts-lib.evalFlakeModule { inherit inputs; } {
                imports = modules;
                systems = [ system ];
              };

            testSetupModule =
              { flake-parts-lib, ... }:
              {
                options = {
                  perSystem = flake-parts-lib.mkPerSystemOption (
                    { ... }:
                    {
                      options.test = {
                        commandsToExecute = lib.mkOption {
                          type = lib.types.listOf lib.types.str;
                          description = ''
                            The commands to execute in this step.
                          '';
                        };
                      };
                    }
                  );
                };
              };

            step =
              step:
              let
                flake = evalFlakeModules ([ testSetupModule ] ++ [ step ]);
              in
              ''
                ${lib.strings.concatStringsSep "\n" (flake.config.allSystems.${system}.test.commandsToExecute)}
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

        /**
          Runs test suite of flake parts tests.

          # Arguments

          `testsDir` (Path)
          : The directory with tests.
            Each subdirectory of this directory is considered a test.
            The test directory must contain `default.nix` file with attrset defining the test.inherit
            The attrset is passed into the `testFlakePartsWithDir` function.

          `extraFlakeModules`
          : The extra flake modules to import in every step of every test when constructing the flake.
            It can be used to do some common setup (e.g. of the commands to run in every step).

          # Example

          ```
          testSuiteFlakePartsWithDir {
            testsDir = ./.;

            extraFlakeModules = [
              nix4dev.flakeModules.managedFiles
              {
                perSystem =
                { config, ... }:
                {
                  test.commandsToExecute = [ ''${config.nix4dev.managedFiles.updateFiles} "$out"'' ];
                };
              }
            ];
          }
          ```
        */
        testSuiteFlakePartsWithDir =
          {
            testsDir,
            extraFlakeModules ? [ ],
          }:
          let
            runTest =
              testDir:
              let
                testDirAbs = testsDir + "/${testDir}";
                testExpr = import testDirAbs;
                finalTestExpr = testExpr // {
                  steps = lib.map (step: {
                    imports = extraFlakeModules ++ [ step ];
                  }) testExpr.steps;
                };
                expectedDir = testDirAbs + "/expected";
                initDir =
                  let
                    d = testDirAbs + "/init";
                  in
                  if lib.filesystem.pathIsDirectory d then d else null;
              in
              testFlakePartsWithDir {
                inherit initDir expectedDir;
                inherit (finalTestExpr) testDescription steps;
              };

            testDirs = builtins.attrNames (
              lib.attrsets.filterAttrs (_: value: value == "directory") (builtins.readDir testsDir)
            );

            tests = lib.lists.map runTest testDirs;
          in
          pkgs.writeText "managed-files-check" ''
            Test outputs:
            ${lib.strings.concatLines tests}
          '';
      in
      {
        nix4devTestLib = {
          inherit testSuiteFlakePartsWithDir testFlakePartsWithDir;
        };
      };
  };
}
