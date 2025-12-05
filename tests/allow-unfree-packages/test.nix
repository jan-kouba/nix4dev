t:
t.makeTest (
  t.withLockedRepo ''
    cp -r ${./repo}/* .
    chmod -R u+w .
    git add .

    ${t.nix "./nix4dev"} develop ./nix4dev -c hello-unfree
  ''
)
