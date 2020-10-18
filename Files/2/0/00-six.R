#234567890123456789012345678901234567890123456789012345678901234-----0-2-------*
#STATUS: IN PROGRESS

# **** WARNING ***
# THERE IS APPARENTLY A PROBLEM WITH INSTALLING TO LIBRARIES AT
# UNC PATHS (THAT BEGIN WITH \\ ON WINDOWS), INCLUDING MAPPED
# DRIVES TO SUCH.
#
# **** WORK-AROUND ****
# INSTALL TO LOCAL DIRECTORY, THEN COPY TO DESIRED LOCATION.

# DESIGN
#
# HANDLES PACKAGES THAT HAVE ALREADY BEEN CREATED


`%//%` <- function(...) paste0(...)
HNL <- "\n"
slash <- function(x) gsub("/", "\\\\", x)



# PARAMETERS

PACKAGE.NAME <- "apace"
PACKAGE.VERSION <- "_0.0-1"
PACKAGE.PATH <- "C:/Users/DMP/_/WORK/"

TEMP.DIR <- "L:/" # FOR WRITING TEMPORARY SHELL SCRIPTS

# THE LIB DIRS SHOULD BE COMPATIBLE WITH SYSTEM COMMAND LINE
LIB.LOCAL <- "C:/Users/DMP/_/WORK/LIBR" # EXCLUDE TERMINAL PATH SEPARATOR
LIB.DESIRED <- "C:/Users/DMP/_/WORK/LIBR2/" # INCLUDE TERMINAL PATH SEPARATOR



# CHECK DEFS
cat("PACKAGE.NAME:", PACKAGE.NAME, "\n")
cat("PACKAGE.PATH:", PACKAGE.PATH, "\n")
cat("LIB.LOCAL:", LIB.LOCAL, "\n")
cat("LIB.DESIRED:", LIB.DESIRED, "\n")



# DETACH PACKAGE FROM SEARCH PATH
while("package:" %//% PACKAGE.NAME %in% search())
		detach("package:" %//% PACKAGE.NAME, character.only=T)



# REMOVE THE PACKAGE FROM THE DESIRED AND LOCAL LOCATIONS
remove.packages(pkgs=PACKAGE.NAME, lib=LIB.DESIRED)
remove.packages(pkgs=PACKAGE.NAME, lib=LIB.LOCAL)



################################################################

# INSTALL PACKAGE TO DEFAULT LOCATION USING ONE OF THE FOLLOWING
# TWO METHODS


# **** METHOD 2A: **** RUN IN R---INSTALL FROM tar.gz FILE
install.packages(
	pkgs=PACKAGE.PATH %//% PACKAGE.NAME %//% PACKAGE.VERSION %//% ".tar.gz",
	lib=LIB.LOCAL,
	repos=NULL,
	method="internal",
	type="source",
	verbose=T)



# **** METHOD 2B: **** RUN IN R---INSTALL FROM FILES
install.packages(
	pkgs=PACKAGE.PATH %//% PACKAGE.NAME,
	lib=LIB.LOCAL,
	repos=NULL,
	method="internal",
	type="source",
	verbose=T)



################################################################
# WRITE THE COMMMAND TO COPY LOCALLY-INSTALLED PACKAGE TO
# DESIRED LOCATION.

'""


cat(file=TEMP.DIR %//% "TEMP-OVERWRTE-INSTALLED-PACKAGE.BAT", sep="", HNL,
	"robocopy " %//%
	slash(LIB.LOCAL) %//% "\\" %//% PACKAGE.NAME %//% " " %//%
	slash(LIB.DESIRED) %//%	PACKAGE.NAME %//%
	" /E",
	HNL, HNL)



""'




# ATTACH PACKAGE
# **** REMINDER: **** library SEEMS TO REMEMBER THE OLD PACKAGE:
# MIGHT BE BEST TO TRY IN A NEW R SESSION
library(
	package=PACKAGE.NAME,
	lib=LIB.DESIRED,
	character.only=T,
	verbose=T)



# VIEW THE SEARCH PATH
search()



# LIST CONTENTS OF THE PACKAGE
ls(all.names=T, "package:" %//% PACKAGE.NAME)
ls("package:" %//% PACKAGE.NAME)
