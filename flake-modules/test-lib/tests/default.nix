{
  perSystem =
    { config, ... }:
    {
      checks.testLibChecks = config.nix4devTestLib.testSuiteFlakePartsWithDir {
        inputs = { };
        testsDir = ./.;

        excludeFiles = [ "./global-exclude-file" ];
      };
    };
}
