# nix4dev

Nix utilities for development.

## Quickstart

To use this in a project, make sure you have [nix installed](https://nixos.org/download/) and then initialize the project with:

```
nix run github:jan-kouba/nix4dev#init
```

## Setup nix4dev Seed

If you want to make your own modifications to the development shell, you can initialize nix4dev in your repo and add flake parts modules of your own.

> \[!TIP\]
> In order to simplify the process of adding your changes, you can also create your own nix4dev seed repo and use the [seed module](./nix4dev-seed-modules/default.nix) to easily setup the `init` command. Then you can initialize new project by:

```
nix run <your_seed_repo>#init
```

TODO: Explain in more detail how to setup seed repo.

## Development

To start development shell run:

```
nix develop ./nix4dev
```

or

```
direnv allow
```

### Testing

Run:

```
$ test-all
```
