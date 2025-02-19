{
  perSystem = {pkgs, ...}: {
    nix4dev.terraform.enable = true;

    nix4dev.overlays = [
      (_self: prev: {
        terraform = pkgs.writeShellApplication {
          name = "terraform";
          runtimeInputs = [(prev.opentofu.withPlugins (p: [p.local]))];
          text = ''
            exec tofu "$@"
          '';
        };
      })
    ];
  };
}
