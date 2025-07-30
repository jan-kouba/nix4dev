{
  excludeFiles = [
    "./test-exclude-file"
    "na"
    "sub1/sub2/foo"
    "nasub1/nasub2/na"
    "sub2"
  ];

  steps = [
    {
      perSystem.test.commandsToExecute = [
        ''echo foo > $out/global-exclude-file''
        ''echo foo > $out/test-exclude-file''
        ''echo foo > $out/foo''
        ''mkdir -p $out/sub1/sub2''
        ''echo foo > $out/sub1/sub2/foo''
        ''mkdir -p $out/sub2''
        ''echo foo > $out/sub2/foo''
      ];
    }
  ];
}
