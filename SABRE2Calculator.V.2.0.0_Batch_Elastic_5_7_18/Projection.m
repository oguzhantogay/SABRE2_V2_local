function [Pbar]=Projection(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L)

P = zeros(14,14);
% P matrix
P(4,3) = -Zetaavg/L;
P(4,4) = 1-Eta1/2;
P(4,5) = Zeta1/2;
P(4,10) = Zetaavg/L;
P(4,11) = -Eta2/2;
P(4,12) = Zeta2/2;

P(5,3) = -1/L;
P(5,5) = 1;
P(5,10) = 1/L;

P(6,2) = 1/L;
P(6,6) = 1;
P(6,9) = -1/L;

P(7,7) = 1;

P(8,1) = -1;
P(8,8) = 1;

P(11,3) = -Zetaavg/L;
P(11,4) = -Eta1/2;
P(11,5) = Zeta1/2;
P(11,10) = Zetaavg/L;
P(11,11) = 1-Eta2/2;
P(11,12) = Zeta2/2;

P(12,3) = -1/L;
P(12,10) = 1/L;
P(12,12) = 1;

P(13,2) = 1/L;
P(13,9) = -1/L;
P(13,13) = 1;

P(14,14) = 1;

% Pbar matrix
Pbar = zeros(9,14);
Pbar(1,1) = -1;
Pbar(1,8) = 1;
Pbar(3,6) = 1;
Pbar(4,5) = 1;
Pbar(5,7) = 1;
Pbar(7,13) = 1;
Pbar(8,12) = 1;
Pbar(9,14) = 1;

Pbar(3,2) = 1/L;
Pbar(4,10) = 1/L;
Pbar(7,2) = 1/L;
Pbar(8,10) = 1/L;

Pbar(3,9) = -1/L;
Pbar(4,3) = -1/L;
Pbar(7,9) = -1/L;
Pbar(8,3) = -1/L;

Pbar(2,10) = Zetaavg/L;
Pbar(6,10) = Zetaavg/L;

Pbar(2,3) = -Zetaavg/L;
Pbar(6,3) = -Zetaavg/L;

Pbar(6,4) = -Eta1/2;
Pbar(2,4) = 1-Eta1/2;
Pbar(2,5) = Zeta1/2;
Pbar(6,5) = Zeta1/2;

Pbar(2,11) = -Eta2/2;
Pbar(6,11) = 1-Eta2/2;
Pbar(2,12) = Zeta2/2;
Pbar(6,12) = Zeta2/2;



