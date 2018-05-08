function [Kh1,M] = LoadHeight(d1,d2)                                    
Fe1=zeros(9,9);                                                             % Eq 2.293
Fe1(2,2)=d1;                                                                % d1=P2p*ey
% Fe1(2,9)=d1;                                                                % P2p = shear at start node
% Fe1(9,2)=d1;                                                                % ey = eccentricity in y-direction wrt external work, Fig 2.16
% Fe1(9,9)=d1;

Fe2=zeros(9,9);                                                             % Eq 2.293
Fe2(6,6)=d2;                                                                % d2=P2q*ey
% Fe2(6,9)=d2;                                                                % P2q = shear at end node
% Fe2(9,6)=d2;
% Fe2(9,9)=d2;

Kh1 = Fe1+Fe2;                                                              % Eq 2.293

M=zeros(14,9);                                                              % Eq 2.119                           
M(4,2)=1;
M(5,4)=1;
M(6,3)=1;
M(7,5)=1;
M(8,1)=1;
M(11,6)=1;
M(12,8)=1;                                                                       
M(13,7)=1;      
M(14,9)=1;