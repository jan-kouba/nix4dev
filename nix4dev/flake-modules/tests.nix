{inputs, ...}: {
  perSystem = {
    pkgs,
    lib,
    ...
  }: let
    testDirs = lib.filterAttrs (_name: type: type == "directory") (builtins.readDir ../../tests);

    writeTestRunner = pkg:
      pkgs.writeShellApplication {
        name = pkg.name;
        runtimeInputs = [pkg];

        text = ''
          echo ===============
          echo "= Starting test ${pkg.name}"
          echo ===============
          ${pkg.name}
          echo ===============
          echo "= Finished test ${pkg.name}"
          echo ===============
        '';
      };

    testLib = testName:
      import ../../tests/lib.nix {
        inherit pkgs testName inputs lib;
        repoPath = ../..;
      };

    tests =
      builtins.mapAttrs
      (
        testName: _type: let
          testScript = import (../../tests + "/${testName}/test.nix");
        in
          writeTestRunner (testScript (testLib testName))
      )
      testDirs;

    testAllPkg = pkgs.writeShellApplication {
      name = "test-all";
      runtimeInputs = builtins.attrValues tests;
      text = builtins.concatStringsSep "\n" (
        lib.mapAttrsToList
        (_n: v: v.name)
        tests
      );
    };
  in {
    treefmt.settings.global.excludes = [
      "tests/formatters-work/repo/**"
      "flake-modules/managed-files/tests/*/expected/**"
    ];

    nix4dev.envrc.watchDirectories = ["tests"];

    devshells.default = {
      commands =
        (
          lib.mapAttrsToList
          (_n: v: {
            package = v;
            category = "tests";
          })
          tests
        )
        ++ [
          {
            name = "test-all";
            package = testAllPkg;
            help = "Runs all tests";
            category = "tests";
          }
        ];
    };
  };
}
