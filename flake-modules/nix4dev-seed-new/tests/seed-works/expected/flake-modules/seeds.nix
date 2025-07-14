{
  flake.templates = {
    seed = {
      description = "A seed";
      welcomeText = ''
        # A seed
        Hello
      '';
      path = ../nix4dev/seeds + "/seed";
    };

  };
}
