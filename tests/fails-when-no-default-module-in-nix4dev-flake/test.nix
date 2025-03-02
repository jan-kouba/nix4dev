t:
t.makeTest (
  t.withLockedRepo ''
    rm nix4dev/flake-modules/default.nix

    if ${t.nix "flake check" "./nix4dev" ../overrides-nix4dev.nix} ./nix4dev 3>&1 1>&2 2>&3 | tee err.out ; then
      echo "flake check not failed when it supposed to" >&2
      exit 1
    fi

    grep 'Default flake module not found. To create an empty default module execute:' err.out
    grep 'echo "{}" > ./flake-modules/default.nix' err.out
  ''
)
