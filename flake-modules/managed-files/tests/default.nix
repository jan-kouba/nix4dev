{
  inputs,
  lib,
  self,
  ...
}: {
  perSystem = {
    config,
    pkgs,
    system,
    ...
  }: let
    managedFilesTestStepModule = {
      enableTreefmt,
      managedFilesConfig,
    }: let
      treefmtModule = {
        imports = [inputs.treefmt-nix.flakeModule];
        perSystem = {
          # Enable formatting of .nix files
          treefmt.programs.alejandra.enable = true;
          nix4dev.managedFiles.treefmt.enable = true;
        };
      };
    in {
      imports =
        [self.flakeModules.managedFiles]
        ++ (
          if enableTreefmt
          then [treefmtModule]
          else []
        );

      perSystem = {config, ...}: {
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
    managedFilesTest = {
      testDescription,
      managedFilesConfigs,
      testDir,
      enableTreefmt ? true,
    }: let
      expectedDir = testDir + "/expected";
      initDir = let
        d = testDir + "/init";
      in
        if lib.filesystem.pathIsDirectory d
        then d
        else null;

      steps =
        lib.map (managedFilesConfig: {
          module = managedFilesTestStepModule {
            inherit enableTreefmt managedFilesConfig;
          };

          commandsToExecute = flake: let
            command = ''
              ${flake.packages.${system}.updateManagedFiles} "$out"
            '';
          in [command];
        })
        managedFilesConfigs;
    in
      config.nix4devTestLib.nix4devTest {
        inherit initDir steps expectedDir;

        testDescription = "managed files ${testDescription}";
      };

    testDirs = builtins.attrNames (lib.attrsets.filterAttrs (_: value: value == "directory") (builtins.readDir ./.));
    tests =
      lib.lists.map (
        testDir: (
          import (./. + "/${testDir}") {
            lib = lib // {inherit managedFilesTest;};
          }
        )
      )
      testDirs;
  in {
    checks.managedFilesCheck = pkgs.writeText "managed-files-check" ''
      Test outputs:
      ${lib.strings.concatLines tests}
    '';
  };
}
