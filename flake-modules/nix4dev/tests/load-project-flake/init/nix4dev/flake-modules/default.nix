{ inputs, ... }:
{
  imports = [
    inputs.flake-parts.flakeModules.flakeModules
  ];

  flake.flakeModules = {
    testModule = { lib, ... }:
{
  options = {
    testModule.foo = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      description = "Test option";
      default = null;
      example = "bar";
    };
  };
};
  };
}
