{pkgs}: let
  nix4devLib = {
    inherit
      (pkgs.callPackage ./make-flake-nix.nix nix4devLib)
      makeFlakeNix
      printFlakeInputs
      ;

    flakeNixOptions = pkgs.callPackage ./flake-nix-options.nix nix4devLib;
  };
in
  nix4devLib
