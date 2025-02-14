{lib, ...}: {
  perSystem = {config, ...}: {
    treefmt.programs = {
      deadnix.enable = true;
      alejandra.enable = true;
    };

    formatter = config.treefmt.programs.nixpkgs-fmt.package;

    nix4dev.managedFiles.files.".editorconfig".source.lines = lib.mkIf config.nix4dev.editorconfig.enable ''
      # Nix language
      [*.nix]
      indent_size = 2
    '';
  };
}
