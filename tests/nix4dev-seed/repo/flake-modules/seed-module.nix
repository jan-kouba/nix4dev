{
  perSystem =
    { pkgs, ... }:
    let
      testSuccessPackage = pkgs.writeShellApplication {
        name = "test-success";
        text = ''
          true
        '';
      };
    in
    {
      devshells.default.packages = [
        testSuccessPackage
      ];
    };
}
