{
  testDescription = "opentofu works";

  steps = [
    {
      perSystem =
        { config, ... }:
        {
          nix4dev = {
            opentofu.enable = true;

            overlays = [
              (_self: prev: {
                opentofu = prev.opentofu.withPlugins (p: [ p.local ]);
              })
            ];
          };

          test.commandsToExecute = [
            ''
              cd "$out"

              pushd tofu/test-module
              ${config.devShells.default}/bin/tofu init
              ${config.devShells.default}/bin/tofu plan
              ${config.devShells.default}/bin/tofu apply -auto-approve
              popd

              rm -r tofu
            ''
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
