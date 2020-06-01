R Code for the working paper "A bridge between information theory, saddlepoint approximations,
and measure transportation", 2019, Andrej Ilievski, Davide La Vecchia, Elvezio Ronchetti.

The repository contains two files:

1- Sadd_Exp.R https://github.com/dvdlvc/MyGitHub/blob/Saddlepoint_MeasureTransportation/Sadd_Exp.R  generates the Figure 2 and Figure 3 available in the paper. The file contains R code for the saddlepoint density approximation (Sad) and the Edgeworth expansion (Edg) of the mean of n iid random variables, exponentially distributed.

2- Test_Level_Power.R https://github.com/dvdlvc/MyGitHub/blob/Saddlepoint_MeasureTransportation/Test_Level_Power.R 
generates the power curve Figure 4 available in the paper, for n=10. The other power curves are obtained changing n and 
superposing the resulting plots.

Both R files have been writteb by Davide La Vecchia, on May 2020 (last update).  The Monte Carlo size is MCsize = 5000. This 
value can be increased by the user, but we in our experience 5000 Monte Carlo runs yield already very accurate results. 
