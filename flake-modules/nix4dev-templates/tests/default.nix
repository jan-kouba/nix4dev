{ self, ... }:
{
  perSystem =
    { config, ... }:
    {
      checks.templatesCheck = config.nix4devTestLib.testSuiteFlakePartsWithDir {
        testsDir = ./.;

        inputs = { };

        extraFlakeModules = [
          self.flakeModules.default
        ];
      };
    };
}
