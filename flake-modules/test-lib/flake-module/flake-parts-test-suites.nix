{ flake-parts-lib, lib, ... }:
{
  options.perSystem = flake-parts-lib.mkPerSystemOption (
    { config, pkgs, ... }:
    let
      perSystemCfg = config;
      cfg = config.nix4dev.flakePartsTests;

      testType =
        suiteConfig:
        lib.types.submodule (
          { name, config, ... }:
          {
            options = {
              name = lib.mkOption {
                type = lib.types.str;
                default = name;
                defaultText = "The attribute name.";
                description = "The name of this test.";
                example = "My Test";
              };

              description = lib.mkOption {
                type = lib.types.nullOr lib.types.str;
                default = null;
                description = "The description of this test.";
                example = "Test of feature X";
              };

              excludeFiles = lib.mkOption {
                type = lib.types.listOf lib.types.str;
                default = suiteConfig.defaultExcludeFiles;
                defaultText = ''
                  The `defaultExcludeFiles` form test suite config.
                '';
                description = ''
                  The paths to files or directories to exclude from test.
                  The path must be relative to test directory.
                  The files on the list will be deleted (if they exist) before the actual test output is compared with the expected output.
                '';
                example = [
                  "flake.nix"
                  ".gitignore"
                ];
              };

              init = lib.mkOption {
                type = lib.types.nullOr (lib.types.pathWith { });
                default = null;
                description = ''
                  The directory to start this test with.
                  If specified, the contents of the directory will be copied into the test directory at the start of the test.
                '';
                example = lib.options.literalExpression "./init";
              };

              inputs = lib.mkOption {
                type = lib.types.attrsOf lib.types.anything;
                default = suiteConfig.defaultInputs;
                defaultText = ''
                  The `defaultInputs` form test suite config.
                '';
                description = ''
                  The inputs that should be provided to the test flake.
                '';
                example = {
                  nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
                };
              };

              expected = lib.mkOption {
                type = lib.types.pathWith { };
                description = ''
                  The path to the directory containing the expected output of this test.
                '';
                example = lib.options.literalExpression "./expected";
              };

              steps = lib.mkOption {
                type = lib.types.listOf lib.types.deferredModule;
                description = ''
                  The steps to sequentionally apply to produce the output directory of this test.
                  Every step is defined as a flake-parts module configuring a flake.
                  The `config.perSystem.test.commandsToExecute` option must be defined for every step.
                  All commands defined in `config.perSystem.test.commandsToExecute` will be executed.
                '';
                example = lib.options.literalExpression ''
                  [
                    {
                      import = [ nix4devModule ];

                      perSystem = { config, system, ...}: {
                        nix4dev.managedFiles.files."foo".source.text = "bar";
                        test.commandsToExecute = [
                          "''${flake.packages.''${system}.updateManagedFiles} $out"
                        ];
                      };
                    }
                  ];
                '';
              };

              testEvaluation = lib.mkOption {
                type = lib.types.package;
                description = ''
                  The resulting test directory.
                '';
                readOnly = true;
              };
            };

            config =
              let
                stepsWithExtraModules = lib.map (step: {
                  imports = suiteConfig.extraFlakeModules ++ [ step ];
                }) config.steps;
              in
              {
                testEvaluation = perSystemCfg.nix4devTestLib.testFlakePartsWithDir {
                  testName = "[flake-parts-test] suite: ${suiteConfig.name}; test: ${config.name}";
                  testDescription = config.description;
                  inputs = config.inputs;
                  initDir = config.init;
                  steps = stepsWithExtraModules;
                  expectedDir = config.expected;
                  excludeFiles = config.excludeFiles;
                };
              };
          }
        );

      suiteType = lib.types.submodule (
        { name, config, ... }:
        {
          options = {
            name = lib.mkOption {
              type = lib.types.str;
              description = "The suite name.";
              default = name;
              defaultText = "The attribute name.";
            };

            defaultExcludeFiles = lib.mkOption {
              type = lib.types.listOf lib.types.str;
              default = [ ];
              description = ''
                The default paths to files or directories to exclude from all testin this test suite.
                The path must be relative to test directory.
                The files on the list will be deleted (if they exist) before the actual test output is compared with the expected output.
                This value will be used as default for the `excludeFiles` option in each test.
              '';
              example = [
                "flake.nix"
                ".gitignore"
              ];
            };

            defaultInputs = lib.mkOption {
              type = lib.types.attrsOf lib.types.anything;
              default = { };
              description = ''
                The default inputs that should be provided to all the tests in this test suite.
                This value will be used as default for the `inputs` option in each test.
              '';
              example = {
                nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
              };
            };

            extraFlakeModules = lib.mkOption {
              type = lib.types.listOf lib.types.deferredModule;
              default = [ ];
              description = ''
                The extra flake modules to import in every step of every test when constructing the flake.
                It can be used to do some common setup (e.g. of the commands to run in every step).
              '';
              example = lib.options.literalExpression ''
                [
                  nix4dev.flakeModules.managedFiles
                  {
                    perSystem = { config, ... }:
                    {
                      test.commandsToExecute = [ "''${config.nix4dev.managedFiles.updateFiles} $out" ];
                    };
                  }
                ];
              '';
            };

            tests = lib.mkOption {
              type = lib.types.attrsWith {
                elemType = testType config;
                placeholder = "test-name";
              };
              default = { };
              description = ''
                Defines flake-parts tests on a directory.
                Starts with optional initial directory, then applies modification steps and in the end checks that the end result
                is equal to the expected directory.
                Each modification step is defined as a flake-parts module configuring a flake and a list of commands to modify or test the test directory.
                The commands must assume the project is at path specified in the `$out` environment variable.
                The check fails if the produced directory differs from the expected directory, or if any of the configured steps commands fails.
              '';
              example = lib.options.literalExpression ''
                {
                  "managed-files-work" = {
                  init = ./init;
                  steps = [
                    {
                      import = [ nix4devModule ];

                      perSystem = { config, system, ...}: {
                        nix4dev.managedFiles.files."foo".source.text = "bar";
                        test.commandsToExecute = [
                          "''${flake.packages.''${system}.updateManagedFiles} $out"
                        ];
                      };
                    }
                  ];
                  expected = ./expected;
                }
              '';
            };

            suiteEvaluation = lib.mkOption {
              type = lib.types.package;
              description = ''
                The result of evaluation of the test suite.
              '';
              readOnly = true;
            };
          };

          config = {
            suiteEvaluation = pkgs.writeText "flake-parts-tests-suite-${config.name}" ''
              Test outputs:

              ${lib.strings.concatMapAttrsStringSep "\n" (_: t: "${t.name}: ${t.testEvaluation}") config.tests}
            '';
          };
        }
      );
    in
    {
      options.nix4dev.flakePartsTests = {
        suites = lib.mkOption {
          type = lib.types.attrsWith {
            elemType = suiteType;
            placeholder = "suite-name";
          };
          default = { };
          description = ''
            Defines a suite of flake parts tests.
          '';
          example = lib.options.literalExpression ''
            {
              managed-files = {
                defaultExcludeFiles = [
                  "flake.nix"
                  ".gitignore"
                ];

                tests = {
                  "work" = {
                    init = ./init;
                    steps = [
                      {
                        import = [ nix4devModule ];

                        perSystem = { config, system, ...}: {
                          nix4dev.managedFiles.files."foo".source.text = "bar";
                          test.commandsToExecute = [
                            "''${flake.packages.''${system}.updateManagedFiles} $out"
                          ];
                        };
                      }
                    ];
                    expected = ./expected;
                  };

                  "overwrite-existing-files" = { ... };
                  ...
                };
              };
            }
          '';
        };
      };

      config.checks = lib.attrsets.concatMapAttrs (_: suite: {
        "flake-parts-test-suite-${suite.name}" = suite.suiteEvaluation;
      }) cfg.suites;
    }
  );
}
