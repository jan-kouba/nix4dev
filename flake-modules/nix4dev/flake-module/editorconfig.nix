{ flake-parts-lib, lib, ... }:
{
  options.perSystem = flake-parts-lib.mkPerSystemOption (
    { config, ... }:
    let
      cfg = config.nix4dev.editorconfig;
    in
    {
      options = {
        nix4dev.editorconfig.disable = lib.mkEnableOption ".editorconfig generation";
      };

      config = lib.mkIf (!cfg.disable) {
        nix4dev.managedFiles.files.".editorconfig".source.lines = lib.mkBefore ''
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
    }
  );
}
