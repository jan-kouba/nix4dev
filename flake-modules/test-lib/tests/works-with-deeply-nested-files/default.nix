{
  steps = [
    {
      perSystem.test.commandsToExecute = [
        ''mkdir -p   $out/sub1-2/sub2/''
        ''mkdir -p   $out/sub1-2/sub2-2/''
        ''echo foo > $out/sub1-2/sub2/foo''
        ''echo foo > $out/sub1-2/sub2-2/foo''
      ];
    }
  ];
}
