# nix4dev

Nix utilities for development.

## Quickstart

To use this in a project, make sure you have [nix installed](https://nixos.org/download/) and then initialize the project with:

```bash
nix run github:jan-kouba/nix4dev#init
```

## Custom nix4dev Templates (new)

You can easily set up your own nix4dev based devshell.

To setup default template in the root flake add the following settings into the `./nix4dev` flake:

```nix
perSystem.nix4dev.seeds.default = {
  description = "My cool seed";
  welcomeText = ''
    # My Cool Seed

    Welcome to my cool seed!
  '';
  extraFiles."nix4dev/flake-modules/default.nix".source.file = ./seed-default.nix;
}
```

Then you can initialize nix4dev in a new project using the following command:

```bash
nix flake new <new-project-dir> -t <flake-with-the-template>
```

## Setup nix4dev Seed (legacy)

If you want to make your own modifications to the development shell, you can initialize nix4dev in your repo and add flake parts modules of your own.

> [!TIP]
> In order to simplify the process of adding your changes, you can also create your own nix4dev seed repo and use the [seed module](./nix4dev-seed-modules/default.nix) to easily setup the `init` command. Then you can initialize new project by:
>
> ```bash
> nix run <your_seed_repo>#init
> ```

TODO: Explain in more detail how to setup seed repo.

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
