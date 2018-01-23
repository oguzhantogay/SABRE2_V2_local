function [MemLength]=InitialEleLengthRendering(xg1,yg1,zg1,xg2,yg2,zg2,SNodevalue)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
% ************************************************************************
% **************       3D Rendering Model Generation       ***************
% ***   Initial Member x-dir Nodal Coordinates for Each Member    ********
% ************************************************************************
xn = sum(sum(SNodevalue(:,:,3)));     % Total number of Elements
mem = length(SNodevalue(:,1,1));
% ******************************************* Initial Each Element Length
% Preallocationg
dX0 = zeros(xn,1);
dY0 = zeros(xn,1);
dZ0 = zeros(xn,1);
L0 = zeros(xn,1);

for i=1:xn
   
    dX0(i,1) = (xg2(i,1)) - (xg1(i,1));
    dY0(i,1) = (yg2(i,1)) - (yg1(i,1));
    dZ0(i,1) = (zg2(i,1)) - (zg1(i,1));
    L0(i,1) = sqrt( ( dX0(i,1) )^2 +( dY0(i,1) )^2+( dZ0(i,1) )^2  ); 
    
end

% **************** Initial Member x-dir Nodal Coordinates for Each Member
% Preallocationg
MemLength = zeros(xn,1);
segnum(1,1)=0; % (Start node number - 1) for each member
for i = 1:mem
   for k = 1:sum(SNodevalue(i,:,3))
      if isequal(k+segnum(i,1),segnum(i,1)+1)
         MemLength(k+segnum(i,1),1)=L0(k+segnum(i,1),1);
      else
         MemLength(k+segnum(i,1),1)=MemLength(k+segnum(i,1)-1,1)+L0(k+segnum(i,1),1);
      end
   end
   segnum(i+1,1) = segnum(i,1) + sum(SNodevalue(i,:,3));
end  
