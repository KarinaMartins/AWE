### Script to generate Bayenv Input from ADR's input.
### Singh P. | September 2014
### --------------------------------------------------
            #Load Input File
y <- read.table('adrinp10k')
y <- y[,7:67]
y <- as.matrix(y)
#if(class(y[1,1])=='numeric'){print('yes')}

            #Make empty matrix
c <- matrix(0,nrow=(dim(y)[1]*2),ncol=dim(y)[2])

            #Fill up appropriate fracs/freqs
# Same freqs in odd rows
for (i in 1:dim(y)[1]){
  c[((2*i)-1),] <- y[i,]
}
# 1-freqs in even rows
for (i in 1:dim(y)[1]){
  c[(2*i),] <- 1 - c[((2*i)-1),]
}

            #Read the population data
y1 <- read.csv('pop_table_2.csv')
pop <- y1$Size
name<- y1$Population.Name; name<-as.character(name)

            #Clear memory of redundant data
#rm(y1,y)

            #Create bayenv format file
z<-sweep(c, MARGIN=2, pop, '*')
            #Round off numbers
a <- round(z)

            #Write the file for bayenv use
write.table(a, file="adrbayinput60pop.txt", quote = FALSE, sep = "\t", eol = "\t \n", row.names = FALSE, col.names = FALSE)

#After this the file "adrbayinput10k" is a bayenv SNP file for 10k randomly chosen SNPs and can be used by the software directly.
#This produces the covariance matrix that can further be utilised to form the correlation matrix for plotting the population clusters.

