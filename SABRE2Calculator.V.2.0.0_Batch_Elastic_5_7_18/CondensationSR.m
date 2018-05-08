function [Kt] = CondensationSR(Kt)
K1=zeros(6,2);K2=zeros(2,9);K3=zeros(1,2);
% Stiffness Condensation i node
Ktc11=Kt(1:6,1:6,1);
Ktc12=Kt(1:6,7:8,1);
Ktc13=Kt(1:6,9,1);
Ktc21=Kt(7:8,1:6,1);
Ktc22=Kt(7:8,7:8,1);
Ktc23=Kt(7:8,9,1);
Ktc31=Kt(9,1:6,1);
Ktc32=Kt(9,7:8,1);
Ktc33=Kt(9,9,1);
Ktcc=[Ktc11-Ktc12/Ktc22*Ktc21,K1,Ktc13-Ktc12/Ktc22*Ktc23;...
   K2; Ktc31-Ktc32/Ktc22*Ktc21,K3,Ktc33-Ktc32/Ktc22*Ktc23];
Kt=Ktcc;



