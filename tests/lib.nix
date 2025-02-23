{
  pkgs,
  repoPath,
  testName,
  inputs,
  lib
}: let
  nixInputOverrides = prefix: ''
    --override-input ${prefix}nixpkgs ${inputs.root-flake-input-nixpkgs} \
    --override-input ${prefix}devshell ${inputs.root-flake-input-devshell} \
    --override-input ${prefix}flake-parts ${inputs.root-flake-input-flake-parts} \
    --override-input ${prefix}systems ${inputs.root-flake-input-systems} \
    --override-input ${prefix}treefmt-nix ${inputs.root-flake-input-treefmt-nix} \
  '';

  freezeInputs = flakeUrl: let
    overrideFlakeInput = flakeUrl: inputFullName:
      if (builtins.substring 0 2 flakeUrl) == "./" then
        overrideLocalFlakeInputs inputFullName (./. + flakeUrl)
      else
        [ (overrideRemoteInput flakeUrl inputFullName) ];

    overrideLocalFlakeInputs = inputFullName: flakePath: let
      inputs = (import "${flakePath}/flake.nix").inputs;
    in lib.lists.flatten (
      lib.attrsets.mapAttrsToList (name: value:
        overrideFlakeInput value.url (if inputFullName != "" then "${inputFullName}/${name}" else name)
      ) inputs
    );

    overrideRemoteInput = flakeUrl: inputFullName:
      "--override-input ${inputFullName} ${inputs."root-flake-input-${inputFullName}"}";
  in
    overrideLocalFlakeInputs "" flakeUrl;

  nix4devInputOverrides = prefix: ''
    --override-input ${prefix}nix4dev ${repoPath} \
    --override-input ${prefix}devshell ${inputs.root-flake-input-devshell} \
    --override-input ${prefix}flake-parts ${inputs.root-flake-input-flake-parts} \
    --override-input ${prefix}nixpkgs ${inputs.root-flake-input-nixpkgs} \
    --override-input ${prefix}systems ${inputs.root-flake-input-systems} \
    --override-input ${prefix}treefmt-nix ${inputs.root-flake-input-treefmt-nix} \
  '';

  overrides = ''
    ${nix4devInputOverrides ""} \
    ${nix4devInputOverrides "nix4dev/"} \
  '';

  nix = command: localFlakeUrl: ''
    ! nix flake metadata ${localFlakeUrl} \
      --json \
      ${overrides} \
      --no-write-lock-file | \
      jq -e '
        .locks.nodes |
        del(.root) |
        map(select(.locked.type != "path")) |
        if . == [] then null else . end
      ' && \
    nix ${command} \
      ${overrides} \
      --offline \
    '';

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
    ${nix "run" repoPath} --no-write-lock-file ${repoPath}#init

    git init .
    git add .
    git commit -m "Init"

    ${nix "flake update" "./nix4dev"} --print-build-logs --flake ./nix4dev/
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

  testLib = {
    inherit
      withLockedRepo
      makeTest
      pkgs
      repoPath
      nix
      ;
  };
in
  testLib
