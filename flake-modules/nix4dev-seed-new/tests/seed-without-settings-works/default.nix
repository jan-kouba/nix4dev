{
  steps = [
    {
      perSystem = {config, ...}: {
        test.commandsToExecute = [
        ''PRJ_ROOT="$out" ${config.packages.setup}/bin/setup'' ];
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
