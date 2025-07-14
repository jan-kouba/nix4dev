let
  seedSettingsModule = {
    perSystem.nix4dev.seeds.seed = {
      description = "A seed";
      welcomeText = ''
        # A seed
        Hello
      '';

      extraFiles = {
        "nix4dev/flake-modules/default.nix".source.file = ./seed-default.nix;
      };
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
