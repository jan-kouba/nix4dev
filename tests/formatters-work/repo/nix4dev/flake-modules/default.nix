{
  perSystem = { pkgs, ...}: {
    treefmt.settings.global.excludes = [
      "expected/**"
    ];

    nix4dev.terraform.enable = true;

    nix4dev.overlays = [
      (prev: self: {
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
