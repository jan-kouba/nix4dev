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

          # Enable formatting of YAML files
          treefmt.programs.prettier = {
            enable = true;

            includes = [
              "*.yml"
              "*.yaml"
            ];
          };
          # treefmt.programs.yamlfmt.enable = true;

          treefmt.settings.formatter = {
            "yq-json" = {
              command = "${pkgs.bash}/bin/bash";
              options = [
                "-euc"
                ''
                  for file in "$@"; do
                    ${lib.getExe pkgs.yq-go} -i -P "$file"
                  done
                ''
                "--" # bash swallows the second argument when using -c
              ];
              includes = [ "*.yaml" "*.yml" ];
              priority = -100;
            };
          };

          # treefmt.programs.yq-json.priority = -100;
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
      assertion,
      expected,
      initDirectory ? null,
      managedFilesConfigs,
      enableTreefmt ? true,
    }: let
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
