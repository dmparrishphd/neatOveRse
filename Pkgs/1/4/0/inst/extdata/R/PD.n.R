.n <- vapply %<=% list (
    FUN = .second %O% length ,
    USE.NAMES = FALSE ,
    FUN.VALUE = 1L )
