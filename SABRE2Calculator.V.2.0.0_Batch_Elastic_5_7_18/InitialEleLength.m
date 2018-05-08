function [L0]=InitialEleLength(xn,xg1,yg1,zg1,xg2,yg2,zg2)

% ************************************************************************
% **************        Initial Each Element Length        ***************
% ************************************************************************
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
