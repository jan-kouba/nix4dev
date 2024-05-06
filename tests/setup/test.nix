t:
t.makeTest (
  t.withLockedRepo ''
    mkdir -p nix4dev/flake-modules
    echo "{}" > nix4dev/flake-modules/default.nix
    git add .

    echo "foo" > bar
    chmod 'u+w' .envrc
    echo "# Something added at the end" >> .envrc

    nix develop ./nix4dev -c setup

    diff bar <(echo "foo")
    grep -v "# Something added at the end" .envrc
  ''
)
