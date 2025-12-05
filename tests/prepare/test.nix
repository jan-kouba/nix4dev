t:
t.makeTest (
  t.withLockedRepo ''
    mkdir -p nix4dev/flake-modules
    echo "{}" > nix4dev/flake-modules/default.nix

    cat > test.nix <<EOF
    {
    foo = [  "bar"    ];
    }
    EOF

    git add .

    cat test.nix

    ${t.nix "./nix4dev"} run ./nix4dev#prepare

    cat > test.nix.expected <<EOF
    {
      foo = [ "bar" ];
    }
    EOF

    diff test.nix.expected test.nix
  ''
)
