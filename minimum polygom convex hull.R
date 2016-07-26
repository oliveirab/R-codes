library(plot3D)
library(FD)
library(geometry)

set.seed(666)
func_space <- data.frame(species = paste("species", 1:30), 
                         habitat = rnorm(30, sd=3), 
                         trophic = rnorm(30, sd=3), 
                         life_history = rnorm(30, sd=3)
)

convhulln(func_space[,2:4], "FA")$vol

com <- func_space[,2:4]

ids=t(convhulln(as.matrix(func_space[,2:4]), options = "Tv"))

scatter3D(x = func_space[,2], 
          y = func_space[,3], 
          z = func_space[,4],
          xlab = "Habitat", ylab = "Trophic", zlab = "Life history",  
          col = "red",pch = 1, cex = 1.8)
lines3D(x = func_space[,2:4][ids,1], 
         y = func_space[,2:4][ids,2], 
         z = func_space[,2:4][ids,3],
         xlab = "Habitat", ylab = "Trophic", zlab = "Life history", add=T,
         pch = 16, cex = 2, legend=FALSE, col = "black")
points3D(x = com[,1], 
         y = com[,2], 
         z = com[,3],
        xlab = "Habitat", ylab = "Trophic", zlab = "Life history", add=T,
        pch = 16, cex = 2, legend=FALSE, col = "black")

