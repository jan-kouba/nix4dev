{
  nix4devFlake,
  pkgs,
  system,
  repoPath,
  testName,
}: let
  withLockedRepo = testScript: ''
    set -x
    export NIX_CONFIG="
      experimental-features = nix-command flakes
    "

    echo testIt: ${testIt}
    find ${testIt}

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

  testIt = let 
    flakeToTestFile = pkgs.writeTextFile {
      name = "flake.nix";
      text = ''
      {
        outputs = { pkgs, ...}: let 
          system = "x86_64-linux";
        in {
          packages.''${system}.foo = pkgs.hello;
        };
      }
      '';
    };

    flakeToTest = (import flakeToTestFile).outputs { pkgs = pkgs; };

    out = pkgs.runCommand "test-it" {} ''
      mkdir -p $out/repo
      cd $out/repo

      ${pkgs.git}/bin/git init .
      ${pkgs.git}/bin/git config user.email "you@example.com"
      ${pkgs.git}/bin/git config user.name "Your Name"
      
      touch .gitignore
      ${pkgs.git}/bin/git add .gitignore
      ${pkgs.git}/bin/git commit -am "Initial commit"

      ${nix4devFlake.packages.${system}.init}/bin/setup
    '';
  in out;

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
