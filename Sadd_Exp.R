## Figure 2
# This code generates Figure 2 in the paper
# "A bridge between information theory, saddlepoint approximations,
# and measure transportation" 
# by Ilievski, La Vecchia and Ronchetti (2019).




library('EQL')

df <-1
shape <- scale <- 1
x <- seq(0, 3, length=1000)
sigma2 <- 1
rho3 <- 2
rho4 <- 6
mu <- 1
tail<-3

#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l
#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l
#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l

n <- 10


x <- seq(max(df-tail*sqrt(2*df/n),0), df+tail*sqrt(2*df/n), length=1000) 
ea <- edgeworth(x, n, rho3, rho4, mu, sigma2, type="mean") 
sp <- saddlepoint(x, n, gammaCumulants(shape, scale)) 
true_dens <- n*dgamma(n*x, shape=n*shape, scale=scale)


plot(sp, col= 4, lwd=2)
lines(x,true_dens)
lines(x,ea$approx,col=2)

rel_err_sp = 100*((true_dens-sp$approx)/true_dens)
rel_err_ea =100*((true_dens-ea$approx)/true_dens)


setEPS()
postscript("Cfr_n10.eps")
plot(x,rel_err_ea,type='l',lty=4,lwd=3,col=1,ylim=c(-10,20),
     ylab="% Relative error", xlab="Xbar", cex=1.2, cex.axis=1.2)
lines(x,(rel_err_sp),type='l',lty=1,lwd=3,col=4)
legend(x=0.5,y=15,c('ea','sad'), col=c(1,4), lwd=c(3,3),
       lty=c(4,1),cex=1.4, bty = "n")
dev.off()


#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l
#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l
#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l

n <- 50


x <- seq(max(df-tail*sqrt(2*df/n),0), df+tail*sqrt(2*df/n), length=1000) 
ea <- edgeworth(x, n, rho3, rho4, mu, sigma2, type="mean") 
sp <- saddlepoint(x, n, gammaCumulants(shape, scale)) 
true_dens <- n*dgamma(n*x, shape=n*shape, scale=scale)



plot(sp, col= 4, lwd=2)
lines(x,true_dens)
lines(x,ea$approx,col=2)

rel_err_sp = 100*((true_dens-sp$approx)/true_dens)
rel_err_ea =100*((true_dens-ea$approx)/true_dens)


setEPS()
postscript("Cfr_n50.eps")
plot(x,rel_err_ea,type='l',lty=4,lwd=3,col=1,ylim=c(-10,20),
     ylab="% Relative error", xlab="Xbar", cex=1.2, cex.axis=1.2)
lines(x,rel_err_sp,type='l',lty=1,lwd=3,col=4)
dev.off()




#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l
#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l
#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l#l

n <- 250


x <- seq(max(df-tail*sqrt(2*df/n),0), df+tail*sqrt(2*df/n), length=1000) 
ea <- edgeworth(x, n, rho3, rho4, mu, sigma2, type="mean") 
sp <- saddlepoint(x, n, gammaCumulants(shape, scale)) 
true_dens <- n*dgamma(n*x, shape=n*shape, scale=scale)



plot(sp, col= 4, lwd=2)
lines(x,true_dens)
lines(x,ea$approx,col=2)

rel_err_sp = 100*((true_dens-sp$approx)/true_dens)
rel_err_ea =100*((true_dens-ea$approx)/true_dens)


setEPS()
postscript("Cfr_n250.eps")
plot(x,rel_err_ea,type='l',lty=4,lwd=3,col=1,ylim=c(-10,20),
     ylab="% Relative error", xlab="Xbar", cex=1.2, cex.axis=1.2)
lines(x,rel_err_sp,type='l',lty=1,lwd=3,col=4)
#legend(x=0.5,y=-80,c('ea','sad'), col=c(1,4),lty=c(4,1),cex=1.4, bty = "n")
dev.off()


