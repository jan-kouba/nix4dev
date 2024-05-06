t:
t.makeTest (
  t.withLockedRepo ''
    mkdir -p nix4dev/flake-modules
    echo "{}" > nix4dev/flake-modules/default.nix
    git add nix4dev/flake-modules/default.nix

    nix develop ./nix4dev -c check
  ''
)
