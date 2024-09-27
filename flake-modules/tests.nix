inputs@ { lib, self, ...}: let
  tests = [
    ../../test-lib/tests.nix
  ];


  l = lib // builtins;
in {
  perSystem = { pkgs, ...}: let

  makeCheck = pathh: let 
    relativeTestPath = l.trace ( "${pathh} ${self.outPath}") (l.path.removePrefix self.outPath pathh);
    testValue = import pathh inputs;
    # checkValue = pkgs.writeText "test-result" (l.toJSON testValue);
    checkValue = pkgs.writeText "test-result" "foos";    
  in {
    # x = checkValue;
    "${l.trace relativeTestPath relativeTestPath}" = checkValue;
    # bar = pkgs.writeText "test-result" (builtins.toJSON { foo = "bar"; });
  };

  in {
    # checks = 
    #   l.attrsets.zipAttrs 
    #     (l.map makeCheck tests);

    checks = makeCheck ../test-lib/tests.nix;
  };
}