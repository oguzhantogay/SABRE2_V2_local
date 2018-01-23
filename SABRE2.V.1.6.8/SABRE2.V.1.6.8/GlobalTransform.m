function [e1,e2,e3] = GlobalTransform(e1,e2,e3,alpharef)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
Rz=[cos(alpharef) -sin(alpharef) 0; ...
   sin(alpharef) cos(alpharef) 0; ...
   0 0 1];

e1 = Rz*e1;
e2 = Rz*e2;