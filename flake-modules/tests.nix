{ lib, ...}: {
  perSystem = { pkgs, ...}: {
    checks.test-lib = let 
      tests = import ../tests/lib-tests {
        inherit lib;
      };
    in pkgs.writeText "test-result" (builtins.toJSON tests);
  };
}