# Open Packages

I have called "open packages" "protopackages"
[elsewhere](https://github.com/dmparrishphd/tRivia/blob/master/Files/3/0/protopackages.md).

## Installing from Open-Packages

You should be able to use something a lot like [00-six.R](https://github.com/dmparrishphd/neatOveRse/blob/master/Files/2/0/00-six.R) to install and attach the open packages
(by default 0, 1/0, 2/0, 3/0, 4/0, 5/0, and 6/0).
**However**, I prefer a more flexible approach:
to build environments with `source` and to `attach` those environments,
using a process like
[build.env.R](https://github.com/dmparrishphd/neatOveRse/blob/master/Files/2/0/build.env.R)
(see the example
[build.env.un-six.R](https://github.com/dmparrishphd/neatOveRse/blob/master/Files/2/0/build.env.un-six.R))

The order of installation you specify should respect the _imports_ and _depends_
(see the DESCRIPTION and NAMESPACE files of the package[s] in question).
