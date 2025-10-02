{
  inputs,
  self,
  ...
}:
{
  imports = [
    ./deletes-file-when-stops-being-managed
    ./does-not-delete-files-it-should-not
    ./does-not-delete-unmanaged-files
    ./parent-directories-of-managed-files-are-writable
    ./write-directory
    ./write-directory-produced-by-derivation
    ./write-file
    ./write-formatted-directory
    ./write-formatted-file

    ./write-file-no-treefmt
  ];

  config.perSystem =
    let
      treefmtModule =
        { lib, ... }:
        {
          imports = [ inputs.treefmt-nix.flakeModule ];
          perSystem =
            { config, ... }:
            {
              options = {
                test.enableTreefmt = lib.options.mkEnableOption "treefmt";
              };

              config = {
                test.enableTreefmt = lib.mkDefault true;

                # Enable formatting of .nixf files
                treefmt.programs.alejandra.enable = config.test.enableTreefmt;
                nix4dev.managedFiles.treefmt.enable = config.test.enableTreefmt;
              };
            };
        };

      managedFilesTestModule = {
        perSystem =
          { config, ... }:
          {
            test.commandsToExecute = [ ''${config.nix4dev.managedFiles.updateFiles} "$out"'' ];
          };
      };
    in
    {
      nix4dev.flakePartsTests.suites."managed-files" = {
        defaultInputs = {
          nixpkgs = inputs.nixpkgs;
        };

        extraFlakeModules = [
          self.flakeModules.managedFiles
          managedFilesTestModule
          treefmtModule
        ];
      };

      nix4dev.flakePartsTests.suites."managed-files-no-treefmt" = {
        defaultInputs = {
          nixpkgs = inputs.nixpkgs;
        };

        extraFlakeModules = [
          self.flakeModules.managedFiles
          managedFilesTestModule
        ];
      };
    };
}
