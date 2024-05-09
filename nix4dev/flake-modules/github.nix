{lib, ...}: {
  perSystem = {
    config,
    pkgs,
    ...
  }: let
    nix4devLib = import ../../nix4dev-lib {inherit pkgs;};
  in {
    nix4dev.managedFiles.files = {
      ".github/workflows/nix4dev-check.yml".source.file = let
        workflowJob = {
          mainStepName,
          mainStepCommand,
        }: {
          runs-on = "ubuntu-22.04";

          steps = [
            {uses = "actions/checkout@v3";}
            {
              name = "Install Nix";
              uses = "cachix/install-nix-action@v26";
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
            nix develop ./nix4dev -c check
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

        workflowYaml = pkgs.writeText "workflow.json" (lib.generators.toYAML {} workflowNix);
      in
        nix4devLib.writeFormattedFile {
          treefmtConfig = config.treefmt;
          fileToFormat = workflowYaml;
          outputFileName = "workflow.json";
        };
    };
  };
}
