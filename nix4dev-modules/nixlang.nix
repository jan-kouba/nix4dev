{
  perSystem = {config, ...}: {
    treefmt.programs = {
      deadnix.enable = true;
      alejandra.enable = true;
    };

    formatter = config.treefmt.programs.nixpkgs-fmt.package;
  };
}
