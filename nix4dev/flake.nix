# This file was generated by nix4dev.
{
  # To change flake inputs, use the `nix4dev.flake.extraInputs` option.
  inputs = {
    "nix4dev" = {
      "url" = "git+ssh://gitea@gitea.koubic.dev/honza/nix4dev.git";
    };
  };

  outputs = inputs:
    inputs.nix4dev.inputs.flake-parts.lib.mkFlake
    {inherit inputs;}
    {
      imports = let
        l = inputs.nix4dev.inputs.nixpkgs.lib // builtins;
        assertFileExists = path: msg:
          assert (
            l.asserts.assertMsg
            (l.filesystem.pathIsRegularFile path)
            msg
          ); path;
      in [
        inputs.nix4dev.flakeModules.default
        (
          assertFileExists
          ./flake-modules/default.nix
          ''
            Default flake module not found. To create an empty default module execute:

            mkdir -p ./flake-modules
            echo "{}" > ./flake-modules/default.nix

            in the directory containing the flake.nix file.
          ''
        )
      ];
    };
}
