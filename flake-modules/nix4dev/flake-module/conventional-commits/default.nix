{ lib, ... }:
{
  perSystem =
    {
      config,
      pkgs,
      ...
    }:
    let
      cfg = config.nix4dev.conventionalCommits;
    in
    {
      options = {
        nix4dev.conventionalCommits.enable = lib.mkEnableOption "conventional commits";
      };

      config = lib.mkIf cfg.enable (
        let
          releasePackage = pkgs.writeShellApplication {
            name = "release";
            runtimeInputs = [
              pkgs.git
              pkgs.convco
            ];
            text = ''
              # Bump version if needed
              convco version -b > version.txt

              # Generate changelog
              git tag v"$(cat version.txt)"
              convco changelog --unreleased "$(cat version.txt)" > CHANGELOG.md
              git tag -d v"$(cat version.txt)"

              git add CHANGELOG.md version.txt
              convco commit --chore -m "Release $(cat version.txt)"

              git tag v"$(cat version.txt)"
            '';
          };
        in
        {
          packages.release = releasePackage;

          devshells.default = {
            commands = [
              {
                name = "release";
                help = "Release next version.";
                package = config.packages.release;
              }
            ];

            env = [
              {
                name = "NIX_CONFIG";
                value = "commit-lockfile-summary = chore: Lock flake";
              }
            ];
          };

          nix4dev.managedFiles.files = {
            ".git/hooks/commit-msg" =
              let
                checkCommand = pkgs.writeShellApplication {
                  name = "commit-msg";
                  runtimeInputs = [
                    pkgs.convco
                  ];
                  text = ''
                    convco check --from-stdin < "$1"
                  '';
                };
              in
              {
                source.file = "${checkCommand}/bin/commit-msg";
                executable = true;
              };
          };

          treefmt.settings.global.excludes = [
            "CHANGELOG.md"
          ];
        }
      );
    };
}
