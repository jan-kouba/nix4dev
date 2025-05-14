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
      treefmtModule = {
        imports = [ inputs.treefmt-nix.flakeModule ];
        perSystem = {
          # Enable formatting of .nix files
          treefmt.programs.alejandra.enable = true;
          nix4dev.managedFiles.treefmt.enable = true;
        };
      };

      managedFilesTestModule = {
        imports = [ self.flakeModules.managedFiles ];

        perSystem =
          { config, ... }:
          {
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
          overrideTest =
            testExpr: testExpr // { testDescription = "managed files ${testExpr.testDescription}"; };

          extraFlakeModules = [ managedFilesTestModule ];
          overrideStep =
            {
              enableTreefmt ? true,
              ...
            }:
            step: {
              flakeModules = step.flakeModules ++ (if enableTreefmt then [ treefmtModule ] else [ ]);

              commandsToExecute = flake: [ ''${flake.packages.${system}.updateManagedFiles} "$out"'' ];
            };

        };

      testSuiteFlakeParts =
        {
          testsDir,
          extraFlakeModules ? [ ],
          overrideTest ? (prevTest: prevTest),
          overrideStep ? (_prevTest: prevStep: prevStep),
        }:
        let
          runTest =
            testDir:
            let
              testDirAbs = testsDir + "/${testDir}";
              testExpr = import testDirAbs;
              finalTest = overrideTest testExpr;
              finalTestWithFinalSteps = finalTest // {
                steps = lib.map (
                  step:
                  overrideStep testExpr (
                    step
                    // {
                      flakeModules =
                        extraFlakeModules ++ (if builtins.hasAttr "flakeModules" step then step.flakeModules else [ ]);
                    }
                  )
                ) finalTest.steps;
              };
              expectedDir = testDirAbs + "/expected";
              initDir =
                let
                  d = testDirAbs + "/init";
                in
                if lib.filesystem.pathIsDirectory d then d else null;
            in
            config.nix4devTestLib.testFlakeParts {
              inherit initDir expectedDir;
              inherit (finalTestWithFinalSteps) testDescription steps;
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
