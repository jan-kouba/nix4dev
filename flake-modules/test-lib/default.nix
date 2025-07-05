{
  imports = [
    ./flake-module
    ./tests
  ];

  flake.flakeModules.testLib = ./flake-module;
}
