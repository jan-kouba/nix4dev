{lib, ...}: {
  perSystem = {config, ...}: {
    options = {
      nix4dev.nixlang.disable = lib.mkEnableOption "Nix language support";
    };

    config = lib.mkIf (! config.nix4dev.nixlang.disable) {
      treefmt.programs = {
        deadnix.enable = true;
        alejandra.enable = true;
      };

      formatter = config.treefmt.programs.nixpkgs-fmt.package;

      nix4dev.managedFiles.files.".editorconfig".source.lines = lib.mkIf (! config.nix4dev.editorconfig.disable) ''
        # Nix language
        [*.nix]
        indent_size = 2
      '';
    };
  };
}
