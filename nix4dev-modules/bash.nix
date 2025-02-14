{lib, ...}: {
  perSystem = {config, ...}: {
    treefmt.programs = {
      shellcheck.enable = true;
      shfmt.enable = true;
    };

    nix4dev.managedFiles.files.".editorconfig".source.lines = lib.mkIf config.nix4dev.editorconfig.enable ''
      # Bash
      [*.sh]
      indent_size = 2
    '';
  };
}
