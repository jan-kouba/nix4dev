{ flake-parts-lib, lib, ... }:
{
  options.perSystem = flake-parts-lib.mkPerSystemOption (
    { config, ... }:
    {
      options = {
        nix4dev.json.disable = lib.mkEnableOption "JSON support";
      };

      config = lib.mkIf (!config.nix4dev.json.disable) {
        treefmt.programs.prettier = {
          enable = true;

          includes = [
            "*.json"
            "*.json5"
          ];
        };

        managedFiles.files.".editorconfig".source.lines = lib.mkIf (!config.nix4dev.editorconfig.disable) ''
          # JSON
          [*.{json,json5}]
          indent_size = 2
        '';
      };
    }
  );
}
