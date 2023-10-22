#
#
#  TD_pixelmap_color for pixelmap colorization
#  by R. Fukushima (ver. Oct 22, 2023)
#
#  This script requires 'fields' and 'matlab' packages 
#
#
library(fields)
library(matlab)
#
xandypix <- 100 # the number of pixels along one axis

intensity <- read.table("x_gr.txt")
#intensity2 <- read.table("x_alm.txt")

intensity_vector <- numeric(xandypix * xandypix)
#intensity_vector2 <- numeric(xandypix * xandypix)

intensity_vector[intensity[,1]] <- intensity[,2]
#intensity_vector2[intensity2[,1]] <- intensity2[,2]

#intensity_vector <- intensity_vector + intensity_vector2

mat <- matrix(intensity_vector, nrow=xandypix, ncol=xandypix)
mat[mat == 0] <- NA

x <- seq(0, xandypix,by=1)
y <- seq(0, xandypix,by=1)


## 'fields' and 'matlab' packages are required
par(pin = c(4,4))
image.plot(x, y, mat,col=jet.colors(32))



par(new = T)
contour(mat, xaxs = "i", yaxs = "i", xaxt = "n", yaxt = "n")

