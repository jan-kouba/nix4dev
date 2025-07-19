# nix4dev

Nix utilities for development.

## Quickstart

To use this in a project, make sure you have [nix installed](https://nixos.org/download/) and then initialize the project with:

```bash
nix run github:jan-kouba/nix4dev#init
```

## Custom Templates

You can easily set up your own nix4dev based template for devshell.

To setup default template in the root flake add the following settings into the `./nix4dev` flake:

```nix
perSystem.nix4dev.templates.default = {
  description = "My cool template";
  welcomeText = ''
    # My Cool Template

    Welcome to my cool template!
  '';
  extraFiles."nix4dev/flake-modules/default.nix".source.file = ./template-default.nix;
}
```

Then, you can initialize nix4dev in a new project using the following command:

```bash
nix flake new <new-project-dir> -t <flake-with-the-template>
```

## Development

To start development shell run:

```bash
nix develop ./nix4dev
```

or

```bash
direnv allow
```

### Testing

Run:

```bash
$ test-all
```
