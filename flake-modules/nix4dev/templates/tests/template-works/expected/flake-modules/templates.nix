{
  flake.templates = {
    test = {
      description = "A test template";
      welcomeText = ''
        # A test template
        Hello
      '';
      path = ../nix4dev/templates + "/test";
    };

  };
}
