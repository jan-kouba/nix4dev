let
  seedSettingsModule = {
    nix4dev.seeds.seed-without-settings = {
      description = "A seed";
      welcomeText = ''
        # A seed
        Hello
      '';
    };
  };
in
{
  steps = [
    {
      imports = [ seedSettingsModule ];

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
