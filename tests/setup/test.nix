t:
t.makeTest (
  t.withLockedRepo ''
    mkdir -p nix4dev/flake-modules
    echo "{}" > nix4dev/flake-modules/default.nix
    git add .

    echo "foo" > bar
    chmod 'u+w' .envrc
    echo "# Something added at the end" >> .envrc

    PRJ_ROOT=$(pwd) ${t.nix "run" "./nix4dev" ../overrides-nix4dev.nix} ./nix4dev#setup

    diff bar <(echo "foo")
    grep -v "# Something added at the end" .envrc
  ''
)
