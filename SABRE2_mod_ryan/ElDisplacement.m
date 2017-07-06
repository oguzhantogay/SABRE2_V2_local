function [qno] = ElDisplacement(theta1x,theta1z,theta1y,theta2x,theta2z,theta2y,theta1xp,theta2xp,ul)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
qno=zeros(9,1);
qno(1)=ul;
qno(2)=theta1x;
qno(3)=theta1z;
qno(4)=theta1y;
qno(5)=theta1xp;
qno(6)=theta2x;
qno(7)=theta2z;
qno(8)=theta2y;
qno(9)=theta2xp;