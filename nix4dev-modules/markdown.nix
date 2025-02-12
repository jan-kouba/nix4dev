nix4devInputs: {
  perSystem = {pkgs, system, ...}: let
    mdformat = (
      pkgs.python3.withPackages (p: [
          p.mdformat
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
        ])).overrideAttrs(_: {
          meta.mainProgram = "mdformat";
        });
  in {
    treefmt.programs.mdformat = {    
      enable = true;
      package = mdformat;
    };    
  };
}
