{
  inputs,
  lib,
  ...
}: let
  l = lib // builtins;
in {
  perSystem = {pkgs, ...}: {
    packages.foo = pkgs.writeText "foo" (l.readFile "${inputs.dep}/foo");
  };
}
