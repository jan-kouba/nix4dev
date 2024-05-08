{pkgs}: let
  nix4devLib = {
    inherit
      (pkgs.callPackage ./make-flake-nix.nix nix4devLib)
      makeFlakeNix
      printFlakeInputs
      ;

    flakeNixOptions = pkgs.callPackage ./flake-nix-options.nix nix4devLib;

    inherit
      (pkgs.callPackage ./format.nix nix4devLib)
      writeFormattedFile
      ;
  };
in
  nix4devLib
