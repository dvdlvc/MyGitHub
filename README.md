Code for the working paper "A bridge between information theory, saddlepoint approximations,
and measure transportation", 2019, Andrej Ilievski, Davide La Vecchia, Elvezio Ronchetti.

The folder contains the R code for the saddlepoint density approximation (Sad) and the Edgeworth expansion (Edg) of the 
mean of n iid random variables, exponentially distributed. In both files, the Monte Carlo size is MCsize = 5000; this can be modified by the ultime user, but we in our experience 5000 Monte Carlo runs yield already very accurate results. 

The code Sadd_Exp.R generates the Figure 2 and Figure 3 available in the paper.
The code Test_Level_Power.R generates the Figure 4 available in the paper, for n=10. The other curves are obtained changing n.

Both R files have been writteb by Davide La Vecchia.
