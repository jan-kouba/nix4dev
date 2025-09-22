# Library for tests.
{ flake-parts-lib, lib, ... }:
{
  imports = [
    ./flake-parts-test-suites.nix
  ];

  options.perSystem = flake-parts-lib.mkPerSystemOption ({
    options.nix4devTestLib = lib.mkOption {
      type = lib.types.lazyAttrsOf lib.types.anything;
      default = { };
      description = ''
        Test library for nix4dev.
      '';
    };
  });

  config.perSystem =
    { pkgs, ... }:
    {
      nix4devTestLib = import ./lib.nix { inherit flake-parts-lib lib pkgs; };
    };
}
