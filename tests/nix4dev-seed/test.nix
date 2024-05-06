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
    nix develop ./nix4dev -c setup

    git add .
    git cm -m "Added repo files"



    echo "Creating repo using the seed repo"

    cd ..
    mkdir repo_seeded
    cd repo_seeded

    nix run ../repo#setup
    mv nix4dev/flake-modules/default.nix nix4dev/flake-modules/seed.nix
    cp -r ${./repo_seeded}/* .

    # Test that the module from seed is loaded
    nix develop ./nix4dev -c test-success

    # Test that setup does not break things
    nix develop ./nix4dev -c setup
    nix develop ./nix4dev -c test-success
  ''
)
