### Get the AWE input in the bayenv format
### Singh P. | September 2014 
### ---------------------------------------
    # Read the inputs
y <- read.table('../data/adr_inp_awe')
x <- read.csv('../data/populationclimate.txt')
x <- x[-1,]
a <- read.csv('../data/adr_inp_hdr (copy)')
    
    # Truncate the tables as per AWE subset
a <- a[9:68,]
indx <- which((as.character(a$X.2))=='y')
x <- x[indx,]
pop <- x$Size

    # Check the sizes of objects
dim(x)[1] ; length(pop); dim(y)[2]

    # Employ wrking_script_1
y <- as.matrix(y)
if(class(y[1,1])=='numeric'){print('yes')}
rand <- sample(1:dim(y)[1], 10000)
y <- y[rand,]
    # Make empty matrix
c <- matrix(0,nrow=(dim(y)[1]*2),ncol=dim(y)[2])
#Fill up appropriate fracs/freqs
# Same freqs in odd rows
for (i in 1:dim(y)[1]){
  c[((2*i)-1),] <- y[i,]
}
name<-x$Population.Name; name<-as.character(name)
b<-sweep(c, MARGIN=2, pop, '*')
b <- round(b)
# Place the 1-pop in even rows
# 1-freqs in even rows
for (i in 1:((dim(b)[1])/2)){
  b[(2*i),] <- (pop - b[((2*i)-1),])
}
##### 
for(i in 1:dim(b)[1]){
  if(all.equal(b[i,],rep(0,length(b[1,])))==TRUE){print(c(i,'problem'))}
}
write.table(b, file="../data/inpforbayawe", quote = FALSE, sep = "\t", eol = "\t \n", row.names = FALSE, col.names = FALSE)
dim(b)
