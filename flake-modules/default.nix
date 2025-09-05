{ inputs, ... }:
{
  systems = import inputs.systems;

  imports = [
    inputs.flake-parts.flakeModules.flakeModules
    inputs.flake-parts.flakeModules.partitions

    ./managed-files
    ./nix4dev
    ./test-lib
  ];

  partitionedAttrs.checks = "dev";

  partitions.dev = {
    extraInputsFlake = ./dev;

    module = {
      imports = [
        {
          perSystem =
            { pkgs, ... }:
            {
              checks.foo = pkgs.writeText "foo" "bar";
            };
        }
      ];
    };
  };
}
