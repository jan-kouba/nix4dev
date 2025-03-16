{ inputs, lib, flake-parts-lib, ...}: {
  perSystem = { config, pkgs, system, ...}: let
    cfg = config.nix4dev.seed;
  in {
    nix4dev.managedFiles.files = let
          initialSetupProjectFlake =
            inputs.nix4dev.inputs.flake-parts.lib.mkFlake
            {
              inputs =
                inputs.nix4dev.inputs
                // {self = initialSetupProjectFlake;};
            }
            {
              imports = [
                inputs.nix4dev.flakeModules.default
                (flake-parts-lib.importApply ../../nix4dev-seed-modules/init-package.nix {inherit (cfg) extraFixedFlakeInputs extraFixedModules;})
              ];
            };

          initTemplate = pkgs.runCommand "init-template" {} ''
            mkdir $out

            cd $out

            ${initialSetupProjectFlake.packages.${system}.init}
          '';
          initFiles = lib.filesystem.listFilesRecursive initTemplate;
        in lib.listToAttrs (
          lib.lists.map (path: let
              relPath = lib.path.removePrefix initTemplate path;
            in {
              name = relPath;
              value = {
                source.file = path;
              };
            }
          ) initFiles
        );
  };
}
