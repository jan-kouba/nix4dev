{
  inputsHash = "sha256-OaTTlU3dUBursNutdk470qOnEcZjRB6EzIw7iS0RrXQ=";
  overrides =
    {
      "my-seed/nix4dev" = "nix4dev";
      "my-seed/nix4dev/devshell" = "devshell";
      "my-seed/nix4dev/flake-parts" = "flake-parts";
      "my-seed/nix4dev/nixpkgs" = "nixpkgs";
      "my-seed/nix4dev/systems" = "systems";
      "my-seed/nix4dev/treefmt-nix" = "treefmt-nix";
      "my-seed/flake-parts" = "flake-parts";
      "my-seed/nixpkgs" = "nixpkgs";
    }
    // (import ../overrides-nix4dev.nix).overrides;
}
