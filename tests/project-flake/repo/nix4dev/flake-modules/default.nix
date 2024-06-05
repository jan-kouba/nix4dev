{...}: {
  perSystem = {
    config.nix4dev.projectFlake = {
      enable = true;

      description = "This is test of project flake";

      extraInputs = {
        foo-nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
        systems.url = "github:nix-systems/default";
      };
    };
  };
}
