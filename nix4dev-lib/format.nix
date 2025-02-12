{runCommand, ...}: let
  writeFormattedFile = {
    treefmtConfig,
    fileToFormat,
    outputFileName,
  }:
    runCommand outputFileName {} ''
      cat '${fileToFormat}' | ${treefmtConfig.package}/bin/treefmt \
        --tree-root "$(pwd)" \
        --config-file ${treefmtConfig.build.configFile} \
        --no-cache \
        --stdin '${outputFileName}' > "$out"
    '';
in {
  inherit writeFormattedFile;
}
