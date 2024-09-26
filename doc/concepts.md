# Concepts



## Actions

correct / fixup / prepare / setup
local-setup
update
test - aggregation of test-slow and test-quick
* test-slow
* test-quick

Everything can be appended with options:

--check
    Does not perform any modifications, just checks if any changes are needed.
    IMPL: Can be done in a generic way for all the commands. Just perform the regular action in a copy of the repo and if there are any changes, say that the check has failed.

--commit
    Will perform the actions and commit the changes with a nice and descriptive commit message.




local       x with internet

fixup       x update
local-setup 



# Workflows

## Development

* enter repo
* hack some changes
* run `prepare`
  * will format/lint sources (including md, json)
  * update managed files if needed (.gitignore, github workflow files, ...)
  * update generated documentation (terraform doc, ...)
* run `test-quick` (or `test`)
  * if it fails, go to "run `prepare`"
* commit changes
* push to github/gitlab
* CI job runs `prepare --check` and `test`

## Maintenance

Run by dev or in CI on schedule.

* run `maintain`
  * run `prepare --check` first
  * for every action from `update` runs the action, runs `prepare` and commits the changes (if any) with descriptive commit message from the action
* if there is any change create pull request
* review changes do fixups 
* continue with **Development**


# Supported features

* can be enabled/disabled

## Markdown

* prepare
  * lint
  * [editorconfig] setup

## Terraform

* prepare
  * lint
  * editorconfig setup
* package
* update
  * terraform providers
  * used modules

## Nix

* prepare
  * lint, fmt
  * editorconfig setup
* update
  * flake inputs


## JSON

* prepare
  * fmt
  * editorconfig setup

## Rust

* prepare
  * fmt, lint
  * editorconfig setup
* package (rustc, cargo)
* env
  * RUST_SRC?
* update
  * dependencies

## Editorconfig

General setup (line endings)

Extra setup with other features.


## GitHub

* prepare
  * workflow files
    * `maintain` on schedule + create PR
    * `test` on push ()