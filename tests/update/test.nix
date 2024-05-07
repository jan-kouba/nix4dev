t:
t.makeTest (
  t.withLockedRepo ''
    echo "Creating dependency repo ..."
    mkdir ../dep-repo
    pushd ../dep-repo
    echo bar > foo
    git init .
    git add foo
    git commit -a -m "First commit"
    popd

    cp -r ${./repo}/* .
    pwd > nix4dev/flake-modules/repo_root
    git add .
    nix develop ./nix4dev -c setup
    git add .
    git commit -a -m "Update"

    diff "$(nix build --no-link --print-out-paths ./nix4dev#foo)" <(echo "bar")
    diff "$(nix build --no-link --print-out-paths .#foo)" <(echo "bar")

    pushd ../dep-repo
    echo baz > foo
    git commit -a -m "Second commit"
    popd

    nix develop ./nix4dev -c update

    diff "$(nix build --no-link --print-out-paths ./nix4dev#foo)" <(echo "baz")
    diff "$(nix build --no-link --print-out-paths .#foo)" <(echo "baz")
  ''
)
