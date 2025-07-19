{
  flake.templates = {
    default = {
      description = "Easy to setup Nix based devshell";
      welcomeText = ''
        # Welcome to nix4dev devshell!

        * Tune ./nix4dev/flake-modules
        * run "direnv allow" or "nix develop"
        * Enjoy!
      '';
      path = ../nix4dev/templates + "/default";
    };

  };
}
