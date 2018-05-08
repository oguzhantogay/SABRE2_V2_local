function [L0,dX0,dY0,dZ0]=InitialEleVal(xn,xg1,yg1,zg1,xg2,yg2,zg2)
% No deformation
dX0 = zeros(xn,1);
dY0 = zeros(xn,1);
dZ0 = zeros(xn,1);
L0 = zeros(xn,1);
for i=1:xn
    dX0(i,1) = (xg2 - xg1)/xn;
    dY0(i,1) = (yg2 - yg1)/xn;
    dZ0(i,1) = (zg2 - zg1)/xn;
    L0(i,1)  = sqrt((dX0(i,1))^2+(dY0(i,1))^2+(dZ0(i,1))^2); 
end