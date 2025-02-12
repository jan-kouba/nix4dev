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

          devshell = {
            url = "github:numtide/devshell";
            inputs = {
              nixpkgs.follows = "nixpkgs";
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
