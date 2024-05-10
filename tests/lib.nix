{
  pkgs,
  repoPath,
  testName,
}: let
  withLockedRepo = testScript: ''
    set -x
    export NIX_CONFIG="
      experimental-features = nix-command flakes
    "

    # Creating test directory
    tmp_dir=$(mktemp -d -t nix4dev-test-XXXXXXXXXX)
    mkdir "$tmp_dir"/repo
    pushd "$tmp_dir"/repo

    # Initializing repo
    nix run ${repoPath}#init

    git init .
    git add .
    git commit -m "Init"

    nix flake update --override-input nix4dev ${repoPath} --print-build-logs nix4dev/
    git add nix4dev/flake.lock
    git commit -m "Add nix4dev/flake.lock"

    # Running testing logic
    ${testScript}

    # Removing test directory
    popd
    rm -rf "$tmp_dir"
  '';

  makeTest = text:
    pkgs.writeShellApplication {
      name = "test-${testName}";

      runtimeInputs = [
        pkgs.nix
        pkgs.gitMinimal
      ];

      inherit text;
    };

  lib = {
    inherit
      withLockedRepo
      makeTest
      pkgs
      repoPath
      ;
  };
in
  lib
