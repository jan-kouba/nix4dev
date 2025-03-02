t:
t.makeTest (
  t.withLockedRepo ''
    cp -r ${./repo}/* .
    chmod -R u+w .
    git add .

    PRJ_ROOT=$(pwd) ${t.nix "run" "./nix4dev" ../overrides-nix4dev.nix} ./nix4dev#setup
    git add .
    git commit -am "Setup project level flake"

    test "$(${t.nix "run" "." ../overrides-nix4dev.nix} .#foo)" == "Hello, world!"
    test "$(${t.nix "run" "." ../overrides-nix4dev.nix} .#bar)" == "Hello, world!"

    grep 'description = "This is test of project flake";' flake.nix
  ''
)
