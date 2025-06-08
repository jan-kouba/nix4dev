{ self, flake-parts-lib, inputs, lib, ...}: {
  perSystem = { config, pkgs, system, ...}: let
    seedFlake = flake-parts-lib.mkFlake { inputs = {}; } {
      imports = [
        (flake-parts-lib.importApply ../../nix4dev-modules inputs)
      ];
    };
    seedProjectDir = pkgs.runCommand "seed-project" {} ''
      PRJ_ROOT="$out" ${seedFlake.packages.${system}.setup}/bin/setup
    '';

    seedFiles = lib.filesystem.listFilesRecursive seedProjectDir.out;
    seedManagedFiles =
      lib.map (file: let
        relPath = lib.strings.removePrefix ("" + seedProjectDir + "/") ("" + file);
      in
      (let res = {
        name =  builtins.trace relPath relPath;
        value.source.file = "${file}";
      }; in builtins.trace res res)
    ) seedFiles;
  in {
    nix4dev.managedFiles.files."nix4dev/seeds/default/.envrc".source.file = "${self}/.envrc";
  };
}
