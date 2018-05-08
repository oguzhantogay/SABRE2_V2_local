function [Kt] = CondensationWL(Kt)
K1=zeros(4,1);K2=zeros(1,9);K3=zeros(4,1);
% Stiffness Condensation i node
Ktc11=Kt(1:4,1:4,1);
Ktc12=Kt(1:4,5,1);
Ktc13=Kt(1:4,6:9,1);
Ktc21=Kt(5,1:4,1);
Ktc22=Kt(5,5,1);
Ktc23=Kt(5,6:9,1);
Ktc31=Kt(6:9,1:4,1);
Ktc32=Kt(6:9,5,1);
Ktc33=Kt(6:9,6:9,1);
Ktcc=[Ktc11-Ktc12*Ktc21/Ktc22,K1,Ktc13-Ktc12*Ktc23/Ktc22;...
   K2; Ktc31-Ktc32*Ktc21/Ktc22,K3,Ktc33-Ktc32*Ktc23/Ktc22];
Kt=Ktcc;



