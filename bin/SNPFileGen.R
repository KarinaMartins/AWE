### Script to generate SNPFILE for bayenv switch 1
### Singh P. | September 2014
### --------------------------------------------------
            # Load Input File
y <- read.table('adr_inp_60pop.csv', sep=',') #To be confirmed
snpname <- y$V1
snpname <- as.character(snpname)
y <- y[,7:dim(y)[2]]
y <- as.matrix(y)
# if(class(y[1,1])=='numeric'){print('yes')}

            # Make empty matrix
c <- matrix(0,nrow=(dim(y)[1]*2),ncol=dim(y)[2])

            # Fill up appropriate fracs/freqs
# Same freqs in odd rows
for (i in 1:dim(y)[1]){
  c[((2*i)-1),] <- y[i,]
}
# 1-freqs in even rows
for (i in 1:dim(y)[1]){
  c[(2*i),] <- 1 - c[((2*i)-1),]
}

            # Read the population data
y1 <- read.csv('pop_table_2.csv')
pop <- y1$Size
name<- y1$Population.Name; name<-as.character(name)

            # Clear memory of redundant data
#rm(y1,y)

            # Create bayenv format file
z<-sweep(c, MARGIN=2, pop, '*')
            #Round off numbers
a <- round(z)
u=data.frame(matrix(vector(),0,(dim(c)[2])))	# SNP data containing vector

	# Write the required SNP files
for(i in 1:(dim(a)[1]/2)){
      u[1,] <- a[(2*i)-1,]
      u[2,] <- a[(2*i),]
      file_name=paste(c('./SNPfiles60/',snpname[i]),collapse='')
      write.table(u,file=file_name,sep='\t',eol='\t \n',row.names=FALSE,col.names=FALSE)
}
            

# This script aims to create 623318 SNP Files to be used as an input to bayenv 
# switch=1 for the calculation of Bayes factors per SNP corresponding to various
# environmental variables