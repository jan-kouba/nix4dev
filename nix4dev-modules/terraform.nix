{lib, ...}: let
  l = lib // builtins;
in {
  perSystem = {
    config,
    pkgs,
    ...
  }: let
    cfg = config.nix4dev.terraform;
  in {
    options = {
      nix4dev.terraform.enable = l.mkEnableOption "terraform";
    };

    config = l.mkIf cfg.enable {
      treefmt.programs.terraform.enable = true;

      devshells.default.packages = [
        pkgs.terraform
      ];

      nix4dev.allowUnfreePackages = ["terraform"];

      nix4dev.managedFiles.files.".gitignore".sources.lines = ''

        #
        # Terraform
        #

        # Ignore local .terraform directories
        **/.terraform/*

        # Ignore state files
        *.tfstate
        *.tfstate.*

        # Ignore override files as they are usually used to override resources locally and so
        # are not checked in
        override.tf
        override.tf.json
        *_override.tf
        *_override.tf.json

        # Ignore the plan output of commands like: terraform plan -out=plan.tfplan
        *.tfplan

      '';
    };
  };
}
