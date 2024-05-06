{inputs, ...}: {
  systems = ["x86_64-linux"];

  perSystem = {
    pkgs,
    system,
    ...
  }: {
    packages = {
      foo = pkgs.hello;
      bar = inputs.foo-nixpkgs.legacyPackages.${system}.hello;
    };
  };
}
