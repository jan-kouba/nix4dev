t:
t.makeTest (
  t.withLockedRepo ''
    cp -r ${./repo}/* .
    chmod -R u+w .
    git add .

    nix run ./nix4dev#prepare

    for f in expected/*; do
      ${t.pkgs.difftastic}/bin/difft input/"$(basename "$f")" "$f" || exit 1

      # Difftastic does not fail on just space changes, so run plain diff to do the actual check
      diff input/"$(basename "$f")" "$f" || exit 1
    done
  ''
)
