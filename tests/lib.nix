{
  pkgs,
  repoPath,
  testName,
  inputs,
  lib,
}: let

  nix = command: localFlakeUrl: overrideFile: let
    overridesConfig = import overrideFile;

    localInputs =
      (
        lib.attrsets.mapAttrs' (
          name: value: {
            name = lib.strings.removePrefix "root-flake-input-" name;
            inherit value;
          }
        ) (lib.attrsets.filterAttrs (name: _: lib.strings.hasPrefix "root-flake-input-" name) inputs)
      )
      // {
        foo = inputs.root-flake-input-nixpkgs;
        foo-nixpkgs = inputs.root-flake-input-nixpkgs;
      };

    localInputsPath = pkgs.writeText "local-inputs" ''
      {
        ${
        lib.strings.concatStringsSep "\n" (
          lib.attrsets.mapAttrsToList (
            name: value: "${name} = \"${value}\";"
          )
          localInputs
        )
      }
      }
    '';
  in ''
    bash -c '
      set -euo pipefail

      RED='"'"'\033[0;31m'"'"'
      NC='"'"'\033[0m'"'"'

      flakeNix="$(realpath "${localFlakeUrl}/flake.nix")"
      # actualFlakeInputsHash="$(nix hash file --type sha256 --sri \
      #   <(nix eval --expr "builtins.toJSON (import \"$flakeNix\").inputs" --impure --raw | jq .) \
      # )"

      # if [ "$actualFlakeInputsHash" != "${overridesConfig.inputsHash}" ]; then
      #   nix eval --expr "builtins.toJSON (import \"$flakeNix\").inputs" --impure --raw | jq . >&2

      #   echo -e "''${RED}Overrides file ${overrideFile} for flake $flakeNix is not up to date!" >&2
      #   echo -e "See the actual inputs printed above, update the overrides and update the hash to "$actualFlakeInputsHash" ''${NC}" >&2

      #   false
      # fi

      # echo nix eval --raw --file ${./override-flake-inputs.nix} \
      #     --arg flakePath "$flakeNix" \
      #     --arg nixpkgs ${inputs.nixpkgs} options \
      #     --arg localInputsPath "${localInputsPath}" \

      overrideOptions="$( \
        nix eval --raw --file ${./override-flake-inputs.nix} \
          --arg flakePath "$flakeNix" \
          --arg nixpkgs ${inputs.nixpkgs} options \
          --arg localInputsPath "${localInputsPath}" \
          --arg nix4devRepoPath "${repoPath}" \
      )"

      if nix flake metadata ${localFlakeUrl} \
        --json \
        $overrideOptions \
        --no-write-lock-file | \
        jq -e '"'"'
          .locks.nodes |
            del(.root) |
            map(select(.locked.type != "path")) |
            if . == [] then null else . end
        '"'"' >&2
      then
        nix flake metadata ${localFlakeUrl} \
          $overrideOptions \
          --no-write-lock-file >&2

        echo -e "''${RED}Lock file in tests contains non-local input (type != "path") in flake $flakeNix" >&2
        echo -e "See the output above and update the overrides file ${overrideFile}''${NC}" >&2

        false
      fi

      nix ${command} \
        $overrideOptions \
        "$@"
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
    ${nix "run" repoPath ./overrides-init.nix} --no-write-lock-file ${repoPath}#init

    git init .
    git add .
    git commit -m "Init"

    ${nix "flake update" "./nix4dev" ./overrides-nix4dev.nix} --print-build-logs --flake ./nix4dev/
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
