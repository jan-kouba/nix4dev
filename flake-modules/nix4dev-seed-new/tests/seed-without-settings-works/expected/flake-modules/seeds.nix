{
  flake.templates = {
    seed-without-settings = {
      description = "A seed";
      welcomeText = ''
        # A seed
        Hello
      '';
      path = ../nix4dev/seeds + "/seed-without-settings";
    };

  };
}
