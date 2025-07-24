{ flake-parts-lib, inputs, ... }:
{
  imports = [
    ./templates
    ./tests
  ];

  flake.flakeModules = {
    default = flake-parts-lib.importApply ./flake-module inputs;
  };
}
