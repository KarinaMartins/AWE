### Script to get the data for AWE populations for subsequent analysis
### Singh P. | September 2014
### ------------------------------------------------------------------
setwd('~/pawan/climate_git/AWE/bin/')
y<-read.table('../data/adr_inp.txt')
x<-read.csv('../data/adr_inp_hdr (copy)')
x<-x[9:68,]
u <- x$X.2
u<-as.character(u)
length(u)
length(names(y))
y<-y[,8:67]
indx <- which(u=='y')
y.indx <- y[,indx]
write.table(y.indx,file='../data/adr_inp_awe',sep='\t',eol='\t \n', row.names=FALSE, col.names=FALSE)
