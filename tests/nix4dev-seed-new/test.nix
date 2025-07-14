t:
t.makeTest (
  t.withLockedRepo ''
    echo "Creating seed repo ..."

    cp -r ${./repo}/* .
    chmod -R u+w .

    git add .
    PRJ_ROOT=$(pwd) ${t.nix "run" "./nix4dev"} ./nix4dev#setup

    # Lock the project flake's inputs
    git add .
    ${t.nix "flake update" "."}

    git add .
    git commit -m "Added repo files"



    echo "Creating repo using the seed repo"

    cd ..
    mkdir repo_seeded
    cd repo_seeded

    ${t.pkgs.nix}/bin/nix flake init -t ../repo

    # Test that the module from seed is loaded
    ${t.nix "develop" "./nix4dev"} ./nix4dev -c test-success

    # Test that setup does not break things
    PRJ_ROOT=$(pwd) ${t.nix "run" "./nix4dev"} ./nix4dev#setup

    ${t.nix "develop" "./nix4dev"} ./nix4dev -c test-success
  ''
)
