{lib, ...}: {
  perSystem = {
    config,
    pkgs,
    ...
  }: let
    l = lib // builtins;
    t = l.types;
    cfg = config.nix4dev;

    compoundCommandOption = commandName:
      l.mkOption {
        type = t.listOf t.pathInStore;
        description = "The commands to execute when '${commandName}' is called";
        default = [];
        example = l.options.literalExpression ''[ ''${pkgs.sbt}/bin/sbt prepare ]'';
      };

    compoundCommand = {
      commandName,
      help,
      subCommands,
    }: let
      package = pkgs.writeShellApplication {
        name = commandName;

        text = builtins.concatStringsSep "\n" subCommands;
      };
    in {
      inherit help package;
      name = commandName;
    };
  in {
    options.nix4dev = {
      prepareCommands = compoundCommandOption "prepare";
      setupCommands = compoundCommandOption "setup";
      checkCommands = compoundCommandOption "check";
      updateCommands = compoundCommandOption "update";
    };

    config = let
      prepareCommand = compoundCommand {
        commandName = "prepare";
        help = "Prepares sources for release";
        subCommands = cfg.prepareCommands;
      };

      setupCommand = compoundCommand {
        commandName = "setup";
        help = "Sets this project up";
        subCommands = cfg.setupCommands;
      };

      checkCommand = compoundCommand {
        commandName = "check";
        help = "Runs checks";
        subCommands = cfg.checkCommands;
      };

      updateCommand = compoundCommand {
        commandName = "update";
        help = "Updates dependencies";
        subCommands = cfg.updateCommands;
      };
    in {
      devshells.default = {
        commands = [
          prepareCommand
          setupCommand
          checkCommand
          updateCommand
        ];
      };

      nix4dev.checkCommands = let
        nixFlakeCheck = pkgs.writeShellApplication {
          name = "nix-flake-check";
          runtimeInputs = [pkgs.nix];
          text = ''
            ( cd "$PRJ_ROOT"/nix4dev && nix flake check . )
          '';
        };
      in ["${nixFlakeCheck}/bin/nix-flake-check"];

      packages = {
        prepare = prepareCommand.package;
        setup = setupCommand.package;
        check = checkCommand.package;
        update = updateCommand.package;
      };
    };
  };
}
