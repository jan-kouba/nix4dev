{ flake-parts-lib, lib, ... }:
{
  imports = [
    ./flake-nix-options.nix
  ];

  options.perSystem = flake-parts-lib.mkPerSystemOption ({
    options = {
      nix4dev.lib.internal = lib.mkOption {
        type = lib.types.attrsOf lib.types.raw;
        description = "The internal library of nix4dev.";
        visible = false;
      };
    };
  });
}
