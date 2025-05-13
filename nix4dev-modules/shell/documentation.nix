{ self, ... }:
{
  perSystem =
    {
      config,
      options,
      pkgs,
      lib,
      system,
      ...
    }:
    {
      packages.optionsDoc =
        let
          manual = pkgs.nixosOptionsDoc {
            inherit options;
            documentType = "none";

            transformOptions =
              opt:
              opt
              // {
                name = builtins.replaceStrings [ ".${system}." ] [ ".<system>." ] opt.name;

                declarations = builtins.map (decl: {
                  name = lib.removePrefix "/" (
                    lib.removePrefix (builtins.toString self) (
                      lib.removeSuffix ", via option perSystem" (builtins.toString decl)
                    )
                  );
                  url = lib.removeSuffix ", via option perSystem" (builtins.toString decl);
                }) opt.declarations;
              };
          };
        in
        manual.optionsCommonMark;

      devshells.default = {
        commands = [
          {
            name = "show-options-doc";
            help = "Shows flake module options";
            command = "${pkgs.xdg-utils}/bin/xdg-open ${config.packages.optionsDoc}";
          }
        ];
      };
    };
}
