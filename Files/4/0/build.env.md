build.env
=========

Build protopackages: create a new environment from source files.

Usage

    build.env(
        parent.name="package:stats",
        path="",
        subdirs=character(),
        pattern="[.]R$")
        
|      Argument | Description |
| ------------: | :---------- |
| `parent.name` | The name of environment to assign as the parent environment of the newly-created environment |
|        `path` | A character string specifying the path to the `subdirs` |
|     `subdirs` | A character vector of subdirectories |
|     `pattern` | passed to `list.files` |

Details
-------

_Include_ a trailing path separator (e.g., "/") in the `path`, but
_Omit_ the path separator from the `subdirs`.

The `pattern` argument should be a regular expression (see `help(regex)`).
It will be used to find files in the subdirectories specified by `subdirs` and `path`.

All found files are `source`d in the order found, and `source`d in the newly created environment.
  
Intent
------

[4/0/build.env](https://github.com/dmparrishphd/neatOveRse/blob/master/Files/4/0/build.env.R)
supersedes 
[2/0/build.env](https://github.com/dmparrishphd/neatOveRse/blob/master/Files/2/0/build.env.R)
