# Helper functions for writing tests {#sec-functions-library-test-lib}

nix4dev test library.

## `pref.test-lib.testFlakePartsWithDir` {#function-library-pref.test-lib.testFlakePartsWithDir}

Runs flake-parts test on a directory.
Starts with optional initial directory, then applies modification steps and in the end checks that the end result
is equal to the expected directory.
Each modification step is defined as a flake-parts module configuring a flake and a list of commands to modify or test the test directory.
The commands must assume the project is at path specified in the `$out` environment variable.
The check fails if the produced directory differs from the expected directory, or if any of the configured steps commands fails.

### Arguments

`testName` (String)
: The name of this test.

`testDescription` (NullOr String)
: Optional description of this test,

`inputs` (Any)
: The inputs that should be provided to the test flake.

`initDir` (NullOr Path)
: Optional directory to start this test with.
If specified, the contents of the directory will be copied into the test directory at the start of the test.

`steps` (ListOf FlakePartsModule)
: The steps to sequentionally apply to produce the output directory of this test.
Every step is defined as a flake-parts module configuring a flake.
The `config.perSystem.test.commandsToExecute` option must be defined for every step.

`expectedDir`
: The expected output of this test.

`excludeFiles`
: The files or directories to exclude from test.
The files on the list will be deleted (if they exist) before the actual test output is compared with the expected output.
Defaults to `[]`.

### Examples

:::{.example}

#### `testFlakePartsWithDir` usage example

```nix
testFlakePartsWithDir {
  testDescription = "managed-files-work";
  initDir = ./init;
  steps = [
    {
      import = [
        nix4devModule
      ];

      perSystem = {config, ...}: {
        nix4dev.managedFiles.files."foo".source.text = "bar";
        test.commandsToExecute = [
          ''${flake.packages.${system}.updateManagedFiles} "$out"''
        ];
      };
    }
  ];
  expectedDir = ./expected;
}
```

:::

## `pref.test-lib.testSuiteFlakePartsWithDir` {#function-library-pref.test-lib.testSuiteFlakePartsWithDir}

Runs test suite of flake parts tests.

### Arguments

`testsDir` (Path)
: The directory with tests.
Each subdirectory of this directory is considered a test.
The test directory must contain `default.nix` file with attrset defining the test.

Attributes of `default.nix` file:

`steps` (ListOf FlakePartsModule)
: As required by the `testFlakePartsWithDir` function.
The steps to sequentionally apply to produce the output directory of this test.
Every step is defined as a flake-parts module configuring a flake.
The `config.perSystem.test.commandsToExecute` option must be defined for every step.

`testName` (NullOr String)
: Optional test name. If not specified, the name of the test directory is used.

`testDescription` (NullOr String)
: Optional test description. If not specified, the name of the test is used.

`excludeFiles`
: The files or directories to exclude from tests.
The files on the list will be deleted (if exist) before the actual test output is compared with the expected output.
This will be merged with the excludeFiles passed as the parameter to the `testSuiteFlakePartsWithDir` function.
Defaults to `[]`.

`inputs` (Any)
: The inputs that should be provided to the test flakes.

`extraFlakeModules` (ListOf FlakePartsModule)
: The extra flake modules to import in every step of every test when constructing the flake.
It can be used to do some common setup (e.g. of the commands to run in every step).

`excludeFiles`
: The files or directories to exclude from tests.
The files on the list will be deleted (if exist) before the actual test output is compared with the expected output.
Defaults to `[]`.

### Examples

:::{.example}

#### `testSuiteFlakePartsWithDir` usage example

```nix
testSuiteFlakePartsWithDir {
  testsDir = ./.;

  extraFlakeModules = [
    nix4dev.flakeModules.managedFiles
    {
      perSystem = {config, ...}: {
        test.commandsToExecute = [''${config.nix4dev.managedFiles.updateFiles} "$out"''];
      };
    }
  ];
}
```

:::
