{
  perSystem.config.nix4dev.flakePartsTests.suites."nix4dev".tests."opentofu-works" = {
    init = ./init;
    expected = ./expected;

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

                # format files
                mkdir .git
                touch .git/config
                TREEFMT_NO_CACHE=true ${config.devShells.default}/bin/prepare

                pushd tofu/test-module
                ${config.devShells.default}/bin/tofu init
                ${config.devShells.default}/bin/tofu plan
                ${config.devShells.default}/bin/tofu apply -auto-approve
                popd

                rm -r .git
                rm -r tofu/test-module/{.terraform*,terraform.tfstate}
              ''
            ];
          };
      }
    ];
  };
}
