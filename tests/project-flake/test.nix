t:
t.makeTest (
  t.withLockedRepo ''
    cp -r ${./repo}/* .
    chmod -R u+w .
    git add .

    PRJ_ROOT=$(pwd) nix run ./nix4dev#setup
    git add .
    git commit -am "Setup project level flake"

    test "$(nix run .#foo)" == "Hello, world!"
    test "$(nix run .#bar)" == "Hello, world!"

    grep 'description = "This is test of project flake";' flake.nix
  ''
)
