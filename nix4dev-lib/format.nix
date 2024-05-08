{runCommand, ...}: let
  writeFormattedFile = {
    treefmtConfig,
    fileToFormat,
    outputFileName,
  }:
    runCommand outputFileName {} ''
      cat '${fileToFormat}' | ${treefmtConfig.package}/bin/treefmt --config-file ${treefmtConfig.build.configFile} --stdin '${outputFileName}' > $out
    '';
in {
  inherit writeFormattedFile;
}
