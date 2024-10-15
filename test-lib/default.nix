{
  pkgs,
  repoPath,
  testName,
  inputs,
}: let
  repoInputs = inputs.nix4dev.inputs;

  l = pkgs.lib;

  withLockedRepo = testScript: let
    nix4devFlake = loadFlake (import "${repoPath}/flake.nix") repoInputs;
  in ''
    set -x
    export NIX_CONFIG="
      experimental-features = nix-command flakes
    "

    # Creating test directory
    tmp_dir=$(mktemp -d -t nix4dev-test-XXXXXXXXXX)
    mkdir "$tmp_dir"/repo
    pushd "$tmp_dir"/repo

    # Initializing repo
    ${nix4devFlake.packages.${pkgs.system}.init}/bin/setup
    # nix run ${repoPath}#init

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

  loadFlake = flake: inputs: let
    requiredInputNames = l.attrNames flake.inputs;
    filteredInputs = l.getAttrs requiredInputNames inputs;
    self = {inputs = filteredInputs;} // (flake.outputs (filteredInputs // {inherit self;}));
  in
    self;

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
