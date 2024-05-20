{...}: {
  perSystem = {
    config.nix4dev.projectFlake = {
      enable = true;

      description = "This is test of project flake";

      extraInputs = {
        foo-nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
        systems.url = "github:nix-systems/default";
      };
    };
  };
}
