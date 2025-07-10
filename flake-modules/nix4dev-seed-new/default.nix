{ flake-parts-lib, self, ... }:
{
  imports = [ ./tests ];

  flake.flakeModules.nix4devSeedNew = flake-parts-lib.importApply ./flake-module.nix self;
}
