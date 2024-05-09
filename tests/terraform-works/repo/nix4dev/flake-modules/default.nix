{
  perSystem = {pkgs, ...}: {
    nix4dev.terraform.enable = true;

    nix4dev.overlays = [
      (_prev: _self: {
        terraform = pkgs.writeShellApplication {
          name = "terraform";
          runtimeInputs = [pkgs.opentofu];
          text = ''
            exec tofu "$@"
          '';
        };
      })
    ];
  };
}
