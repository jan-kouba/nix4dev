{
  perSystem = { ...}: {
    nix4dev.terraform.enable = true;

    nix4dev.overlays = [
      (_self: prev: {
        terraform = prev.terraform.withPlugins (p: [p.local]);
      })
    ];
  };
}
