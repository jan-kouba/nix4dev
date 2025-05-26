{
  testDescription = "managed files can write file";

  excludeFiles = [ "./test-exclude-file" ];

  steps = [
    {
      perSystem.test.commandsToExecute = [
        ''echo foo > $out/global-exclude-file''
        ''echo foo > $out/test-exclude-file''
        ''echo foo > $out/foo''
      ];
    }
  ];
}
