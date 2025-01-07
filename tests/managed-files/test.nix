t:
t.makeTest (
  t.withLockedRepo ''
    mkdir -p nix4dev/flake-modules

    cat > nix4dev/flake-modules/default.nix <<EOF
      {
        perSystem = {
          nix4dev.managedFiles.files."test.nix".source.text = '''
            {
            foo = [  "bar"    ];
            }
          ''';
        };
      }
    EOF

    git add .

    nix develop ./nix4dev -c setup

    cat > test.nix.expected <<EOF
    {
      foo = ["bar"];
    }
    EOF

    diff test.nix.expected test.nix
  ''
)
