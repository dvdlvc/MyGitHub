# Author: Davide La Vecchia. Last update: 29-May-2020.
# This code generates Figure 3 in the paper
# "A bridge between information theory, saddlepoint approximations and measure transportation" 
# by Ilievski, La Vecchia and Ronchetti (2019).


library('EQL')

## Fig 2

df <-1
shape <- scale <- 1 # exponential random variable with rate = 1
sigma2 <- 1
rho3 <- 2
rho4 <- 6
mu <- 1
tail <- 3 # define a cut off for the tail---needed just for plotting purposes


# Approximations 
n <- 10 # 
x <- seq(max(df-tail*sqrt(2*df/n),0), df+tail*sqrt(2*df/n), length=1000) # grid of points
ea <- edgeworth(x, n, rho3, rho4, mu, sigma2, type="mean") # Edg expansion of the mean
true_dens <- n*dgamma(n*x, shape=n*shape, scale=scale)     # true density of the mean      




# Code for Fig 2
plot(x,true_dens,col=1,type='l',lty=2, lwd=2, xlab="z", ylab="Density")
lines(x,ea$approx,col=1,lty=1,lwd=2)
lines(x,asy,col=2,lty=4,lwd=2)
legend(x=1.5,y=1,c('true','Edg','asy'), col=c(1,1,2), lwd=c(2,2,2),
       lty=c(2,1,4),cex=1, bty = "n")



## Code for Fig 3

# Approximations for a fix n (code below for n = 10, change n to obtain the other plots)

n <- 10 # top left plot in Fig 3. Use n = 50, 100, 250 to obtain the other plots. 
x <- seq(max(df-tail*sqrt(2*df/n),0), df+tail*sqrt(2*df/n), length=1000) # grid of points
ea <- edgeworth(x, n, rho3, rho4, mu, sigma2, type="mean") # Edg expansion of the mean
sp <- saddlepoint(x, n, gammaCumulants(shape, scale))      # sad density of the mean
true_dens <- n*dgamma(n*x, shape=n*shape, scale=scale)     # true density of the mean      


# compute relative error
rel_err_sp <- 100*((true_dens-sp$approx)/true_dens)
rel_err_ea <- 100*((true_dens-ea$approx)/true_dens)

# Fig 3: plot the % relative error for the two approximations 
plot(x,rel_err_ea,type='l',lty=4,lwd=3,col=1,ylim=c(-10,20),
     ylab="% Relative error", xlab="Xbar", cex=1.2, cex.axis=1.2)
lines(x,(rel_err_sp),type='l',lty=1,lwd=3,col=4)
legend(x=0.5,y=15,c('ea','sad'), col=c(1,4), lwd=c(3,3),
       lty=c(4,1),cex=1.4, bty = "n")

