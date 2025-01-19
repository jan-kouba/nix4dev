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

    managedFilesTest = {
      assertion,
      expected,
      managedFilesConfig,
      enableTreefmt ? true,
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
      updateManagedFiles = (evalFlakeModules [module]).packages.${system}.updateManagedFiles;
    in
      pkgs.testers.testEqualContents {
        inherit assertion expected;
        actual = pkgs.runCommand "actual" {} ''
          ${updateManagedFiles} $out
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
