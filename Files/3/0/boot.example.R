(function(mirrors)  {
    `%//%` <- paste0
    DIR <- mirrors %//% "GitHub/dmparrishphd/neatOveRse/Files/3/0/"
    source(DIR %//% "boot.R")[[1]](
        mirrors=mirrors,
        path=DIR,
        files=c(
            "build.env.build.R",
            "build.env.tRivia1.R",
            "build.env.un-six.R"
        )
)})
