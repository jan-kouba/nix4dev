{ inputs, ... }:
{
  systems = import inputs.systems;

  imports = [
    inputs.flake-parts.flakeModules.flakeModules

    ./managed-files
    ./nix4dev
    ./test-lib
  ];
}
