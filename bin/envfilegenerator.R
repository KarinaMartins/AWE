### Script to create the environment file for bayenv
### Singh P. | September 2014
### ------------------------------------------------
    # Read the population climate file
x <- read.csv('../data/populationclimate.txt')
class(x); dim(x); names(x)
env.vars <- names(x)[7:dim(x)[2]]

    # Remove the global population from the analysis
y <- x[-1,]
y$Source <- y$Size <- y$Lat <- y$Long <- y$Comments <- NULL
y[1:4,]
dim(y)

    # Get the data standardised for the climate file.
u <- y
for(i in 2:dim(y)[2]){
  u[,i]<-as.numeric(scale(y[,i]))
}

    # Write the data in the appropriate format for bayenv climate file.
u$Population.Name <- NULL
v <- as.matrix(u)
v <- t(v)
write.table(v,file='../data/climate9.env',sep='\t',eol='\t \n', row.names=FALSE, col.names=FALSE)
getwd()

## dbCLINE.env is the environment file to be used for the Anna DiRienzo's results 
## The file contains 9 environmental variables for 60 populations used in the paper
## *The population size is not mentioned completely. HGDP size changes.