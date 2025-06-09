{
  perSystem =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      l = lib // builtins;
      t = l.types;

      topCfg = config;
      cfg = config.nix4dev.managedFiles;

      sourceType = t.submodule (
        { config, ... }:
        {
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
        }
      );

      managedFileType = t.submodule (
        {
          config,
          name,
          ...
        }:
        {
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

            allTargetFiles = l.mkOption {
              type = t.listOf t.str;
              internal = true;
              readOnly = true;
              description = ''
                The list of all the target files.
                If `target` is a directory this list is set to all the non-directory files in the directory.
              '';
            };
          };

          config = {
            target = lib.path.subpath.normalise name;
            allTargetFiles =
              if lib.filesystem.pathIsDirectory config.source.file then
                let
                  sourceFilesFullPaths = lib.filesystem.listFilesRecursive config.source.file;
                  sourceFilesRelPaths = lib.map (
                    f:
                    lib.path.subpath.join [
                      config.target
                      (lib.path.removePrefix config.source.file f)
                    ]
                  ) sourceFilesFullPaths;
                in
                sourceFilesRelPaths
              else
                [ config.target ];
          };
        }
      );
    in
    {
      options.nix4dev.managedFiles = {
        files = l.mkOption {
          type = t.attrsOf managedFileType;
          description = ''
            Definition of managed files in the project.
            The attribute name is a relative path to the target file.
          '';
          default = { };
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

        treefmt.enable = l.mkEnableOption "the formatting of the managed files by treefmt. If enabled, treefmt must be configured in this flake.";

        fileListPaths = l.mkOption {
          type = t.listOf t.str;
          default = [ "./.managed-files.list" ];
          example = [ "./files1.list" ];
          description = ''
            Relative paths to the files containing list of managed files.
            All paths in the list are merged into a single list.

            This option is a list, in order to allow for easier migration when it is needed to change it's value.
            If you want to change the value e.g. from `files.list` to `files2.list`, you first add the `files2.list`
            value into the `fileListPaths` list and deprecate the `files.list` file.
            After the deprication period elapses (and every user updates the managed files with the `fileListPaths` option containing the two values),
            you can safely remove the `files.list` value from the `fileListPaths` list.
          '';
        };

        writeFiles = l.mkOption {
          type = t.package;
          description = "A script that (over)writes the managed files into the project.";
          readOnly = true;
        };

        updateFiles = l.mkOption {
          type = t.package;
          description = "A script that updates the managed files in the directory given as argument.";
          readOnly = true;
        };
      };

      config =
        let
          installCmd =
            _: managedFile:
            let
              inst = mode: ''
                mkdir -p "$(dirname "$out"/'${managedFile.target}')"
                ${pkgs.coreutils}/bin/cp -r -- "${managedFile.source.file}" "$out"/'${managedFile.target}'
                ${if managedFile.executable then ''chmod ${mode} "$out"/'${managedFile.target}' '' else ""}
              '';
              executeMode = if managedFile.executable then "x" else "";
              # Make the managed files that are always overwritten read-only.
              # Users are not supposed to change them.
              instOverwrite = inst "ugo=r${executeMode}";
            in
            ''
              # Install "${managedFile.source.file}"
              ${instOverwrite}
            '';

          managedFilesDir = pkgs.runCommand "managed-files-dir" { } ''
            set -eu

            ${l.strings.concatLines (l.mapAttrsToList installCmd cfg.files)}

            chmod -R u+w "$out"

            ${
              if cfg.treefmt.enable then
                ''
                  ${topCfg.treefmt.package}/bin/treefmt \
                    --tree-root "$out" \
                    --config-file ${topCfg.treefmt.build.configFile} \
                    --no-cache
                ''
              else
                ""
            }
          '';

          managedFilesList = pkgs.writeText "managed-files-list" (
            let
              managedFilesTargets = l.lists.flatten (
                l.attrsets.mapAttrsToList (_: file: file.allTargetFiles) cfg.files
              );
            in
            builtins.toJSON {
              _comment = [
                "DO NOT MODIFY THIS FILE!"
                "PLEASE COMMIT THIS FILE!"
                "This file was generated by nix4dev."
                "This file contains list of managed files."
              ];
              managedFiles = l.sort (a: b: a < b) managedFilesTargets;
            }
          );

          updateFilesScript =
            let
              fileListPaths =
                assert l.asserts.assertMsg (
                  (l.length cfg.fileListPaths) > 0
                ) "`fileListPaths` can not be an empty list";
                cfg.fileListPaths;
              fileListPath = "$outDir/${l.head fileListPaths}";
              fileListPathNew = "$tmpFileListPath";
            in
            pkgs.writeShellScript "update-managed-files" ''
              set -euo pipefail

              outDir="$1"
              tmpFileListPath="$(mktemp --tmpdir -- nix4dev-file-list-new-XXXXXX.json)"


              # Update managed files list to contain both old and new files
              mkdir -p "$(dirname "${fileListPath}")"

              ${pkgs.jq}/bin/jq --raw-output -sS '([.[] | .managedFiles] | flatten | unique | { managedFiles: . }) + (.[0] | {_comment})' \
                > "${fileListPathNew}" \
                <(
                  cat "${managedFilesList}"
                  ${l.strings.concatMapStringsSep "\n" (f: ''
                    if [ -f "$outDir/${f}" ]; then
                      cat "$outDir/${f}"
                    fi
                  '') cfg.fileListPaths}
                )
              ${pkgs.rsync}/bin/rsync \
                --checksum \
                "${fileListPathNew}" "${fileListPath}"


              # Update managed files
              jq_filter='.managedFiles[] | gsub("\\*"; "\\*") | gsub("\\?"; "\\?") | gsub("\\["; "\\[") | gsub("^\\./"; "") | "/" + .'

              ${pkgs.rsync}/bin/rsync \
                -r \
                --delete \
                --checksum \
                --from0 \
                --chmod=D+w,F-w,+X \
                -f'.+ '<(${pkgs.jq}/bin/jq --raw-output0 "$jq_filter" "${fileListPath}") \
                -f'-! */' \
                ${managedFilesDir}/ \
                "$outDir" \
              | { grep -v '^cannot delete non-empty directory: ' || true; }


              # Update managed files list to contain just the new files
              ${pkgs.jq}/bin/jq --raw-output -S '.' "${managedFilesList}" > "${fileListPathNew}"

              ${pkgs.rsync}/bin/rsync \
                --checksum \
                "${fileListPathNew}" "${fileListPath}"

              ${l.strings.concatMapStringsSep "\n" (f: "rm -f \"$outDir/${f}\"") (l.tail cfg.fileListPaths)}

              rm "$tmpFileListPath"
            '';

          writeFilesCommand = pkgs.writeShellApplication {
            name = "write-managed-files";
            text = ''
              ${updateFilesScript} "$PRJ_ROOT";
            '';
          };
        in
        {
          nix4dev.managedFiles.updateFiles = updateFilesScript;
          nix4dev.managedFiles.writeFiles = writeFilesCommand;
        };
    };
}
