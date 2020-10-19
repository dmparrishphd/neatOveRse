build.env <- function(parent.name, path, subdirs, pattern="[.]R$") {
    Envir <- new.env(parent=as.environment(parent.name))
    FILENAMES <- list.files(path, pattern=pattern, recursive=T)
    for (Filename in FILENAMES) source(Filename, local=Envir)
    Envir }
