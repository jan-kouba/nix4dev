{
  inputsHash = "sha256-8P6pY9JRQPkR4fEtnnM40pObBxjXSCKHuJ/6JxhaYEI=";
  overrides =
    {
      "foo" = "nixpkgs";
    }
    // (import ../overrides-nix4dev.nix).overrides;
}
