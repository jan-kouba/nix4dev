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
          {
            imports = [ ./inputs.nix ];
          }
        '';

        "nix4dev/flake-modules/inputs.nix".source.text = ''
          {
            perSystem.nix4dev.flake = {
              extraInputs = {
                nix4dev.url = "github:jan-kouba/nix4dev";
              };

              extraFlakeModules = [
                "inputs.nix4dev.flakeModules.default"
              ];
            };
          }
        '';
      };
    };
  };
}
