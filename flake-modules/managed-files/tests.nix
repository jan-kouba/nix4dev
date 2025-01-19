{
  inputs,
  self,
  ...
}: {
  perSystem = {
    pkgs,
    system,
    ...
  }: {
    checks.managedFilesCheck = let
      evalFlake = module:
        inputs.flake-parts.lib.mkFlake
        {inherit inputs;}
        module;
      simpleTest = pkgs.testers.testEqualContents {
        assertion = "managed files can write file";
        expected = pkgs.writeText "expected" ''
          {
            foo = ["bar"];
          }
        '';
        actual = let
          module = {
            imports = [self.flakeModules.default];
            systems = [system];
            perSystem = {config, ...}: {
              nix4dev.managedFiles.files."test.nix".source.text = ''
                {
                foo = [  "bar"    ];
                }
              '';
              packages.updateManagedFiles = config.nix4dev.managedFiles.updateFiles;
            };
          };
          updateManagedFiles = (evalFlake module).packages.${system}.updateManagedFiles;
        in
          pkgs.runCommand "actual" {} ''
            ${updateManagedFiles} .
            cp test.nix $out
          '';
      };
    in
      pkgs.writeText "managed-files-check" ''
        Simple test: ${simpleTest}
      '';
  };
}
