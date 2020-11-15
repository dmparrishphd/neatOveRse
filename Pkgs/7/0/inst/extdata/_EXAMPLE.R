# FILE USED FOR EXAMPLE:
# "https://www2.census.gov/geo/tiger/GENZ2018/shp/cb_2018_us_county_20m.zip"

FILENAME <- "~/Downloads/cb_2018_us_county_20m.shp"

# WHERE THIS PACKAGE IS STORED:
ROOT <- "~/Mirrors/GitHub/dmparrishphd/neatOveRse/Pkgs/7/0/"

. <- source(paste0(ROOT, "R/type5.R"))[[1]](ROOT)

ls(.)

ls(., a=T)

. <- .$init(., FILENAME)
. <- .$loadAllPoints(.)

.$HEADER
head(.$PARTS)
head(.$N)
head(.$SUBHEADERS)

with(.$SUBHEADERS, range(c(YMin, YMax)))
with(.$SUBHEADERS, range(c(XMin, XMax)))

pdf("dwg.pdf", height=6.5, width=8.5)
par(mai=rep(.5, 4))
image(c(-125, -65), c(25, 50), matrix(1), col=NA, asp=1,
xlab="", ylab="", xaxt="n", yaxt="n", bty="n")
mtext("2018 Cartographic Boundary File, Current County and Equivalent for United States, 1:20,000,000")
mtext(side=1, line=-2, "plate carre projection")
mtext(side=1, line=-1, "Source of Data: U.S. Census Bureau")
mtext(side=1, line=0, "https://www2.census.gov/geo/tiger/GENZ2018/shp/cb_2018_us_county_20m.zip")
for (n in seq_along(.$POINTS)) for (k in seq_along(.$POINTS[[n]])) {
	Points <- .$POINTS[[n]][[k]]
	if (
		all(Points[,1] < 0 &&
		all(Points[,1] > -125) &&
		all(20 < Points[,2]))
	) polygon(Points, col=grep("green", colors(), value=T)[ceiling(40*runif(1))])
}
dev.off()
