## perSystem\.\<system>\.packages



An attribute set of packages to be built by [` nix build `](https://nixos\.org/manual/nix/stable/command-ref/new-cli/nix3-build\.html)\.

` nix build .#<name> ` will build ` packages.<name> `\.



*Type:*
lazy attribute set of package



*Default:*
` { } `

*Declared by:*
 - [nix/store/dw345ma5l7pp3zvyc06i4239j8cfi4s9-source/modules/packages\.nix](/nix/store/dw345ma5l7pp3zvyc06i4239j8cfi4s9-source/modules/packages.nix)



## perSystem\.\<system>\.apps

Programs runnable with nix run ` <name> `\.



*Type:*
lazy attribute set of (submodule)



*Default:*
` { } `



*Example:*

```
{
  default.program = "${config.packages.hello}/bin/hello";
}

```

*Declared by:*
 - [nix/store/dw345ma5l7pp3zvyc06i4239j8cfi4s9-source/modules/apps\.nix](/nix/store/dw345ma5l7pp3zvyc06i4239j8cfi4s9-source/modules/apps.nix)



## perSystem\.\<system>\.apps\.\<name>\.meta



Metadata information about the app\.
Standardized in Nix at [https://github\.com/NixOS/nix/pull/11297](https://github\.com/NixOS/nix/pull/11297)\.

Note: ` nix flake check ` is only aware of the ` description ` attribute in ` meta `\.



*Type:*
lazy attribute set of raw value



*Default:*
` { } `

*Declared by:*
 - [nix/store/dw345ma5l7pp3zvyc06i4239j8cfi4s9-source/modules/apps\.nix](/nix/store/dw345ma5l7pp3zvyc06i4239j8cfi4s9-source/modules/apps.nix)



## perSystem\.\<system>\.apps\.\<name>\.program



A path to an executable or a derivation with ` meta.mainProgram `\.



*Type:*
string or package convertible to it

*Declared by:*
 - [nix/store/dw345ma5l7pp3zvyc06i4239j8cfi4s9-source/modules/apps\.nix](/nix/store/dw345ma5l7pp3zvyc06i4239j8cfi4s9-source/modules/apps.nix)



## perSystem\.\<system>\.apps\.\<name>\.type



A type tag for ` apps ` consumers\.



*Type:*
value “app” (singular enum)



*Default:*
` "app" `

*Declared by:*
 - [nix/store/dw345ma5l7pp3zvyc06i4239j8cfi4s9-source/modules/apps\.nix](/nix/store/dw345ma5l7pp3zvyc06i4239j8cfi4s9-source/modules/apps.nix)



## perSystem\.\<system>\.checks



Derivations to be built by [` nix flake check `](https://nixos\.org/manual/nix/stable/command-ref/new-cli/nix3-flake-check\.html)\.



*Type:*
lazy attribute set of package



*Default:*
` { } `

*Declared by:*
 - [nix/store/dw345ma5l7pp3zvyc06i4239j8cfi4s9-source/modules/checks\.nix](/nix/store/dw345ma5l7pp3zvyc06i4239j8cfi4s9-source/modules/checks.nix)



## perSystem\.\<system>\.debug



Values to return in e\.g\. ` allSystems.<system> ` when
[` debug = true `](\#opt-debug)\.



*Type:*
lazy attribute set of raw value

*Declared by:*
 - [nix/store/dw345ma5l7pp3zvyc06i4239j8cfi4s9-source/modules/formatter\.nix](/nix/store/dw345ma5l7pp3zvyc06i4239j8cfi4s9-source/modules/formatter.nix)



## perSystem\.\<system>\.devShells



An attribute set of packages to be used as shells\.
[` nix develop .#<name> `](https://nixos\.org/manual/nix/stable/command-ref/new-cli/nix3-develop\.html) will run ` devShells.<name> `\.



*Type:*
lazy attribute set of package



*Default:*
` { } `



*Example:*

```
{
  default = pkgs.mkShell {
    nativeBuildInputs = with pkgs; [ wget bat cargo ];
  };
}

```

*Declared by:*
 - [nix/store/dw345ma5l7pp3zvyc06i4239j8cfi4s9-source/modules/devShells\.nix](/nix/store/dw345ma5l7pp3zvyc06i4239j8cfi4s9-source/modules/devShells.nix)



## perSystem\.\<system>\.devshells



Configure devshells with flake-parts\.

Not to be confused with ` devShells `, with a capital S\. Yes, this
is unfortunate\.

Each devshell will also configure an equivalent ` devShells `\.

Used to define devshells\. not to be confused with ` devShells `



*Type:*
lazy attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/flake-module\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/flake-module.nix)



## perSystem\.\<system>\.devshells\.\<name>\.commands



Add commands to the environment\.



*Type:*
list of (submodule)



*Default:*
` [ ] `



*Example:*

```
[
  {
    help = "print hello";
    name = "hello";
    command = "echo hello";
  }

  {
    package = "nixpkgs-fmt";
    category = "formatter";
  }
]

```

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/commands\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/commands.nix)



## perSystem\.\<system>\.devshells\.\<name>\.commands\.\*\.package



Used to bring in a specific package\. This package will be added to the
environment\.



*Type:*
null or (package or string convertible to it)



*Default:*
` null `

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/commands\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/commands.nix)



## perSystem\.\<system>\.devshells\.\<name>\.commands\.\*\.category



Set a free text category under which this command is grouped
and shown in the help menu\.



*Type:*
string



*Default:*
` "[general commands]" `

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/commands\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/commands.nix)



## perSystem\.\<system>\.devshells\.\<name>\.commands\.\*\.command



If defined, it will add a script with the name of the command, and the
content of this value\.

By default it generates a bash script, unless a different shebang is
provided\.



*Type:*
null or string



*Default:*
` null `



*Example:*

```
''
  #!/usr/bin/env python
  print("Hello")
''
```

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/commands\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/commands.nix)



## perSystem\.\<system>\.devshells\.\<name>\.commands\.\*\.help



Describes what the command does in one line of text\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/commands\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/commands.nix)



## perSystem\.\<system>\.devshells\.\<name>\.commands\.\*\.name



Name of this command\. Defaults to attribute name in commands\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/commands\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/commands.nix)



## perSystem\.\<system>\.devshells\.\<name>\.devshell\.packages



The set of packages to appear in the project environment\.

Those packages come from [https://nixos\.org/NixOS/nixpkgs](https://nixos\.org/NixOS/nixpkgs) and can be
searched by going to [https://search\.nixos\.org/packages](https://search\.nixos\.org/packages)



*Type:*
list of (package or string convertible to it)



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/devshell\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/devshell.nix)



## perSystem\.\<system>\.devshells\.\<name>\.devshell\.packagesFrom



Add all the build dependencies from the listed packages to the
environment\.



*Type:*
list of (package or string convertible to it)



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/devshell\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/devshell.nix)



## perSystem\.\<system>\.devshells\.\<name>\.devshell\.interactive\.\<name>\.deps



A list of other steps that this one depends on\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/devshell\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/devshell.nix)



## perSystem\.\<system>\.devshells\.\<name>\.devshell\.interactive\.\<name>\.text



Script to run\.



*Type:*
string

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/devshell\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/devshell.nix)



## perSystem\.\<system>\.devshells\.\<name>\.devshell\.load_profiles



Whether to enable load etc/profiles\.d/\*\.sh in the shell\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/devshell\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/devshell.nix)



## perSystem\.\<system>\.devshells\.\<name>\.devshell\.meta



Metadata, such as ‘meta\.description’\. Can be useful as metadata for downstream tooling\.



*Type:*
attribute set of anything



*Default:*
` { } `

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/devshell\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/devshell.nix)



## perSystem\.\<system>\.devshells\.\<name>\.devshell\.motd



Message Of The Day\.

This is the welcome message that is being printed when the user opens
the shell\.

You may use any valid ansi color from the 8-bit ansi color table\. For example, to use a green color you would use something like {106}\. You may also use {bold}, {italic}, {underline}\. Use {reset} to turn off all attributes\.



*Type:*
string



*Default:*

```
''
  {202}🔨 Welcome to devshell{reset}
  $(type -p menu &>/dev/null && menu)
''
```

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/devshell\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/devshell.nix)



## perSystem\.\<system>\.devshells\.\<name>\.devshell\.name



Name of the shell environment\. It usually maps to the project name\.



*Type:*
string



*Default:*
` "devshell" `

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/devshell\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/devshell.nix)



## perSystem\.\<system>\.devshells\.\<name>\.devshell\.prj_root_fallback



If IN_NIX_SHELL is nonempty, or DIRENV_IN_ENVRC is set to ‘1’, then
PRJ_ROOT is set to the value of PWD\.

This option specifies the path to use as the value of PRJ_ROOT in case
IN_NIX_SHELL is empty or unset and DIRENV_IN_ENVRC is any value other
than ‘1’\.

Set this to null to force PRJ_ROOT to be defined at runtime (except if
IN_NIX_SHELL or DIRENV_IN_ENVRC are defined as described above)\.

Otherwise, you can set this to a string representing the desired
default path, or to a submodule of the same type valid in the ‘env’
options list (except that the ‘name’ field is ignored)\.



*Type:*
null or ((submodule) or non-empty string convertible to it)



*Default:*

```
{
  eval = "$PWD";
}
```



*Example:*

```
{
  # Use the top-level directory of the working tree
  eval = "$(git rev-parse --show-toplevel)";
};

```

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/devshell\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/devshell.nix)



## perSystem\.\<system>\.devshells\.\<name>\.devshell\.prj_root_fallback\.eval



Like value but not evaluated by Bash\. This allows to inject other
variable names or even commands using the ` $() ` notation\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "$OTHER_VAR" `

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/env\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/env.nix)



## perSystem\.\<system>\.devshells\.\<name>\.devshell\.prj_root_fallback\.name



Name of the environment variable



*Type:*
string

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/env\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/env.nix)



## perSystem\.\<system>\.devshells\.\<name>\.devshell\.prj_root_fallback\.prefix



Prepend to PATH-like environment variables\.

For example name = “PATH”; prefix = “bin”; will expand the path of
\./bin and prepend it to the PATH, separated by ‘:’\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "bin" `

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/env\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/env.nix)



## perSystem\.\<system>\.devshells\.\<name>\.devshell\.prj_root_fallback\.unset



Whether to enable unsets the variable\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/env\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/env.nix)



## perSystem\.\<system>\.devshells\.\<name>\.devshell\.prj_root_fallback\.value



Shell-escaped value to set



*Type:*
null or string or signed integer or boolean or package



*Default:*
` null `

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/env\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/env.nix)



## perSystem\.\<system>\.devshells\.\<name>\.devshell\.startup\.\<name>\.deps



A list of other steps that this one depends on\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/devshell\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/devshell.nix)



## perSystem\.\<system>\.devshells\.\<name>\.devshell\.startup\.\<name>\.text



Script to run\.



*Type:*
string

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/devshell\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/devshell.nix)



## perSystem\.\<system>\.devshells\.\<name>\.env



Add environment variables to the shell\.



*Type:*
list of (submodule)



*Default:*
` [ ] `



*Example:*

```
[
  {
    name = "HTTP_PORT";
    value = 8080;
  }
  {
    name = "PATH";
    prefix = "bin";
  }
  {
    name = "XDG_CACHE_DIR";
    eval = "$PRJ_ROOT/.cache";
  }
  {
    name = "CARGO_HOME";
    unset = true;
  }
]

```

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/env\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/env.nix)



## perSystem\.\<system>\.devshells\.\<name>\.env\.\*\.eval



Like value but not evaluated by Bash\. This allows to inject other
variable names or even commands using the ` $() ` notation\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "$OTHER_VAR" `

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/env\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/env.nix)



## perSystem\.\<system>\.devshells\.\<name>\.env\.\*\.name



Name of the environment variable



*Type:*
string

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/env\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/env.nix)



## perSystem\.\<system>\.devshells\.\<name>\.env\.\*\.prefix



Prepend to PATH-like environment variables\.

For example name = “PATH”; prefix = “bin”; will expand the path of
\./bin and prepend it to the PATH, separated by ‘:’\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "bin" `

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/env\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/env.nix)



## perSystem\.\<system>\.devshells\.\<name>\.env\.\*\.unset



Whether to enable unsets the variable\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/env\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/env.nix)



## perSystem\.\<system>\.devshells\.\<name>\.env\.\*\.value



Shell-escaped value to set



*Type:*
null or string or signed integer or boolean or package



*Default:*
` null `

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/env\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/env.nix)



## perSystem\.\<system>\.devshells\.\<name>\.serviceGroups



Add services to the environment\. Services can be used to group long-running processes\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/services\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/services.nix)



## perSystem\.\<system>\.devshells\.\<name>\.serviceGroups\.\<name>\.description



Short description of the service group, shown in generated commands



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/services\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/services.nix)



## perSystem\.\<system>\.devshells\.\<name>\.serviceGroups\.\<name>\.name



Name of the service group\. Defaults to attribute name in groups\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/services\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/services.nix)



## perSystem\.\<system>\.devshells\.\<name>\.serviceGroups\.\<name>\.services



Attrset of services that should be run in this group\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/services\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/services.nix)



## perSystem\.\<system>\.devshells\.\<name>\.serviceGroups\.\<name>\.services\.\<name>\.command



Command to execute\.



*Type:*
string

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/services\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/services.nix)



## perSystem\.\<system>\.devshells\.\<name>\.serviceGroups\.\<name>\.services\.\<name>\.name



Name of this service\. Defaults to attribute name in group services\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/services\.nix](/nix/store/wlhsnrq6g5avc7z21lfivqypaq5fy2wn-source/modules/services.nix)



## perSystem\.\<system>\.formatter



A package used by [` nix fmt `](https://nixos\.org/manual/nix/stable/command-ref/new-cli/nix3-fmt\.html)\.



*Type:*
null or package



*Default:*
` null `

*Declared by:*
 - [nix/store/dw345ma5l7pp3zvyc06i4239j8cfi4s9-source/modules/formatter\.nix](/nix/store/dw345ma5l7pp3zvyc06i4239j8cfi4s9-source/modules/formatter.nix)



## perSystem\.\<system>\.legacyPackages



An attribute set of unmergeable values\. This is also used by [` nix build .#<attrpath> `](https://nixos\.org/manual/nix/stable/command-ref/new-cli/nix3-build\.html)\.



*Type:*
lazy attribute set of raw value



*Default:*
` { } `

*Declared by:*
 - [nix/store/dw345ma5l7pp3zvyc06i4239j8cfi4s9-source/modules/legacyPackages\.nix](/nix/store/dw345ma5l7pp3zvyc06i4239j8cfi4s9-source/modules/legacyPackages.nix)



## perSystem\.\<system>\.nix4dev\.allowUnfreePackages



List of unfree packages to allow in the flake\.



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "terraform"
]
```

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/pkgs\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/pkgs.nix)



## perSystem\.\<system>\.nix4dev\.bash\.disable



Whether to enable bash support\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/bash\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/bash.nix)



## perSystem\.\<system>\.nix4dev\.checkCommands



The commands to execute when ‘check’ is called



*Type:*
list of path in the Nix store



*Default:*
` [ ] `



*Example:*
` [ ${pkgs.sbt}/bin/sbt prepare ] `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/shell/commands\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/shell/commands.nix)



## perSystem\.\<system>\.nix4dev\.conventionalCommits\.enable



Whether to enable conventional commits\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/conventional-commits](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/conventional-commits)



## perSystem\.\<system>\.nix4dev\.editorconfig\.disable



Whether to enable \.editorconfig generation\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/editorconfig\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/editorconfig.nix)



## perSystem\.\<system>\.nix4dev\.envrc\.watchDirectories



List of directories to watch for changes that will trigger
direnv reload\. The directories must be relative paths to the project root\.



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "./flake-modules/common"
]
```

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/shell/devshell\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/shell/devshell.nix)



## perSystem\.\<system>\.nix4dev\.flake



Configuration of nix4dev’s flake\.
For the configuration of the project’s flake see the ` nix4dev.projectFlake ` option\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/shell/devshell\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/shell/devshell.nix)



## perSystem\.\<system>\.nix4dev\.flake\.description



Flake description\. This will be set into flake’s ` description ` attribute\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "A very cool flake!" `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/shell/devshell\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/shell/devshell.nix)



## perSystem\.\<system>\.nix4dev\.flake\.extraFlakeModules



Extra flake modules to import from the generated flake\.nix file\.



*Type:*
list of string



*Default:*
` [] `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/shell/devshell\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/shell/devshell.nix)



## perSystem\.\<system>\.nix4dev\.flake\.extraInputs



Extra inputs for the flake\.
The format of this option must be attrset of valid flake inputs\.



*Type:*
attribute set of anything



*Default:*
` {} `



*Example:*

```
''
  {
    foo.url = "github:NixOS/nixpkgs/nixos-25.05";
  }
''
```

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/shell/devshell\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/shell/devshell.nix)



## perSystem\.\<system>\.nix4dev\.flake\.inputs



Inputs for the flake\.
The format of this option must be attrset of valid flake inputs\.



*Type:*
attribute set of anything



*Default:*
` { } `



*Example:*

```
''
  {
    foo.url = "github:NixOS/nixpkgs/nixos-25.05";
  }
''
```

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/shell/devshell\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/shell/devshell.nix)



## perSystem\.\<system>\.nix4dev\.flake\.modules



Flake modules to import from the generated flake\.nix file\.



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "nix4dev.flakeModules.default"
]
```

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/shell/devshell\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/shell/devshell.nix)



## perSystem\.\<system>\.nix4dev\.json\.disable



Whether to enable JSON support\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/json\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/json.nix)



## perSystem\.\<system>\.nix4dev\.managedFiles\.fileListPaths



Relative paths to the files containing list of managed files\.
All paths in the list are merged into a single list\.

This option is a list, in order to allow for easier migration when it is needed to change it’s value\.
If you want to change the value e\.g\. from ` files.list ` to ` files2.list `, you first add the ` files2.list `
value into the ` fileListPaths ` list and deprecate the ` files.list ` file\.
After the deprication period elapses (and every user updates the managed files with the ` fileListPaths ` option containing the two values),
you can safely remove the ` files.list ` value from the ` fileListPaths ` list\.



*Type:*
list of string



*Default:*

```
[
  "./.managed-files.list"
]
```



*Example:*

```
[
  "./files1.list"
]
```

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module.nix)



## perSystem\.\<system>\.nix4dev\.managedFiles\.files



Definition of managed files in the project\.
The attribute name is a relative path to the target file\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `



*Example:*

```
{
  ".envrc" = {
    source.text = "use flake";
  };
  "examples/hello" = {
    source.file = "${someFlake}/examples/hello";
  };
}

```

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module.nix)



## perSystem\.\<system>\.nix4dev\.managedFiles\.files\.\<name>\.executable



Make the file executable\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module.nix)



## perSystem\.\<system>\.nix4dev\.managedFiles\.files\.\<name>\.source



The file source\.



*Type:*
attribute-tagged union

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module.nix)



## perSystem\.\<system>\.nix4dev\.managedFiles\.files\.\<name>\.source\.file



The source for the file\.
Path in store (file or directory) which will be recursively copied over the target\.



*Type:*
path in the Nix store



*Example:*
` "../examples/hello" `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module.nix)



## perSystem\.\<system>\.nix4dev\.managedFiles\.files\.\<name>\.source\.lines



The source for the file\.
The target will be overwritten by a file with this string as content\.



*Type:*
strings concatenated with “\\n”



*Example:*

```
.direnv
target

```

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module.nix)



## perSystem\.\<system>\.nix4dev\.managedFiles\.files\.\<name>\.source\.text



The source for the file\.
The target will be overwritten by a file with this string as content\.



*Type:*
string



*Example:*
` Hello world! `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module.nix)



## perSystem\.\<system>\.nix4dev\.managedFiles\.files\.\<name>\.sourceFile



The source for the file\.
Path in store (file or directory) which will be recursively copied over the target\.
This option is guaranteed to be always defined independent of what ` source.* ` option was used\.



*Type:*
path in the Nix store *(read only)*

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module.nix)



## perSystem\.\<system>\.nix4dev\.managedFiles\.treefmt\.enable



Whether to enable the formatting of the managed files by treefmt\. If enabled, treefmt must be configured in this flake…



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module.nix)



## perSystem\.\<system>\.nix4dev\.managedFiles\.updateFiles



A script that updates the managed files in the directory given as argument\.



*Type:*
package *(read only)*

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module.nix)



## perSystem\.\<system>\.nix4dev\.managedFiles\.writeFiles



A script that (over)writes the managed files into the project\.



*Type:*
package *(read only)*

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module.nix)



## perSystem\.\<system>\.nix4dev\.markdown\.disable



Whether to enable markdown support\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/markdown\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/markdown.nix)



## perSystem\.\<system>\.nix4dev\.nixlang\.disable



Whether to enable Nix language support\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/nixlang\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/nixlang.nix)



## perSystem\.\<system>\.nix4dev\.opentofu\.enable



Whether to enable opentofu\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/terratofu\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/terratofu.nix)



## perSystem\.\<system>\.nix4dev\.overlays



Overlays to apply when constructing the pkgs from nixpkgs\.



*Type:*
list of function that evaluates to a(n) function that evaluates to a(n) (attribute set)



*Default:*
` [ ] `



*Example:*

```
''
  final: prev: {
    jdk = final.graalvm-ce;
  }
''
```

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/pkgs\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/pkgs.nix)



## perSystem\.\<system>\.nix4dev\.prepareCommands



The commands to execute when ‘prepare’ is called



*Type:*
list of path in the Nix store



*Default:*
` [ ] `



*Example:*
` [ ${pkgs.sbt}/bin/sbt prepare ] `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/shell/commands\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/shell/commands.nix)



## perSystem\.\<system>\.nix4dev\.projectFlake



Configuration of projects’s flake\.
For the configuration of the nix4dev’s flake see the ` nix4dev.flake ` option\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/project-flake](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/project-flake)



## perSystem\.\<system>\.nix4dev\.projectFlake\.enable



Whether to enable project flake\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/project-flake](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/project-flake)



## perSystem\.\<system>\.nix4dev\.projectFlake\.description



Flake description\. This will be set into flake’s ` description ` attribute\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "A very cool flake!" `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/project-flake](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/project-flake)



## perSystem\.\<system>\.nix4dev\.projectFlake\.extraFlakeModules



Extra flake modules to import from the generated flake\.nix file\.



*Type:*
list of string



*Default:*
` [] `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/project-flake](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/project-flake)



## perSystem\.\<system>\.nix4dev\.projectFlake\.extraInputs



Extra inputs for the flake\.
The format of this option must be attrset of valid flake inputs\.



*Type:*
attribute set of anything



*Default:*
` {} `



*Example:*

```
''
  {
    foo.url = "github:NixOS/nixpkgs/nixos-25.05";
  }
''
```

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/project-flake](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/project-flake)



## perSystem\.\<system>\.nix4dev\.projectFlake\.inputs



Inputs for the flake\.
The format of this option must be attrset of valid flake inputs\.



*Type:*
attribute set of anything



*Default:*
` { } `



*Example:*

```
''
  {
    foo.url = "github:NixOS/nixpkgs/nixos-25.05";
  }
''
```

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/project-flake](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/project-flake)



## perSystem\.\<system>\.nix4dev\.projectFlake\.modules



Flake modules to import from the generated flake\.nix file\.



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "nix4dev.flakeModules.default"
]
```

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/project-flake](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/project-flake)



## perSystem\.\<system>\.nix4dev\.setupCommands



The commands to execute when ‘setup’ is called



*Type:*
list of path in the Nix store



*Default:*
` [ ] `



*Example:*
` [ ${pkgs.sbt}/bin/sbt prepare ] `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/shell/commands\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/shell/commands.nix)



## perSystem\.\<system>\.nix4dev\.templates



The nix flake templates that will be provided by this project’s flake\.

Every template contains the common nix4dev files and optionally also some extra files
configured using the ` extraFiles ` option\.

The template is constructed as if a basic nix4dev devshell was initialized in a directory,
the extra files were added into the directory
and the ` setup ` command was called in such devshell\.
The default flake module provided by the nix4dev flake is imported automatically\.

The devshell (in which the setup command is run) has only the nix4dev flake as input\.
It is not possible to add other inputs\. However, it is possible to configure
the ` perSystem.nix4dev.flake.inputs ` option which will add the extra inputs into
the generated template, so they can be used in the devshells initialized using the generated template\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `



*Example:*

```
{
  default = {
    description = "A simple nix4dev template";
    extraFiles = {
      "nix4dev/flake-modules/default.nix" = {
        source = {
          text = ''
            { }
          '';
        };
      };
    };
    welcomeText = ''
      # Simple nix4dev Template

      To start using nix4dev run ...
    '';
  };
}
```

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/templates/flake-module\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/templates/flake-module.nix)



## perSystem\.\<system>\.nix4dev\.templates\.\<name>\.description



A one-line description of the template, in CommonMark syntax\.



*Type:*
string



*Example:*
` "A simple nix4dev template" `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/templates/flake-module\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/templates/flake-module.nix)



## perSystem\.\<system>\.nix4dev\.templates\.\<name>\.extraFiles



The extra files to add to this template\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `



*Example:*

```
{
  ".envrc" = {
    source.text = "use flake";
  };
  "examples/hello" = {
    source.file = "${someFlake}/examples/hello";
  };
}

```

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/templates/flake-module\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/templates/flake-module.nix)



## perSystem\.\<system>\.nix4dev\.templates\.\<name>\.extraFiles\.\<name>\.executable



Make the file executable\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module.nix)



## perSystem\.\<system>\.nix4dev\.templates\.\<name>\.extraFiles\.\<name>\.source



The file source\.



*Type:*
attribute-tagged union

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module.nix)



## perSystem\.\<system>\.nix4dev\.templates\.\<name>\.extraFiles\.\<name>\.source\.file



The source for the file\.
Path in store (file or directory) which will be recursively copied over the target\.



*Type:*
path in the Nix store



*Example:*
` "../examples/hello" `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module.nix)



## perSystem\.\<system>\.nix4dev\.templates\.\<name>\.extraFiles\.\<name>\.source\.lines



The source for the file\.
The target will be overwritten by a file with this string as content\.



*Type:*
strings concatenated with “\\n”



*Example:*

```
.direnv
target

```

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module.nix)



## perSystem\.\<system>\.nix4dev\.templates\.\<name>\.extraFiles\.\<name>\.source\.text



The source for the file\.
The target will be overwritten by a file with this string as content\.



*Type:*
string



*Example:*
` Hello world! `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module.nix)



## perSystem\.\<system>\.nix4dev\.templates\.\<name>\.extraFiles\.\<name>\.sourceFile



The source for the file\.
Path in store (file or directory) which will be recursively copied over the target\.
This option is guaranteed to be always defined independent of what ` source.* ` option was used\.



*Type:*
path in the Nix store *(read only)*

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/managed-files/flake-module.nix)



## perSystem\.\<system>\.nix4dev\.templates\.\<name>\.templateName



Name of this template\.



*Type:*
string



*Default:*
` "\${attrName}" `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/templates/flake-module\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/templates/flake-module.nix)



## perSystem\.\<system>\.nix4dev\.templates\.\<name>\.welcomeText



A block of markdown text to display when a user initializes a new flake based on this template\.



*Type:*
string



*Example:*

```
''
  # Simple nix4dev Template

  To start using nix4dev run ...
''
```

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/templates/flake-module\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/templates/flake-module.nix)



## perSystem\.\<system>\.nix4dev\.terraform\.enable



Whether to enable terraform\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/terratofu\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/terratofu.nix)



## perSystem\.\<system>\.nix4dev\.updateCommands



The commands to execute when ‘update’ is called



*Type:*
list of path in the Nix store



*Default:*
` [ ] `



*Example:*
` [ ${pkgs.sbt}/bin/sbt prepare ] `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/shell/commands\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/shell/commands.nix)



## perSystem\.\<system>\.nix4dev\.yaml\.disable



Whether to enable YAML support\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/yaml\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/nix4dev/flake-module/yaml.nix)



## perSystem\.\<system>\.test\.commandsToExecute



The commands to execute in this step\.



*Type:*
list of string

*Declared by:*
 - [nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/test-lib/flake-module/lib\.nix](/nix/store/7mqdmxczb07c6mdl01z5kzffdy0g68z5-source/flake-modules/test-lib/flake-module/lib.nix)



## perSystem\.\<system>\.treefmt



Project-level treefmt configuration

Use ` config.treefmt.build.wrapper ` to get access to the resulting treefmt
package based on this configuration\.

By default treefmt-nix will set the ` formatter.<system> ` attribute of the flake,
used by the ` nix fmt ` command\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/flake-module\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/flake-module.nix)



## perSystem\.\<system>\.treefmt\.enableDefaultExcludes



Enable the default excludes in the treefmt configuration\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options.nix)



## perSystem\.\<system>\.treefmt\.package



The treefmt package to use\.



*Type:*
package



*Default:*
` pkgs.treefmt `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options.nix)



## perSystem\.\<system>\.treefmt\.build\.check



Create a flake check to test that the given project tree is already
formatted\.

Input argument is the path to the project tree (usually ‘self’)\.



*Type:*
function that evaluates to a(n) package



*Default:*
Default check implementation

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options.nix)



## perSystem\.\<system>\.treefmt\.build\.configFile



Contains the generated config file derived from the settings\.



*Type:*
absolute path

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options.nix)



## perSystem\.\<system>\.treefmt\.build\.devShell

The development shell with treefmt and its underlying programs



*Type:*
package *(read only)*

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options.nix)



## perSystem\.\<system>\.treefmt\.build\.programs



Attrset of formatter programs enabled in treefmt configuration\.

The key of the attrset is the formatter name, with the value being the
package used to do the formatting\.



*Type:*
attribute set of package



*Default:*
Programs used in configuration

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options.nix)



## perSystem\.\<system>\.treefmt\.build\.wrapper



The treefmt package, wrapped with the config file\.



*Type:*
package



*Default:*
wrapped ` treefmt ` command

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options.nix)



## perSystem\.\<system>\.treefmt\.flakeCheck



Add a flake check to run ` treefmt `



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/flake-module\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/flake-module.nix)



## perSystem\.\<system>\.treefmt\.flakeFormatter



Enables ` treefmt ` the default formatter used by the ` nix fmt ` command



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/flake-module\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/flake-module.nix)



## perSystem\.\<system>\.treefmt\.pkgs



Nixpkgs to use in ` treefmt `\.



*Type:*
lazy attribute set of raw value



*Default:*
` pkgs ` (module argument of ` perSystem `)

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/flake-module\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/flake-module.nix)
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/flake-module\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/flake-module.nix)



## perSystem\.\<system>\.treefmt\.programs\.actionlint\.enable



Whether to enable actionlint\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/actionlint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/actionlint.nix)



## perSystem\.\<system>\.treefmt\.programs\.actionlint\.package



The actionlint package to use\.



*Type:*
package



*Default:*
` pkgs.actionlint `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/actionlint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/actionlint.nix)



## perSystem\.\<system>\.treefmt\.programs\.actionlint\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/actionlint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/actionlint.nix)



## perSystem\.\<system>\.treefmt\.programs\.actionlint\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  ".github/workflows/*.yml"
  ".github/workflows/*.yaml"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/actionlint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/actionlint.nix)



## perSystem\.\<system>\.treefmt\.programs\.actionlint\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/actionlint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/actionlint.nix)



## perSystem\.\<system>\.treefmt\.programs\.aiken\.enable



Whether to enable aiken\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/aiken\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/aiken.nix)



## perSystem\.\<system>\.treefmt\.programs\.aiken\.package



The aiken package to use\.



*Type:*
package



*Default:*
` pkgs.aiken `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/aiken\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/aiken.nix)



## perSystem\.\<system>\.treefmt\.programs\.aiken\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/aiken\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/aiken.nix)



## perSystem\.\<system>\.treefmt\.programs\.aiken\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.ak"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/aiken\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/aiken.nix)



## perSystem\.\<system>\.treefmt\.programs\.aiken\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/aiken\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/aiken.nix)



## perSystem\.\<system>\.treefmt\.programs\.alejandra\.enable



Whether to enable alejandra\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/alejandra\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/alejandra.nix)



## perSystem\.\<system>\.treefmt\.programs\.alejandra\.package



The alejandra package to use\.



*Type:*
package



*Default:*
` pkgs.alejandra `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/alejandra\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/alejandra.nix)



## perSystem\.\<system>\.treefmt\.programs\.alejandra\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/alejandra\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/alejandra.nix)



## perSystem\.\<system>\.treefmt\.programs\.alejandra\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.nix"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/alejandra\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/alejandra.nix)



## perSystem\.\<system>\.treefmt\.programs\.alejandra\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/alejandra\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/alejandra.nix)



## perSystem\.\<system>\.treefmt\.programs\.asmfmt\.enable



Whether to enable asmfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/asmfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/asmfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.asmfmt\.package



The asmfmt package to use\.



*Type:*
package



*Default:*
` pkgs.asmfmt `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/asmfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/asmfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.asmfmt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/asmfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/asmfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.asmfmt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.s"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/asmfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/asmfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.asmfmt\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/asmfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/asmfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.autocorrect\.enable



Whether to enable autocorrect\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect.nix)



## perSystem\.\<system>\.treefmt\.programs\.autocorrect\.package



The autocorrect package to use\.



*Type:*
package



*Default:*
` pkgs.autocorrect `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect.nix)



## perSystem\.\<system>\.treefmt\.programs\.autocorrect\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect.nix)



## perSystem\.\<system>\.treefmt\.programs\.autocorrect\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect.nix)



## perSystem\.\<system>\.treefmt\.programs\.autocorrect\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect.nix)



## perSystem\.\<system>\.treefmt\.programs\.autocorrect\.settings\.context



Enable or disable in a specific context\.



*Type:*
null or (submodule)



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect.nix)



## perSystem\.\<system>\.treefmt\.programs\.autocorrect\.settings\.context\.codeblock



Enable or disable to format codeblock in Markdown or AsciiDoc etc\.



*Type:*
null or one of “off”, “error”, “warning”



*Default:*
` null `



*Example:*
` "error" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect.nix)



## perSystem\.\<system>\.treefmt\.programs\.autocorrect\.settings\.fileTypes



Configure the files associations, you config is higher priority than default\.



*Type:*
null or (attribute set of string)



*Default:*
` null `



*Example:*

```
{
  "*.js" = "javascript";
  ".mdx" = "markdown";
  Rakefile = "ruby";
  rb = "ruby";
}
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect.nix)



## perSystem\.\<system>\.treefmt\.programs\.autocorrect\.settings\.rules



Configure rules for autocorrect formatting\.



*Type:*
null or (submodule)



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect.nix)



## perSystem\.\<system>\.treefmt\.programs\.autocorrect\.settings\.rules\.fullwidth



Convert to fullwidth\.



*Type:*
null or one of “off”, “error”, “warning”



*Default:*
` null `



*Example:*
` "error" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect.nix)



## perSystem\.\<system>\.treefmt\.programs\.autocorrect\.settings\.rules\.halfwidth-punctuation



Fullwidth punctuations to halfwidth in english\.



*Type:*
null or one of “off”, “error”, “warning”



*Default:*
` null `



*Example:*
` "error" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect.nix)



## perSystem\.\<system>\.treefmt\.programs\.autocorrect\.settings\.rules\.halfwidth-word



Fullwidth alphanumeric characters to halfwidth\.



*Type:*
null or one of “off”, “error”, “warning”



*Default:*
` null `



*Example:*
` "error" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect.nix)



## perSystem\.\<system>\.treefmt\.programs\.autocorrect\.settings\.rules\.no-space-fullwidth



Remove space near the fullwidth\.



*Type:*
null or one of “off”, “error”, “warning”



*Default:*
` null `



*Example:*
` "error" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect.nix)



## perSystem\.\<system>\.treefmt\.programs\.autocorrect\.settings\.rules\.space-backticks



Add space between \`\`, when near the CJK\.



*Type:*
null or one of “off”, “error”, “warning”



*Default:*
` null `



*Example:*
` "error" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect.nix)



## perSystem\.\<system>\.treefmt\.programs\.autocorrect\.settings\.rules\.space-bracket



Add space between brackets (), \[] when near the CJK\.



*Type:*
null or one of “off”, “error”, “warning”



*Default:*
` null `



*Example:*
` "error" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect.nix)



## perSystem\.\<system>\.treefmt\.programs\.autocorrect\.settings\.rules\.space-dash



Add space between dash ` - `\.



*Type:*
null or one of “off”, “error”, “warning”



*Default:*
` null `



*Example:*
` "off" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect.nix)



## perSystem\.\<system>\.treefmt\.programs\.autocorrect\.settings\.rules\.space-dollar



Add space between dollar $ when near the CJK\.



*Type:*
null or one of “off”, “error”, “warning”



*Default:*
` null `



*Example:*
` "off" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect.nix)



## perSystem\.\<system>\.treefmt\.programs\.autocorrect\.settings\.rules\.space-punctuation



Add space between some punctuations\.



*Type:*
null or one of “off”, “error”, “warning”



*Default:*
` null `



*Example:*
` "error" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect.nix)



## perSystem\.\<system>\.treefmt\.programs\.autocorrect\.settings\.rules\.space-word



Auto add spacing between CJK (Chinese, Japanese, Korean) and English words\.



*Type:*
null or one of “off”, “error”, “warning”



*Default:*
` null `



*Example:*
` "off" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect.nix)



## perSystem\.\<system>\.treefmt\.programs\.autocorrect\.settings\.rules\.spellcheck



Spellcheck\.



*Type:*
null or one of “off”, “error”, “warning”



*Default:*
` null `



*Example:*
` "warning" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect.nix)



## perSystem\.\<system>\.treefmt\.programs\.autocorrect\.settings\.spellcheck



Spellcheck configuration\.



*Type:*
null or (submodule)



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect.nix)



## perSystem\.\<system>\.treefmt\.programs\.autocorrect\.settings\.spellcheck\.words



Correct Words (Case insensitive) for by Spellcheck\.



*Type:*
null or (list of string)



*Default:*
` null `



*Example:*

```
[
  "GitHub"
  "App Store"
  "AppStore = App Store"
  "Git"
  "Node.js"
  "nodejs = Node.js"
  "VIM"
  "DNS"
  "HTTP"
  "SSL"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect.nix)



## perSystem\.\<system>\.treefmt\.programs\.autocorrect\.settings\.textRules



Configure special rules for some texts\.



*Type:*
null or (attribute set of (null or one of “off”, “error”, “warning”))



*Default:*
` null `



*Example:*

```
{
  "Hello你好" = "warning";
  "Hi你好" = "off";
}
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect.nix)



## perSystem\.\<system>\.treefmt\.programs\.autocorrect\.threads



Number of threads, 0 - use number of CPU\. \[default: 0]



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 2 `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/autocorrect.nix)



## perSystem\.\<system>\.treefmt\.programs\.beautysh\.enable



Whether to enable beautysh\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/beautysh\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/beautysh.nix)



## perSystem\.\<system>\.treefmt\.programs\.beautysh\.package



The beautysh package to use\.



*Type:*
package



*Default:*
` pkgs.beautysh `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/beautysh\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/beautysh.nix)



## perSystem\.\<system>\.treefmt\.programs\.beautysh\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/beautysh\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/beautysh.nix)



## perSystem\.\<system>\.treefmt\.programs\.beautysh\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.sh"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/beautysh\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/beautysh.nix)



## perSystem\.\<system>\.treefmt\.programs\.beautysh\.indent_size



Sets the number of spaces to be used in indentation\.



*Type:*
signed integer



*Default:*
` 2 `



*Example:*
` 4 `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/beautysh\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/beautysh.nix)



## perSystem\.\<system>\.treefmt\.programs\.beautysh\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/beautysh\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/beautysh.nix)



## perSystem\.\<system>\.treefmt\.programs\.biome\.enable



Whether to enable biome\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/biome\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/biome.nix)



## perSystem\.\<system>\.treefmt\.programs\.biome\.package



The biome package to use\.



*Type:*
package



*Default:*
` pkgs.biome `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/biome\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/biome.nix)



## perSystem\.\<system>\.treefmt\.programs\.biome\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/biome\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/biome.nix)



## perSystem\.\<system>\.treefmt\.programs\.biome\.formatCommand



The command to run Biome with\.



*Type:*
one of “format”, “lint”, “check”



*Default:*
` "check" `



*Example:*
` "format" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/biome\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/biome.nix)



## perSystem\.\<system>\.treefmt\.programs\.biome\.formatUnsafe



Allows to format a document that has unsafe fixes\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/biome\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/biome.nix)



## perSystem\.\<system>\.treefmt\.programs\.biome\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.js"
  "*.ts"
  "*.mjs"
  "*.mts"
  "*.cjs"
  "*.cts"
  "*.jsx"
  "*.tsx"
  "*.d.ts"
  "*.d.cts"
  "*.d.mts"
  "*.json"
  "*.jsonc"
  "*.css"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/biome\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/biome.nix)



## perSystem\.\<system>\.treefmt\.programs\.biome\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/biome\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/biome.nix)



## perSystem\.\<system>\.treefmt\.programs\.biome\.settings



Raw Biome configuration (must conform to Biome JSON schema)



*Type:*
attribute set of anything



*Default:*
` { } `



*Example:*

```
{
  formatter = {
    indentStyle = "space";
    lineWidth = 100;
  };
  javascript = {
    formatter = {
      lineWidth = 120;
      quoteStyle = "single";
    };
  };
  json = {
    formatter = {
      enabled = false;
    };
  };
}
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/biome\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/biome.nix)



## perSystem\.\<system>\.treefmt\.programs\.black\.enable



Whether to enable black\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/black\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/black.nix)



## perSystem\.\<system>\.treefmt\.programs\.black\.package



The black package to use\.



*Type:*
package



*Default:*
` pkgs.black `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/black\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/black.nix)



## perSystem\.\<system>\.treefmt\.programs\.black\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/black\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/black.nix)



## perSystem\.\<system>\.treefmt\.programs\.black\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.py"
  "*.pyi"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/black\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/black.nix)



## perSystem\.\<system>\.treefmt\.programs\.black\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/black\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/black.nix)



## perSystem\.\<system>\.treefmt\.programs\.buf\.enable



Whether to enable buf\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/buf\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/buf.nix)



## perSystem\.\<system>\.treefmt\.programs\.buf\.package



The buf package to use\.



*Type:*
package



*Default:*
` pkgs.buf `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/buf\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/buf.nix)



## perSystem\.\<system>\.treefmt\.programs\.buf\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/buf\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/buf.nix)



## perSystem\.\<system>\.treefmt\.programs\.buf\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.proto"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/buf\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/buf.nix)



## perSystem\.\<system>\.treefmt\.programs\.buf\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/buf\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/buf.nix)



## perSystem\.\<system>\.treefmt\.programs\.buildifier\.enable



Whether to enable buildifier\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/buildifier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/buildifier.nix)



## perSystem\.\<system>\.treefmt\.programs\.buildifier\.package



The buildifier package to use\.



*Type:*
package



*Default:*
` pkgs.buildifier `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/buildifier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/buildifier.nix)



## perSystem\.\<system>\.treefmt\.programs\.buildifier\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/buildifier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/buildifier.nix)



## perSystem\.\<system>\.treefmt\.programs\.buildifier\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.bazel"
  "*.bzl"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/buildifier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/buildifier.nix)



## perSystem\.\<system>\.treefmt\.programs\.buildifier\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/buildifier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/buildifier.nix)



## perSystem\.\<system>\.treefmt\.programs\.cabal-fmt\.enable



Whether to enable cabal-fmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cabal-fmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cabal-fmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.cabal-fmt\.package



The cabal-fmt package to use\.



*Type:*
package



*Default:*
` pkgs.haskellPackages.cabal-fmt `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cabal-fmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cabal-fmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.cabal-fmt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cabal-fmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cabal-fmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.cabal-fmt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.cabal"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cabal-fmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cabal-fmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.cabal-fmt\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cabal-fmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cabal-fmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.cabal-gild\.enable



Whether to enable cabal-gild\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cabal-gild\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cabal-gild.nix)



## perSystem\.\<system>\.treefmt\.programs\.cabal-gild\.package



The cabal-gild package to use\.



*Type:*
package



*Default:*
` pkgs.haskellPackages.cabal-gild `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cabal-gild\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cabal-gild.nix)



## perSystem\.\<system>\.treefmt\.programs\.cabal-gild\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cabal-gild\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cabal-gild.nix)



## perSystem\.\<system>\.treefmt\.programs\.cabal-gild\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.cabal"
  "cabal.project"
  "cabal.project.local"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cabal-gild\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cabal-gild.nix)



## perSystem\.\<system>\.treefmt\.programs\.cabal-gild\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cabal-gild\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cabal-gild.nix)



## perSystem\.\<system>\.treefmt\.programs\.clang-format\.enable



Whether to enable clang-format\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/clang-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/clang-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.clang-format\.package



The clang-tools package to use\.



*Type:*
package



*Default:*
` pkgs.clang-tools `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/clang-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/clang-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.clang-format\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/clang-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/clang-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.clang-format\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.c"
  "*.cc"
  "*.cpp"
  "*.h"
  "*.hh"
  "*.hpp"
  "*.glsl"
  "*.vert"
  ".tesc"
  ".tese"
  ".geom"
  ".frag"
  ".comp"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/clang-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/clang-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.clang-format\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/clang-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/clang-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.cljfmt\.enable



Whether to enable cljfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cljfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cljfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.cljfmt\.package



The cljfmt package to use\.



*Type:*
package



*Default:*
` pkgs.cljfmt `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cljfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cljfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.cljfmt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cljfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cljfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.cljfmt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.clj"
  "*.cljc"
  "*.cljs"
  "*.cljx"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cljfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cljfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.cljfmt\.priority

Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cljfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cljfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.cmake-format\.enable



Whether to enable cmake-format\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cmake-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cmake-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.cmake-format\.package



The cmake-format package to use\.



*Type:*
package



*Default:*
` pkgs.cmake-format `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cmake-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cmake-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.cmake-format\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cmake-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cmake-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.cmake-format\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.cmake"
  "CMakeLists.txt"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cmake-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cmake-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.cmake-format\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cmake-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cmake-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.csharpier\.enable



Whether to enable csharpier\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/csharpier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/csharpier.nix)



## perSystem\.\<system>\.treefmt\.programs\.csharpier\.package



The csharpier package to use\.



*Type:*
package



*Default:*
` pkgs.csharpier `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/csharpier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/csharpier.nix)



## perSystem\.\<system>\.treefmt\.programs\.csharpier\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/csharpier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/csharpier.nix)



## perSystem\.\<system>\.treefmt\.programs\.csharpier\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.cs"
  "*.csproj"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/csharpier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/csharpier.nix)



## perSystem\.\<system>\.treefmt\.programs\.csharpier\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/csharpier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/csharpier.nix)



## perSystem\.\<system>\.treefmt\.programs\.cue\.enable



Whether to enable cue\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cue\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cue.nix)



## perSystem\.\<system>\.treefmt\.programs\.cue\.package



The cue package to use\.



*Type:*
package



*Default:*
` pkgs.cue `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cue\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cue.nix)



## perSystem\.\<system>\.treefmt\.programs\.cue\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cue\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cue.nix)



## perSystem\.\<system>\.treefmt\.programs\.cue\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.cue"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cue\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cue.nix)



## perSystem\.\<system>\.treefmt\.programs\.cue\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cue\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/cue.nix)



## perSystem\.\<system>\.treefmt\.programs\.d2\.enable



Whether to enable d2\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/d2\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/d2.nix)



## perSystem\.\<system>\.treefmt\.programs\.d2\.package



The d2 package to use\.



*Type:*
package



*Default:*
` pkgs.d2 `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/d2\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/d2.nix)



## perSystem\.\<system>\.treefmt\.programs\.d2\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/d2\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/d2.nix)



## perSystem\.\<system>\.treefmt\.programs\.d2\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.d2"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/d2\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/d2.nix)



## perSystem\.\<system>\.treefmt\.programs\.d2\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/d2\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/d2.nix)



## perSystem\.\<system>\.treefmt\.programs\.dart-format\.enable



Whether to enable dart-format\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dart-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dart-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.dart-format\.package



The dart package to use\.



*Type:*
package



*Default:*
` pkgs.dart `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dart-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dart-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.dart-format\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dart-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dart-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.dart-format\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.dart"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dart-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dart-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.dart-format\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dart-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dart-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.deadnix\.enable



Whether to enable deadnix\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/deadnix\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/deadnix.nix)



## perSystem\.\<system>\.treefmt\.programs\.deadnix\.package



The deadnix package to use\.



*Type:*
package



*Default:*
` pkgs.deadnix `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/deadnix\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/deadnix.nix)



## perSystem\.\<system>\.treefmt\.programs\.deadnix\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/deadnix\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/deadnix.nix)



## perSystem\.\<system>\.treefmt\.programs\.deadnix\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.nix"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/deadnix\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/deadnix.nix)



## perSystem\.\<system>\.treefmt\.programs\.deadnix\.no-lambda-arg



Whether to enable Don’t check lambda parameter arguments\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/deadnix\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/deadnix.nix)



## perSystem\.\<system>\.treefmt\.programs\.deadnix\.no-lambda-pattern-names



Whether to enable Don’t check lambda attrset pattern names (don’t break nixpkgs callPackage)\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/deadnix\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/deadnix.nix)



## perSystem\.\<system>\.treefmt\.programs\.deadnix\.no-underscore



Whether to enable Don’t check any bindings that start with a _\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/deadnix\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/deadnix.nix)



## perSystem\.\<system>\.treefmt\.programs\.deadnix\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/deadnix\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/deadnix.nix)



## perSystem\.\<system>\.treefmt\.programs\.deno\.enable



Whether to enable deno\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/deno\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/deno.nix)



## perSystem\.\<system>\.treefmt\.programs\.deno\.package



The deno package to use\.



*Type:*
package



*Default:*
` pkgs.deno `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/deno\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/deno.nix)



## perSystem\.\<system>\.treefmt\.programs\.deno\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/deno\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/deno.nix)



## perSystem\.\<system>\.treefmt\.programs\.deno\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.css"
  "*.html"
  "*.js"
  "*.json"
  "*.jsonc"
  "*.jsx"
  "*.less"
  "*.markdown"
  "*.md"
  "*.sass"
  "*.scss"
  "*.ts"
  "*.tsx"
  "*.yaml"
  "*.yml"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/deno\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/deno.nix)



## perSystem\.\<system>\.treefmt\.programs\.deno\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/deno\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/deno.nix)



## perSystem\.\<system>\.treefmt\.programs\.dhall\.enable



Whether to enable dhall\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dhall\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dhall.nix)



## perSystem\.\<system>\.treefmt\.programs\.dhall\.package



The dhall package to use\.



*Type:*
package



*Default:*
` pkgs.dhall `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dhall\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dhall.nix)



## perSystem\.\<system>\.treefmt\.programs\.dhall\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dhall\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dhall.nix)



## perSystem\.\<system>\.treefmt\.programs\.dhall\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.dhall"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dhall\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dhall.nix)



## perSystem\.\<system>\.treefmt\.programs\.dhall\.lint



Whether to lint in addition to formatting\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dhall\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dhall.nix)



## perSystem\.\<system>\.treefmt\.programs\.dhall\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dhall\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dhall.nix)



## perSystem\.\<system>\.treefmt\.programs\.dnscontrol\.enable



Whether to enable dnscontrol\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dnscontrol\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dnscontrol.nix)



## perSystem\.\<system>\.treefmt\.programs\.dnscontrol\.package



The dnscontrol package to use\.



*Type:*
package



*Default:*
` pkgs.dnscontrol `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dnscontrol\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dnscontrol.nix)



## perSystem\.\<system>\.treefmt\.programs\.dnscontrol\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dnscontrol\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dnscontrol.nix)



## perSystem\.\<system>\.treefmt\.programs\.dnscontrol\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "dnsconfig.js"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dnscontrol\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dnscontrol.nix)



## perSystem\.\<system>\.treefmt\.programs\.dnscontrol\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dnscontrol\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dnscontrol.nix)



## perSystem\.\<system>\.treefmt\.programs\.dockerfmt\.enable



Whether to enable dockerfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dockerfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dockerfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.dockerfmt\.package



The dockerfmt package to use\.



*Type:*
package



*Default:*
` pkgs.dockerfmt `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dockerfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dockerfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.dockerfmt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dockerfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dockerfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.dockerfmt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*/Dockerfile"
  "*.dockerfile"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dockerfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dockerfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.dockerfmt\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dockerfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dockerfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.dockfmt\.enable



Whether to enable dockfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dockfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dockfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.dockfmt\.package



The dockfmt package to use\.



*Type:*
package



*Default:*
` pkgs.dockfmt `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dockfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dockfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.dockfmt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dockfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dockfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.dockfmt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "Dockerfile"
  "*.Dockerfile"
  "Dockerfile.*"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dockfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dockfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.dockfmt\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dockfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dockfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.dos2unix\.enable



Whether to enable dos2unix\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dos2unix\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dos2unix.nix)



## perSystem\.\<system>\.treefmt\.programs\.dos2unix\.package



The dos2unix package to use\.



*Type:*
package



*Default:*
` pkgs.dos2unix `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dos2unix\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dos2unix.nix)



## perSystem\.\<system>\.treefmt\.programs\.dos2unix\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dos2unix\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dos2unix.nix)



## perSystem\.\<system>\.treefmt\.programs\.dos2unix\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dos2unix\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dos2unix.nix)



## perSystem\.\<system>\.treefmt\.programs\.dos2unix\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dos2unix\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dos2unix.nix)



## perSystem\.\<system>\.treefmt\.programs\.dprint\.enable



Whether to enable dprint\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dprint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dprint.nix)



## perSystem\.\<system>\.treefmt\.programs\.dprint\.package



The dprint package to use\.



*Type:*
package



*Default:*
` pkgs.dprint `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dprint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dprint.nix)



## perSystem\.\<system>\.treefmt\.programs\.dprint\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dprint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dprint.nix)



## perSystem\.\<system>\.treefmt\.programs\.dprint\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  ".*"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dprint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dprint.nix)



## perSystem\.\<system>\.treefmt\.programs\.dprint\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dprint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dprint.nix)



## perSystem\.\<system>\.treefmt\.programs\.dprint\.settings



Configuration to generate dprint\.json with



*Type:*
JSON value



*Default:*
` { } `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dprint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dprint.nix)



## perSystem\.\<system>\.treefmt\.programs\.dprint\.settings\.extends



Configurations to extend\.



*Type:*
null or string or list of string



*Default:*
` null `



*Example:*
` "https://dprint.dev/path/to/config/file.v1.json" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dprint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dprint.nix)



## perSystem\.\<system>\.treefmt\.programs\.dprint\.settings\.incremental



Whether to format files only when they change\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dprint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dprint.nix)



## perSystem\.\<system>\.treefmt\.programs\.dprint\.settings\.indentWidth



The number of characters for an indent



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 2 `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dprint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dprint.nix)



## perSystem\.\<system>\.treefmt\.programs\.dprint\.settings\.lineWidth



The width of a line the printer will try to stay under\. Note that the
printer may exceed this width in certain cases\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 80 `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dprint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dprint.nix)



## perSystem\.\<system>\.treefmt\.programs\.dprint\.settings\.newLineKind



The kind of newline to use (one of: auto, crlf, lf, system)\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "auto" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dprint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dprint.nix)



## perSystem\.\<system>\.treefmt\.programs\.dprint\.settings\.plugins



Array of plugin URLs to format files\.



*Type:*
null or (list of string)



*Default:*
` null `



*Example:*

```
# (recommended) using plugins from nixpkgs
# plugins is the list of all available dprint plugins in nixpkgs
(pkgs.dprint-plugins.getPluginList (
  plugins: with plugins; [
    dprint-plugin-toml
    dprint-plugin-dockerfile
    g-plane-pretty_yaml
    # (pkgs.callPackage ./dprint/plugins/sample.nix {})
  ]
))
# (not recommended) using url plugins
# treefmt then only works outside the nix sandbox, so treefmt nix flake check will fail
++ [
  "https://plugins.dprint.dev/json-0.17.2.wasm"
  "https://plugins.dprint.dev/markdown-0.15.2.wasm"
  "https://plugins.dprint.dev/typescript-0.84.4.wasm"
]

```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dprint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dprint.nix)



## perSystem\.\<system>\.treefmt\.programs\.dprint\.settings\.useTabs



Whether to use tabs (true) or spaces (false) for indentation\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dprint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/dprint.nix)



## perSystem\.\<system>\.treefmt\.programs\.efmt\.enable



Whether to enable efmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/efmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/efmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.efmt\.package



The efmt package to use\.



*Type:*
package



*Default:*
` pkgs.efmt `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/efmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/efmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.efmt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/efmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/efmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.efmt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.erl"
  "*.hrl"
  "*.app"
  "*.app.src"
  "*.config"
  "*.script"
  "*.escript"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/efmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/efmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.efmt\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/efmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/efmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.elm-format\.enable



Whether to enable elm-format\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/elm-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/elm-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.elm-format\.package



The elm-format package to use\.



*Type:*
package



*Default:*
` pkgs.elmPackages.elm-format `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/elm-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/elm-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.elm-format\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/elm-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/elm-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.elm-format\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.elm"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/elm-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/elm-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.elm-format\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/elm-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/elm-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.erlfmt\.enable



Whether to enable erlfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/erlfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/erlfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.erlfmt\.package



The erlfmt package to use\.



*Type:*
package



*Default:*
` pkgs.erlfmt `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/erlfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/erlfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.erlfmt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/erlfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/erlfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.erlfmt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.erl"
  "*.hrl"
  "*.app"
  "*.app.src"
  "*.config"
  "*.script"
  "*.escript"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/erlfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/erlfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.erlfmt\.print-width



The line length that formatter would wrap on



*Type:*
signed integer



*Default:*
` 100 `



*Example:*
` 80 `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/erlfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/erlfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.erlfmt\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/erlfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/erlfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.fantomas\.enable



Whether to enable fantomas\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fantomas\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fantomas.nix)



## perSystem\.\<system>\.treefmt\.programs\.fantomas\.package



The fantomas package to use\.



*Type:*
package



*Default:*
` pkgs.fantomas `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fantomas\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fantomas.nix)



## perSystem\.\<system>\.treefmt\.programs\.fantomas\.dotnet-sdk



The dotnet-sdk package to use\.



*Type:*
package



*Default:*
` pkgs.dotnet-sdk `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fantomas\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fantomas.nix)



## perSystem\.\<system>\.treefmt\.programs\.fantomas\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fantomas\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fantomas.nix)



## perSystem\.\<system>\.treefmt\.programs\.fantomas\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.fs"
  "*.fsx"
  "*.fsi"
  "*.ml"
  "*.mli"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fantomas\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fantomas.nix)



## perSystem\.\<system>\.treefmt\.programs\.fantomas\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fantomas\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fantomas.nix)



## perSystem\.\<system>\.treefmt\.programs\.fish_indent\.enable

Whether to enable fish_indent\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fish_indent\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fish_indent.nix)



## perSystem\.\<system>\.treefmt\.programs\.fish_indent\.package



The fish package to use\.



*Type:*
package



*Default:*
` pkgs.fish `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fish_indent\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fish_indent.nix)



## perSystem\.\<system>\.treefmt\.programs\.fish_indent\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fish_indent\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fish_indent.nix)



## perSystem\.\<system>\.treefmt\.programs\.fish_indent\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.fish"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fish_indent\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fish_indent.nix)



## perSystem\.\<system>\.treefmt\.programs\.fish_indent\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fish_indent\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fish_indent.nix)



## perSystem\.\<system>\.treefmt\.programs\.fnlfmt\.enable



Whether to enable fnlfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fnlfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fnlfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.fnlfmt\.package



The fnlfmt package to use\.



*Type:*
package



*Default:*
` pkgs.fnlfmt `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fnlfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fnlfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.fnlfmt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fnlfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fnlfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.fnlfmt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.fnl"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fnlfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fnlfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.fnlfmt\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fnlfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fnlfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.formatjson5\.enable



Whether to enable formatjson5\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/formatjson5\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/formatjson5.nix)



## perSystem\.\<system>\.treefmt\.programs\.formatjson5\.package



The formatjson5 package to use\.



*Type:*
package



*Default:*
` pkgs.formatjson5 `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/formatjson5\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/formatjson5.nix)



## perSystem\.\<system>\.treefmt\.programs\.formatjson5\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/formatjson5\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/formatjson5.nix)



## perSystem\.\<system>\.treefmt\.programs\.formatjson5\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.json5"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/formatjson5\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/formatjson5.nix)



## perSystem\.\<system>\.treefmt\.programs\.formatjson5\.indent



Indent by the given number of spaces



*Type:*
signed integer



*Default:*
` 4 `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/formatjson5\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/formatjson5.nix)



## perSystem\.\<system>\.treefmt\.programs\.formatjson5\.noTrailingCommas



Suppress trailing commas (otherwise added by default)



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/formatjson5\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/formatjson5.nix)



## perSystem\.\<system>\.treefmt\.programs\.formatjson5\.oneElementLines



Objects or arrays with a single child should collapse to a single line



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/formatjson5\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/formatjson5.nix)



## perSystem\.\<system>\.treefmt\.programs\.formatjson5\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/formatjson5\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/formatjson5.nix)



## perSystem\.\<system>\.treefmt\.programs\.formatjson5\.sortArrays



Sort arrays of primitive values (string, number, boolean, or null) lexicographically



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/formatjson5\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/formatjson5.nix)



## perSystem\.\<system>\.treefmt\.programs\.fourmolu\.enable



Whether to enable fourmolu\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fourmolu\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fourmolu.nix)



## perSystem\.\<system>\.treefmt\.programs\.fourmolu\.package



The fourmolu package to use\.



*Type:*
package



*Default:*
` pkgs.haskellPackages.fourmolu `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fourmolu\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fourmolu.nix)



## perSystem\.\<system>\.treefmt\.programs\.fourmolu\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fourmolu\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fourmolu.nix)



## perSystem\.\<system>\.treefmt\.programs\.fourmolu\.ghcOpts



Which GHC language extensions to enable



*Type:*
unspecified value



*Default:*

```
[
  "BangPatterns"
  "PatternSynonyms"
  "TypeApplications"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fourmolu\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fourmolu.nix)



## perSystem\.\<system>\.treefmt\.programs\.fourmolu\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.hs"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fourmolu\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fourmolu.nix)



## perSystem\.\<system>\.treefmt\.programs\.fourmolu\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fourmolu\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fourmolu.nix)



## perSystem\.\<system>\.treefmt\.programs\.fprettify\.enable



Whether to enable fprettify\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fprettify\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fprettify.nix)



## perSystem\.\<system>\.treefmt\.programs\.fprettify\.package



The fprettify package to use\.



*Type:*
package



*Default:*
` pkgs.fprettify `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fprettify\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fprettify.nix)



## perSystem\.\<system>\.treefmt\.programs\.fprettify\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fprettify\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fprettify.nix)



## perSystem\.\<system>\.treefmt\.programs\.fprettify\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.f90"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fprettify\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fprettify.nix)



## perSystem\.\<system>\.treefmt\.programs\.fprettify\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fprettify\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/fprettify.nix)



## perSystem\.\<system>\.treefmt\.programs\.gdformat\.enable



Whether to enable gdformat\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gdformat\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gdformat.nix)



## perSystem\.\<system>\.treefmt\.programs\.gdformat\.package



The gdtoolkit_4 package to use\.



*Type:*
package



*Default:*
` pkgs.gdtoolkit_4 `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gdformat\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gdformat.nix)



## perSystem\.\<system>\.treefmt\.programs\.gdformat\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gdformat\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gdformat.nix)



## perSystem\.\<system>\.treefmt\.programs\.gdformat\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.gd"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gdformat\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gdformat.nix)



## perSystem\.\<system>\.treefmt\.programs\.gdformat\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gdformat\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gdformat.nix)



## perSystem\.\<system>\.treefmt\.programs\.genemichaels\.enable



Whether to enable [` genemichaels `](https://github\.com/andrewbaxter/genemichaels/blob/master/readme_genemichaels\.md), a Rust code formatter\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels.nix)



## perSystem\.\<system>\.treefmt\.programs\.genemichaels\.package



The genemichaels package to use\.



*Type:*
package



*Default:*
` pkgs.genemichaels `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels.nix)



## perSystem\.\<system>\.treefmt\.programs\.genemichaels\.excludes



Path / file patterns to exclude for genemichaels\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels.nix)



## perSystem\.\<system>\.treefmt\.programs\.genemichaels\.includes



Path / file patterns to include for genemichaels\.



*Type:*
list of string



*Default:*

```
[
  "*.rs"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels.nix)



## perSystem\.\<system>\.treefmt\.programs\.genemichaels\.settings\.comment_errors_fatal



If reformatting comments results in an error, abort formatting the
document\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels.nix)



## perSystem\.\<system>\.treefmt\.programs\.genemichaels\.settings\.comment_width



Maximum relative line length for comments (past the comment
indentation level)\. Can be ` null ` to disable relative wrapping\. If
disabled, still wraps at ` max_width `\.



*Type:*
null or (positive integer, meaning >0)



*Default:*
` 80 `



*Example:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels.nix)



## perSystem\.\<system>\.treefmt\.programs\.genemichaels\.settings\.keep_max_blank_lines



Genemichaels will replace line breaks with it’s own deterministic
line breaks\. You can use this to keep extra line breaks (1 will keep
up to 1 extra line break) during comment extraction\. This is unused
during formatting\.



*Type:*
unsigned integer, meaning >=0



*Default:*
` 0 `



*Example:*
` 1 `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels.nix)



## perSystem\.\<system>\.treefmt\.programs\.genemichaels\.settings\.max_width



Ideal maximum line width\. If there’s an unbreakable element the line
won’t be split\.



*Type:*
positive integer, meaning >0



*Default:*
` 120 `



*Example:*
` 80 `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels.nix)



## perSystem\.\<system>\.treefmt\.programs\.genemichaels\.settings\.root_splits



When breaking a child element, also break all parent elements\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels.nix)



## perSystem\.\<system>\.treefmt\.programs\.genemichaels\.settings\.split_attributes



Break a ` #[] ` on a separate line before the element it’s associated
with\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels.nix)



## perSystem\.\<system>\.treefmt\.programs\.genemichaels\.settings\.split_brace_threshold



Break a ` () ` or ` {} ` if it has greater than this number of children\.
Set to ` null ` to disable breaking due to high child counts\.



*Type:*
null or (positive integer, meaning >0)



*Default:*
` 1 `



*Example:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels.nix)



## perSystem\.\<system>\.treefmt\.programs\.genemichaels\.settings\.split_where



Put the ` where ` clause on a new line\.



*Type:*
boolean



*Default:*
` true `



*Example:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels.nix)



## perSystem\.\<system>\.treefmt\.programs\.genemichaels\.settingsFile



The configuration file used by ` genemichaels `\.



*Type:*
absolute path



*Default:*
Generated JSON file from ` perSystem.x86_64-linux.treefmt.programs.genemichaels.settings `



*Example:*
` ./.genemichaels.json `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels.nix)



## perSystem\.\<system>\.treefmt\.programs\.genemichaels\.threadCount



How many threads to use for formatting multiple files\. Set to ` null ` to
default to the number of cores on the system\.



*Type:*
null or (unsigned integer, meaning >=0)



*Default:*
` null `



*Example:*
` 1 `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/genemichaels.nix)



## perSystem\.\<system>\.treefmt\.programs\.gleam\.enable



Whether to enable gleam\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gleam\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gleam.nix)



## perSystem\.\<system>\.treefmt\.programs\.gleam\.package



The gleam package to use\.



*Type:*
package



*Default:*
` pkgs.gleam `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gleam\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gleam.nix)



## perSystem\.\<system>\.treefmt\.programs\.gleam\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gleam\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gleam.nix)



## perSystem\.\<system>\.treefmt\.programs\.gleam\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.gleam"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gleam\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gleam.nix)



## perSystem\.\<system>\.treefmt\.programs\.gleam\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gleam\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gleam.nix)



## perSystem\.\<system>\.treefmt\.programs\.gofmt\.enable



Whether to enable gofmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gofmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gofmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.gofmt\.package



The go package to use\.



*Type:*
package



*Default:*
` pkgs.go `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gofmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gofmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.gofmt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*

```
[
  "vendor/*"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gofmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gofmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.gofmt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.go"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gofmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gofmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.gofmt\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gofmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gofmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.gofumpt\.enable



Whether to enable gofumpt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gofumpt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gofumpt.nix)



## perSystem\.\<system>\.treefmt\.programs\.gofumpt\.package



The gofumpt package to use\.



*Type:*
package



*Default:*
` pkgs.gofumpt `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gofumpt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gofumpt.nix)



## perSystem\.\<system>\.treefmt\.programs\.gofumpt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*

```
[
  "vendor/*"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gofumpt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gofumpt.nix)



## perSystem\.\<system>\.treefmt\.programs\.gofumpt\.extra



Whether to enable extra rules\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gofumpt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gofumpt.nix)



## perSystem\.\<system>\.treefmt\.programs\.gofumpt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.go"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gofumpt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gofumpt.nix)



## perSystem\.\<system>\.treefmt\.programs\.gofumpt\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gofumpt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/gofumpt.nix)



## perSystem\.\<system>\.treefmt\.programs\.goimports\.enable



Whether to enable goimports\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/goimports\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/goimports.nix)



## perSystem\.\<system>\.treefmt\.programs\.goimports\.package



The gotools package to use\.



*Type:*
package



*Default:*
` pkgs.gotools `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/goimports\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/goimports.nix)



## perSystem\.\<system>\.treefmt\.programs\.goimports\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*

```
[
  "vendor/*"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/goimports\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/goimports.nix)



## perSystem\.\<system>\.treefmt\.programs\.goimports\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.go"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/goimports\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/goimports.nix)



## perSystem\.\<system>\.treefmt\.programs\.goimports\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/goimports\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/goimports.nix)



## perSystem\.\<system>\.treefmt\.programs\.golines\.enable



Whether to enable golines\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/golines\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/golines.nix)



## perSystem\.\<system>\.treefmt\.programs\.golines\.package



The golines package to use\.



*Type:*
package



*Default:*
` pkgs.golines `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/golines\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/golines.nix)



## perSystem\.\<system>\.treefmt\.programs\.golines\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*

```
[
  "vendor/*"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/golines\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/golines.nix)



## perSystem\.\<system>\.treefmt\.programs\.golines\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.go"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/golines\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/golines.nix)



## perSystem\.\<system>\.treefmt\.programs\.golines\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/golines\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/golines.nix)



## perSystem\.\<system>\.treefmt\.programs\.google-java-format\.enable



Whether to enable google-java-format\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/google-java-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/google-java-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.google-java-format\.package



The google-java-format package to use\.



*Type:*
package



*Default:*
` pkgs.google-java-format `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/google-java-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/google-java-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.google-java-format\.aospStyle



Whether to use AOSP (Android Open Source Project) indentation\.
In a few words, use 4-space indentation rather than the conventional
2-space indentation width that Google uses\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/google-java-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/google-java-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.google-java-format\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/google-java-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/google-java-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.google-java-format\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.java"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/google-java-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/google-java-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.google-java-format\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/google-java-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/google-java-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.hclfmt\.enable



Whether to enable hclfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hclfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hclfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.hclfmt\.package



The hclfmt package to use\.



*Type:*
package



*Default:*
` pkgs.hclfmt `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hclfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hclfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.hclfmt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hclfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hclfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.hclfmt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.hcl"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hclfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hclfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.hclfmt\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hclfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hclfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.hlint\.enable



Whether to enable hlint\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hlint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hlint.nix)



## perSystem\.\<system>\.treefmt\.programs\.hlint\.package



The hlint package to use\.



*Type:*
package



*Default:*
` pkgs.hlint `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hlint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hlint.nix)



## perSystem\.\<system>\.treefmt\.programs\.hlint\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hlint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hlint.nix)



## perSystem\.\<system>\.treefmt\.programs\.hlint\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.hs"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hlint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hlint.nix)



## perSystem\.\<system>\.treefmt\.programs\.hlint\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hlint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hlint.nix)



## perSystem\.\<system>\.treefmt\.programs\.hujsonfmt\.enable



Whether to enable hujsonfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hujsonfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hujsonfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.hujsonfmt\.package



The hujsonfmt package to use\.



*Type:*
package



*Default:*
` pkgs.hujsonfmt `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hujsonfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hujsonfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.hujsonfmt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hujsonfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hujsonfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.hujsonfmt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.hujson"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hujsonfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hujsonfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.hujsonfmt\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hujsonfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/hujsonfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.isort\.enable



Whether to enable isort\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/isort\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/isort.nix)



## perSystem\.\<system>\.treefmt\.programs\.isort\.package



The isort package to use\.



*Type:*
package



*Default:*
` pkgs.isort `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/isort\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/isort.nix)



## perSystem\.\<system>\.treefmt\.programs\.isort\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/isort\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/isort.nix)



## perSystem\.\<system>\.treefmt\.programs\.isort\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.py"
  "*.pyi"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/isort\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/isort.nix)



## perSystem\.\<system>\.treefmt\.programs\.isort\.priority

Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/isort\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/isort.nix)



## perSystem\.\<system>\.treefmt\.programs\.isort\.profile



The profile to use for isort\.



*Type:*
string



*Default:*
` "" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/isort\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/isort.nix)



## perSystem\.\<system>\.treefmt\.programs\.jsonfmt\.enable



Whether to enable jsonfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.jsonfmt\.package



The jsonfmt package to use\.



*Type:*
package



*Default:*
` pkgs.jsonfmt `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.jsonfmt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.jsonfmt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.json"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.jsonfmt\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.jsonnet-lint\.enable



Whether to enable jsonnet-lint\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonnet-lint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonnet-lint.nix)



## perSystem\.\<system>\.treefmt\.programs\.jsonnet-lint\.package



The go-jsonnet package to use\.



*Type:*
package



*Default:*
` pkgs.go-jsonnet `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonnet-lint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonnet-lint.nix)



## perSystem\.\<system>\.treefmt\.programs\.jsonnet-lint\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonnet-lint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonnet-lint.nix)



## perSystem\.\<system>\.treefmt\.programs\.jsonnet-lint\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.jsonnet"
  "*.libsonnet"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonnet-lint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonnet-lint.nix)



## perSystem\.\<system>\.treefmt\.programs\.jsonnet-lint\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonnet-lint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonnet-lint.nix)



## perSystem\.\<system>\.treefmt\.programs\.jsonnetfmt\.enable



Whether to enable jsonnetfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonnetfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonnetfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.jsonnetfmt\.package



The go-jsonnet package to use\.



*Type:*
package



*Default:*
` pkgs.go-jsonnet `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonnetfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonnetfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.jsonnetfmt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonnetfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonnetfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.jsonnetfmt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.jsonnet"
  "*.libsonnet"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonnetfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonnetfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.jsonnetfmt\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonnetfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/jsonnetfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.just\.enable



Whether to enable just\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/just\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/just.nix)



## perSystem\.\<system>\.treefmt\.programs\.just\.package



The just package to use\.



*Type:*
package



*Default:*
` pkgs.just `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/just\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/just.nix)



## perSystem\.\<system>\.treefmt\.programs\.just\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/just\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/just.nix)



## perSystem\.\<system>\.treefmt\.programs\.just\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "[Jj][Uu][Ss][Tt][Ff][Ii][Ll][Ee]"
  "*/[Jj][Uu][Ss][Tt][Ff][Ii][Ll][Ee]"
  ".[Jj][Uu][Ss][Tt][Ff][Ii][Ll][Ee]"
  "*/.[Jj][Uu][Ss][Tt][Ff][Ii][Ll][Ee]"
  "*.[Jj][Uu][Ss][Tt]"
  "*.[Jj][Uu][Ss][Tt][Ff][Ii][Ll][Ee]"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/just\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/just.nix)



## perSystem\.\<system>\.treefmt\.programs\.just\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/just\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/just.nix)



## perSystem\.\<system>\.treefmt\.programs\.kdlfmt\.enable



Whether to enable kdlfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/kdlfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/kdlfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.kdlfmt\.package



The kdlfmt package to use\.



*Type:*
package



*Default:*
` pkgs.kdlfmt `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/kdlfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/kdlfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.kdlfmt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/kdlfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/kdlfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.kdlfmt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.kdl"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/kdlfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/kdlfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.kdlfmt\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/kdlfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/kdlfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.keep-sorted\.enable



Whether to enable keep-sorted\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/keep-sorted\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/keep-sorted.nix)



## perSystem\.\<system>\.treefmt\.programs\.keep-sorted\.package



The keep-sorted package to use\.



*Type:*
package



*Default:*
` pkgs.keep-sorted `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/keep-sorted\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/keep-sorted.nix)



## perSystem\.\<system>\.treefmt\.programs\.keep-sorted\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/keep-sorted\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/keep-sorted.nix)



## perSystem\.\<system>\.treefmt\.programs\.keep-sorted\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/keep-sorted\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/keep-sorted.nix)



## perSystem\.\<system>\.treefmt\.programs\.keep-sorted\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/keep-sorted\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/keep-sorted.nix)



## perSystem\.\<system>\.treefmt\.programs\.ktfmt\.enable



Whether to enable ktfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ktfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ktfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.ktfmt\.package



The ktfmt package to use\.



*Type:*
package



*Default:*
` pkgs.ktfmt `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ktfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ktfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.ktfmt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ktfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ktfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.ktfmt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.kt"
  "*.kts"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ktfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ktfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.ktfmt\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ktfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ktfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.ktlint\.enable



Whether to enable ktlint\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ktlint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ktlint.nix)



## perSystem\.\<system>\.treefmt\.programs\.ktlint\.package



The ktlint package to use\.



*Type:*
package



*Default:*
` pkgs.ktlint `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ktlint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ktlint.nix)



## perSystem\.\<system>\.treefmt\.programs\.ktlint\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ktlint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ktlint.nix)



## perSystem\.\<system>\.treefmt\.programs\.ktlint\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.kt"
  "*.kts"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ktlint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ktlint.nix)



## perSystem\.\<system>\.treefmt\.programs\.ktlint\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ktlint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ktlint.nix)



## perSystem\.\<system>\.treefmt\.programs\.latexindent\.enable



Whether to enable latexindent\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/latexindent\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/latexindent.nix)



## perSystem\.\<system>\.treefmt\.programs\.latexindent\.package



The texliveMedium package to use\.



*Type:*
package



*Default:*
` pkgs.texliveMedium `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/latexindent\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/latexindent.nix)



## perSystem\.\<system>\.treefmt\.programs\.latexindent\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/latexindent\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/latexindent.nix)



## perSystem\.\<system>\.treefmt\.programs\.latexindent\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.tex"
  "*.sty"
  "*.cls"
  "*.bib"
  "*.cmh"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/latexindent\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/latexindent.nix)



## perSystem\.\<system>\.treefmt\.programs\.latexindent\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/latexindent\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/latexindent.nix)



## perSystem\.\<system>\.treefmt\.programs\.leptosfmt\.enable



Whether to enable leptosfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/leptosfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/leptosfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.leptosfmt\.package



The leptosfmt package to use\.



*Type:*
package



*Default:*
` pkgs.leptosfmt `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/leptosfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/leptosfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.leptosfmt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/leptosfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/leptosfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.leptosfmt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.rs"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/leptosfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/leptosfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.leptosfmt\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/leptosfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/leptosfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.mdformat\.enable



Whether to enable mdformat\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mdformat\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mdformat.nix)



## perSystem\.\<system>\.treefmt\.programs\.mdformat\.package



The mdformat package to use\.



*Type:*
package



*Default:*
` pkgs.python3Packages.mdformat `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mdformat\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mdformat.nix)



## perSystem\.\<system>\.treefmt\.programs\.mdformat\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mdformat\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mdformat.nix)



## perSystem\.\<system>\.treefmt\.programs\.mdformat\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.md"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mdformat\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mdformat.nix)



## perSystem\.\<system>\.treefmt\.programs\.mdformat\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mdformat\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mdformat.nix)



## perSystem\.\<system>\.treefmt\.programs\.mdformat\.settings\.end-of-line



Output file line ending mode\.



*Type:*
null or one of “crlf”, “lf”, “keep”



*Default:*
` null `



*Example:*
` "lf" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mdformat\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mdformat.nix)



## perSystem\.\<system>\.treefmt\.programs\.mdformat\.settings\.number



Apply consecutive numbering to ordered lists\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mdformat\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mdformat.nix)



## perSystem\.\<system>\.treefmt\.programs\.mdformat\.settings\.wrap



Paragraph word wrap mode\.
Set to an INTEGER to wrap at that length\.



*Type:*
null or signed integer or one of “keep”, “no”



*Default:*
` null `



*Example:*
` "keep" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mdformat\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mdformat.nix)



## perSystem\.\<system>\.treefmt\.programs\.mdsh\.enable



Whether to enable mdsh\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mdsh\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mdsh.nix)



## perSystem\.\<system>\.treefmt\.programs\.mdsh\.package



The mdsh package to use\.



*Type:*
package



*Default:*
` pkgs.mdsh `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mdsh\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mdsh.nix)



## perSystem\.\<system>\.treefmt\.programs\.mdsh\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mdsh\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mdsh.nix)



## perSystem\.\<system>\.treefmt\.programs\.mdsh\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "README.md"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mdsh\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mdsh.nix)



## perSystem\.\<system>\.treefmt\.programs\.mdsh\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mdsh\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mdsh.nix)



## perSystem\.\<system>\.treefmt\.programs\.meson\.enable



Whether to enable meson\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/meson\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/meson.nix)



## perSystem\.\<system>\.treefmt\.programs\.meson\.package



The meson package to use\.



*Type:*
package



*Default:*
` pkgs.meson `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/meson\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/meson.nix)



## perSystem\.\<system>\.treefmt\.programs\.meson\.editorconfig



Try to read configuration from \.editorconfig



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/meson\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/meson.nix)



## perSystem\.\<system>\.treefmt\.programs\.meson\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/meson\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/meson.nix)



## perSystem\.\<system>\.treefmt\.programs\.meson\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "meson.build"
  "meson.options"
  "meson_options.txt"
  "*/meson.build"
  "*/meson.options"
  "*/meson_options.txt"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/meson\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/meson.nix)



## perSystem\.\<system>\.treefmt\.programs\.meson\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/meson\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/meson.nix)



## perSystem\.\<system>\.treefmt\.programs\.mix-format\.enable



Whether to enable mix-format\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mix-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mix-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.mix-format\.package



The elixir package to use\.



*Type:*
package



*Default:*
` pkgs.elixir `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mix-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mix-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.mix-format\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mix-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mix-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.mix-format\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.ex"
  "*.exs"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mix-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mix-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.mix-format\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mix-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mix-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.muon\.enable



Whether to enable muon\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/muon\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/muon.nix)



## perSystem\.\<system>\.treefmt\.programs\.muon\.package



The muon package to use\.



*Type:*
package



*Default:*
` pkgs.muon `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/muon\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/muon.nix)



## perSystem\.\<system>\.treefmt\.programs\.muon\.editorconfig



Try to read configuration from \.editorconfig



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/muon\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/muon.nix)



## perSystem\.\<system>\.treefmt\.programs\.muon\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/muon\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/muon.nix)



## perSystem\.\<system>\.treefmt\.programs\.muon\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "meson.build"
  "meson.options"
  "meson_options.txt"
  "*/meson.build"
  "*/meson.options"
  "*/meson_options.txt"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/muon\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/muon.nix)



## perSystem\.\<system>\.treefmt\.programs\.muon\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/muon\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/muon.nix)



## perSystem\.\<system>\.treefmt\.programs\.mypy\.enable



Whether to enable mypy\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mypy\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mypy.nix)



## perSystem\.\<system>\.treefmt\.programs\.mypy\.package



The mypy package to use\.



*Type:*
package



*Default:*
` pkgs.mypy `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mypy\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mypy.nix)



## perSystem\.\<system>\.treefmt\.programs\.mypy\.directories



Directories to run mypy in



*Type:*
attribute set of (submodule)



*Default:*

```
{
  "" = { };
}
```



*Example:*

```
{
  "" = {
    modules = [
      "mymodule"
      "tests"
    ];
  };
  subdir = { };
}
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mypy\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mypy.nix)



## perSystem\.\<system>\.treefmt\.programs\.mypy\.directories\.\<name>\.directory



Directory to run mypy in



*Type:*
string



*Default:*
` "‹name›" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mypy\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mypy.nix)



## perSystem\.\<system>\.treefmt\.programs\.mypy\.directories\.\<name>\.extraPythonPackages



Extra packages to add to PYTHONPATH



*Type:*
list of package



*Default:*
` [ ] `



*Example:*
\[ pkgs\.python3\.pkgs\.requests ]

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mypy\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mypy.nix)



## perSystem\.\<system>\.treefmt\.programs\.mypy\.directories\.\<name>\.extraPythonPaths



Extra paths to add to PYTHONPATH\.
Paths are interpreted relative to the directory options and are added before extraPythonPackages\.



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "path/to/my/module"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mypy\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mypy.nix)



## perSystem\.\<system>\.treefmt\.programs\.mypy\.directories\.\<name>\.modules



Modules to check



*Type:*
list of string



*Default:*

```
[
  ""
]
```



*Example:*

```
[
  "mymodule"
  "tests"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mypy\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mypy.nix)



## perSystem\.\<system>\.treefmt\.programs\.mypy\.directories\.\<name>\.options



Options to pass to mypy



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "--ignore-missing-imports"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mypy\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/mypy.nix)



## perSystem\.\<system>\.treefmt\.programs\.nickel\.enable



Whether to enable nickel\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nickel\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nickel.nix)



## perSystem\.\<system>\.treefmt\.programs\.nickel\.package



The nickel package to use\.



*Type:*
package



*Default:*
` pkgs.nickel `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nickel\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nickel.nix)



## perSystem\.\<system>\.treefmt\.programs\.nickel\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nickel\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nickel.nix)



## perSystem\.\<system>\.treefmt\.programs\.nickel\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.ncl"
  "*.nickel"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nickel\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nickel.nix)



## perSystem\.\<system>\.treefmt\.programs\.nickel\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nickel\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nickel.nix)



## perSystem\.\<system>\.treefmt\.programs\.nimpretty\.enable



Whether to enable nimpretty\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nimpretty\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nimpretty.nix)



## perSystem\.\<system>\.treefmt\.programs\.nimpretty\.package



The nim package to use\.



*Type:*
package



*Default:*
` pkgs.nim `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nimpretty\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nimpretty.nix)



## perSystem\.\<system>\.treefmt\.programs\.nimpretty\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nimpretty\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nimpretty.nix)



## perSystem\.\<system>\.treefmt\.programs\.nimpretty\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.nim"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nimpretty\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nimpretty.nix)



## perSystem\.\<system>\.treefmt\.programs\.nimpretty\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nimpretty\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nimpretty.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixf-diagnose\.enable

Whether to enable nixf-diagnose\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixf-diagnose\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixf-diagnose.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixf-diagnose\.package



The nixf-diagnose package to use\.



*Type:*
package



*Default:*
` pkgs.nixf-diagnose `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixf-diagnose\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixf-diagnose.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixf-diagnose\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixf-diagnose\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixf-diagnose.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixf-diagnose\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.nix"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixf-diagnose\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixf-diagnose.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixf-diagnose\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixf-diagnose\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixf-diagnose.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixfmt\.enable



Whether to enable nixfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixfmt\.package



The nixfmt-rfc-style package to use\.



*Type:*
package



*Default:*
` pkgs.nixfmt-rfc-style `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixfmt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixfmt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.nix"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixfmt\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixfmt\.strict



Enable a stricter formatting mode that isn’t influenced
as much by how the input is formatted\.



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixfmt\.width



Maximum width in characters \[default: 100]



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 120 `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixfmt-classic\.enable



Whether to enable nixfmt-classic\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt-classic\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt-classic.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixfmt-classic\.package



The nixfmt-classic package to use\.



*Type:*
package



*Default:*
` pkgs.nixfmt-classic `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt-classic\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt-classic.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixfmt-classic\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt-classic\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt-classic.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixfmt-classic\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.nix"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt-classic\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt-classic.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixfmt-classic\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt-classic\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt-classic.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixfmt-rfc-style\.enable



Whether to enable nixfmt-rfc-style\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt-rfc-style\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt-rfc-style.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixfmt-rfc-style\.package



The nixfmt-rfc-style package to use\.



*Type:*
package



*Default:*
` pkgs.nixfmt-rfc-style `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt-rfc-style\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt-rfc-style.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixfmt-rfc-style\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt-rfc-style\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt-rfc-style.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixfmt-rfc-style\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.nix"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt-rfc-style\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt-rfc-style.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixfmt-rfc-style\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt-rfc-style\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixfmt-rfc-style.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixpkgs-fmt\.enable



Whether to enable nixpkgs-fmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixpkgs-fmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixpkgs-fmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixpkgs-fmt\.package



The nixpkgs-fmt package to use\.



*Type:*
package



*Default:*
` pkgs.nixpkgs-fmt `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixpkgs-fmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixpkgs-fmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixpkgs-fmt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixpkgs-fmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixpkgs-fmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixpkgs-fmt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.nix"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixpkgs-fmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixpkgs-fmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.nixpkgs-fmt\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixpkgs-fmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/nixpkgs-fmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.ocamlformat\.enable



Whether to enable ocamlformat\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ocamlformat\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ocamlformat.nix)



## perSystem\.\<system>\.treefmt\.programs\.ocamlformat\.package



The ocamlformat package to use\.



*Type:*
package



*Default:*
` pkgs.ocamlformat `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ocamlformat\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ocamlformat.nix)



## perSystem\.\<system>\.treefmt\.programs\.ocamlformat\.configFile



Path to the \.ocamlformat file\. Used to pick the right version of ocamlformat if passed\.



*Type:*
null or absolute path



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ocamlformat\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ocamlformat.nix)



## perSystem\.\<system>\.treefmt\.programs\.ocamlformat\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ocamlformat\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ocamlformat.nix)



## perSystem\.\<system>\.treefmt\.programs\.ocamlformat\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.ml"
  "*.mli"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ocamlformat\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ocamlformat.nix)



## perSystem\.\<system>\.treefmt\.programs\.ocamlformat\.pkgs



The package set used to get the ocamlformat package at a specific version\.



*Type:*
lazy attribute set of raw value



*Default:*
Nixpkgs from context

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ocamlformat\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ocamlformat.nix)



## perSystem\.\<system>\.treefmt\.programs\.ocamlformat\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ocamlformat\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ocamlformat.nix)



## perSystem\.\<system>\.treefmt\.programs\.odinfmt\.enable



Whether to enable odinfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/odinfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/odinfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.odinfmt\.package



The ols package to use\.



*Type:*
package



*Default:*
` pkgs.ols `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/odinfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/odinfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.odinfmt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/odinfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/odinfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.odinfmt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.odin"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/odinfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/odinfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.odinfmt\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/odinfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/odinfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.opa\.enable



Whether to enable opa\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/opa\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/opa.nix)



## perSystem\.\<system>\.treefmt\.programs\.opa\.package



The open-policy-agent package to use\.



*Type:*
package



*Default:*
` pkgs.open-policy-agent `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/opa\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/opa.nix)



## perSystem\.\<system>\.treefmt\.programs\.opa\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/opa\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/opa.nix)



## perSystem\.\<system>\.treefmt\.programs\.opa\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.rego"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/opa\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/opa.nix)



## perSystem\.\<system>\.treefmt\.programs\.opa\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/opa\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/opa.nix)



## perSystem\.\<system>\.treefmt\.programs\.ormolu\.enable



Whether to enable ormolu\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ormolu\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ormolu.nix)



## perSystem\.\<system>\.treefmt\.programs\.ormolu\.package



The ormolu package to use\.



*Type:*
package



*Default:*
` pkgs.ormolu `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ormolu\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ormolu.nix)



## perSystem\.\<system>\.treefmt\.programs\.ormolu\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ormolu\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ormolu.nix)



## perSystem\.\<system>\.treefmt\.programs\.ormolu\.ghcOpts



Which GHC language extensions to enable



*Type:*
unspecified value



*Default:*

```
[
  "BangPatterns"
  "PatternSynonyms"
  "TypeApplications"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ormolu\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ormolu.nix)



## perSystem\.\<system>\.treefmt\.programs\.ormolu\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.hs"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ormolu\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ormolu.nix)



## perSystem\.\<system>\.treefmt\.programs\.ormolu\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ormolu\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ormolu.nix)



## perSystem\.\<system>\.treefmt\.programs\.oxipng\.enable



Whether to enable oxipng\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/oxipng\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/oxipng.nix)



## perSystem\.\<system>\.treefmt\.programs\.oxipng\.package



The oxipng package to use\.



*Type:*
package



*Default:*
` pkgs.oxipng `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/oxipng\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/oxipng.nix)



## perSystem\.\<system>\.treefmt\.programs\.oxipng\.alpha



Whether to enable Perform additional optimization on images with an alpha channel\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/oxipng\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/oxipng.nix)



## perSystem\.\<system>\.treefmt\.programs\.oxipng\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/oxipng\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/oxipng.nix)



## perSystem\.\<system>\.treefmt\.programs\.oxipng\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.png"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/oxipng\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/oxipng.nix)



## perSystem\.\<system>\.treefmt\.programs\.oxipng\.opt



Set the optimization level preset



*Type:*
string



*Default:*
` "2" `



*Example:*
` "max" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/oxipng\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/oxipng.nix)



## perSystem\.\<system>\.treefmt\.programs\.oxipng\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/oxipng\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/oxipng.nix)



## perSystem\.\<system>\.treefmt\.programs\.oxipng\.scale16



Whether to enable Forcibly reduce images with 16 bits per channel to 8 bits per channel\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/oxipng\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/oxipng.nix)



## perSystem\.\<system>\.treefmt\.programs\.oxipng\.strip



Strip metadata chunks



*Type:*
null or string



*Default:*
` null `



*Example:*
` "safe" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/oxipng\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/oxipng.nix)



## perSystem\.\<system>\.treefmt\.programs\.packer\.enable



Whether to enable packer\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/packer\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/packer.nix)



## perSystem\.\<system>\.treefmt\.programs\.packer\.package



The packer package to use\.



*Type:*
package



*Default:*
` pkgs.packer `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/packer\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/packer.nix)



## perSystem\.\<system>\.treefmt\.programs\.packer\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/packer\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/packer.nix)



## perSystem\.\<system>\.treefmt\.programs\.packer\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.pkr.hcl"
  "*.pkrvars.hcl"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/packer\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/packer.nix)



## perSystem\.\<system>\.treefmt\.programs\.packer\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/packer\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/packer.nix)



## perSystem\.\<system>\.treefmt\.programs\.perltidy\.enable



Whether to enable perltidy\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/perltidy\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/perltidy.nix)



## perSystem\.\<system>\.treefmt\.programs\.perltidy\.package



The PerlTidy package to use\.



*Type:*
package



*Default:*
` pkgs.perlPackages.PerlTidy `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/perltidy\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/perltidy.nix)



## perSystem\.\<system>\.treefmt\.programs\.perltidy\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/perltidy\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/perltidy.nix)



## perSystem\.\<system>\.treefmt\.programs\.perltidy\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.pl"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/perltidy\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/perltidy.nix)



## perSystem\.\<system>\.treefmt\.programs\.perltidy\.perltidyrc



A path for perltidy’s configuration file, usually named \.perltidyrc



*Type:*
null or absolute path



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/perltidy\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/perltidy.nix)



## perSystem\.\<system>\.treefmt\.programs\.perltidy\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/perltidy\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/perltidy.nix)



## perSystem\.\<system>\.treefmt\.programs\.php-cs-fixer\.enable



Whether to enable php-cs-fixer\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/php-cs-fixer\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/php-cs-fixer.nix)



## perSystem\.\<system>\.treefmt\.programs\.php-cs-fixer\.package



The php-cs-fixer package to use\.



*Type:*
package



*Default:*
` pkgs.php83Packages.php-cs-fixer `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/php-cs-fixer\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/php-cs-fixer.nix)



## perSystem\.\<system>\.treefmt\.programs\.php-cs-fixer\.configFile



Path to php-cs-fixer config file\.



*Type:*
string or absolute path



*Default:*
` "./.php-cs-fixer.php" `



*Example:*
` "./.php-cs-fixer.dist.php" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/php-cs-fixer\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/php-cs-fixer.nix)



## perSystem\.\<system>\.treefmt\.programs\.php-cs-fixer\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/php-cs-fixer\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/php-cs-fixer.nix)



## perSystem\.\<system>\.treefmt\.programs\.php-cs-fixer\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.php"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/php-cs-fixer\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/php-cs-fixer.nix)



## perSystem\.\<system>\.treefmt\.programs\.php-cs-fixer\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/php-cs-fixer\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/php-cs-fixer.nix)



## perSystem\.\<system>\.treefmt\.programs\.pinact\.enable



Whether to enable pinact\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/pinact\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/pinact.nix)



## perSystem\.\<system>\.treefmt\.programs\.pinact\.package



The pinact package to use\.



*Type:*
package



*Default:*
` pkgs.pinact `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/pinact\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/pinact.nix)



## perSystem\.\<system>\.treefmt\.programs\.pinact\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/pinact\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/pinact.nix)



## perSystem\.\<system>\.treefmt\.programs\.pinact\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  ".github/workflows/*.yml"
  ".github/workflows/*.yaml"
  "**/action.yml"
  "**/action.yaml"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/pinact\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/pinact.nix)



## perSystem\.\<system>\.treefmt\.programs\.pinact\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/pinact\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/pinact.nix)



## perSystem\.\<system>\.treefmt\.programs\.pinact\.settings



Configuration for pinact, see
\<link xlink:href=“https://github\.com/suzuki-shunsuke/pinact?tab=readme-ov-file\#configuration”/>
for supported values\.



*Type:*
YAML 1\.1 value



*Default:*
` { } `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/pinact\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/pinact.nix)



## perSystem\.\<system>\.treefmt\.programs\.pinact\.update



Update actions to latest versions\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/pinact\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/pinact.nix)



## perSystem\.\<system>\.treefmt\.programs\.pinact\.verify



Verify if pairs of commit SHA and version are correct\.



*Type:*
boolean



*Default:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/pinact\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/pinact.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.enable



Whether to enable prettier\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.package



The prettier package to use\.



*Type:*
package



*Default:*
` pkgs.nodePackages.prettier `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.cjs"
  "*.css"
  "*.html"
  "*.js"
  "*.json"
  "*.json5"
  "*.jsx"
  "*.md"
  "*.mdx"
  "*.mjs"
  "*.scss"
  "*.ts"
  "*.tsx"
  "*.vue"
  "*.yaml"
  "*.yml"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.arrowParens



Include parentheses around a sole arrow function parameter\.



*Type:*
null or one of “always”, “avoid”



*Default:*
` null `



*Example:*
` "always" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.bracketSameLine



Put > of opening tags on the last line instead of on a new line\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.bracketSpacing



Print spaces between brackets



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.cursorOffset



Print (to stderr) where a cursor at the given position would move to
after formatting\. This option cannot be used with --range-start and
–range-end\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` -1 `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.editorconfig



Whether parse the \.editorconfig file in your project and convert its
properties to the corresponding Prettier configuration\. This
configuration will be overridden by \.prettierrc, etc\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.embeddedLanguageFormatting



Control how Prettier formats quoted code embedded in the file\.



*Type:*
null or one of “auto”, “off”



*Default:*
` null `



*Example:*
` "auto" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.endOfLine



Which end of line characters to apply\.



*Type:*
null or one of “lf”, “crlf”, “cr”, “auto”



*Default:*
` null `



*Example:*
` "lf" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.filepath



Specify the input filepath\. This will be used to do parser inference\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "example.js" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.htmlWhitespaceSensitivity



How to handle whitespaces in HTML\.



*Type:*
null or one of “css”, “strict”, “ignore”



*Default:*
` null `



*Example:*
` "css" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.insertPragma



Insert @format pragma into file’s first docblock commentypes\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.jsxSingleQuote



Use single quotes in JSX



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.overrides

Provide a list of patterns to override prettier configuration\.



*Type:*
null or (list of (attribute set))



*Default:*
` null `



*Example:*

```
{
  files = [
    "*.html"
    "legacy/**/*.js"
  ];
  options = {
    tabwidth = 4;
  };
}
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.parser



Which parser to use\.



*Type:*
null or one of “flow”, “babel”, “babel-flow”, “babel-ts”, “typescript”, “acorn”, “espree”, “meriyah”, “css”, “less”, “scss”, “json”, “json5”, “json-stringify”, “graphql”, “markdown”, “mdx”, “vue”, “yaml”, “glimmer”, “html”, “angular”, “lwc” or string



*Default:*
` null `



*Example:*
` "typescript" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.pluginSearchDirs



Custom directory that contains prettier plugins in node_modules
subdirectory\. Overrides default behavior when plugins are searched
relatively to the location of Prettier\.\\nMultiple values are accepted\.



*Type:*
null or (list of string) or value false (singular enum)



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.plugins



Add a plugin\. Multiple plugins can be passed as separate ` --plugin `s\.



*Type:*
null or (list of string)



*Default:*
` null `



*Example:*

```
[
  "@prettier/plugin-xml"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.printWidth



The line length where Prettier will try wrap\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 80 `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.proseWrap



How to wrap prose\.



*Type:*
null or one of “always”, “never”, “preserve”



*Default:*
` null `



*Example:*
` "preserve" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.quoteProps



Change when properties in objects are quoted



*Type:*
null or one of “as-needed”, “consistent”, “preserve”



*Default:*
` null `



*Example:*
` "as-needed" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.rangeEnd



Format code ending at a given character offset (exclusive)\. The range
will extend forwards to the end of the selected statementypes\. This
option cannot be used with --cursor-offsetypes\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` 0 `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.rangeStart



Format code starting at a given character offsetypes\. The range will
extend backwards to the start of the first line containing the selected
statementypes\. his option cannot be used with --cursor-offsetypes\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 0 `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.requirePragma



Require either ‘@prettier’ or ‘@format’ to be present in the file’s
first docblock comment\\nin order for it to be formatted\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.semi



Print semicolons\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.singleAttributePerLine



Enforce single attribute per line in HTML, Vue and JSX\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.singleQuote



Use single quotes instead of double quotes\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.tabWidth



Number of spaces per indentation level\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 2 `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.trailingComma



Print trailing commas wherever possible when multi-line\.



*Type:*
null or one of “es5”, “none”, “all”



*Default:*
` null `



*Example:*
` "es5" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.useTabs



Indent with tabs instead of spaces



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.prettier\.settings\.vueIndentScriptAndStyle



Indent script and style tags in Vue files\.



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/prettier.nix)



## perSystem\.\<system>\.treefmt\.programs\.protolint\.enable



Whether to enable protolint\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/protolint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/protolint.nix)



## perSystem\.\<system>\.treefmt\.programs\.protolint\.package



The protolint package to use\.



*Type:*
package



*Default:*
` pkgs.protolint `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/protolint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/protolint.nix)



## perSystem\.\<system>\.treefmt\.programs\.protolint\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/protolint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/protolint.nix)



## perSystem\.\<system>\.treefmt\.programs\.protolint\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.proto"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/protolint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/protolint.nix)



## perSystem\.\<system>\.treefmt\.programs\.protolint\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/protolint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/protolint.nix)



## perSystem\.\<system>\.treefmt\.programs\.purs-tidy\.enable



Whether to enable purs-tidy\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/purs-tidy\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/purs-tidy.nix)



## perSystem\.\<system>\.treefmt\.programs\.purs-tidy\.package



The purs-tidy package to use\.



*Type:*
package



*Default:*
` pkgs.nodePackages.purs-tidy `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/purs-tidy\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/purs-tidy.nix)



## perSystem\.\<system>\.treefmt\.programs\.purs-tidy\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/purs-tidy\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/purs-tidy.nix)



## perSystem\.\<system>\.treefmt\.programs\.purs-tidy\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "src/**/*.purs"
  "test/**/*.purs"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/purs-tidy\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/purs-tidy.nix)



## perSystem\.\<system>\.treefmt\.programs\.purs-tidy\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/purs-tidy\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/purs-tidy.nix)



## perSystem\.\<system>\.treefmt\.programs\.rstfmt\.enable



Whether to enable rstfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rstfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rstfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.rstfmt\.package



The rstfmt package to use\.



*Type:*
package



*Default:*
` pkgs.rstfmt `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rstfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rstfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.rstfmt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rstfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rstfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.rstfmt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.rst"
  "*.txt"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rstfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rstfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.rstfmt\.line_length



Sets the line length\.



*Type:*
signed integer



*Default:*
` 72 `



*Example:*
` 80 `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rstfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rstfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.rstfmt\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rstfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rstfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.rubocop\.enable



Whether to enable rubocop\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rubocop\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rubocop.nix)



## perSystem\.\<system>\.treefmt\.programs\.rubocop\.package



The rubocop package to use\.



*Type:*
package



*Default:*
` pkgs.rubocop `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rubocop\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rubocop.nix)



## perSystem\.\<system>\.treefmt\.programs\.rubocop\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rubocop\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rubocop.nix)



## perSystem\.\<system>\.treefmt\.programs\.rubocop\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.rb"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rubocop\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rubocop.nix)



## perSystem\.\<system>\.treefmt\.programs\.rubocop\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rubocop\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rubocop.nix)



## perSystem\.\<system>\.treefmt\.programs\.ruff-check\.enable



Whether to enable ruff-check\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ruff-check\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ruff-check.nix)



## perSystem\.\<system>\.treefmt\.programs\.ruff-check\.package



The ruff package to use\.



*Type:*
package



*Default:*
` pkgs.ruff `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ruff-check\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ruff-check.nix)



## perSystem\.\<system>\.treefmt\.programs\.ruff-check\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ruff-check\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ruff-check.nix)



## perSystem\.\<system>\.treefmt\.programs\.ruff-check\.extendSelect



–extend-select options



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "I"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ruff-check\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ruff-check.nix)



## perSystem\.\<system>\.treefmt\.programs\.ruff-check\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.py"
  "*.pyi"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ruff-check\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ruff-check.nix)



## perSystem\.\<system>\.treefmt\.programs\.ruff-check\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ruff-check\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ruff-check.nix)



## perSystem\.\<system>\.treefmt\.programs\.ruff-format\.enable



Whether to enable ruff-format\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ruff-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ruff-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.ruff-format\.package



The ruff package to use\.



*Type:*
package



*Default:*
` pkgs.ruff `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ruff-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ruff-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.ruff-format\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ruff-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ruff-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.ruff-format\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.py"
  "*.pyi"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ruff-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ruff-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.ruff-format\.lineLength



Set the line-length\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 79 `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ruff-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ruff-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.ruff-format\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ruff-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/ruff-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.rufo\.enable



Whether to enable rufo\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rufo\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rufo.nix)



## perSystem\.\<system>\.treefmt\.programs\.rufo\.package



The rufo package to use\.



*Type:*
package



*Default:*
` pkgs.rufo `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rufo\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rufo.nix)



## perSystem\.\<system>\.treefmt\.programs\.rufo\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rufo\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rufo.nix)



## perSystem\.\<system>\.treefmt\.programs\.rufo\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.rb"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rufo\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rufo.nix)



## perSystem\.\<system>\.treefmt\.programs\.rufo\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rufo\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rufo.nix)



## perSystem\.\<system>\.treefmt\.programs\.rustfmt\.enable



Whether to enable rustfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rustfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rustfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.rustfmt\.package



The rustfmt package to use\.



*Type:*
package



*Default:*
` pkgs.rustfmt `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rustfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rustfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.rustfmt\.edition



Rust edition to target when formatting



*Type:*
string



*Default:*
` "2024" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rustfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rustfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.rustfmt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rustfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rustfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.rustfmt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.rs"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rustfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rustfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.rustfmt\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rustfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/rustfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.scalafmt\.enable



Whether to enable scalafmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/scalafmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/scalafmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.scalafmt\.package



The scalafmt package to use\.



*Type:*
package



*Default:*
` pkgs.scalafmt `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/scalafmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/scalafmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.scalafmt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/scalafmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/scalafmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.scalafmt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.sbt"
  "*.scala"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/scalafmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/scalafmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.scalafmt\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/scalafmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/scalafmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.shellcheck\.enable



Whether to enable shellcheck\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/shellcheck\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/shellcheck.nix)



## perSystem\.\<system>\.treefmt\.programs\.shellcheck\.package



The shellcheck package to use\.



*Type:*
package



*Default:*
` pkgs.shellcheck `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/shellcheck\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/shellcheck.nix)



## perSystem\.\<system>\.treefmt\.programs\.shellcheck\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/shellcheck\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/shellcheck.nix)



## perSystem\.\<system>\.treefmt\.programs\.shellcheck\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.sh"
  "*.bash"
  "*.envrc"
  "*.envrc.*"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/shellcheck\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/shellcheck.nix)



## perSystem\.\<system>\.treefmt\.programs\.shellcheck\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/shellcheck\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/shellcheck.nix)



## perSystem\.\<system>\.treefmt\.programs\.shfmt\.enable



Whether to enable shfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/shfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/shfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.shfmt\.package



The shfmt package to use\.



*Type:*
package



*Default:*
` pkgs.shfmt `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/shfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/shfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.shfmt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/shfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/shfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.shfmt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.sh"
  "*.bash"
  "*.envrc"
  "*.envrc.*"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/shfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/shfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.shfmt\.indent_size



Sets the number of spaces to be used in indentation\. Uses tabs if set to
zero\. If this is null, then [\.editorconfig will be used to configure
shfmt](https://github\.com/patrickvane/shfmt\#description)\.



*Type:*
null or signed integer



*Default:*
` 2 `



*Example:*
` 4 `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/shfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/shfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.shfmt\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/shfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/shfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.sizelint\.enable



Whether to enable sizelint\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sizelint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sizelint.nix)



## perSystem\.\<system>\.treefmt\.programs\.sizelint\.package



The sizelint package to use\.



*Type:*
package



*Default:*
` pkgs.sizelint `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sizelint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sizelint.nix)



## perSystem\.\<system>\.treefmt\.programs\.sizelint\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sizelint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sizelint.nix)



## perSystem\.\<system>\.treefmt\.programs\.sizelint\.failOnWarn



Whether to enable fail-on-warn\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sizelint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sizelint.nix)



## perSystem\.\<system>\.treefmt\.programs\.sizelint\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sizelint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sizelint.nix)



## perSystem\.\<system>\.treefmt\.programs\.sizelint\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sizelint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sizelint.nix)



## perSystem\.\<system>\.treefmt\.programs\.sizelint\.settings



Configuration to generate sizelint\.toml with



*Type:*
TOML value



*Default:*
` { } `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sizelint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sizelint.nix)



## perSystem\.\<system>\.treefmt\.programs\.sql-formatter\.enable



Whether to enable sql-formatter\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sql-formatter\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sql-formatter.nix)



## perSystem\.\<system>\.treefmt\.programs\.sql-formatter\.package



The sql-formatter package to use\.



*Type:*
package



*Default:*
` pkgs.sql-formatter `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sql-formatter\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sql-formatter.nix)



## perSystem\.\<system>\.treefmt\.programs\.sql-formatter\.dialect



The sql dialect to use for formatting



*Type:*
null or one of “bigquery”, “db2”, “db2i”, “hive”, “mariadb”, “mysql”, “n1ql”, “plsql”, “postgresql”, “redshift”, “spark”, “sqlite”, “sql”, “tidb”, “trino”, “transactsql”, “tsql”, “singlestoredb”, “snowflake”



*Default:*
` null `



*Example:*
` "postgresql" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sql-formatter\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sql-formatter.nix)



## perSystem\.\<system>\.treefmt\.programs\.sql-formatter\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sql-formatter\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sql-formatter.nix)



## perSystem\.\<system>\.treefmt\.programs\.sql-formatter\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.sql"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sql-formatter\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sql-formatter.nix)



## perSystem\.\<system>\.treefmt\.programs\.sql-formatter\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sql-formatter\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sql-formatter.nix)



## perSystem\.\<system>\.treefmt\.programs\.sqlfluff\.enable



Whether to enable sqlfluff\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqlfluff\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqlfluff.nix)



## perSystem\.\<system>\.treefmt\.programs\.sqlfluff\.package



The sqlfluff package to use\.



*Type:*
package



*Default:*
` pkgs.sqlfluff `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqlfluff\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqlfluff.nix)



## perSystem\.\<system>\.treefmt\.programs\.sqlfluff\.dialect



The sql dialect to use for formatting



*Type:*
null or one of “db2”, “ansi”, “soql”, “tsql”, “hive”, “trino”, “mysql”, “oracle”, “sqlite”, “duckdb”, “exasol”, “athena”, “mariadb”, “vertica”, “teradata”, “redshift”, “sparksql”, “bigquery”, “postgres”, “greenplum”, “snowflake”, “materializ”, “clickhouse”, “databricks”



*Default:*
` null `



*Example:*
` "sqlite" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqlfluff\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqlfluff.nix)



## perSystem\.\<system>\.treefmt\.programs\.sqlfluff\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqlfluff\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqlfluff.nix)



## perSystem\.\<system>\.treefmt\.programs\.sqlfluff\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.sql"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqlfluff\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqlfluff.nix)



## perSystem\.\<system>\.treefmt\.programs\.sqlfluff\.priority

Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqlfluff\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqlfluff.nix)



## perSystem\.\<system>\.treefmt\.programs\.sqlfluff-lint\.enable



Whether to enable sqlfluff-lint\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqlfluff-lint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqlfluff-lint.nix)



## perSystem\.\<system>\.treefmt\.programs\.sqlfluff-lint\.package



The sqlfluff package to use\.



*Type:*
package



*Default:*
` pkgs.sqlfluff `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqlfluff-lint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqlfluff-lint.nix)



## perSystem\.\<system>\.treefmt\.programs\.sqlfluff-lint\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqlfluff-lint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqlfluff-lint.nix)



## perSystem\.\<system>\.treefmt\.programs\.sqlfluff-lint\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.sql"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqlfluff-lint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqlfluff-lint.nix)



## perSystem\.\<system>\.treefmt\.programs\.sqlfluff-lint\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqlfluff-lint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqlfluff-lint.nix)



## perSystem\.\<system>\.treefmt\.programs\.sqruff\.enable



Whether to enable sqruff\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqruff\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqruff.nix)



## perSystem\.\<system>\.treefmt\.programs\.sqruff\.package



The sqruff package to use\.



*Type:*
package



*Default:*
` pkgs.sqruff `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqruff\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqruff.nix)



## perSystem\.\<system>\.treefmt\.programs\.sqruff\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqruff\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqruff.nix)



## perSystem\.\<system>\.treefmt\.programs\.sqruff\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.sql"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqruff\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqruff.nix)



## perSystem\.\<system>\.treefmt\.programs\.sqruff\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqruff\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/sqruff.nix)



## perSystem\.\<system>\.treefmt\.programs\.statix\.enable



Whether to enable statix\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/statix\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/statix.nix)



## perSystem\.\<system>\.treefmt\.programs\.statix\.package



The statix package to use\.



*Type:*
package



*Default:*
` pkgs.statix `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/statix\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/statix.nix)



## perSystem\.\<system>\.treefmt\.programs\.statix\.disabled-lints



List of ignored lints\. Run ` statix list ` to see all available lints\.



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "empty_pattern"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/statix\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/statix.nix)



## perSystem\.\<system>\.treefmt\.programs\.statix\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/statix\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/statix.nix)



## perSystem\.\<system>\.treefmt\.programs\.statix\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.nix"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/statix\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/statix.nix)



## perSystem\.\<system>\.treefmt\.programs\.statix\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/statix\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/statix.nix)



## perSystem\.\<system>\.treefmt\.programs\.stylish-haskell\.enable



Whether to enable stylish-haskell\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylish-haskell\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylish-haskell.nix)



## perSystem\.\<system>\.treefmt\.programs\.stylish-haskell\.package



The stylish-haskell package to use\.



*Type:*
package



*Default:*
` pkgs.stylish-haskell `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylish-haskell\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylish-haskell.nix)



## perSystem\.\<system>\.treefmt\.programs\.stylish-haskell\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylish-haskell\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylish-haskell.nix)



## perSystem\.\<system>\.treefmt\.programs\.stylish-haskell\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.hs"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylish-haskell\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylish-haskell.nix)



## perSystem\.\<system>\.treefmt\.programs\.stylish-haskell\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylish-haskell\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylish-haskell.nix)



## perSystem\.\<system>\.treefmt\.programs\.stylua\.enable



Whether to enable stylua\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylua\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylua.nix)



## perSystem\.\<system>\.treefmt\.programs\.stylua\.package



The stylua package to use\.



*Type:*
package



*Default:*
` pkgs.stylua `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylua\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylua.nix)



## perSystem\.\<system>\.treefmt\.programs\.stylua\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylua\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylua.nix)



## perSystem\.\<system>\.treefmt\.programs\.stylua\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.lua"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylua\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylua.nix)



## perSystem\.\<system>\.treefmt\.programs\.stylua\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylua\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylua.nix)



## perSystem\.\<system>\.treefmt\.programs\.stylua\.settings\.call_parentheses



Whether parentheses should be applied on
function calls with a single string/table
argument\.  ` Always ` applies parentheses in
all cases\. ` NoSingleString ` omits
parentheses on calls with a single string
argument\. Similarly, ` NoSingleTable ` omits
parentheses on calls with a single table
argument\. ` None ` omits parentheses in both
cases\.

Note: parentheses are still kept in situations
where removal can lead to obscurity
(e\.g\. ` foo "bar".setup -> foo("bar").setup `,
since the index is on the call result, not the string)\.

` Input ` removes all automation and preserves
parentheses only if they were present in input code:
consistency is not enforced\.



*Type:*
null or one of “Always”, “NoSingleString”, “NoSingleTable”, “None”, “Input”



*Default:*
` null `



*Example:*
` "Always" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylua\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylua.nix)



## perSystem\.\<system>\.treefmt\.programs\.stylua\.settings\.collapse_simple_statement



Specify whether to collapse simple statements\.



*Type:*
null or one of “Never”, “FunctionOnly”, “ConditionalOnly”, “Always”



*Default:*
` null `



*Example:*
` "Never" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylua\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylua.nix)



## perSystem\.\<system>\.treefmt\.programs\.stylua\.settings\.column_width



Approximate line length for printing\.

Used as a guide for line wrapping -
this is not a hard requirement:
lines may fall under or over the limit\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 120 `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylua\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylua.nix)



## perSystem\.\<system>\.treefmt\.programs\.stylua\.settings\.indent_type



Indent type\.



*Type:*
null or one of “Tabs”, “Spaces”



*Default:*
` null `



*Example:*
` "Tabs" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylua\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylua.nix)



## perSystem\.\<system>\.treefmt\.programs\.stylua\.settings\.indent_width



Character size of single indentation\.

If ` indent_type ` is set to ` Tabs `,
this option is used as a heuristic to
determine column width only\.



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 4 `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylua\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylua.nix)



## perSystem\.\<system>\.treefmt\.programs\.stylua\.settings\.line_endings



Line endings type\.



*Type:*
null or one of “Unix”, “Windows”



*Default:*
` null `



*Example:*
` "Unix" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylua\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylua.nix)



## perSystem\.\<system>\.treefmt\.programs\.stylua\.settings\.quote_style



Quote style for string literals\.

` AutoPrefer ` styles will prefer the
specified quote style, but fall back to
the alternative if it has fewer string
escapes\. ` Force ` styles always use the
specified style regardless of escapes\.



*Type:*
null or one of “AutoPreferDouble”, “AutoPreferSingle”, “ForceDouble”, “ForceSingle”



*Default:*
` null `



*Example:*
` "AutoPreferDouble" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylua\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylua.nix)



## perSystem\.\<system>\.treefmt\.programs\.stylua\.settings\.sort_requires\.enabled



StyLua has built-in support for sorting
require statements\. We group consecutive
require statements into a single “block”,
and then requires are sorted only within
that block\. Blocks of requires do not
move around the file\.

We only include requires of the form
` local NAME = require(EXPR) `, and sort
lexicographically based on ` NAME `\.
(We also sort Roblox services of the form
` local NAME = game:GetService(EXPR) `)



*Type:*
null or boolean



*Default:*
` null `



*Example:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylua\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/stylua.nix)



## perSystem\.\<system>\.treefmt\.programs\.swift-format\.enable



Whether to enable swift-format\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/swift-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/swift-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.swift-format\.package



The swift-format package to use\.



*Type:*
package



*Default:*
` pkgs.swift-format `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/swift-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/swift-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.swift-format\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/swift-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/swift-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.swift-format\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.swift"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/swift-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/swift-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.swift-format\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/swift-format\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/swift-format.nix)



## perSystem\.\<system>\.treefmt\.programs\.taplo\.enable



Whether to enable taplo\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/taplo\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/taplo.nix)



## perSystem\.\<system>\.treefmt\.programs\.taplo\.package



The taplo package to use\.



*Type:*
package



*Default:*
` pkgs.taplo `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/taplo\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/taplo.nix)



## perSystem\.\<system>\.treefmt\.programs\.taplo\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/taplo\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/taplo.nix)



## perSystem\.\<system>\.treefmt\.programs\.taplo\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.toml"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/taplo\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/taplo.nix)



## perSystem\.\<system>\.treefmt\.programs\.taplo\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/taplo\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/taplo.nix)



## perSystem\.\<system>\.treefmt\.programs\.taplo\.settings



Configuration to generate taplo\.toml with



*Type:*
TOML value



*Default:*
` { } `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/taplo\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/taplo.nix)



## perSystem\.\<system>\.treefmt\.programs\.templ\.enable



Whether to enable templ\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/templ\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/templ.nix)



## perSystem\.\<system>\.treefmt\.programs\.templ\.package



The templ package to use\.



*Type:*
package



*Default:*
` pkgs.templ `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/templ\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/templ.nix)



## perSystem\.\<system>\.treefmt\.programs\.templ\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/templ\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/templ.nix)



## perSystem\.\<system>\.treefmt\.programs\.templ\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.templ"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/templ\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/templ.nix)



## perSystem\.\<system>\.treefmt\.programs\.templ\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/templ\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/templ.nix)



## perSystem\.\<system>\.treefmt\.programs\.terraform\.enable



Whether to enable terraform\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/terraform\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/terraform.nix)



## perSystem\.\<system>\.treefmt\.programs\.terraform\.package



The opentofu package to use\.



*Type:*
package



*Default:*
` pkgs.opentofu `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/terraform\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/terraform.nix)



## perSystem\.\<system>\.treefmt\.programs\.terraform\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/terraform\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/terraform.nix)



## perSystem\.\<system>\.treefmt\.programs\.terraform\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.tf"
  "*.tfvars"
  "*.tftest.hcl"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/terraform\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/terraform.nix)



## perSystem\.\<system>\.treefmt\.programs\.terraform\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/terraform\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/terraform.nix)



## perSystem\.\<system>\.treefmt\.programs\.texfmt\.enable



Whether to enable texfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/texfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/texfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.texfmt\.package



The tex-fmt package to use\.



*Type:*
package



*Default:*
` pkgs.tex-fmt `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/texfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/texfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.texfmt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/texfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/texfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.texfmt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.tex"
  "*.sty"
  "*.cls"
  "*.bib"
  "*.cmh"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/texfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/texfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.texfmt\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/texfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/texfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.toml-sort\.enable



Whether to enable toml-sort\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/toml-sort\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/toml-sort.nix)



## perSystem\.\<system>\.treefmt\.programs\.toml-sort\.package



The toml-sort package to use\.



*Type:*
package



*Default:*
` pkgs.toml-sort `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/toml-sort\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/toml-sort.nix)



## perSystem\.\<system>\.treefmt\.programs\.toml-sort\.all



Whether to enable sort ALL keys\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/toml-sort\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/toml-sort.nix)



## perSystem\.\<system>\.treefmt\.programs\.toml-sort\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/toml-sort\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/toml-sort.nix)



## perSystem\.\<system>\.treefmt\.programs\.toml-sort\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.toml"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/toml-sort\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/toml-sort.nix)



## perSystem\.\<system>\.treefmt\.programs\.toml-sort\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/toml-sort\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/toml-sort.nix)



## perSystem\.\<system>\.treefmt\.programs\.typos\.enable



Whether to enable typos\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos.nix)



## perSystem\.\<system>\.treefmt\.programs\.typos\.package



The typos package to use\.



*Type:*
package



*Default:*
` pkgs.typos `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos.nix)



## perSystem\.\<system>\.treefmt\.programs\.typos\.binary



Search binary files



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos.nix)



## perSystem\.\<system>\.treefmt\.programs\.typos\.configFile



Custom config file



*Type:*
null or string



*Default:*
` null `



*Example:*
` "typos.toml" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos.nix)



## perSystem\.\<system>\.treefmt\.programs\.typos\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos.nix)



## perSystem\.\<system>\.treefmt\.programs\.typos\.hidden



Search hidden files and directories



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos.nix)



## perSystem\.\<system>\.treefmt\.programs\.typos\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos.nix)



## perSystem\.\<system>\.treefmt\.programs\.typos\.isolated



Ignore implicit configuration files



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos.nix)



## perSystem\.\<system>\.treefmt\.programs\.typos\.locale



Language locale to suggest corrections for \[possible values: en, en-us, en-gb, en-ca, en-au]



*Type:*
null or one of “en”, “en-us”, “en-gb”, “en-ca”, “en-au”



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos.nix)



## perSystem\.\<system>\.treefmt\.programs\.typos\.noCheckFilenames



Skip verifying spelling in file names



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos.nix)



## perSystem\.\<system>\.treefmt\.programs\.typos\.noCheckFiles



Skip verifying spelling in files



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos.nix)



## perSystem\.\<system>\.treefmt\.programs\.typos\.noIgnore



Don’t respect ignore files



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos.nix)



## perSystem\.\<system>\.treefmt\.programs\.typos\.noIgnoreDot



Don’t respect \.ignore files



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos.nix)



## perSystem\.\<system>\.treefmt\.programs\.typos\.noIgnoreGlobal



Don’t respect global ignore files



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos.nix)



## perSystem\.\<system>\.treefmt\.programs\.typos\.noIgnoreParent



Don’t respect ignore files in parent directories



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos.nix)



## perSystem\.\<system>\.treefmt\.programs\.typos\.noIgnoreVCS



Don’t respect ignore files in vsc directories



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos.nix)



## perSystem\.\<system>\.treefmt\.programs\.typos\.noUnicode



Only allow ASCII characters in identifiers



*Type:*
boolean



*Default:*
` false `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos.nix)



## perSystem\.\<system>\.treefmt\.programs\.typos\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos.nix)



## perSystem\.\<system>\.treefmt\.programs\.typos\.sort



Sort results



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos.nix)



## perSystem\.\<system>\.treefmt\.programs\.typos\.threads



The approximate number of threads to use \[default: 0]



*Type:*
null or signed integer



*Default:*
` null `



*Example:*
` 2 `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typos.nix)



## perSystem\.\<system>\.treefmt\.programs\.typstfmt\.enable



Whether to enable typstfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typstfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typstfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.typstfmt\.package



The typstfmt package to use\.



*Type:*
package



*Default:*
` pkgs.typstfmt `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typstfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typstfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.typstfmt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typstfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typstfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.typstfmt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.typ"
  "*.typst"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typstfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typstfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.typstfmt\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typstfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typstfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.typstyle\.enable



Whether to enable typstyle\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typstyle\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typstyle.nix)



## perSystem\.\<system>\.treefmt\.programs\.typstyle\.package



The typstyle package to use\.



*Type:*
package



*Default:*
` pkgs.typstyle `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typstyle\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typstyle.nix)



## perSystem\.\<system>\.treefmt\.programs\.typstyle\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typstyle\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typstyle.nix)



## perSystem\.\<system>\.treefmt\.programs\.typstyle\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.typ"
  "*.typst"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typstyle\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typstyle.nix)



## perSystem\.\<system>\.treefmt\.programs\.typstyle\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typstyle\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/typstyle.nix)



## perSystem\.\<system>\.treefmt\.programs\.xmllint\.enable



Whether to enable xmllint\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/xmllint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/xmllint.nix)



## perSystem\.\<system>\.treefmt\.programs\.xmllint\.package



The libxml2 package to use\.



*Type:*
package



*Default:*
` pkgs.libxml2 `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/xmllint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/xmllint.nix)



## perSystem\.\<system>\.treefmt\.programs\.xmllint\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/xmllint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/xmllint.nix)



## perSystem\.\<system>\.treefmt\.programs\.xmllint\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.xml"
  "*.svg"
  "*.xhtml"
  "*.xsl"
  "*.xslt"
  "*.dtd"
  "*.xsd"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/xmllint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/xmllint.nix)



## perSystem\.\<system>\.treefmt\.programs\.xmllint\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/xmllint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/xmllint.nix)



## perSystem\.\<system>\.treefmt\.programs\.yamlfmt\.enable



Whether to enable yamlfmt\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/yamlfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/yamlfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.yamlfmt\.package

The yamlfmt package to use\.



*Type:*
package



*Default:*
` pkgs.yamlfmt `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/yamlfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/yamlfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.yamlfmt\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/yamlfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/yamlfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.yamlfmt\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.yaml"
  "*.yml"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/yamlfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/yamlfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.yamlfmt\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/yamlfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/yamlfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.yamlfmt\.settings



Configuration for yamlfmt, see
\<link xlink:href=“https://github\.com/google/yamlfmt/blob/main/docs/config-file\.md”/>
for supported values\.



*Type:*
YAML 1\.1 value



*Default:*
` { } `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/yamlfmt\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/yamlfmt.nix)



## perSystem\.\<system>\.treefmt\.programs\.yapf\.enable



Whether to enable yapf\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/yapf\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/yapf.nix)



## perSystem\.\<system>\.treefmt\.programs\.yapf\.package



The yapf package to use\.



*Type:*
package



*Default:*
` pkgs.yapf `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/yapf\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/yapf.nix)



## perSystem\.\<system>\.treefmt\.programs\.yapf\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/yapf\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/yapf.nix)



## perSystem\.\<system>\.treefmt\.programs\.yapf\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.py"
  "*.pyi"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/yapf\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/yapf.nix)



## perSystem\.\<system>\.treefmt\.programs\.yapf\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/yapf\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/yapf.nix)



## perSystem\.\<system>\.treefmt\.programs\.zig\.enable



Whether to enable zig\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zig\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zig.nix)



## perSystem\.\<system>\.treefmt\.programs\.zig\.package



The zig package to use\.



*Type:*
package



*Default:*
` pkgs.zig `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zig\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zig.nix)



## perSystem\.\<system>\.treefmt\.programs\.zig\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zig\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zig.nix)



## perSystem\.\<system>\.treefmt\.programs\.zig\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.zig"
  "*.zon"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zig\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zig.nix)



## perSystem\.\<system>\.treefmt\.programs\.zig\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zig\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zig.nix)



## perSystem\.\<system>\.treefmt\.programs\.zizmor\.enable



Whether to enable zizmor\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zizmor\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zizmor.nix)



## perSystem\.\<system>\.treefmt\.programs\.zizmor\.package



The zizmor package to use\.



*Type:*
package



*Default:*
` pkgs.zizmor `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zizmor\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zizmor.nix)



## perSystem\.\<system>\.treefmt\.programs\.zizmor\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zizmor\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zizmor.nix)



## perSystem\.\<system>\.treefmt\.programs\.zizmor\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  ".github/workflows/*.yml"
  ".github/workflows/*.yaml"
  ".github/actions/**/*.yml"
  ".github/actions/**/*.yaml"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zizmor\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zizmor.nix)



## perSystem\.\<system>\.treefmt\.programs\.zizmor\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zizmor\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zizmor.nix)



## perSystem\.\<system>\.treefmt\.programs\.zprint\.enable



Whether to enable zprint\.



*Type:*
boolean



*Default:*
` false `



*Example:*
` true `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zprint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zprint.nix)



## perSystem\.\<system>\.treefmt\.programs\.zprint\.package



The zprint package to use\.



*Type:*
package



*Default:*
` pkgs.zprint `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zprint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zprint.nix)



## perSystem\.\<system>\.treefmt\.programs\.zprint\.excludes



Path / file patterns to exclude



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zprint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zprint.nix)



## perSystem\.\<system>\.treefmt\.programs\.zprint\.includes



Path / file patterns to include



*Type:*
list of string



*Default:*

```
[
  "*.clj"
  "*.cljc"
  "*.cljs"
  "*.edn"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zprint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zprint.nix)



## perSystem\.\<system>\.treefmt\.programs\.zprint\.priority



Priority



*Type:*
null or signed integer



*Default:*
` null `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zprint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zprint.nix)



## perSystem\.\<system>\.treefmt\.programs\.zprint\.zprintOpts



Clojure map containing zprint options\.



*Type:*
null or string



*Default:*
` null `



*Example:*
` "{:width 90}" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zprint\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/programs/zprint.nix)



## perSystem\.\<system>\.treefmt\.projectRoot



Path to the root of the project on which treefmt operates



*Type:*
absolute path



*Default:*
` self `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/flake-module\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/flake-module.nix)



## perSystem\.\<system>\.treefmt\.projectRootFile



File to look for to determine the root of the project in the
build\.wrapper\.



*Type:*
string



*Default:*
` ".git/config" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options.nix)



## perSystem\.\<system>\.treefmt\.settings



The contents of treefmt\.toml



*Type:*
TOML value



*Default:*
` { } `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options.nix)



## perSystem\.\<system>\.treefmt\.settings\.formatter



Set of formatters to use



*Type:*
attribute set of (TOML value)



*Default:*
` { } `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options.nix)



## perSystem\.\<system>\.treefmt\.settings\.formatter\.\<name>\.command



Executable obeying the treefmt formatter spec



*Type:*
Path to executable

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options.nix)



## perSystem\.\<system>\.treefmt\.settings\.formatter\.\<name>\.excludes



List of files to exclude for formatting\. Supports globbing\. Takes precedence over the includes\.



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options.nix)



## perSystem\.\<system>\.treefmt\.settings\.formatter\.\<name>\.includes



List of files to include for formatting\. Supports globbing\.



*Type:*
list of string

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options.nix)



## perSystem\.\<system>\.treefmt\.settings\.formatter\.\<name>\.options



List of arguments to pass to the command



*Type:*
list of string



*Default:*
` [ ] `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options.nix)



## perSystem\.\<system>\.treefmt\.settings\.global\.excludes



A global list of paths to exclude\. Supports glob\.



*Type:*
list of string



*Default:*
` [ ] `



*Example:*

```
[
  "node_modules/*"
]
```

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options.nix)



## perSystem\.\<system>\.treefmt\.settings\.global\.on-unmatched



Log paths that did not match any formatters at the specified log level\.



*Type:*
one of “debug”, “info”, “warn”, “error”, “fatal”



*Default:*
` "warn" `

*Declared by:*
 - [nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options\.nix](/nix/store/likik9bgsgxgn83i6937r6dz92vnhqqw-source/module-options.nix)


