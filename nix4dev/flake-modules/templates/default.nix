{
  perSystem = {
    nix4dev.templates.default = {
      description = "Easy to setup Nix based devshell";

      welcomeText = ''
        # Welcome to nix4dev devshell!

        * Tune ./nix4dev/flake-modules
        * run "direnv allow" or "nix develop"
        * Enjoy!
      '';

      extraFiles = {
        "nix4dev/flake-modules/default.nix".source.text = ''
          {}
        '';
      };
    };
  };
}
