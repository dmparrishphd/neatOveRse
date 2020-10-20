function(mirrors, files=character(), path="") for (file in files)
        source(local=T, paste0(path, file))[[1]](mirrors)
