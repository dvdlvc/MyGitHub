## Author Davide La Vecchia (31-May-2020)
# The code below generates the power curve of the saddlepoin test 
# based on the Legendre transform of the mean
# for n = 10. The curve is available in Figure 4 of the paper
# "A bridge between information theory, saddlepoint approximations and measure transportation" 
# by Ilievski, La Vecchia and Ronchetti (2019).

set.seed(2020)
MCsize <- 5000 # change this if you want more MC runs

# Level (QQ-plot under H_0, for nsize = 10) 

nsize <- 10 # change this to increase the sample size
test_clean <- rep(0,MCsize)

for (i in 1:MCsize)
{
  sample_my_clean <- rexp(nsize,rate=1) 
  test_clean[i] <- 2*nsize*(mean(sample_my_clean)-1-log(mean(sample_my_clean)))
  print(i)
}

thquant=rchisq(MCsize,df=1)

# graphical fine-tuning of the grid to plot
xmax <- 15
ymax <- xmax
tau.max <- 0.9

## QQplot 
qqplot(thquant,test_clean, col=4, xlim=c(0,xmax), lwd=2,
       ylim=c(0,ymax), xlab="Chi^2 quantiles", 
       ylab="Emprical quantiles")
abline(0,1,col=2, lwd=3, lty=2)
abline(v=qchisq(0.95,df=1), lty=2)
abline(v=qchisq(0.975,df=1), lty=2)
text(2,10,"0.95 quantile")
text(7.5,14,"0.975 quantile")

# Power (study the rejection frequency under a seq of alternative hypotheses)

test_clean <- rep(0,MCsize)
t10 <- NULL
rej <- rep(0,MCsize)
tau <- seq(0,tau.max,by=0.05) #defines the grid of alternative hypotheses
cv <- qchisq(0.95,df=1)

for (j in 1:length(tau))
  {
    for (i in 1:MCsize)
    {
      sample_my_clean <- rexp(nsize,rate=1+tau[j]) 
      test_clean[i] <- 2*nsize*(mean(sample_my_clean)-1-log(mean(sample_my_clean)))
      if  (test_clean[i] >= cv) {
           rej[i] = 1
      }
    }
   t10[j]=sum(rej)/MCsize
   print(j)
  }

# plot of the power curve
plot(tau,t10, ylim=c(0.05,1), type="l", lty=1,col=4,lwd=2, ylab="", xlab="delta")


# Increase the sample size and superplot the power curves
# to get the plot for the power, as available in Figure 4.

