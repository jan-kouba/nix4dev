{ self, ... }:
{
  perSystem =
    { config, ... }:
    {
      checks.seedCheck = config.nix4devTestLib.testSuiteFlakePartsWithDir {
        testsDir = ./.;

        extraFlakeModules = [
          self.flakeModules.default

          ../flake-module.nix
        ];
      };
    };
}
