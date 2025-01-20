{
  inputs,
  self,
  flake-parts-lib,
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
    }: let
      module = {
        imports = [self.modules.flake.managedFiles];
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
  in {
    checks.managedFilesCheck = let
      simpleTest = managedFilesTest {
        assertion = "managed files can write file";
        expected = ./expected/simple;
        managedFilesConfig = {
          files."test.nix".source.text = ''
            {
            foo = [  "bar"    ];
            }
          '';
        };
      };
    in
      pkgs.writeText "managed-files-check" ''
        Simple test: ${simpleTest}
      '';
  };
}
