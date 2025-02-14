{lib, ...}: {
  perSystem = {config, ...}: {
    options = {
      nix4dev.bash.disable = lib.mkEnableOption "bash support";
    };

    config = lib.mkIf (! config.nix4dev.bash.disable) {
      treefmt.programs = {
        shellcheck.enable = true;
        shfmt.enable = true;
      };

      nix4dev.managedFiles.files.".editorconfig".source.lines = lib.mkIf (! config.nix4dev.editorconfig.disable) ''
        # Bash
        [*.sh]
        indent_size = 2
      '';
    };
  };
}
