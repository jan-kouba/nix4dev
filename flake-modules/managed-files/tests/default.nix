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

    managedFilesTest = {
      assertion,
      expected,
      managedFilesConfigs,
      enableTreefmt ? true,
    }: let
      step = managedFilesConfig: ''
        ${updateManagedFilesScript {inherit managedFilesConfig enableTreefmt;}} $out
      '';
    in
      pkgs.testers.testEqualContents {
        inherit assertion;
        # This copying is needed in order for the tests to not fail on OSX,
        # because the actual and expected files have different group owner.
        expected = pkgs.runCommand "expected" {} ''
          ${pkgs.rsync}/bin/rsync -r "${expected}/" $out
        '';
        actual = pkgs.runCommand "actual" {} ''
          ${lib.strings.concatMapStringsSep "\n" step managedFilesConfigs}
        '';
      };

    tests =
      lib.attrsets.mapAttrsToList (
        testDescription: testAttrs:
          managedFilesTest (
            {assertion = "managed files ${testDescription}";} // testAttrs
          )
      )
      (import ./test-cases.nix);
  in {
    checks.managedFilesCheck = pkgs.writeText "managed-files-check" ''
      Test outputs:
      ${lib.strings.concatLines tests}
    '';
  };
}
