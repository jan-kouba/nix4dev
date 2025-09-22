{
  perSystem.nix4dev.flakePartsTests.suites."module-test".tests."works" = {
    steps = [
      {
        perSystem.test.commandsToExecute = [
          ''
            echo foo > $out/foo
          ''
        ];
      }
    ];
    expected = ./expected;
  };
}
