/*
Library for tests.
*/
{
  flake-parts-lib,
  inputs,
  lib,
  ...
}: {
  options = {
    perSystem = flake-parts-lib.mkPerSystemOption ({...}: {
      options.nix4devTestLib = lib.mkOption {
        type = lib.types.lazyAttrsOf lib.types.anything;
        default = {};
        description = ''
          Test library for nix4dev.
        '';
      };
    });
  };

  config = {
    perSystem = {
      pkgs,
      system,
      ...
    }: let
      evalFlakeModules = modules:
        flake-parts-lib.mkFlake
        {inherit inputs;}
        {
          imports = modules;
          systems = [system];
        };
    in {
      /*
      Runs nix4dev test.

      # Inputs

      `testDescription`
      : The description of this test

      `initDirectory`
      : The directory to start this test with.

      `steps`
      : The steps to sequentionally apply to produce the output directory of this test.

      `expectedDir`
      : The expected output of this test.
      */
      nix4devTestLib.nix4devTest = {
        testDescription,
        initDir,
        steps,
        expectedDir,
      }: let
        step = step: let
          flake = evalFlakeModules [step.module];
        in ''
          ${lib.strings.concatStringsSep "\n" (step.commandsToExecute flake)}
        '';

        actual = pkgs.runCommand "${testDescription}-actual" {} ''
          mkdir -p "$out/root"

          # Copy initial files
          ${lib.strings.optionalString (initDir != null) "${pkgs.rsync}/bin/rsync -r ${initDir}/ \"$out/root\""}

          # Update managed files
          ${lib.strings.concatMapStringsSep "\n" step steps}
        '';
      in
        pkgs.testers.testEqualContents {
          inherit actual;

          assertion = testDescription;

          # This copying is needed in order for the tests to not fail on OSX,
          # because the actual and expected files have different group owner.
          expected = pkgs.runCommand "${testDescription}-expected" {} ''
            set -euo pipefail

            ls -la $(dirname $out)
            mkdir -p "$out/root"

            ls -la  $out

            ${pkgs.rsync}/bin/rsync -r "${expectedDir}/" "$out/root"
          '';
        };
    };
  };
}
