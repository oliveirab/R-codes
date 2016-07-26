# Create background a grid of sampling probabilities.
# Maxent can sample grid cells for background data in proportion to those probabilities.
# For this, lets use occurrence points of all flowering plants downloaded from GBif to create your grid of ocurrence probabilities.
# The result of density.ppp is not a probability density. 
# It is an estimate of the intensity function of the point process that generated the point pattern data. 
# Intensity is the expected number of randompoints per unit area. The units of intensity are "points per unit area".
# Intensity is usually a function of spatial location, and it is this function which is estimated by density.ppp. 
# The integral of the intensity function over a spatial region gives the expected number of points falling in this region.


library(spatstat)

setwd("/media/brunno/FAT/Prosopis")

pBg <- read.csv("Magnoliophyta-GBif-July30-2015.csv",h=T,sep=",")
pBg <- data.frame(x=pBg$decimallongitude,y=pBg$decimallatitude)
pBg <- SpatialPoints(na.omit(pBg))
pBg <- pBg[NatFrame,] # subset only native occurrences

XY <- as.data.frame(BgAll[[1]], xy=T)

w <- as.owin(WE_c)

p <- ppp(pM2$x, pM2$y, window = w)

p.dens1 <- density(p, bw.ppl) # bw.diggle - sigma = 0.00162728 / bw.ppl - sigma = 
p.dens2 <- density(p) # eps=resolution -> to change the resolution of the im. The result is the same, the only difference is map with fine resolution.
par(mfrow=c(1,2))
#plot(pM2,cex=.3); plot(WE_c,add=T)
plot(p.dens1); plot(WE_c,add=T)
plot(p.dens2); plot(WE_c,add=T)
dev.off()
