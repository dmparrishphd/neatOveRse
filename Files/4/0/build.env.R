build.env <- function(parent.name="package:stats", path="",
        subdirs=character(), pattern="[.]R$") {
    Envir <- new.env(parent=as.environment(parent.name))
    GROUP <- lapply(subdirs, function(subdir) list.files(
        paste0(path, subdir), pattern=pattern, recursive=T))
    for (k in seq_along(GROUP)) for (Filename in GROUP[[k]])
            source(paste0(path, subdirs[k], "/", Filename), local=Envir)
    Envir }
