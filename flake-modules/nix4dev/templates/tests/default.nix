{ self, ... }:
{
  imports = [
    ./template-works
  ];

  perSystem.config.nix4dev.flakePartsTests.suites."templates" = {
    extraFlakeModules = [
      self.flakeModules.default
    ];
  };
}
