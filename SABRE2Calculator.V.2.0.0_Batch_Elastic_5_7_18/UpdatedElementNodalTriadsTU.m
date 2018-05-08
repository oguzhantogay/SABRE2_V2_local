function [t1,t2,t3,u1,u2,u3] = UpdatedElementNodalTriadsTU(beta1x,beta2x,beta1y,beta2y,beta1z,beta2z,alphatap)

% basis vector in Column for prismatic base frame basis vector
tr1 = [1; 0; 0];
tr2 = [0; 1; 0];
tr3 = [0; 0; 1];

ur1 = [1; 0; 0];
ur2 = [0; 1; 0];
ur3 = [0; 0; 1];

I = [1 0 0; 0 1 0; 0 0 1];

% ---------------- Global Frame to Element Frame S
Rz=[cos(-alphatap) -sin(-alphatap) 0; ...
   sin(-alphatap) cos(-alphatap) 0; ...
   0 0 1];

Ang1 = [beta1x ; beta1y ; beta1z]; 
Ang2 = [beta2x ; beta2y ; beta2z];
Ang1=Rz*Ang1;
Ang2=Rz*Ang2;
beta1x =Ang1(1,1); beta1y =Ang1(2,1); beta1z=Ang1(3,1);
beta2x =Ang2(1,1); beta2y =Ang2(2,1); beta2z=Ang2(3,1);
% ---------------- Global Frame to Element Frame E


Q1 = [0 -beta1z beta1y;beta1z 0 -beta1x;-beta1y beta1x 0];
beta1 = sqrt(beta1x^2+beta1y^2+beta1z^2);
Q2 = [0 -beta2z beta2y;beta2z 0 -beta2x;-beta2y beta2x 0];
beta2 = sqrt(beta2x^2+beta2y^2+beta2z^2);

if beta1 == 0
R1 = I ;
else
R1 = I + (1/2)*(sin(beta1/2)/(beta1/2))^2*Q1*Q1 + (sin(beta1)/beta1)*Q1;
end

if beta2 == 0
R2 = I ;
else
R2 = I + (1/2)*(sin(beta2/2)/(beta2/2))^2*Q2*Q2 + (sin(beta2)/beta2)*Q2;
end

t1 = R1*tr1;
t2 = R1*tr2;
t3 = R1*tr3;

u1 = R2*ur1;
u2 = R2*ur2;
u3 = R2*ur3;

