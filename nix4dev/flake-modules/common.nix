{ lib, ... }:
{
  perSystem = {
    devshells.default.name = "nix4dev";

    nix4dev = {
      conventionalCommits.enable = true;

      # Add the root flake as dependency, so we have its dependencies captured
      flake.extraInputs =
        let
          projectFlakeInputs = (import ./../../flake.nix).inputs;
          testInputs = lib.attrsets.mapAttrs' (name: value: {
            name = "test-input-${name}";
            inherit value;
          }) projectFlakeInputs;
        in
        testInputs
        // {
          nixpkgs.follows = "nix4dev/nixpkgs";
        };

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

          flake-parts-website = {
            url = "github:hercules-ci/flake.parts-website";
            # inputs = {
            #   # devshell.follows = "devshell";
            #   # flake-parts.follows = "flake-parts";
            #   nixpkgs.follows = "nixpkgs";
            #   treefmt-nix.follows = "treefmt-nix";
            # };
          };

          treefmt-nix = {
            url = "github:numtide/treefmt-nix";
            inputs.nixpkgs.follows = "nixpkgs";
          };
        };

        extraFlakeModules = [
          "inputs.flake-parts-website.flakeModules.empty-site"
        ];
      };

      managedFiles.files.".gitignore".source.lines = ''
        # Do not commit flake lock file
        /flake.lock
      '';
    };
  };
}
