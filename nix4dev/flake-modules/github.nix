{lib, ...}: {
  perSystem = {
    ...
  }: {
    nix4dev.managedFiles.files = {
      ".github/workflows/nix4dev-check.yml".source.text = let
        workflowJob = {
          mainStepName,
          mainStepCommand,
        }: {
          strategy.matrix.runs-on = ["ubuntu-22.04" "macos-14"];
          runs-on = "\${{ matrix.runs-on}}";

          steps = [
            {uses = "actions/checkout@v4";}
            {
              name = "Install Nix";
              uses = "DeterminateSystems/nix-installer-action@main";
            }
            {
              name = "Setup Nix cache";
              uses = "DeterminateSystems/magic-nix-cache-action@main";
            }
            {
              name = "Setup git for test";
              run = ''
                git config --global user.email "nix4dev-ci@github.com"
                git config --global user.name "nix4dev CI"
              '';
            }
            {
              name = mainStepName;
              run = mainStepCommand;
            }
          ];
        };

        checkJob = workflowJob {
          mainStepName = "Run `check`";
          mainStepCommand = ''
            nix run ./nix4dev#check
          '';
        };

        testJob = workflowJob {
          mainStepName = "Run `test-all`";
          mainStepCommand = ''
            nix develop ./nix4dev -c test-all
          '';
        };

        workflowNix = {
          name = "nix4dev-check";
          on = {
            push = {};
            workflow_dispatch = {};
          };

          permissions = {
            id-token = "write";
            contents = "read";
          };

          jobs = {
            nix4dev-check = checkJob;
            nix4dev-test-all = testJob;
          };
        };
      in
        lib.generators.toYAML {} workflowNix;
    };
  };
}
