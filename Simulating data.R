### GENERATE EXAMPLE DATA
library(picante)
library(apTreeshape)
library(geiger)

Ncells   <- 100
Nspecies <- 50
Ntraits  <- 20

### 1 - SIMULATE DISTRIBUTIONAL DATA
occrS <- data.frame(matrix (nrow=Nspecies,ncol=Ncells,data=round(runif(Ncells*Nspecies))))
row.names(occrS) <- paste("Sp",1:Nspecies,sep="")
names(occrS) <- paste("Cell",1:Ncells,sep="")
dim(occrS)
occrS[1:20,1:10]

### 2 - SIMULATE PHYLOGENY (MATCHES THE DISTRIBUTIONAL DATA)
treS <- sim.bdtree(b=1,d=0.1,n=Nspecies)
treS <- drop.extinct(treS)
treS$tip.label <- paste("Sp",1:Nspecies,sep="")
plot(treS)
summary(treS)

### 3 - SIMULATE TRAIT DATA
traitS <- data.frame(matrix(nrow=Nspecies,ncol=Ntraits,data=rnorm(n=Nspecies*Ncells)))
row.names(traitS) <- paste("Sp",1:Nspecies,sep="")
names(traitS) <- paste("Trait",1:Ntraits,sep="")
dim(traitS)
traitS[1:20,1:5]