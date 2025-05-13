{ inputs, ... }:
{
  imports = [ ../test-module.nix ];

  systems = import inputs.systems;
}
