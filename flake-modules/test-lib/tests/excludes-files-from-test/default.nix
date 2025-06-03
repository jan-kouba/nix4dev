{
  testDescription = "managed files can write file";

  excludeFiles = [
    "./test-exclude-file"
    "na"
    "sub1/sub2/foo"
    "nasub1/nasub2/na"
  ];

  steps = [
    {
      perSystem.test.commandsToExecute = [
        ''echo foo > $out/global-exclude-file''
        ''echo foo > $out/test-exclude-file''
        ''echo foo > $out/foo''
        ''mkdir -p $out/sub1/sub2''
        ''echo foo > $out/sub1/sub2/foo''
      ];
    }
  ];
}
