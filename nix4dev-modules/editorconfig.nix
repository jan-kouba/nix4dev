{lib, ...}: {
  perSystem = {
    config,
    pkgs,
    ...
  }: let
    cfg = config.nix4dev.editorconfig;
    mkEnabledOption = feature: lib.mkOption {
        type = lib.types.bool;
        default = true;
        example = false;
        description = "Whether to enable ${feature}.";
    };
  in {
    options = {
      nix4dev.editorconfig.enable = mkEnabledOption ".editorconfig generation";
    };

    config = lib.mkIf cfg.enable {
        managedFiles.files.".editorconfig".src.lines = lib.mkBefore ''
            # EditorConfig is awesome:
            # https://EditorConfig.org

            # top-most EditorConfig file
            root = true

            # Default settings:
            # A newline ending every file
            [*]
            insert_final_newline = true
            indent_style = space
            end_of_line = lf
            charset = utf-8
            trim_trailing_whitespace = true
        '';
    };
  };
}
