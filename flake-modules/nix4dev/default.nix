{ flake-parts-lib, inputs, ... }:
{
  imports = [
    ./templates
  ];

  flake.flakeModules = {
    default = flake-parts-lib.importApply ./flake-module inputs;
  };
}
