### Script to compare the covariance matrices from bayenv 
### and create correlation matrices: population clusters
### Singh P. | September 2014
### ----------------------------------------------------
setwd('~/pawan/climate_git/AWE/bin')
# Read in the covariance matrix
y <- read.csv('../results/covariance matrices/covawe30k', header=FALSE, sep = '\t',quote=NULL)
y<-y[,1:33]
class(y)
y<-as.matrix(y)
class(y[1,1])

# The analyzable covariance matrix is y.
range(y)
hist(y)
# Prep the correlation matrix
z<-cov2cor(y)

# Get the names
a <- read.csv('../data/populationclimate.txt')
b <- read.csv('../data/adr_inp_hdr (copy)')
names(b)
b1<-b[9:length(b[,1]),]
name <- a$Population.Name[2:61]
indx<-which(as.character(b1$X.2)=='y')
rownames(z)<-colnames(z)<-name[indx]

# Plot the clustered heatmap
hist(z)
png(filename='../results/covariance matrices/heatmap_clust_AWE30k',width=4,height=4,units='in',res=600,pointsize=7)
heatmap(z)
dev.off()
