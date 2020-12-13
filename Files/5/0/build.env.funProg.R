(function(mirrors)
        attach(name="FunProgEnv", what=build.env(
            parent.name="package:stats",
            path=paste0(mirrors, "GitHub/dmparrishphd/neatOveRse/Pkgs/"),
            subdirs=strsplit(split=" ", "1/0 2/0 3/0 4/0 5/0 6/0 1/1/0")[[1]])))
