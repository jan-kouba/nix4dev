{ flake-parts-lib, lib, ... }:
{
  options.perSystem = flake-parts-lib.mkPerSystemOption (
    {
      config,
      pkgs,
      ...
    }:
    let
      mdformat =
        (pkgs.python3.withPackages (p: [
          p.mdformat
          p.mdformat-admon
          p.mdformat-beautysh
          p.mdformat-footnote
          p.mdformat-frontmatter
          p.mdformat-gfm
          p.mdformat-mkdocs
          p.mdformat-nix-alejandra
          p.mdformat-simple-breaks
          p.mdformat-tables
          # p.mdformat-toc # disable because the package is marked as broken
        ])).overrideAttrs
          (_: {
            meta.mainProgram = "mdformat";
          });
    in
    {
      options = {
        nix4dev.markdown.disable = lib.mkEnableOption "markdown support";
      };

      config = lib.mkIf (!config.nix4dev.markdown.disable) {
        treefmt.programs.mdformat = {
          enable = true;
          package = mdformat;
        };

        nix4dev.managedFiles.files.".editorconfig".source.lines =
          lib.mkIf (!config.nix4dev.editorconfig.disable)
            ''
              # Markdown
              [*.md]
              indent_size = 4
            '';
      };
    }
  );
}
