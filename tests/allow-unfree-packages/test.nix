t:
t.makeTest (
  t.withLockedRepo ''
    cp -r ${./repo}/* .
    chmod -R u+w .
    git add .

    ${t.nix "develop" "./nix4dev" ../overrides-nix4dev.nix} ./nix4dev -c hello-unfree
  ''
)
