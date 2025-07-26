{
  inputs,
  self,
  ...
}:
{
  perSystem =
    {
      config,
      ...
    }:
    let

      nix4devTestModule = {
        perSystem =
          { config, ... }:
          {
            test.commandsToExecute = [ ''${config.managedFiles.updateFiles} "$out"'' ];
          };
      };
    in
    {
      checks.nix4devModuleTests = config.nix4devTestLib.testSuiteFlakePartsWithDir {
        testsDir = ./.;
        inputs.nixpkgs = inputs.nixpkgs;

        extraFlakeModules = [
          nix4devTestModule

          self.flakeModules.default
        ];
      };
    };
}
