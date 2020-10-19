build.env.from.files <- function(parent.name, path, files) {
    Envir <- new.env(parent=as.environment(parent.name))
    FILENAMES <- paste0(path, files)
    for (Filename in FILENAMES) source(Filename, local=Envir)
    Envir }
