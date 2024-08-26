t:
t.makeTest (
  t.withLockedRepo ''
    mkdir -p nix4dev/flake-modules
    echo "{}" > nix4dev/flake-modules/default.nix
    git add nix4dev/flake-modules/default.nix

    PRJ_ROOT=$(pwd) nix run ./nix4dev#check
  ''
)
