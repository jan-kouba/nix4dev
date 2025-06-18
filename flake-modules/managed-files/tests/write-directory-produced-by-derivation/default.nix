{
  steps = [
    {
      perSystem = { pkgs, ...}: {
        test.enableTreefmt = false;

        nix4dev.managedFiles.files."dir".source.file = pkgs.runCommand "make-dir" {} ''
          cp -r "${./test-dir}" $out
        '';
      };
    }
  ];
}
