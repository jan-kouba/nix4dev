t:
t.makeTest (
  t.withLockedRepo ''
    echo "Creating repo with template ..."

    cp -r ${./repo}/* .
    chmod -R u+w .

    git add .
    PRJ_ROOT=$(pwd) ${t.nix "run" "./nix4dev"} ./nix4dev#setup

    # Lock the project flake's inputs
    git add .
    ${t.nix "flake update" "."}

    git add .
    git commit -m "Added repo files"



    echo "Creating repo using the template repo"

    cd ..
    mkdir repo_templated
    cd repo_templated

    ${t.pkgs.nix}/bin/nix flake init -t ../repo

    # Test that the module from template is loaded
    ${t.nix "develop" "./nix4dev"} ./nix4dev -c test-success

    # Test that setup does not break things
    PRJ_ROOT=$(pwd) ${t.nix "run" "./nix4dev"} ./nix4dev#setup

    ${t.nix "develop" "./nix4dev"} ./nix4dev -c test-success
  ''
)
