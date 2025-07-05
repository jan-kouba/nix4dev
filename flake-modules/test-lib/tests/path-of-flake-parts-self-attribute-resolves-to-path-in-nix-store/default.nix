{
  steps = [
    (
      { self, ... }:
      {
        perSystem.test.commandsToExecute = [
          ''cp ${self}/foo $out/bar''
        ];
      }
    )
  ];
}
