nix4devIntpus:
{
  flake-parts-lib,
  self,
  lib,
  ...
}:
{
  options.perSystem = flake-parts-lib.mkPerSystemOption (
    { ... }:
    {
      options.nix4dev.documentation.nixModules = {
        enable = lib.mkEnableOption "generation of documentation for nix modules" // {
          default = true;
        };

        sourcePath = lib.mkOption {
          type = lib.types.path;
          description = ''
            Source files root.
            This path will be prefix-removed from the source location links.";
          '';
          example = lib.options.literalExpression "./.";
          default = self;
          defaultText = "self";
        };

        baseUrl = lib.mkOption {
          type = lib.types.str;
          description = "URL prefix to add to source location links.";
          example = "https://mydocs.com";
        };
      };
    }
  );

  config.perSystem =
    {
      config,
      pkgs,
      system,
      ...
    }:
    let
      cfg = config.nix4dev.documentation.nixModules;

      takeStringUntil = substr: str: lib.lists.head (lib.strings.splitString substr str);

      managedFilesEntry =
        name: module:
        let
          docFileNameBase = lib.strings.replaceString "/" "-" name;
          eval = (
            lib.evalModules {
              modules = [ module ];
            }
          );
          optionsDoc = pkgs.nixosOptionsDoc {
            inherit (eval) options;

            documentType = "none";

            transformOptions =
              opt:
              opt
              // {
                name = lib.strings.replaceString ".${system}." ".<system>." opt.name;

                declarations = builtins.map (
                  decl:
                  let
                    strippedPath = lib.removePrefix "/" (
                      lib.removePrefix (builtins.toString cfg.sourcePath) (
                        takeStringUntil ", via option perSystem" (builtins.toString decl)
                      )
                    );
                  in
                  {
                    name = strippedPath;
                    url = "${cfg.baseUrl}/${strippedPath}";
                  }
                ) opt.declarations;

                visible = opt.name != "_module.args";
              };
          };
        in
        {
          "docs/modules/flake/${docFileNameBase}.md".source.file = optionsDoc.optionsCommonMark;
        };

      projectFlake = (import nix4devIntpus.flake-compat) { src = ./..; };
    in
    {
      nix4dev.managedFiles.files = lib.mkIf cfg.enable (
        lib.attrsets.concatMapAttrs managedFilesEntry (projectFlake.flakeModules or { })
      );
    };
}
