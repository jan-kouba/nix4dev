{ inputs, self, ... }:
{
  perSystem.config.nix4dev.flakePartsTests.suites."nix4dev".tests."load-project-flake" =
    {
      inputs = { inherit (inputs) flake-parts; };
      init = ./init;
      expected = ./expected;
      steps = [
        (
          { inputs, ... }:
          {
            perSystem.nix4dev.projectFlake.enable = true;
          }
        )
      ];

      excludeFiles = [
        ".editorconfig"
        ".envrc"
        ".gitignore"
        "nix4dev"
      ];
    };
}
