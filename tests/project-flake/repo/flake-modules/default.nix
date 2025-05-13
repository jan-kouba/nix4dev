{ inputs, ... }:
{
  systems = import inputs.systems;

  perSystem =
    {
      pkgs,
      system,
      ...
    }:
    {
      packages = {
        foo = pkgs.hello;
        bar = inputs.foo-nixpkgs.legacyPackages.${system}.hello;
      };
    };
}
