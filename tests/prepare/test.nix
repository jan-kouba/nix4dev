t:
t.makeTest (
  t.withLockedRepo ''
    mkdir -p nix4dev/flake-modules
    echo "{}" > nix4dev/flake-modules/default.nix
    git add .

    cat > test.nix <<EOF
    {
    foo = [  "bar"    ];
    }
    EOF

    cat test.nix

    nix develop nix4dev/ -c prepare

    cat > test.nix.expected <<EOF
    {
      foo = ["bar"];
    }
    EOF

    diff test.nix.expected test.nix
  ''
)
