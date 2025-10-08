{ inputs, self, ... }:
{
  perSystem.config.nix4dev.flakePartsTests.suites."nix4dev".tests."generates-module-options-documentation" =
    {
      inputs = { inherit (inputs) flake-parts; };
      expected = ./expected;
      steps = [
        (
          { inputs, ... }:
          {
            imports = [
              inputs.flake-parts.flakeModules.flakeModules
            ];

            flake.flakeModules = {
              testModule = ./test-module.nix;
            };

            perSystem.nix4dev.documentation.nixModules = {
              sourcePath = "${self}/flake-modules/nix4dev/tests/generates-module-options-documentation";
              baseUrl = "https://mydoc.com";
            };
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
