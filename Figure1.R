
n.size = 40 # sample size
my.b = 10   # number of breaks in the histograms
t = 2.5     # mean of the transformed random variable, namely E[Y] = t 

set.seed(123)
x = rexp(n.size,rate=1)
hist(x, breaks = my.b, xlim=c(0,15),col="blue", ylim=c(0,20),xlab="X", main="")

#mean(x)  # check on the mean 
#sd(x)    # check on the std 

y = t*x   # transformed rv by means of the optimal transportation map
hist(y,breaks= my.b, xlim=c(0,15),col="red", ylim=c(0,20), xlab="Y", main="")

#mean(y)  # check on the mean 
#sd(y)    # check on the std 


#Check via simulation of exp with rate 1/t and mean t
set.seed(123)
y.c = rexp(n.size,rate=1/t)
hist(y.c, breaks= my.b,xlim=c(0,15),col="grey", ylim=c(0,20),
     xlab="Y", main="")

# mean(y.c) # should be the same as in line 17 


# plot the transportation map as a vector field

y.seq<-seq(1,length(x),by=1)
plot(x, y.seq,col="red",lwd=2, 
     ylim=c(0,n.size),xlim=c(0,15), pch = 16,
     ylab="Obs. num.",xlab="",type="p")

lines(x*t,y.seq,col="blue",lwd=2,type ="p",pch = 16)
abline(v=t,lwd=2,lty=2)
shape::Arrows(x0=x,y0=y.seq,x1=t*x,y1=y.seq, arr.adj = 1,
              arr.width = 0.05, lwd=1, arr.lwd=0.15, col="gray10")

