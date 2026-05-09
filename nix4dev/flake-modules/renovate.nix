{
  perSystem =
    { pkgs, ... }:
    {
      devshells.default.commands = [
        {
          name = "prj-renovate";

          help = "Run Renovate on the current repo using GitHub CLI for authentication";

          package = pkgs.writeShellApplication {
            name = "prj-renovate";
            runtimeInputs = [
              pkgs.git
              pkgs.gh
              pkgs.renovate
            ];
            text = ''
              ORIGIN_URL=$(git remote get-url origin)
              REPO_PATH="''${ORIGIN_URL%.git}"
              if [[ "$REPO_PATH" == *"github.com/"* ]]; then
                REPO="''${REPO_PATH##*github.com/}"
              elif [[ "$REPO_PATH" == *"github.com:"* ]]; then
                REPO="''${REPO_PATH##*github.com:}"
              else
                echo "Error: origin remote does not point to GitHub: $ORIGIN_URL" >&2
                exit 1
              fi

              TOKEN=$(gh auth token)
              renovate --platform=github --token="$TOKEN" --autodiscover=false "$REPO"
            '';
          };
        }
      ];
    };
}
