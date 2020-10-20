(function(mirrors)
        attach(name="triviaEnv", what=build.env.from.files(
            parent.name="package:stats",
            path=paste0(mirrors, "GitHub/dmparrishphd/tRivia/Files/"),
            files=trimws(strsplit(split="\n", '
                1/0/R/zeroone.R
                2/0/R/anon.R
                3/0/s3d7a.br.R
                4/0/character.array.R
                4/0/rmna.R
                4/0/rmnl.R
                4/0/rmnullstrings.R
                4/0/rmstr.R
                4/0/rmtabs.R
                4/0/rmz.R
                5/0/readRaw.R
                5/0/writeRaw.R')[[1]][-1]))))
