t:
t.makeTest (
  t.withLockedRepo ''
    cp -r ${./repo}/* .
    chmod -R u+w .
    git add .

    nix develop ./nix4dev -c hello-unfree
  ''
)
