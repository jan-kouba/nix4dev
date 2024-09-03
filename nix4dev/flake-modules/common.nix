{
  perSystem = {
    devshells.default.name = "nix4dev";

    nix4dev = {
      conventionalCommits.enable = true;

      projectFlake = {
        enable = true;

        description = "Tools to easily setup development environment.";

        extraInputs = {
          systems.url = "github:nix-systems/default";
          flake-utils = {
            url = "github:numtide/flake-utils";
            inputs.systems.follows = "systems";
          };

          devshell = {
            url = "github:numtide/devshell";
            inputs = {
              nixpkgs.follows = "nixpkgs";
              flake-utils.follows = "flake-utils";
            };
          };

          nixpkgs-mdformat = {
            url = "github:NixOS/nixpkgs/nixos-unstable-small";
          };

          treefmt-nix = {
            url = "github:numtide/treefmt-nix";
            inputs.nixpkgs.follows = "nixpkgs";
          };
        };
      };
    };
  };
}
