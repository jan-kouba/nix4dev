{
  flake-parts-lib,
  inputs,
  ...
}:
{
  flake.flakeModules = {
    default = flake-parts-lib.importApply ../nix4dev-modules/default.nix inputs;
  };
}
