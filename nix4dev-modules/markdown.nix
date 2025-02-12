nix4devInputs: {
  perSystem = {pkgs, system, ...}: {
    treefmt.programs.mdformat = {
      enable = true;
      package = pkgs.mdformat.withPlugins (p: [
          p.mdformat-admon
          p.mdformat-beautysh
          p.mdformat-footnote
          p.mdformat-frontmatter
          p.mdformat-gfm
          p.mdformat-gfm-alerts
          p.mdformat-mkdocs
          p.mdformat-nix-alejandra
          p.mdformat-simple-breaks
          p.mdformat-tables
          p.mdformat-toc
        ]);
    };
  };
}
