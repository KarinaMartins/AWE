# Script to generate Bayenv Input from ADR's input.
### Singh P. | September 2014
### --------------------------------------------------
#Load Input File
Y <- read.table('../data/adr_inp.txt')
y <- Y[,8:67]
y <- as.matrix(y)
rand <- sample(1:dim(y)[1], 10000)
#if(class(y[1,1])=='numeric'){print('yes')}
y <- y[rand,]
#Make empty matrix
c <- matrix(0,nrow=(dim(y)[1]*2),ncol=dim(y)[2])

#Fill up appropriate fracs/freqs
# Same freqs in odd rows
for (i in 1:dim(y)[1]){
  c[((2*i)-1),] <- y[i,]
}

#Read the population data
y1 <- read.csv('../data/populationclimate.txt')
pop <- y1$Size
pop <- pop[2:length(pop)]
name<- y1$Population.Name; name<-as.character(name)

#Clear memory of redundant data
#rm(y1,y)

#Create bayenv format file
a<-sweep(c, MARGIN=2, pop, '*')
#Round off numbers
a <- round(a)

# Place the 1-pop in even rows
# 1-freqs in even rows
for (i in 1:((dim(a)[1])/2)){
  a[(2*i),] <- (pop - a[((2*i)-1),])
}

##### 
for(i in 1:dim(a)[1]){
  if(all.equal(a[i,],rep(0,60))==TRUE){print(c(i,'problem'))}
}

#Write the file for bayenv use
write.table(a, file="../data/inpforbay2", quote = FALSE, sep = "\t", eol = "\t \n", row.names = FALSE, col.names = FALSE)
2252*2-1
#After this the file "inpforbay" is a bayenv SNP file for 10k randomly chosen SNPs and can be used by the software directly.
#This produces the covariance matrix that can further be utilised to form the correlation matrix for plotting the population clusters.
