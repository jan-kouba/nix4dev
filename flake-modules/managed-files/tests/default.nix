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
      treefmtModule =
        { lib, ... }:
        {
          imports = [ inputs.treefmt-nix.flakeModule ];
          perSystem =
            { config, ... }:
            {
              options = {
                test.enableTreefmt = lib.options.mkEnableOption "treefmt";
              };

              config = {
                test.enableTreefmt = lib.mkDefault true;

                # Enable formatting of .nixf files
                treefmt.programs.alejandra.enable = config.test.enableTreefmt;
                managedFiles.treefmt.enable = config.test.enableTreefmt;
              };
            };
        };

      managedFilesTestModule = {
        perSystem =
          { config, ... }:
          {
            test.commandsToExecute = [ ''${config.managedFiles.updateFiles} "$out"'' ];
          };
      };
    in
    {
      checks.managedFilesCheck = config.nix4devTestLib.testSuiteFlakePartsWithDir {
        testsDir = ./.;
        inputs.nixpkgs = inputs.nixpkgs;

        extraFlakeModules = [
          self.flakeModules.managedFiles
          managedFilesTestModule
          treefmtModule
        ];
      };
    };
}
