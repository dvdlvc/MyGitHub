R Code for the working paper "A bridge between information theory, saddlepoint approximations,
and measure transportation", 2019, Andrej Ilievski, Davide La Vecchia, Elvezio Ronchetti.

The repository contains two files:

1- [Sadd_Exp.R] (https://github.com/dvdlvc/MyGitHub/blob/Saddlepoint_MeasureTransportation/Sadd_Exp.R)  generates the Figure 2 and 
Figure 3 available in the paper. The file contains R code for the saddlepoint density approximation (Sad) and the Edgeworth 
expansion (Edg) of the mean of n iid random variables, exponentially distributed, with rate one.

2- Test_Level_Power.R https://github.com/dvdlvc/MyGitHub/blob/Saddlepoint_MeasureTransportation/Test_Level_Power.R 
implements the saddlepoint test of Robinson, Ronchetti and Young (Annals of Statistics, Volume 31, Number 4 (2003), 1154-1169, 
https://projecteuclid.org/euclid.aos/1059655909) based on the Legendre transform for the mean 
of n = 10 iid random variables exponentially distributed. We consider the simple hypthesis testing problem as in Example 1 p. 
1164 of Robinson et al (2003) paper . The code generates the QQplot and one of the power curve in Figure 4, as available in 
the paper. The other power curves are obtained changing n and superposing the resulting plots.

For both files, the Monte Carlo size is MCsize = 5000. This value can be increased by the user. In our experience 5000 Monte 
Carlo runs yield already very accurate results, for the saddlepoint density and the test. 

Additional info:

- Author: Davide La Vecchia.
- Creation data: May 2020. 
- Last update: June 2020. 
- R version: 3.6.1 (>=).
