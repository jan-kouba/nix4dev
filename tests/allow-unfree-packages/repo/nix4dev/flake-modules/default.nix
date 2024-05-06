{
  perSystem = {pkgs, ...}: {
    nix4dev.allowUnfreePackages = [
      "example-unfree-package"
    ];

    devshells.default.packages = [pkgs.hello-unfree];
  };
}
