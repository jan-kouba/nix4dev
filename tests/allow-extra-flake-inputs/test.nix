t:
t.makeTest (
  t.withLockedRepo ''
    mkdir -p nix4dev/flake-modules
    cat > nix4dev/flake-modules/default.nix <<EOF
      { inputs, ... }: {
        perSystem = { system, ...}: {
          nix4dev.flake = {
            inputs = {
              foo.url = "github:NixOS/nixpkgs/nixos-25.11";
            };
          };

          packages.bar = inputs.foo.legacyPackages.\''${system}.hello;
        };
      }
    EOF
    git add nix4dev/flake-modules/default.nix
    PRJ_ROOT=$(pwd) ${t.nix "./nix4dev"} run ./nix4dev#setup

    # Check that all the generated files are correctly formatted
    ${t.nix "./nix4dev"} run ./nix4dev#prepare

    test "$(${t.nix "./nix4dev"} run ./nix4dev#bar)" == "Hello, world!"
  ''
)
