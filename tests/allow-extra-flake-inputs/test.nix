t:
t.makeTest (
  t.withLockedRepo ''
    mkdir -p nix4dev/flake-modules
    cat > nix4dev/flake-modules/default.nix <<EOF
      { inputs, ... }: {
        perSystem = { system, ...}: {
          nix4dev.flake.extraInputs = {
            foo.url = "github:NixOS/nixpkgs/nixos-24.11";
          };

          packages.bar = inputs.foo.legacyPackages.\''${system}.hello;
        };
      }
    EOF
    git add nix4dev/flake-modules/default.nix
    PRJ_ROOT=$(pwd) ${t.nix "run" "./nix4dev"} ./nix4dev#setup

    # Check that all the generated files are correctly formatted
    ${t.nix "run" "./nix4dev"} ./nix4dev#prepare

    test "$(${t.nix "run" "./nix4dev"} ./nix4dev#bar)" == "Hello, world!"
  ''
)
