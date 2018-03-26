function [tap1,tap2]=TapedEleLength(NTshex1,NTshey1,NTshez1, ...
         NTshex2,NTshey2,NTshez2,alpharef)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
tr1=[NTshex1;NTshey1;NTshez1];
tr2=[NTshex2;NTshey2;NTshez2];
   Rz=[cos(alpharef) -sin(alpharef) 0; ...
      sin(alpharef) cos(alpharef) 0; ...
      0 0 1];   
tap1 = Rz*tr1;
tap2 = Rz*tr2;

