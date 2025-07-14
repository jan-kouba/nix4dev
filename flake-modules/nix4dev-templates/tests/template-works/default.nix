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
      };
    };
  };
in
{
  steps = [
    {
      imports = [ templateSettingsModule ];

      perSystem =
        { config, ... }:
        {
          test.commandsToExecute = [
            ''PRJ_ROOT="$out" ${config.packages.setup}/bin/setup''
          ];
        };
    }
  ];

  excludeFiles = [
    ".editorconfig"
    ".envrc"
    ".gitignore"
    "nix4dev/.managed-files.list"
    "nix4dev/flake.nix"
  ];
}
