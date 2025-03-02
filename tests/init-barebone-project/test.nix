t:
t.makeTest (
  t.withLockedRepo ''
    mkdir -p nix4dev/flake-modules
    echo "{}" > nix4dev/flake-modules/default.nix
    git add nix4dev/flake-modules/default.nix

    PRJ_ROOT=$(pwd) ${t.nix "run" "./nix4dev" ../overrides-nix4dev.nix} ./nix4dev#check

    # Check that the project directory looks as expected
    rm -rf .git nix4dev/flake.lock

    diff --recursive ${./.}/expected .
  ''
)
