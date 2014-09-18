### Script to read the covariance matrix from bayenv 
### and create a correlation matrix: population clusters
### Singh P. | September 2014
### ----------------------------------------------------

      # Set working directory
setwd('~/pawan/research/climate/results/bay_out/')

      # Read in the covariance matrix
y <- read.csv('covmat10k', header=FALSE, sep = '\t',quote=NULL)
y<-y[,1:61]
class(y)
y<-as.matrix(y)
class(y[1,1])

      # The analyzable covariance matrix is y.
range(y)
hist(y)
      # Prep the correlation matrix
z<-cov2cor(y)

      # Get the names
a <- read.csv('pop_table_6.csv')
name <- a$Population.Name
rownames(z)<-colnames(z)<-name

      # Plot the clustered heatmap
hist(z)
png(filename='heatmap_clust_10k',width=4,height=4,units='in',res=600,pointsize=7)
heatmap(z)
dev.off()

