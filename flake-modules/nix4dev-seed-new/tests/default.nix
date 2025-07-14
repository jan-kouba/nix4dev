{ self, ... }:
{
  perSystem =
    { config, ... }:
    {
      checks.seedCheck = config.nix4devTestLib.testSuiteFlakePartsWithDir {
        testsDir = ./.;

        inputs = { };

        extraFlakeModules = [
          self.flakeModules.default
        ];
      };
    };
}
