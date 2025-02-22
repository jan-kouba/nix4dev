{
  perSystem = {
    devshells.default.name = "nix4dev";

    nix4dev = {
      conventionalCommits.enable = true;

      flake.extraInputs = {
        # Add the root flake as dependency, so we have its dependencies captured
        project-flake.url = "./..";
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

          treefmt-nix = {
            url = "github:numtide/treefmt-nix";
            inputs.nixpkgs.follows = "nixpkgs";
          };
        };
      };

      managedFiles.files.".gitignore".source.lines = ''
        # Do not commit flake lock file
        /flake.lock
      '';
    };
  };
}
