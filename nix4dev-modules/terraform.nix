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
    };
  };
}
