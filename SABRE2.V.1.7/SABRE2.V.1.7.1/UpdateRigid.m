function [R1,R2] = UpdateRigid(beta1x,beta2x,beta1y,beta2y,beta1z,beta2z,d1,d2)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
% basis vector in Column for prismatic base frame basis vector
% tr1 = [0; d1; 0];
% % tr2 = [0; d1; 0];
% % tr3 = [0; 0; 0];
% 
% ur1 = [0; d2; 0];
% % ur2 = [0; d2; 0];
% % ur3 = [0; 0; 0];

r1x=0;
r1y=d1;
r1z=0;

r2x=0;
r2y=d2;
r2z=0;


Q1 = [0 -beta1z beta1y;beta1z 0 -beta1x;-beta1y beta1x 0];
beta1 = sqrt(beta1x^2+beta1y^2+beta1z^2);
P1 = [0 -r1z r1y;r1z 0 -r1x;-r1y r1x 0];
Q2 = [0 -beta2z beta2y;beta2z 0 -beta2x;-beta2y beta2x 0];
P2 = [0 -r2z r2y;r2z 0 -r2x;-r2y r2x 0];
beta2 = sqrt(beta2x^2+beta2y^2+beta2z^2);



if beta1 == 0
R1 = - (1/2)*Q1*P1 - P1;
else
R1 = - (1/2)*(sin(beta1/2)/(beta1/2))^2*Q1*P1 - (sin(beta1)/beta1)*P1;
end

if beta2 == 0
R2 = - (1/2)*Q2*P2 - P2;
else
R2 = - (1/2)*(sin(beta2/2)/(beta2/2))^2*Q2*P2 - (sin(beta2)/beta2)*P2;
end

% t1 = R1*tr1;
% % t2 = R1*tr2;
% % t3 = R1*tr3;
% 
% u1 = R2*ur1;
% % u2 = R2*ur2;
% % u3 = R2*ur3;

