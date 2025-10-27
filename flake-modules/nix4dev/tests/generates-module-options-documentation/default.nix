{ inputs, self, ... }:
{
  perSystem.config.nix4dev.flakePartsTests.suites."nix4dev".tests."generates-module-options-documentation" =
    {
      inputs = { inherit (inputs) flake-parts; };
      init = ./init;
      expected = ./expected;
      steps = [
        (
          { ... }:
          {
            perSystem.nix4dev = {
              projectFlake.enable = true;
            };
          }
        )
        ({
          perSystem.nix4dev = {
            projectFlake.enable = true;

            documentation.nixModules = {
              sourcePath = "${self}/flake-modules/nix4dev/tests/generates-module-options-documentation";
              baseUrl = "https://mydoc.com";
            };
          };
        })
      ];

      excludeFiles = [
        ".editorconfig"
        ".envrc"
        ".gitignore"
        "nix4dev"
        "flake-modules/default.nix"
        "flake-modules/test-module.nix"
      ];
    };
}
