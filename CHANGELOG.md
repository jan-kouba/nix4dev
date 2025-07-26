# Changelog

## [v0.3.0](https://github.com/jan-kouba/nix4dev/compare/v0.2.0...v0.3.0) (2025-07-26)

### Features

* Rename the `nix4dev.managedFiles` option to `managedFiles` (#118)
([60c087b](https://github.com/jan-kouba/nix4dev/commit/60c087ba38476aac14507b0dad2d3095c7d8d55d)),
closes [#118](https://github.com/jan-kouba/nix4dev/issues/118)
* **managedFiles:** Change the type of the source option to attrTag (#117)
([a117b97](https://github.com/jan-kouba/nix4dev/commit/a117b97b59e6b71a1a1a2e2eac855c528fad87a2)),
closes [#117](https://github.com/jan-kouba/nix4dev/issues/117)
* Add support for opentofu (#114)
([e2bfdc5](https://github.com/jan-kouba/nix4dev/commit/e2bfdc552053f4ae0747145f044ee27cd1ef228c)),
closes [#114](https://github.com/jan-kouba/nix4dev/issues/114)
* Drop support for seeds (#110)
([e9799ab](https://github.com/jan-kouba/nix4dev/commit/e9799abb3786180859d1182f715527e6efc1e25c)),
closes [#110](https://github.com/jan-kouba/nix4dev/issues/110)

### Fixes

* Fix yaml formatting (#113)
([ca717d8](https://github.com/jan-kouba/nix4dev/commit/ca717d8e3d3f64438fd158ac4ab273b588af55e2)),
closes [#113](https://github.com/jan-kouba/nix4dev/issues/113)

## [v0.2.0](https://github.com/jan-kouba/nix4dev/compare/v0.1.3...v0.2.0) (2025-07-19)

### Features

* Provide regular nix flake template (#109)
([91f0720](https://github.com/jan-kouba/nix4dev/commit/91f0720c2cca9a8d6e2da26638f62438831d3c5c)),
closes [#109](https://github.com/jan-kouba/nix4dev/issues/109)
* Import the nix4dev flake module when generating template (#106)
([aebec3f](https://github.com/jan-kouba/nix4dev/commit/aebec3ffda192d6a75e035666ea95e0db08dea39)),
closes [#106](https://github.com/jan-kouba/nix4dev/issues/106)
* Add nix4devSeedNew module (#105)
([5f373a4](https://github.com/jan-kouba/nix4dev/commit/5f373a41e65788908747e42c79e1c1a4bd225c4e)),
closes [#105](https://github.com/jan-kouba/nix4dev/issues/105)
* Add inputs parameter to test*FlakePartsWithDir methods (#104)
([513d3cd](https://github.com/jan-kouba/nix4dev/commit/513d3cd45a4e2b5d9be044956ebfdf9b974a7bc6)),
closes [#104](https://github.com/jan-kouba/nix4dev/issues/104)
* **test-lib:** Set outPath of the self attribute to the output of the
previous test step (#103)
([3f2e0d3](https://github.com/jan-kouba/nix4dev/commit/3f2e0d3d5eec5e7acc381713ff17c227f5c897d8)),
closes [#103](https://github.com/jan-kouba/nix4dev/issues/103)
* Allow to use derivation output as source for managed files directory (#102)
([e940453](https://github.com/jan-kouba/nix4dev/commit/e9404531f397a23ea262cf8551ea640bf4be51dc)),
closes [#102](https://github.com/jan-kouba/nix4dev/issues/102)
* Update to nixos-25.05
([21bbd31](https://github.com/jan-kouba/nix4dev/commit/21bbd311a867e5e0d92a20b401f8cde554af512c))

### Fixes

* Properly escape strings (#107)
([e40d192](https://github.com/jan-kouba/nix4dev/commit/e40d192f7f6b892020cbbce2f4a18c0e7d12d55e)),
closes [#107](https://github.com/jan-kouba/nix4dev/issues/107)
* Make newly created parent directories of managed files writable (#99)
([6013867](https://github.com/jan-kouba/nix4dev/commit/601386785305b9e598011779e4d18f0b8911bc15)),
closes [#99](https://github.com/jan-kouba/nix4dev/issues/99)
* Do not fail when using directory as managed file source (#98)
([ce3faff](https://github.com/jan-kouba/nix4dev/commit/ce3faff449311b66551d78482bace571abb2cf3e)),
closes [#98](https://github.com/jan-kouba/nix4dev/issues/98)
* Do not ignore managed files starting with ./ (#97)
([7fd13b7](https://github.com/jan-kouba/nix4dev/commit/7fd13b71d0d1f07da07f68d22a95b04bc0e7090a)),
closes [#97](https://github.com/jan-kouba/nix4dev/issues/97)

### [v0.1.3](https://github.com/jan-kouba/nix4dev/compare/v0.1.2...v0.1.3) (2025-06-08)

#### Features

* Do not format managed files on prepare (#89)
([89d98c9](https://github.com/jan-kouba/nix4dev/commit/89d98c9349dab7bc78d1fc2b3ff0a68443bff752)),
closes [#89](https://github.com/jan-kouba/nix4dev/issues/89)
* Allow to exclude files in flake parts tests (#88)
([f478a36](https://github.com/jan-kouba/nix4dev/commit/f478a368ea4c4d071c96cd8241c8be91a8d72834)),
closes [#88](https://github.com/jan-kouba/nix4dev/issues/88)
* **test-lib:** Make `testDescription` optional in test suite (#87)
([6f75785](https://github.com/jan-kouba/nix4dev/commit/6f75785cafc1d4116f4ea582321f448029c4fa31)),
closes [#87](https://github.com/jan-kouba/nix4dev/issues/87)
* Rework nix4devTest function into testFlakePartsWithDir and
testSuiteFlakePartsWithDir (#86)
([9f10268](https://github.com/jan-kouba/nix4dev/commit/9f10268a1a0a174b18c9c7a4ae2826b91923ea86)),
closes [#86](https://github.com/jan-kouba/nix4dev/issues/86)
* Change nix formatter to nixfmt (#84)
([3082b76](https://github.com/jan-kouba/nix4dev/commit/3082b7696f7497d67809e4d62e338b09c78a48e2)),
closes [#84](https://github.com/jan-kouba/nix4dev/issues/84)

#### Fixes

* Fix test-lib to work also with deeply nested files produced by test (#94)
([88b8715](https://github.com/jan-kouba/nix4dev/commit/88b8715f81d27e9b351086fb489bab7ae3174a90)),
closes [#94](https://github.com/jan-kouba/nix4dev/issues/94)
* **test-lib:** Delete empty parent directories of excluded files (#92)
([3439cb4](https://github.com/jan-kouba/nix4dev/commit/3439cb4405185ef0df4a51b433662854e4ac6dff)),
closes [#92](https://github.com/jan-kouba/nix4dev/issues/92)

### [v0.1.2](https://github.com/jan-kouba/nix4dev/compare/v0.1.1...v0.1.2) (2025-04-06)

#### Features

* Do not overwrite unchanged managed files on setup, attempt 2 (#76)
([27918c2](https://github.com/jan-kouba/nix4dev/commit/27918c28927a368eaa0de8aa428a97e2e799e1c8)),
closes [#76](https://github.com/jan-kouba/nix4dev/issues/76)
* Do not overwrite unchanged managed files on setup (#75)
([02b9fbe](https://github.com/jan-kouba/nix4dev/commit/02b9fbe1b8da0053dab6f2fd40e33644fb08927d)),
closes [#75](https://github.com/jan-kouba/nix4dev/issues/75)
* Do not print warning when a file with no configured formatter is found (#74)
([f80cb1f](https://github.com/jan-kouba/nix4dev/commit/f80cb1f8ce5af26d25a9776f67f7b5ab11e1be6b)),
closes [#74](https://github.com/jan-kouba/nix4dev/issues/74)
* Make formatted .yaml files look like YAML when they contain a valid JSON
(#70)
([73ed88f](https://github.com/jan-kouba/nix4dev/commit/73ed88f8576e25be13147e93b32d4965cf9d0b6d)),
closes [#70](https://github.com/jan-kouba/nix4dev/issues/70)
* Do not print the "cannot delete non-empty directory" warnings when updating
the managed files (#59)
([1288da8](https://github.com/jan-kouba/nix4dev/commit/1288da848161d5b62a91a32c69f1463a5b300262)),
closes [#59](https://github.com/jan-kouba/nix4dev/issues/59)
* Remove flake.lock (#57)
([78dc016](https://github.com/jan-kouba/nix4dev/commit/78dc0167d1c6f6ee4340bdcfd8f9b656ee4a35e5)),
closes [#57](https://github.com/jan-kouba/nix4dev/issues/57)

#### Fixes

* Set the treefmt.projectRoot to point to the whole repository (#73)
([36d851c](https://github.com/jan-kouba/nix4dev/commit/36d851cfd0c6d0d560e72fc68f99aa6e48d985a1)),
closes [#73](https://github.com/jan-kouba/nix4dev/issues/73)

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
