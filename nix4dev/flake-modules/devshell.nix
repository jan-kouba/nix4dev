{
  perSystem = {...}: {
    nix4dev.envrc.preamble = ''
      set_watch() {
        TO_WATCH=""
        mapfile -td "" TO_WATCH < <(find ./nix4dev-modules -type f -print0)
        nix_direnv_watch_file "''${TO_WATCH[@]}"
        mapfile -td "" TO_WATCH < <(find ./tests -type f -print0)
        nix_direnv_watch_file "''${TO_WATCH[@]}"
      }
      set_watch
    '';
  };
}
