{lib, ...}: {
  perSystem = {config, ...}: {
    options = {
      nix4dev.yaml.disable = lib.mkEnableOption "YAML support";
    };

    config = lib.mkIf (! config.nix4dev.yaml.disable) {
      treefmt.programs.prettier = {
        enable = true;

        includes = [
          "*.yml"
          "*.yaml"
        ];
      };

      nix4dev.managedFiles.files.".editorconfig".source.lines = lib.mkIf config.nix4dev.editorconfig.enable ''
        # YAML
        [*.{yml, yaml}]
        indent_size = 2
      '';
    };
  };
}
