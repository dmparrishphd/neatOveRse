# About 3/0/boot.R

[3/0/boot.R](https://github.com/dmparrishphd/neatOveRse/blob/master/Files/3/0/boot.R)
is intended to be used as part of a loader to set up your **R** search path, etc.

[5/0/boot.example.R](../../5/0/boot.example.R)
implements
[3/0/boot.R](../../3/0/boot.R)
to build and attach:

1. an environment for building environments,

2. an environment containing some of the functions defined by the
[tRivia repository](https://github.com/dmparrishphd/tRivia), and

3. an environment containing some of the functions defined by the
[neatOveRse repository](https://github.com/dmparrishphd/neatOveRse).

## Usage

    #USAGE OF 5/0/boot.example.R
    
    (function(mirrors="/usr/local/share/mirrors/") {
        # mirrors IS WHEREVER YOU ARE STORING COPIES OF THE FILES
        # (WITH THEIR PATHS) AS EXPECTED BY boot.example.R,
        # **** INCLUDING **** THE TRAILING PATH SEPARATOR (e.g., "/").
        source(paste0(mirrors, "GitHub/dmparrishphd/neatOveRse/",
            "Files/5/0/boot.example.R"))[[1]](mirrors)
     })("/usr/local/share/mirrors/")
     
