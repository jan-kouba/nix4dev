{
  flake-parts-lib,
  inputs,
  self,
  ...
}:
let
  fpl = flake-parts-lib;
in
{
  flake.flakeModules = {
    default = fpl.importApply ../nix4dev-modules/default.nix inputs;
    nix4devSeed = fpl.importApply ../nix4dev-seed-modules { nix4devFlake = self; };
  };
}
