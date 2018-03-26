function [Fe1,Fe2,M] = LoadHeight(d1,d2)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
% Load height
Fe1=zeros(9,9);
Fe1(2,2)=d1;
Fe1(2,9)=d1;
Fe1(9,2)=d1;
Fe1(9,9)=d1;

Fe2=zeros(9,9);
Fe2(6,6)=d2;
Fe2(6,9)=d2;
Fe2(9,6)=d2;
Fe2(9,9)=d2;

M=zeros(14,9);
M(4,2)=1;
M(5,4)=1;
M(6,3)=1;
M(7,5)=1;
M(8,1)=1;
M(11,6)=1;
M(12,7)=1;
M(13,8)=1;
M(14,9)=1;