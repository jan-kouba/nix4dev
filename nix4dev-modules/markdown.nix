nix4devInputs: {
  perSystem = {system, ...}: {
    treefmt.programs.mdformat = {
      enable = true;
      package = let
        mdformatPkgs = import nix4devInputs.nixpkgs-mdformat {inherit system;};
      in
        mdformatPkgs.mdformat.withPlugins (p: [
          p.mdformat-admon
          p.mdformat-beautysh
          p.mdformat-footnote
          p.mdformat-frontmatter
          p.mdformat-gfm
          p.mdformat-gfm-action
          p.mdformat-mkdocs
          p.mdformat-nix-alejandra
          p.mdformat-simple-breaks
          p.mdformat-tables
          p.mdformat-toc
        ]);
    };
  };
}
