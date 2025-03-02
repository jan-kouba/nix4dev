{
  inputsHash = "sha256-01XGr55ndbFXTT+kRYmA1Ff7P0T3vZ7GpEEK1G6xUhY=";
  overrides = {
    "flake-parts" = "flake-parts";
    "nixpkgs" = "nixpkgs";
  } // (import ../overrides-nix4dev.nix).overrides;
}
