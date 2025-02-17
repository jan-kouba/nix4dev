# Changelog

### [v0.1.1](https://github.com/jan-kouba/nix4dev/compare/v0.1.0...v0.1.1) (2025-02-17)

#### Features

* Allow to disable support for individual languages (#53)
([904ba56](https://github.com/jan-kouba/nix4dev/commit/904ba5600e0fcd61c3aac14df929afa3cca06896)),
closes [#53](https://github.com/jan-kouba/nix4dev/issues/53)
* Extend .editorconfig with settings for all the supported languages (#52)
([8956c6f](https://github.com/jan-kouba/nix4dev/commit/8956c6febba75e4b1c27df572153ce72757b2999)),
closes [#52](https://github.com/jan-kouba/nix4dev/issues/52)
* Add support for .editorconfig (#51)
([2f9e91d](https://github.com/jan-kouba/nix4dev/commit/2f9e91d9255c5a490a6846b7ea6ce881416c75f7)),
closes [#51](https://github.com/jan-kouba/nix4dev/issues/51)
* Update markdown formatter to not escape github's alerts (#46)
([c300751](https://github.com/jan-kouba/nix4dev/commit/c3007515b662219d847396e3300fe45a557ffd74)),
closes [#46](https://github.com/jan-kouba/nix4dev/issues/46)
* Allow newline character in filenames of managed files (#45)
([7ccb17f](https://github.com/jan-kouba/nix4dev/commit/7ccb17f8408e0e4a3dd612098561d9a2a4e8887c)),
closes [#45](https://github.com/jan-kouba/nix4dev/issues/45)
* Store managed files list in a JSON file (#44)
([915dca2](https://github.com/jan-kouba/nix4dev/commit/915dca28a49a83af65b2aaa85fa037ed825abea5)),
closes [#44](https://github.com/jan-kouba/nix4dev/issues/44)
* **managed-files:** Delete files when they stop being managed (#42)
([b92e356](https://github.com/jan-kouba/nix4dev/commit/b92e356c6517e3ea1ad626fb31e494c73c3ea640)),
closes [#42](https://github.com/jan-kouba/nix4dev/issues/42)
* Setup .gitignore for terraform (#38)
([1508569](https://github.com/jan-kouba/nix4dev/commit/150856982c8158aedb4c4d60e27e55dc8a6b57a0)),
closes [#38](https://github.com/jan-kouba/nix4dev/issues/38)
* Add support for YAML files (#36)
([e03add5](https://github.com/jan-kouba/nix4dev/commit/e03add55c25da3c9d88c0d8535177b47076cb42f)),
closes [#36](https://github.com/jan-kouba/nix4dev/issues/36)
* Auto format managed files (#31)
([96a6073](https://github.com/jan-kouba/nix4dev/commit/96a607343cc0097c97431f8e87fd379c1985596b)),
closes [#31](https://github.com/jan-kouba/nix4dev/issues/31)
* Update to nixpkgs 24.11 everywhere and fix problems (#28)
([f72892a](https://github.com/jan-kouba/nix4dev/commit/f72892ae13ef1db5a717eeefc3e1c09cc615bdf4)),
closes [#28](https://github.com/jan-kouba/nix4dev/issues/28)
* Bump nixpkgs to 24.11 (#27)
([ec62c8d](https://github.com/jan-kouba/nix4dev/commit/ec62c8d1908dc2fdd6652cdda24c955311ba3b18)),
closes [#27](https://github.com/jan-kouba/nix4dev/issues/27)
* Expose the nix4dev commands in the flake (#23)
([fd83bf0](https://github.com/jan-kouba/nix4dev/commit/fd83bf044dae73650757e6e86bac9d76a1c93cbe)),
closes [#23](https://github.com/jan-kouba/nix4dev/issues/23)

#### Fixes

* Try to fix manage files checks to not fail sometimes (#54)
([b40fc4f](https://github.com/jan-kouba/nix4dev/commit/b40fc4fd08b74e59bb7f177b93126f82849b530a)),
closes [#54](https://github.com/jan-kouba/nix4dev/issues/54)

## v0.1.0 (2024-08-04)

### ⚠ BREAKING CHANGE

* The name of the command used to initialize
nix4dev in a repository was renamed from `setup` to `init`.



### Features

* Allow to add directories to watch for changes by direnv (#17)
([8b61e41](https://github.com/jan-kouba/nix4dev/commit/8b61e411889febcab5772126ae55de062848d466)),
closes [#17](https://github.com/jan-kouba/nix4dev/issues/17)
* Update this flake's nixpkgs input to nixos-24.05 (#11)
([80d114a](https://github.com/jan-kouba/nix4dev/commit/80d114a0b713dcedf3acf84fbefca140f619e990)),
closes [#11](https://github.com/jan-kouba/nix4dev/issues/11)
* Update to nixos-24.05 nixpkgs (#10)
([b9caec3](https://github.com/jan-kouba/nix4dev/commit/b9caec377663eee00e2d35095f86f933e1eb47cd)),
closes [#10](https://github.com/jan-kouba/nix4dev/issues/10)
* Rename the command used to init a repository from `setup` to `init`. (#3)
([7e14deb](https://github.com/jan-kouba/nix4dev/commit/7e14deb20f4a684d7d38554f1bc09433e6443612)),
closes [#3](https://github.com/jan-kouba/nix4dev/issues/3)
* Setup support for JSON
([ff78ed6](https://github.com/jan-kouba/nix4dev/commit/ff78ed6df38611dda5c990271f16e93edf98730b))
* Add update command
([02130cf](https://github.com/jan-kouba/nix4dev/commit/02130cffeed42c37f04d8902da1e70592727dd14))

### Fixes

* Fix generation of directory watching in envrc (#18)
([fad63cd](https://github.com/jan-kouba/nix4dev/commit/fad63cdf0deb94644949fa014dfdda058b365bf5)),
closes [#18](https://github.com/jan-kouba/nix4dev/issues/18)
* Fix github workflow (#1)
([aae83a4](https://github.com/jan-kouba/nix4dev/commit/aae83a4a20bf6be8bab731110458965ec7a5cc2f)),
closes [#1](https://github.com/jan-kouba/nix4dev/issues/1)
* Fix URL of the nix4dev flake in the seed
([9719e1b](https://github.com/jan-kouba/nix4dev/commit/9719e1b7a99d37a7643193991781fbfe70630c56))
