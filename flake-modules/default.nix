{ inputs, ... }:
{
  systems = import inputs.systems;

  imports = [
    inputs.flake-parts.flakeModules.flakeModules

    ./output.nix
    ./managed-files
    ./nix4dev-templates
    ./test-lib
  ];
}
