function [Ax,Ay,Az]=Arrow(Aro)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
Ax(1,1)=Aro(1,1);
Ax(1,2)=Aro(2,1);
Ax(2,1)=Aro(3,1);
Ax(2,2)=Aro(4,1);

Ay(1,1)=Aro(1,2);
Ay(1,2)=Aro(2,2);
Ay(2,1)=Aro(3,2);
Ay(2,2)=Aro(4,2);

Az(1,1)=Aro(1,3);
Az(1,2)=Aro(2,3);
Az(2,1)=Aro(3,3);
Az(2,2)=Aro(4,3);


