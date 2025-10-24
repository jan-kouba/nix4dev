t:
t.makeTest (
  t.withLockedRepo ''
    mkdir -p nix4dev/flake-modules
    echo "{ }" > nix4dev/flake-modules/default.nix
    git add nix4dev/flake-modules/default.nix

    PRJ_ROOT=$(pwd) ${t.nix "run" "./nix4dev"} ./nix4dev#check

    # Check that the project directory looks as expected
    rm -rf .git nix4dev/flake.lock

    # Replace nix4dev flake references back from the path to this repo
    find . -name '*.nix' -exec sed -i 's%"${t.repoPath}"%"github:jan-kouba/nix4dev"%g' {} \;

    diff --recursive ${./.}/expected .
  ''
)
