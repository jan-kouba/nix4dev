{ self, ...}: {
  perSystem = { config, pkgs, ...}: let
    seedTestModule = {

    };
  in {
    checks.seedCheck = config.nix4devTestLib.testSuiteFlakePartsWithDir {
        testsDir = ./.;

        extraFlakeModules = [
          self.flakeModules.default
          seedTestModule

          ../flake-module.nix
        ];
      };
  };
}
