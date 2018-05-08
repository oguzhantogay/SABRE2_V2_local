function [Kt] = CondensationWR(Kt)
K1=zeros(8,1);K2=zeros(1,9);
% Stiffness Condensation i node
Ktc11=Kt(1:8,1:8,1);
Ktc12=Kt(1:8,9,1);
Ktc21=Kt(9,1:8,1);
Ktc22=Kt(9,9,1);
Ktcc=[Ktc11-Ktc12*inv(Ktc22)*Ktc21,K1; K2];
Kt=Ktcc;



