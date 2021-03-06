#### Brunno Oliveira, 2014 (brunno.oliveira@me.com)
#### Universidade Federal do Rio Grande do Norte - Brasil
#### make presence/absence 1/0 matrix
#### Enter with a lists with .shp extension name
#### E.g.: 
#### shpfilenames <- list.files("our directory",pattern=".shp",full.name=T,recursive=T)

siteXsp <- function(shpfilenames){
  
  # this gets the sitexsp matrix of 0s and 1s
  rasters <- list()
  d <- data.frame("Species"="species")
  for (i in 1:length(shpfilenames)){
    speciesrange <- readShapePoly(shpfilenames[i]) 
    rasters[[i]] <- rasterize(speciesrange, myvarscrop, field=1, background=0) 
    keepname <- data.frame(Species=speciesrange$SCINAME[1])
    d <- rbind(d, keepname)
    print(i)
  }
  s <- stack(rasters)
  x <- as.data.frame(s)
  d <- d[-1,]
  drename <- strsplit(x=as.character(d), split = " ")
  drename2 <- sapply(drename, function(x){
    paste(x[[1]], x[[2]], sep="_")
  })
  colnames(x) <- drename2
  
  # version without cells that are presence only (e.g., ocean)
  m <- as.matrix(x, rownames.force=T) #use rownames.force=T to keep the cellIDs
  m1 <- m[apply(m, MARGIN=1, FUN=sum)>0, ] #MARGIN=1 means rows
  
}
siteXsp()
  