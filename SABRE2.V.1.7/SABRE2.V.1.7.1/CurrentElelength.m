function [L,ul,dX,dY,dZ]=CurrentElelength(xg1,yg1,zg1,xg2,yg2,zg2,xn,unew,L0,MI)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
% After deformation
% Preallocationg
dX = zeros(xn,1);
dY = zeros(xn,1);
dZ = zeros(xn,1);
L= zeros(xn,1);

for i=1:xn
    
    dX(i,1) = (xg2(i,1)+unew(MI(i,3),1)) - (xg1(i,1)+unew(MI(i,2),1));
    dY(i,1) = (yg2(i,1)+unew(MI(i,3),2)) - (yg1(i,1)+unew(MI(i,2),2));
    dZ(i,1) = (zg2(i,1)+unew(MI(i,3),3)) - (zg1(i,1)+unew(MI(i,2),3));
    L(i,1) = sqrt( ( dX(i,1) )^2 +( dY(i,1) )^2 +( dZ(i,1) )^2 ) ; 
end

ul = (L.^2-L0.^2) ./ (L+L0);


