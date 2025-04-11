{
  inputs,
  self,
  lib,
  ...
}: {
  perSystem = {
    pkgs,
    system,
    ...
  }: let
    evalFlakeModules = modules:
      inputs.flake-parts.lib.mkFlake
      {inherit inputs;}
      {
        imports = modules;
        systems = [system];
      };

    updateManagedFilesScript = {
      managedFilesConfig,
      enableTreefmt,
    }: let
      treefmtModule = {
        imports = [inputs.treefmt-nix.flakeModule];
        perSystem = {
          # Enable formatting of .nix files
          treefmt.programs.alejandra.enable = true;
          nix4dev.managedFiles.treefmt.enable = true;
        };
      };

      module = {
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

      flake = evalFlakeModules [module];
    in
      flake.packages.${system}.updateManagedFiles;

    /*
    Runs managed files test.

    # Inputs

    `assertion`
    : The description of this assertion

    `expected`
    : The expected output of the managed files application.

    `initDirectory`
    : The directory to start the test with.

    `managedFilesConfigs`
    : The managed files configurations to apply sequentially.

    `enableTreefmt`
    : If set to `true`, format the managed files using treefmt.
    */
    managedFilesTest = {
      testDescription,
      managedFilesConfigs,
      testDir,
      enableTreefmt ? true,
    }: let
      assertion = "managed files ${testDescription}";
      expected = testDir + "/expected";
      initDirectory = let
        d = testDir + "/init";
      in
        if lib.filesystem.pathIsDirectory d
        then d
        else null;

      step = managedFilesConfig: ''
        ${updateManagedFilesScript {inherit managedFilesConfig enableTreefmt;}} "$out/root"
      '';
      actual = pkgs.runCommand "${assertion}-actual" {} ''
        mkdir -p "$out/root"

        # Copy initial files
        ${lib.strings.optionalString (initDirectory != null) "${pkgs.rsync}/bin/rsync -r ${initDirectory}/ \"$out/root\""}

        # Update managed files
        ${lib.strings.concatMapStringsSep "\n" step managedFilesConfigs}
      '';
    in
      pkgs.testers.testEqualContents {
        inherit actual assertion;
        # This copying is needed in order for the tests to not fail on OSX,
        # because the actual and expected files have different group owner.
        expected = pkgs.runCommand "${assertion}-expected" {} ''
          set -euo pipefail

          ls -la $(dirname $out)
          mkdir -p "$out/root"

          ls -la  $out

          ${pkgs.rsync}/bin/rsync -r "${expected}/" "$out/root"
        '';
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
