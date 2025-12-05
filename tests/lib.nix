{
  pkgs,
  repoPath,
  testName,
  inputs,
  lib,
}:
let
  nix =
    localFlakeUrl:
    let
      localInputs =
        (lib.attrsets.mapAttrs' (name: value: {
          name = lib.strings.removePrefix "test-input-" name;
          inherit value;
        }) (lib.attrsets.filterAttrs (name: _: lib.strings.hasPrefix "test-input-" name) inputs))
        // {
          foo = inputs.test-input-nixpkgs;
          foo-nixpkgs = inputs.test-input-nixpkgs;
        };

      localInputsPath = pkgs.writeText "local-inputs" ''
        {
          ${lib.strings.concatStringsSep "\n" (
            lib.attrsets.mapAttrsToList (
              name: value: "${lib.strings.escapeNixIdentifier name} = ${lib.strings.escapeNixString value};"
            ) localInputs
          )}
        }
      '';

      makeAndCheckOverrides = pkgs.writeText "make-and-check-overrides" ''
        set -euo pipefail

        RED='\033[0;31m'
        NC='\033[0m'

        flakeNix="$(${pkgs.coreutils}/bin/realpath "${localFlakeUrl}/flake.nix")"

        overrideOptions="$( \
          nix eval --raw --file ${./override-flake-inputs.nix} \
            --arg flakePath "$flakeNix" \
            --arg nixpkgs ${inputs.nixpkgs} \
            --arg localInputsPath "${localInputsPath}" \
            --arg nix4devRepoPath "${repoPath}" \
            options
        )"

        if nix flake metadata ${localFlakeUrl} \
          --json \
          $overrideOptions \
          --no-write-lock-file | \
          jq -e '
            .locks.nodes |
              del(.root) |
              map(select(.locked.type != "path")) |
              if . == [] then null else . end
          ' >&2
        then
          nix flake metadata ${localFlakeUrl} \
            $overrideOptions \
            --no-write-lock-file >&2

          echo -e "''${RED}Lock file in tests contains non-local input (type != "path") in flake $flakeNix" >&2
          echo -e "This should not happen!''${NC}" >&2

          false
        fi
      '';
    in
    ''
      bash -c '
        . ${makeAndCheckOverrides}

        nix flake update \
          $overrideOptions \
          --flake ${localFlakeUrl}

        nix "$@"
      ' bash \
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
    ${pkgs.nix}/bin/nix flake init -t ${repoPath}

    # Replace nix4dev flake references by path to this repo
    find . -name '*.nix' -exec sed -i 's%"github:jan-kouba/nix4dev"%"${repoPath}"%g' {} \;

    git init .
    git add .
    git commit -m "Init"

    # Init flake.lock file.
    # The "hacked" nix command always updates the lock file in the directory specified
    ${nix "./nix4dev"} flake metadata ./nix4dev > /dev/null
    git add nix4dev/flake.lock
    git commit -m "Add nix4dev/flake.lock"

    # Running testing logic
    ${testScript}

    # Removing test directory
    popd
    rm -rf "$tmp_dir"
  '';

  makeTest =
    text:
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
