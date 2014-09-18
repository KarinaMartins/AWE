### Script to get the Covariance Matrix from bayout
### Singh P. | September 2014
### ------------------------------------------------
a1<-read.csv('../results/covariance matrices/covawe5k', header=FALSE, sep = '\t',quote=NULL)
a2<-read.csv('../results/covariance matrices/covawe10k', header=FALSE, sep = '\t',quote=NULL)
a3<-read.csv('../results/covariance matrices/covawe15k', header=FALSE, sep = '\t',quote=NULL)
a4<-read.csv('../results/covariance matrices/covawe20k', header=FALSE, sep = '\t',quote=NULL)
a5<-read.csv('../results/covariance matrices/covawe25k', header=FALSE, sep = '\t',quote=NULL)
a6<-read.csv('../results/covariance matrices/covawe30k', header=FALSE, sep = '\t',quote=NULL)
a<-(a1+a2+a3+a4+a5+a6)/6
dim(a); a<-a[,1:33]
write.table(a, file="../results/covariance matrices/covawe_mean", quote = FALSE, sep = "\t", eol = "\t \n", row.names = FALSE, col.names = FALSE)
a <- as.matrix(a)
z <- cov2cor(a)
rownames(z)<-colnames(z)<-name[indx]
png(filename='../results/covariance matrices/heatmap_clust_AWE_mean',width=4,height=4,units='in',res=600,pointsize=7)
heatmap(z)
dev.off()
