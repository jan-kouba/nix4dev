{
  steps = [
    {
      perSystem =
        { pkgs, ... }:
        {
          test.enableTreefmt = false;

          managedFiles.files."dir".source.file =
            let
              srcDir = pkgs.runCommand "make-dir" { } ''
                cp -r "${./test-dir}" $out
              '';
            in
            "${srcDir}";
        };
    }
  ];
}
