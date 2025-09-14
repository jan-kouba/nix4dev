{
  imports = [
    ./flake-module
    ./module-tests
    ./tests
  ];

  flake.flakeModules.testLib = ./flake-module;
}
