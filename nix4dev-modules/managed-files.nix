{
  perSystem = {
    config,
    lib,
    pkgs,
    ...
  }: let
    l = lib // builtins;
    t = l.types;

    cfg = config.nix4dev.managedFiles;

    sourceType = t.submodule ({config, ...}: {
      options = {
        lines = l.mkOption {
          type = t.lines;
          description = ''
            The source for the managed file.
            The target will be overwritten by a file with this string as content.
            Ignored, if the `file` or `text` option is set.
          '';
          example = l.options.literalExpression ''
            .direnv
            target
          '';
        };

        text = l.mkOption {
          type = t.str;
          description = ''
            The source for the managed file.
            The target will be overwritten by a file with this string as content.
            Ignored, if the `file` option is set.
          '';
          example = l.options.literalExpression ''Hello world!'';
        };

        file = l.mkOption {
          type = t.pathInStore;
          description = ''
            The source for the managed file.
            Path in store (file or directory) which will be recursively copied over the target.
          '';
          example = ''../examples/hello'';
        };
      };

      config = {
        file = l.mkDefault (pkgs.writeText "managed-file-source" config.text);
        text = l.mkDefault config.lines;
      };
    });

    managedFilesType = t.submodule ({
      config,
      name,
      ...
    }: {
      options = {
        source = l.mkOption {
          description = "The managed file source.";
          type = sourceType;
        };

        executable = l.mkOption {
          type = t.bool;
          description = ''
            Make the file executable.
          '';
          default = false;
        };

        target = l.mkOption {
          type = t.str;
          internal = true;
          description = "Relative path to the target file.";
        };

        sourceFile = l.mkOption {
          type = t.pathInStore;
          internal = true;
          readOnly = true;
          description = "Path to the source file in store.";
        };
      };

      config = {
        target = name;
      };
    });
  in {
    options.nix4dev.managedFiles = {
      files = l.mkOption {
        type = t.attrsOf managedFilesType;
        description = ''
          Definition of managed files in the project.
          The attribute name is a relative path to the target file.
        '';
        default = {};
        example = l.options.literalExpression ''
          {
            ".envrc" = {
              source.text = "use flake";
            };
            "examples/hello" = {
              source.file = "''${someFlake}/examples/hello";
            };
          }
        '';
      };

      writeFiles = l.mkOption {
        type = t.package;
        description = "A script that writes the files into the project.";
        readOnly = true;
      };
    };

    config = let
      installCmd = _: managedFile: let
        inst = mode: ''${pkgs.coreutils}/bin/install -D -m ${mode} "${managedFile.source.file}" "$PRJ_ROOT"/'${managedFile.target}' '';
        executeMode =
          if managedFile.executable
          then "x"
          else "";
        # Make the managed files that are always overwritten read-only.
        # Users are not supposed to change them.
        instOverwrite = inst "ugo=r${executeMode}";
      in ''
        # Install "${managedFile.source.file}"
        ${instOverwrite}
      '';

      writeFilesCommand = pkgs.writeShellApplication {
        name = "write-managed-files";
        text = ''
          ${l.strings.concatLines (l.mapAttrsToList installCmd cfg.files)}
        '';
      };
    in {
      nix4dev.managedFiles.writeFiles = writeFilesCommand;

      devshells.default.commands = [
        {
          name = "write-managed-files";
          help = "(Over)writes managed files.";
          package = writeFilesCommand;
          category = "setup sub-commands";
        }
      ];

      nix4dev.setupCommands = ["${writeFilesCommand}/bin/write-managed-files"];
    };
  };
}
