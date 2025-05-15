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
      ...
    }:
    let
      treefmtModule =
        { lib, ... }:
        {
          imports = [ inputs.treefmt-nix.flakeModule ];
          perSystem =
            { config, ... }:
            {
              options = {
                test.enableTreefmt = lib.options.mkEnableOption "treefmt";
              };

              config = {
                test.enableTreefmt = lib.mkDefault true;

                # Enable formatting of .nixf files
                treefmt.programs.alejandra.enable = config.test.enableTreefmt;
                nix4dev.managedFiles.treefmt.enable = config.test.enableTreefmt;
              };
            };
        };

      managedFilesTestModule = {
        imports = [ self.flakeModules.managedFiles ];

        perSystem =
          { config, ... }:
          {
            test.commandsToExecute = [ ''${config.nix4dev.managedFiles.updateFiles} "$out"'' ];
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

      testSuiteFlakeParts =
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
            config.nix4devTestLib.testFlakeParts {
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
      checks.managedFilesCheck = testSuiteFlakeParts {
        testsDir = ./.;

        extraFlakeModules = [
          managedFilesTestModule
          treefmtModule
        ];
      };
    };
}
