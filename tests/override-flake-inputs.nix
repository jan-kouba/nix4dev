/*
  Given flake.nix file, returns --input-override options that override all non-local inputs
  used by the flake (including transitive inputs).
  A local flake is detected by checking if the url field of the input starts with '/'.
*/
{
  flakePath,
  nixpkgs,
  localInputsPath,
  nix4devRepoPath,
}:
let
  l = (import nixpkgs { }).lib // builtins;
  localInputs = import localInputsPath;
  flake = import flakePath;
  inputs = flake.inputs;

  resolveInputs =
    inputPathSoFar:
    l.mapAttrsToList (
      inputName: value:
      let
        isLocalFlake = (l.hasAttr "url" value) && (l.substring 0 1 value.url) == "/";
        isFlake = (!l.hasAttr "flake" value) || value.flake;
        inputPath = inputPathSoFar ++ [ inputName ];
      in
      if inputName == "nix4dev" then
        [ { inputPath = inputPathSoFar ++ [ inputName ]; } ]
        ++ (resolveInputs inputPath (import (nix4devRepoPath + "/flake.nix")).inputs)
      else if isLocalFlake then
        (if isFlake then resolveInputs inputPath (import (value.url + "/flake.nix")).inputs else [ ])
      else
        { inputPath = inputPathSoFar ++ [ inputName ]; }
    );

  resolvedInputs = l.lists.flatten (resolveInputs [ ] inputs);

  overrideOptions = l.lists.map (
    inputPath:
    let
      inputPathString = l.strings.concatStringsSep "/" inputPath.inputPath;
      inputName = l.lists.last inputPath.inputPath;
      localUrl = if inputName == "nix4dev" then nix4devRepoPath else "${localInputs.${inputName}}";
    in
    "--override-input ${l.strings.escapeShellArg inputPathString} ${l.strings.escapeShellArg localUrl}"
  ) resolvedInputs;
in
{
  options = l.strings.concatStringsSep " " overrideOptions;
}
