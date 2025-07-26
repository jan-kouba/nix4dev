{ flake-parts-lib, lib, ... }:
{
  options.perSystem = flake-parts-lib.mkPerSystemOption (
    {
      config,
      pkgs,
      ...
    }:
    {
      options = {
        nix4dev.yaml.disable = lib.mkEnableOption "YAML support";
      };

      config = lib.mkIf (!config.nix4dev.yaml.disable) {
        # Convert .yaml files formatted as JSON (which is still a valid YAML format)
        # into more common YAML syntax (without curly braces, strings and field names wrapped in '"', ...).
        # This step is handy, e.g. when you generate YAML files from nix expression
        # using the `builtins.toJSON` function.
        treefmt.settings.formatter = {
          "yq-json" = {
            command = "${pkgs.bash}/bin/bash";
            options = [
              "-euc"
              ''
                for file in "$@"; do
                  # Rewrite to YAML only if the file is a JSON file
                  if ${pkgs.jq}/bin/jq . "$file" > /dev/null; then
                    ${pkgs.yq-go}/bin/yq -i -P "$file"
                  fi
                done
              ''
              "--" # bash swallows the second argument when using -c
            ];
            includes = [
              "*.yaml"
              "*.yml"
            ];
            priority = -100;
          };
        };

        treefmt.programs.prettier = {
          enable = true;

          includes = [
            "*.yml"
            "*.yaml"
          ];
        };

        managedFiles.files.".editorconfig".source.lines = lib.mkIf (!config.nix4dev.editorconfig.disable) ''
          # YAML
          [*.{yml, yaml}]
          indent_size = 2
        '';
      };
    }
  );
}
