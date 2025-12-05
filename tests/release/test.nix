t:
t.makeTest (
  t.withLockedRepo ''
    mkdir -p nix4dev/flake-modules
    echo "{}" > nix4dev/flake-modules/default.nix
    git add .

    git tag v0.0.1 HEAD~1

    git commit --amend -m "feat: Add nix4dev/flake.lock oot4aeJ3"

    # Asserts
    test ! -e CHANGELOG.md

    # Run release
    ${t.nix "./nix4dev"} develop nix4dev/ -c release

    # Check output of release
    cat CHANGELOG.md
    grep 'Add nix4dev/flake.lock oot4aeJ3' CHANGELOG.md
    test "0.0.2" = "$(cat version.txt)"
    test "v0.0.2" = "$(git tag --points-at HEAD)"
  ''
)
