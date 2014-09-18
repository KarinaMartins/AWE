### File truncator
### This script truncates my files and matrices to 52 populations for debugging bayenv
### Singh P. | September 2014
### ----------------------------------------------------
setwd('~/pawan/climate_git/60/debug/')
a<-read.table('rs10004643-60ed')
dim(a)
a<-a[,1:58]
write.table(a,file='../debug/rs10004643-58',sep='\t',eol='\t \n', row.names=FALSE, col.names=FALSE)

a<-read.table('covmat60')
dim(a)
a<-a[1:58,1:58]
write.table(a,file='../debug/covmat-58',sep='\t',eol='\t \n', row.names=FALSE, col.names=FALSE)

a<-read.table('climate9.env')
dim(a)
a<-a[,1:58]
write.table(a,file='../debug/climate-58',sep='\t',eol='\t \n', row.names=FALSE, col.names=FALSE)

