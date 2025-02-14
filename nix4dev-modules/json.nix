{lib, ...}: {
  perSystem = {config, ...}: {
    treefmt.programs.prettier = {
      enable = true;

      includes = [
        "*.json"
        "*.json5"
      ];
    };

    nix4dev.managedFiles.files.".editorconfig".source.lines = lib.mkIf config.nix4dev.editorconfig.enable ''
      # JSON
      [*.{json,json5}]
      indent_size = 2
    '';
  };
}
