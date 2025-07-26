nix4devInputs:
{
  config,
  flake-parts-lib,
  lib,
  ...
}:
let
  l = lib // builtins;
  t = l.types;

  topCfg = config.nix4dev;
  overlaysOption = lib.mkOption {
    type = lib.types.listOf (lib.types.functionTo (lib.types.functionTo lib.types.attrs));
    default = [ ];
    description = "Overlays to apply when constructing the pkgs from nixpkgs.";
    example = ''
      final: prev: {
        jdk = final.graalvm-ce;
      }
    '';
  };
in
{
  options = {
    nix4dev = {
      overlays = overlaysOption;
      nixpkgs = lib.mkOption {
        type = lib.types.path;
        default = nix4devInputs.nixpkgs;
        defaultText = l.literalExpression "nix4devInputs.nixpkgs";
        description = "The nixpkgs to use to construct pkgs passed as argument into flake-parts modules.";
        example = "inputs.nixpkgs-unstable";
      };
    };
  };

  options.perSystem = flake-parts-lib.mkPerSystemOption (
    {
      system,
      config,
      ...
    }:
    let
      cfg = config.nix4dev;
    in
    {
      options = {
        nix4dev = {
          overlays = overlaysOption;

          allowUnfreePackages = l.mkOption {
            type = t.listOf t.str;
            description = ''
              List of unfree packages to allow in the flake.
            '';
            default = [ ];
            example = [ "terraform" ];
          };
        };
      };

      config = {
        _module.args.pkgs = import topCfg.nixpkgs {
          inherit system;
          overlays = topCfg.overlays ++ cfg.overlays;

          config = {
            allowUnfreePredicate = pkg: l.elem (l.getName pkg) cfg.allowUnfreePackages;
          };
        };
      };
    }
  );
}
