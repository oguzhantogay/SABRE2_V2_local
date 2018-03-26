function [Kt] = CondensationMyR(Kt)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
% Rearrange Matrix
IR=[1 0 0 0 0 0 0 0 0; 
    0 1 0 0 0 0 0 0 0;
    0 0 1 0 0 0 0 0 0;
    0 0 0 1 0 0 0 0 0;
    0 0 0 0 1 0 0 0 0;
    0 0 0 0 0 1 0 0 0;
    0 0 0 0 0 0 1 0 0;
    0 0 0 0 0 0 0 0 1;
    0 0 0 0 0 0 0 1 0];
Kt= IR*Kt*IR'; 
 
if isequal(Kt(9,9,1),0)
   Kt=IR*Kt*IR';
else
   % Stiffness Condensation i node
   K1=zeros(8,1);K2=zeros(1,9);
   Ktc11=Kt(1:8,1:8,1);
   Ktc12=Kt(1:8,9,1);

   Ktc21=Kt(9,1:8,1);
   Ktc22=Kt(9,9,1);
   Ktcc=[Ktc11-Ktc12*inv(Ktc22)*Ktc21,K1; K2];
   Kt=IR*Ktcc*IR';
end





