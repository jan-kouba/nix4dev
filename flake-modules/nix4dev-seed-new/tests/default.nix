{
  perSystem = { pkgs, ...}: {
    checks.nix4devSeedTests = pkgs.writeText "nix4dev-seed-tests" ''
      Test outputs:
      # ''${lib.strings.concatLines tests}
    '';
  };
}
