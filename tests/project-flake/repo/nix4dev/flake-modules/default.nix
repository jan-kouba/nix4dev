{
  perSystem = {
    config.nix4dev.projectFlake = {
      enable = true;

      description = "This is test of project flake";

      inputs = {
        foo-nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
        systems.url = "github:nix-systems/default";
      };
    };
  };
}
