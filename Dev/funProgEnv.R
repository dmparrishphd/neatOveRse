(function(mirrors) {
    stop("UNTESTED!")
    strsplit1 <- function(x) strsplit(x, split=" ")[[1]]
    `%//%` <- paste0
    PREFIX <- mirrors %//% "GitHub/dmparrishphd/neatOveRse/"
    ENV1 <- build.env(
        parent.name="package:stats",
        path=PREFIX %//% "Pkgs/",
        subdirs=strsplit1("1/0 2/0 3/0 4/0 5/0 6/0"))
    ENV2 <- build.env.from.files(
        parent.name="package:stats",
        path=PREFIX %//% "Files/",
        files=strsplit1("3/0/PC.LT.EQ.2.PC.R"))
    ENV <- c(ENV1, ENV2) #TODO: WILL THIS WORK?
    attach(name="FunProgEnv", what=ENV)
})
