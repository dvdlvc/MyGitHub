# Author: Davide La Vecchia. Last update: 29-May-2020.
# This code generates Figure 2 in the paper
# "A bridge between information theory, saddlepoint approximations and measure transportation" 
# by Ilievski, La Vecchia and Ronchetti (2019).


library('EQL')

df <-1
shape <- scale <- 1 # exponential random variable with rate = 1
x <- seq(0, 3, length=1000)
sigma2 <- 1
rho3 <- 2
rho4 <- 6
mu <- 1
tail<-3

# Approximations for a fix n

n <- 10 # top left plot in Fig 2. Use n = 50, 100, 250 to obtain the other plots. 


x <- seq(max(df-tail*sqrt(2*df/n),0), df+tail*sqrt(2*df/n), length=1000) 
ea <- edgeworth(x, n, rho3, rho4, mu, sigma2, type="mean") # Edg expansion
sp <- saddlepoint(x, n, gammaCumulants(shape, scale))      # Saddlepoint density 
true_dens <- n*dgamma(n*x, shape=n*shape, scale=scale)     # True density of the mean      


# compute relative error
rel_err_sp <- 100*((true_dens-sp$approx)/true_dens)
rel_err_ea <- 100*((true_dens-ea$approx)/true_dens)


plot(x,rel_err_ea,type='l',lty=4,lwd=3,col=1,ylim=c(-10,20),
     ylab="% Relative error", xlab="Xbar", cex=1.2, cex.axis=1.2)
lines(x,(rel_err_sp),type='l',lty=1,lwd=3,col=4)
legend(x=0.5,y=15,c('ea','sad'), col=c(1,4), lwd=c(3,3),
       lty=c(4,1),cex=1.4, bty = "n")

