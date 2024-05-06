t:
t.makeTest (
  t.withLockedRepo ''
    mkdir -p nix4dev/flake-modules
    echo "{ perSystem.nix4dev.projectFlake.enable = true; }" > nix4dev/flake-modules/default.nix
    git add .
    nix develop ./nix4dev -c setup
    git add .
    git commit -m "chore: Setup project"

    if nix flake check  3>&1 1>&2 2>&3 | tee err.out ; then
      echo "flake check not failed when it supposed to" >&2
      exit 1
    fi

    grep 'Default flake module not found. To create an empty default module execute:' err.out
    grep 'echo "{}" > ./flake-modules/default.nix' err.out
  ''
)
