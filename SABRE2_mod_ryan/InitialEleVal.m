function [L,L0,ul,dX,dY,dZ]=InitialEleVal(xn,xg1,yg1,zg1,xg2,yg2,zg2,u,v,w,MI)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
% No deformation
% Preallocationg
dX0 = zeros(xn,1);
dY0 = zeros(xn,1);
dZ0 = zeros(xn,1);
L0 = zeros(xn,1);

for i=1:xn
   
    dX0(i,1) = (xg2(i,1)) - (xg1(i,1));
    dY0(i,1) = (yg2(i,1)) - (yg1(i,1));
    dZ0(i,1) = (zg2(i,1)) - (zg1(i,1));
    L0(i,1) = sqrt( ( dX0(i,1) )^2 +( dY0(i,1) )^2+( dZ0(i,1) )^2  ) ; 
   
end

% After deformation
% Preallocationg
dX = zeros(xn,1);
dY = zeros(xn,1);
dZ = zeros(xn,1);
L= zeros(xn,1);
for i=1:xn
    dX(i,1) = (xg2(i,1)+u(MI(i,3),1)) - (xg1(i,1)+u(MI(i,2),1));
    dY(i,1) = (yg2(i,1)+v(MI(i,3),1)) - (yg1(i,1)+v(MI(i,2),1));
    dZ(i,1) = (zg2(i,1)+w(MI(i,3),1)) - (zg1(i,1)+w(MI(i,2),1));
    L(i,1) = sqrt( ( dX(i,1) )^2 +( dY(i,1) )^2 +( dZ(i,1) )^2 ) ; 
end

ul = (L.^2-L0.^2) ./ (L+L0);

