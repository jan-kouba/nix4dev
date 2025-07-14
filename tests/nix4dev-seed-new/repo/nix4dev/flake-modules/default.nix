{
  perSystem.nix4dev.templates.default = {
    description = "Some description";
    welcomeText = "Some welcome text";

    extraFiles = {
      "nix4dev/flake-modules/default.nix".source.file = ./template-default.nix;
    };
  };
}
