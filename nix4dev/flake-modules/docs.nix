{
  config.perSystem =
    { pkgs, ... }:
    {
      nix4dev.managedFiles.files = {
        "docs/test-lib.md".source.file = let
          locs = pkgs.writeText "test-lib-locs.json" ''
            {
              "pref.cat.testFlakePartsWithDir": "[flake-modules/test-lib/flake-module/lib.nix](https://github.com/jan-kouba/nix4dev/blob/master/flake-modules/test-lib/flake-module/lib.nix)",
              "pref.cat.testSuiteFlakePartsWithDir": "[flake-modules/test-lib/flake-module/lib.nix](https://github.com/jan-kouba/nix4dev/blob/master/flake-modules/test-lib/flake-module/lib.nix)"
            }
          '';
        in pkgs.runCommandNoCC "test-lib-docs.md" { } ''
          ${pkgs.nixdoc}/bin/nixdoc \
            --file ${./../../flake-modules/test-lib/flake-module/lib.nix} \
            --category "test-lib" \
            --description "Helper functions for writing tests" \
            --prefix "pref" \
            --locs ${locs} \
            > $out
        '';
      };
    };
}
