{
  perSystem.nix4dev.seeds.default = {
    description = "Some description";
    welcomeText = "Some welcome text";

    extraFiles = {
      "nix4dev/flake-modules/default.nix".source.file = ./seed.nix;
    };
  };
}
