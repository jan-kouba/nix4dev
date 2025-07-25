{ flake-parts-lib, lib, ... }:
{
  options.perSystem = flake-parts-lib.mkPerSystemOption (
    { config, ... }:
    {
      options = {
        nix4dev.bash.disable = lib.mkEnableOption "bash support";
      };

      config = lib.mkIf (!config.nix4dev.bash.disable) {
        treefmt.programs = {
          shellcheck.enable = true;
          shfmt.enable = true;
        };

        managedFiles.files.".editorconfig".source.lines = lib.mkIf (!config.nix4dev.editorconfig.disable) ''
          # Bash
          [*.sh]
          indent_size = 2
        '';
      };
    }
  );
}
