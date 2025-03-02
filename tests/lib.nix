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
    ${nix4devInputOverrides "my-seed/"} \
    ${nix4devInputOverrides "my-seed/nix4dev/"} \
    --override-input foo ${inputs.root-flake-input-nixpkgs} \
    --override-input my-seed/flake-parts/nixpkgs-lib ${inputs.root-flake-input-nixpkgs} \
    --override-input foo-nixpkgs ${inputs.root-flake-input-nixpkgs} \
  '';

  nix = command: localFlakeUrl: overrideFile: let
    overridesConfig = import overrideFile;
    overrides = lib.strings.concatStringsSep " \\\n" (
      lib.attrsets.mapAttrsToList (
        src: dest:
          "--override-input ${src} ${if dest == "nix4dev" then repoPath else inputs."root-flake-input-${dest}"}"
      ) (if lib.hasAttr "overrides" overridesConfig then overridesConfig.overrides else {})
    );
  in ''
    bash -c '
      set -euo pipefail

      RED='"'"'\033[0;31m'"'"'
      NC='"'"'\033[0m'"'"'

      flakeNix="$(realpath "${localFlakeUrl}/flake.nix")"
      actualFlakeInputsHash="$(nix hash file --type sha256 --sri \
        <(nix eval --expr "builtins.toJSON (import \"$flakeNix\").inputs" --impure --raw | jq .) \
      )"

      if [ "$actualFlakeInputsHash" != "${overridesConfig.inputsHash}" ]; then
        nix eval --expr "builtins.toJSON (import \"$flakeNix\").inputs" --impure --raw | jq . >&2

        echo -e "''${RED}Overrides file ${overrideFile} for flake $flakeNix is not up to date!" >&2
        echo -e "See the actual inputs printed above, update the overrides and update the hash to "$actualFlakeInputsHash" ''${NC}" >&2

        false
      fi

      if nix flake metadata ${localFlakeUrl} \
        --json \
        ${overrides} \
        --no-write-lock-file | \
        jq -e '"'"'
          .locks.nodes |
            del(.root) |
            map(select(.locked.type != "path")) |
            if . == [] then null else . end
        '"'"' >&2
      then
        nix flake metadata ${localFlakeUrl} \
          ${overrides} \
          --no-write-lock-file >&2

        echo -e "''${RED}Lock file in tests contains non-local input (type != "path") in flake $flakeNix" >&2
        echo -e "See the output above and update the overrides file ${overrideFile}''${NC}" >&2

        false
      fi

      nix ${command} \
        ${overrides} \
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
