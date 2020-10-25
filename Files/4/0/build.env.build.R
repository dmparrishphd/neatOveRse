(function(mirrors) {
    Envir <- new.env(parent=as.environment("package:stats"))
    `%//%` <- paste0
    NEATOVERSE <- mirrors %//% "GitHub/dmparrishphd/neatOveRse/" 
    for (Filename in c(
        NEATOVERSE %//% "Files/4/0/build.env.R",
        NEATOVERSE %//% "Files/3/0/build.env.from.files.R"))
            source(Filename, local=Envir)
    attach(name="buildEnv", what=Envir) })
