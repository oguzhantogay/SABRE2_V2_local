function [Kt] = CondensationSL(Kt)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
K1=zeros(2,2);K2=zeros(2,9);K3=zeros(5,2);
% Stiffness Condensation i node
Ktc11=Kt(1:2,1:2,1);
Ktc12=Kt(1:2,3:4,1);
Ktc13=Kt(1:2,5:9,1);

Ktc21=Kt(3:4,1:2,1);
Ktc22=Kt(3:4,3:4,1);
Ktc23=Kt(3:4,5:9,1);

Ktc31=Kt(5:9,1:2,1);
Ktc32=Kt(5:9,3:4,1);
Ktc33=Kt(5:9,5:9,1);

Ktcc=[Ktc11-Ktc12/Ktc22*Ktc21,K1,Ktc13-Ktc12/Ktc22*Ktc23;...
   K2; Ktc31-Ktc32/Ktc22*Ktc21,K3,Ktc33-Ktc32/Ktc22*Ktc23];
Kt=Ktcc;



