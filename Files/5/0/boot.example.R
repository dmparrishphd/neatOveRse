function(mirrors) {
    `%//%` <- paste0
    DIR <- mirrors %//% "GitHub/dmparrishphd/neatOveRse/Files/"
    source(DIR %//% "3/0/boot.R")[[1]](
        mirrors=mirrors, path=DIR, files=c(
            "4/0/build.env.build.R",
            "3/0/build.env.tRivia1.R",
            "5/0/build.env.funProg.R"))}
