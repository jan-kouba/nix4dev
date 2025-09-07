# Library for tests.
{ flake-parts-lib, lib, ... }:
{
  imports = [
    {
      perSystem = lib.modules.mkRenamedOptionModule [ "nix4devTestLib" ] [ "nix4dev" "testLib" ];
    }
  ];

  options.perSystem = flake-parts-lib.mkPerSystemOption ({
    options.nix4dev.testLib = lib.mkOption {
      type = lib.types.lazyAttrsOf lib.types.anything;
      default = { };
      description = ''
        Test library for nix4dev.
      '';
    };
  });

  config.perSystem =
    { pkgs, ... }:
    let
      funcs = import ./lib.nix { inherit flake-parts-lib lib pkgs; };
    in
    {
      nix4devTestLib = {
        inherit (funcs) testSuiteFlakePartsWithDir testFlakePartsWithDir;
      };
    };
}
