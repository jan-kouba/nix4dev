{
  perSystem =
    { config, ... }:
    {
      checks.testLibChecks = config.nix4devTestLib.testSuiteFlakePartsWithDir {
        testsDir = ./.;

        excludeFiles = [ "./global-exclude-file" ];
      };
    };
}
