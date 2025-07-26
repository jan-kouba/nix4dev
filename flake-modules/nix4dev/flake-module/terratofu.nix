{ flake-parts-lib, lib, ... }:
{
  options.perSystem = flake-parts-lib.mkPerSystemOption ({
    options.nix4dev = {
      terraform.enable = lib.mkEnableOption "terraform";
      opentofu.enable = lib.mkEnableOption "opentofu";
    };
  });

  config.perSystem =
    {
      config,
      pkgs,
      ...
    }:
    let
      terraCfg = config.nix4dev.terraform;
      tofuCfg = config.nix4dev.opentofu;

      tofuOutCfg = lib.mkIf tofuCfg.enable {
        devshells.default.packages = [
          pkgs.opentofu
        ];
      };

      terraOutCfg = lib.mkIf terraCfg.enable {
        devshells.default.packages = [
          pkgs.terraform
        ];

        nix4dev.allowUnfreePackages = [ "terraform" ];
      };

      commonOutCfg = lib.mkIf (terraCfg.enable || tofuCfg.enable) {
        # treefmt uses opentofu for formatting
        treefmt.programs.terraform.enable = true;

        managedFiles.files = {
          ".gitignore".source.lines = ''
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

          ".editorconfig".source.lines = lib.mkIf (!config.nix4dev.editorconfig.disable) ''
            # Terraform / OpenTofu
            [*.{tf,tfvars}]
            indent_size = 2
          '';
        };
      };
    in
    {
      config = lib.mkMerge [
        tofuOutCfg
        terraOutCfg
        commonOutCfg
      ];
    };
}
