{
  inputs,
  self,
  ...
}:
{
  imports = [
    ./generates-module-options-documentation
    ./load-project-flake
    ./opentofu-works
    ./prepare-formats-files
    ./terraform-works
    ./write-managed-formatted-file
  ];

  perSystem =
    let
      nix4devTestModule = {
        perSystem =
          { config, ... }:
          {
            test.commandsToExecute = [ ''${config.nix4dev.managedFiles.updateFiles} "$out"'' ];
          };
      };
    in
    {
      nix4dev.flakePartsTests.suites."nix4dev" = {
        defaultInputs.nixpkgs = inputs.nixpkgs;

        extraFlakeModules = [
          nix4devTestModule

          self.flakeModules.default
        ];
      };
    };
}
