{
  inputs,
  lib,
  self,
  ...
}:
{
  perSystem =
    {
      config,
      pkgs,
      system,
      ...
    }:
    let
      managedFilesTestStepModule =
        {
          enableTreefmt,
          managedFilesConfig,
        }:
        let
          treefmtModule = {
            imports = [ inputs.treefmt-nix.flakeModule ];
            perSystem = {
              # Enable formatting of .nix files
              treefmt.programs.alejandra.enable = true;
              nix4dev.managedFiles.treefmt.enable = true;
            };
          };
        in
        {
          imports = [ self.flakeModules.managedFiles ] ++ (if enableTreefmt then [ treefmtModule ] else [ ]);

          perSystem =
            { config, ... }:
            {
              nix4dev.managedFiles = managedFilesConfig;
              packages.updateManagedFiles = config.nix4dev.managedFiles.updateFiles;
            };
        };

      /*
        Runs managed files test.

        # Inputs

        `testDescription`
        : The description of this test

        `managedFilesConfigs`
        : The configurations of managed files to apply sequentionally before checking the assertions.

        `testDir`
        : The test directory.

        `enableTreefmt`
        : If set to `true`, format the managed files using treefmt.
      */

      testSuiteManagedFiles =
        { testsDir }:
        testSuiteFlakeParts {
          inherit testsDir;
          testExprToDescriptionAndSteps =
            {
              testDescription,
              managedFilesConfigs,
              enableTreefmt ? true,
            }:
            {
              testDescription = "managed files ${testDescription}";

              steps = lib.map (managedFilesConfig: {
                module = managedFilesTestStepModule {
                  inherit enableTreefmt managedFilesConfig;
                };

                commandsToExecute =
                  flake:
                  let
                    command = ''
                      ${flake.packages.${system}.updateManagedFiles} "$out"
                    '';
                  in
                  [ command ];
              }) managedFilesConfigs;
            };
        };

      testSuiteFlakeParts =
        { testsDir, testExprToDescriptionAndSteps }:
        let
          runTest =
            testDir:
            let
              testDirAbs = testsDir + "/${testDir}";
              testExpr = import testDirAbs;
              descAndSteps = testExprToDescriptionAndSteps testExpr;
              expectedDir = testDirAbs + "/expected";
              initDir =
                let
                  d = testDirAbs + "/init";
                in
                if lib.filesystem.pathIsDirectory d then d else null;
            in
            config.nix4devTestLib.testFlakeParts {
              inherit initDir expectedDir;
              inherit (descAndSteps) testDescription steps;
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
      checks.managedFilesCheck = testSuiteManagedFiles { testsDir = ./.; };
    };
}
