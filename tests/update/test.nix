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
    chmod -R u+w .
    readlink -f "$(pwd)" > nix4dev/flake-modules/repo_root
    git add .
    PRJ_ROOT=$(pwd) ${t.nix "run" "./nix4dev"} ./nix4dev#setup
    git add .
    git commit -a -m "Update"

    diff "$(${t.nix "build" "./nix4dev"} --no-link --print-out-paths ./nix4dev#foo)" <(echo "bar")
    diff "$(${t.nix "build" "."} --no-link --print-out-paths .#foo)" <(echo "bar")

    pushd ../dep-repo
    echo baz > foo
    git commit -a -m "Second commit"
    popd

    PRJ_ROOT=$(pwd) ${t.nix "run" "./nix4dev"} ./nix4dev#update

    diff "$(${t.nix "build" "./nix4dev"} --no-link --print-out-paths ./nix4dev#foo)" <(echo "baz")
    diff "$(${t.nix "build" "."} --no-link --print-out-paths .#foo)" <(echo "baz")
  ''
)
