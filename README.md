# Overview

This repository contains the working paper ["A bridge between information theory, saddlepoint approximations,
and measure transportation"](https://github.com/dvdlvc/MyGitHub/blob/Saddlepoint_MeasureTransportation/June_2020_MongeKantorovich_Saddlepoint.pdf), 2019, 
Andrej Ilievski, Davide La Vecchia, Elvezio Ronchetti. The repository  contains two R files which reproduce Figure 2, 3 and 4 
in the manuscript.

## Content

Three R files:

1- [Figure1.R](https://github.com/dvdlvc/MyGitHub/blob/Saddlepoint_MeasureTransportation/Figure1.R) generates Figure 3 
available in the paper. The optimal transport mapping is in closed form and Y=tX. The conjugate density is an exp(1/t).

2- [Sadd_Exp.R](https://github.com/dvdlvc/MyGitHub/blob/Saddlepoint_MeasureTransportation/Sadd_Exp.R) generates the Figure 4 
and Figure 5 available in the paper. The file contains the R code for the saddlepoint density approximation and the 
Edgeworth expansion for the mean of n iid random variables, exponentially distributed, with rate one---exp(1). The Monte Carlo size is MCsize = 5000.

3- [Test_Level_Power.R](https://github.com/dvdlvc/MyGitHub/blob/Saddlepoint_MeasureTransportation/Test_Level_Power.R) 
implements the saddlepoint test of Robinson, Ronchetti and Young (Annals of Statistics, Volume 31, Number 4 (2003), 1154-1169, 
https://projecteuclid.org/euclid.aos/1059655909) based on the Legendre transform for the mean 
of n = 10 iid random variables exponentially distributed. We consider the simple hypthesis testing problem as in Example 1 p. 
1164 of Robinson et al (2003) paper . The code generates the QQplot and one of the power curve in Figure 4, as available in 
the paper. The other power curves are obtained changing n and superposing the resulting plots. The Monte Carlo size is MCsize = 5000. This value can be increased by the user. In our experience 5000 Monte Carlo runs yield already very accurate results, for the saddlepoint density and the test. 

4- The file .m is inspired by Peyre and Cuturi (2019) and it generates Figure 2 (optimal transportation of Gaussians mixture)

## Additional info
- Author of the R codes: Davide La Vecchia.
- Creation date: May 2020. 
- Last update: June 2020. 
- R version: 3.6.1 (>=).
