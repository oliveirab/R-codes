codeconf <- read.csv("Mammals.csv", stringsAsFactors=F, encoding="utf8", sep=",", header=T)
require(rgdal)
mammals <- readOGR(dsn="All_MAMMALS_OCT2012/All_MAMMALS_OCT2012",layer="Mammals_Oct2012",input_field_name_encoding="utf8")
str(Mammals_Oct2012, max.level=2)
mammals@data[1:5,]
codeconf[1:5,]
mammals2 <- mammals
mammals2@data <- merge(mammals2@data,codeconf,by.x="ID_NO", by.y="ID_NO", all.x=T, sort=F)
dim(mammals@data)
dim(mammals2@data)
mammals2@data[1:5,]