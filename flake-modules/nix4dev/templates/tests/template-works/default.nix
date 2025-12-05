let
  templateSettingsModule = {
    perSystem.nix4dev.templates.test = {
      description = "A test template";
      welcomeText = ''
        # A test template
        Hello
      '';

      extraFiles = {
        "nix4dev/flake-modules/default.nix".source.file = ./template-default.nix;
        "foo".source.text = ''
          foo
        '';
        "bar".source.lines = ''
          bar
        '';
      };
    };
  };
in
{
  perSystem.config.nix4dev.flakePartsTests.suites."templates".tests."template-works" = {
    steps = [
      {
        imports = [ templateSettingsModule ];

        perSystem =
          { config, ... }:
          {
            test.commandsToExecute = [ ''${config.nix4dev.managedFiles.updateFiles} "$out"'' ];
          };
      }
    ];

    expected = ./expected;

    excludeFiles = [
      ".editorconfig"
      ".envrc"
      ".gitignore"
      "nix4dev/.managed-files.list"
      "nix4dev/flake.nix"
    ];
  };
}
