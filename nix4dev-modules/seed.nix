{lib, ...}: let
  l = lib // builtins;
  t = lib.types;
in {
  perSystem = {config, ...}: let
    cfg = config.nix4dev.seed;

    seedTemplateType = t.submodule ({
      config,
      ...
    }: {
      options = {
      };

      config = {
        foo = "bar";
      };
    });
  in {
    options = {
      nix4dev.seed = {
        templates = t.attrsOf seedTemplateType;
      };
    };

    config = {
      nix4dev.managedFiles.files =
        l.attrsets.mapAttrs' (
          templateName: _templateConfig: {
            name = "templates/${templateName}/templateFile";
            value = {
              source.text = "hello";
            };
          }
        )
        cfg.templates;

      # Test
      nix4dev.seed.templates.my-test-template = {};
    };
  };
}
