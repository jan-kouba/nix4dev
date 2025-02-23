t:
t.makeTest (
  t.withLockedRepo ''
    echo "Creating seed repo ..."

    cp -r ${./repo}/* .
    chmod -R u+w .

    mkdir -p ./nix4dev/flake-modules
    cat > ./nix4dev/flake-modules/default.nix <<EOF
      {inputs, ...}: {
        perSystem.nix4dev.projectFlake = {
          enable = true;
          extraInputs.nix4dev.url = "${t.repoPath}";
        };
      }
    EOF

    git add .
    PRJ_ROOT=$(pwd) ${t.nix "run" "./nix4dev"} ./nix4dev#setup

    git add .
    git commit -m "Added repo files"



    echo "Creating repo using the seed repo"

    cd ..
    mkdir repo_seeded
    cd repo_seeded

    ${t.nix "run" "../repo"} ../repo#init
    mv nix4dev/flake-modules/default.nix nix4dev/flake-modules/seed.nix
    cp -r ${./repo_seeded}/* .

    ${t.nix "flake update" "./nix4dev"} --override-input nix4dev "${t.repoPath}" --flake ./nix4dev

    # Test that the module from seed is loaded
    ${t.nix "develop" "./nix4dev"} ./nix4dev -c test-success

    # Test that setup does not break things
    PRJ_ROOT=$(pwd) ${t.nix "run" "./nix4dev"} ./nix4dev#setup
    ${t.nix "flake update" "./nix4dev"} --override-input nix4dev "${t.repoPath}" --flake ./nix4dev

    ${t.nix "develop" "./nix4dev"} ./nix4dev -c test-success
  ''
)
