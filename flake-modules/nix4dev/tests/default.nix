{
  inputs,
  self,
  ...
}:
{
  imports = [
    ./opentofu-works
    ./prepare-formats-files
    ./devshell-does-not-depend-on-managed-files-contents
    ./terraform-works
    ./write-managed-formatted-file
  ];

  perSystem = {
    nix4dev.flakePartsTests.suites."nix4dev" = {
      defaultInputs.nixpkgs = inputs.nixpkgs;

      extraFlakeModules = [
        self.flakeModules.default
      ];
    };
  };
}
