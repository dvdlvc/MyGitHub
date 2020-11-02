
n.size = 40
my.b = 10
t = 2.5 

set.seed(123)
x = rexp(n.size,rate=1)
hist(x, breaks = my.b, xlim=c(0,15),col="blue", 
     ylim=c(0,20),xlab="X", main="")

mean(x)
sd(x)

y = t*x 
hist(y,breaks= my.b, xlim=c(0,15),col="red", ylim=c(0,20),
     xlab="Y", main="")

mean(y)
sd(y)

#Check via simulation of exp with rate 1/t and mean t
set.seed(123)
y.c = rexp(n.size,rate=1/t)
hist(y.c, breaks= my.b,xlim=c(0,15),col="grey", ylim=c(0,20),
     xlab="Y", main="")
mean(y.c)

y.seq<-seq(1,length(x),by=1)
plot(x, y.seq,col="red",lwd=2, 
     ylim=c(0,n.size),xlim=c(0,15), pch = 16,
     ylab="Obs. num.",xlab="",type="p")

lines(x*t,y.seq,col="blue",lwd=2,type ="p",pch = 16)
abline(v=t,lwd=2,lty=2)
shape::Arrows(x0=x,y0=y.seq,x1=t*x,y1=y.seq, arr.adj = 1,
              arr.width = 0.05, lwd=1, arr.lwd=0.15, col="gray10")

