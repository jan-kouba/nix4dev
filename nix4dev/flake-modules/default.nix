{...}: {
  imports = [
    ./common.nix
    ./devshell.nix
    ./github.nix
    ./tests.nix
  ];

  perSystem = { pkgs, ...}: {
    devshells.default.packages = [
      pkgs.nixVersions.latest
    ];
  };
}
