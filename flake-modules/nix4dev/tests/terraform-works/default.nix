{
  perSystem.config.nix4dev.flakePartsTests.suites."nix4dev".tests."terraform-works" = {
    init = ./init;
    expected = ./expected;

    steps = [
      {
        perSystem =
          { config, pkgs, ... }:
          {
            nix4dev = {
              terraform.enable = true;

              overlays = [
                (_self: prev: {
                  terraform = pkgs.writeShellApplication {
                    name = "terraform";
                    runtimeInputs = [ (prev.opentofu.withPlugins (p: [ p.local ])) ];
                    text = ''
                      exec tofu "$@"
                    '';
                  };
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

                pushd terraform/test-module
                ${config.devShells.default}/bin/terraform init
                ${config.devShells.default}/bin/terraform plan
                ${config.devShells.default}/bin/terraform apply -auto-approve
                popd

                rm -r .git
                rm -r terraform/test-module/{.terraform*,terraform.tfstate}
              ''
            ];
          };
      }
    ];
  };
}
