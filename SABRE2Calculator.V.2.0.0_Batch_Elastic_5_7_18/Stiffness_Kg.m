function [Kg,Qino]=Stiffness_Kg(Ks,...
    theta1x,theta1z,theta1y,theta2x,theta2z,theta2y,theta1xp,theta2xp,...
    nip,xe,wts,L,qno)

% ************************************************************************
% ********                Geometric Stiffness Matix          *************
% ************************************************************************                                       

% Shape functions (cubic); p = derivative w.r.t. xe
Nu1p=1/L;                                                                   %Eq 2.186 first derivative
Nv1p=1-4*(xe/L)+3*(xe/L).^2;                                                %Eq 2.189 first derivative   
Nv1pp=-4*(1/L)+6*xe*(1/L).^2;                                               %Eq 2.189 second derivative
Nv2p=-2*(xe/L)+3*(xe/L).^2;                                                 %Eq 2.190 first derivative
Nv2pp=-2*(1/L)+6*xe*(1/L).^2;                                               %Eq 2.190 second derivative
Nw1p=-Nv1p;                                                                 %Eq 2.193 first derivative 
Nw1pp=-Nv1pp;                                                               %Eq 2.193 second derivative
Nw2p=-Nv2p;                                                                 %Eq 2.194 first derivative 
Nw2pp=-Nv2pp;                                                               %Eq 2.194 second derivative
N1=(1-3*(xe/L).^2+2*(xe/L).^3);                                             %Eq 2.197                 
N1p=-6*xe*(1/L).^2+6*xe.^2*(1/L).^3;                                        %Eq 2.197 first derivative 
N1pp= -6*(1/L).^2+12*xe*(1/L).^3;                                           %Eq 2.197 second derivative 
N2 = xe-2*xe.^2*(1/L)+xe.^3*(1/L).^2;                                       %Eq 2.198                                      
N2p = 1-4*(xe/L)+3*(xe/L).^2;                                               %Eq 2.198 first derivative 
N2pp = -4*(1/L)+6*xe*(1/L).^2;                                              %Eq 2.198 second derivative 
N3 = 3*(xe/L).^2-2*(xe/L).^3;                                               %Eq 2.199     
N3p =6*xe*(1/L).^2-6*xe.^2*(1/L).^3;                                        %Eq 2.199 first derivative 
N3pp =6*(1/L).^2-12*xe*(1/L).^3;                                            %Eq 2.199 second derivative 
N4 = -xe.^2*(1/L)+xe.^3*(1/L).^2;                                           %Eq 2.200                                            
N4p = -2*(xe/L)+3*(xe/L).^2;                                                %Eq 2.200 first derivative  
N4pp = -2*(1/L)+6*xe*(1/L).^2;                                              %Eq 2.200 second derivative 

%% Tangent Stiffness Formulation
B=zeros(8,9,nip);
B(1,1,:)=Nu1p;                                                              %Eq 2.185
B(2,3,:)=Nv1p;                                                              %Eq 2.188
B(2,7,:)=Nv2p;                                                              %Eq 2.188
B(3,4,:)=Nw1p;                                                              %Eq 2.192
B(3,8,:)=Nw2p;                                                              %Eq 2.192
B(4,3,:)=Nv1pp;                                                             %Eq 2.205
B(4,7,:)=Nv2pp;                                                             %Eq 2.205
B(5,4,:)=Nw1pp;                                                             %Eq 2.205
B(5,8,:)=Nw2pp;                                                             %Eq 2.205
B(6,2,:)=N1;                                                                %Eq 2.196
B(6,5,:)=N2;                                                                %Eq 2.196
B(6,6,:)=N3;                                                                %Eq 2.196
B(6,9,:)=N4;                                                                %Eq 2.196
B(7,2,:)=N1p;                                                               %Eq 2.196
B(7,5,:)=N2p;                                                               %Eq 2.196
B(7,6,:)=N3p;                                                               %Eq 2.196
B(7,9,:)=N4p;                                                               %Eq 2.196
B(8,2,:)=N1pp;                                                              %Eq 2.196
B(8,5,:)=N2pp;                                                              %Eq 2.196
B(8,6,:)=N3pp;                                                              %Eq 2.196
B(8,9,:)=N4pp;                                                              %Eq 2.196

Q=zeros(6,8,nip);
Q(1,1,:)= 1;
Q(1,2,:)= Nv1p*theta1z + Nv2p*theta2z;
Q(1,3,:)= Nw1p*theta1y + Nw2p*theta2y;
Q(2,4,:)= 1;
Q(2,5,:)= N1*theta1x + N2*theta1xp+ N3*theta2x+ N4*theta2xp;
Q(2,6,:)= Nw1pp*theta1y + Nw2pp*theta2y;
Q(3,4,:)= Q(2,5,:);
Q(3,5,:)= -1;
Q(3,6,:)= Nv1pp*theta1z + Nv2pp*theta2z;
Q(4,7,:)= N1p*theta1x + N2p*theta1xp + N3p*theta2x + N4p*theta2xp;
Q(5,8,:)= 1;
Q(6,7,:)= 1;

% Natutal frame
Kt=wts(1)*B(:,:,1)'*Q(:,:,1)'*Ks(:,:,1)*Q(:,:,1)*B(:,:,1)+...
   wts(2)*B(:,:,2)'*Q(:,:,2)'*Ks(:,:,2)*Q(:,:,2)*B(:,:,2)+...
   wts(3)*B(:,:,3)'*Q(:,:,3)'*Ks(:,:,3)*Q(:,:,3)*B(:,:,3)+...
   wts(4)*B(:,:,4)'*Q(:,:,4)'*Ks(:,:,4)*Q(:,:,4)*B(:,:,4)+...
   wts(5)*B(:,:,5)'*Q(:,:,5)'*Ks(:,:,5)*Q(:,:,5)*B(:,:,5);
Qino=Kt*qno; % internal force

%% Geometric Stiffness Formulation
BM=zeros(12,9,nip);
BM(1,1,:)=Nu1p;
BM(2,2,:)= 1;
BM(3,3,:)= 1;
BM(4,4,:)= 1;
BM(5,6,:)= 1;
BM(6,7,:)= 1;
BM(7,8,:)= 1;
BM(8,3,:)=Nv1pp;
BM(8,7,:)=Nv2pp;
BM(9,4,:)=Nw1pp;
BM(9,8,:)=Nw2pp;
BM(10,2,:)=N1;
BM(10,5,:)=N2;
BM(10,6,:)=N3;
BM(10,9,:)=N4;
BM(11,2,:)=N1p;
BM(11,5,:)=N2p;
BM(11,6,:)=N3p;
BM(11,9,:)=N4p;
BM(12,2,:)=N1pp;
BM(12,5,:)=N2pp;
BM(12,6,:)=N3pp;
BM(12,9,:)=N4pp;

QM=zeros(6,12,nip);
QM(1,1,:)= 1;
QM(1,3,:)= (4*theta1z - theta2z)/30;
QM(1,4,:)= (4*theta1y - theta2y)/30;
QM(1,6,:)= (4*theta2z - theta1z)/30;
QM(1,7,:)= (4*theta2y - theta1y)/30;
QM(2,8,:)= 1;
QM(2,9,:)= N1*theta1x + N2*theta1xp+ N3*theta2x+ N4*theta2xp;    
QM(2,10,:)= Nw1pp*theta1y + Nw2pp*theta2y;  
QM(3,8,:)= QM(2,9,:);    
QM(3,9,:)= -1;
QM(3,10,:)= Nv1pp*theta1z + Nv2pp*theta2z;
QM(4,11,:)= N1p*theta1x + N2p*theta1xp + N3p*theta2x + N4p*theta2xp; 
QM(5,12,:)= 1;
QM(6,11,:)= 1;

Qin_into1=Ks(:,:,1)*QM(:,:,1)*BM(:,:,1)*qno;
Qin_into2=Ks(:,:,2)*QM(:,:,2)*BM(:,:,2)*qno;
Qin_into3=Ks(:,:,3)*QM(:,:,3)*BM(:,:,3)*qno;
Qin_into4=Ks(:,:,4)*QM(:,:,4)*BM(:,:,4)*qno;
Qin_into5=Ks(:,:,5)*QM(:,:,5)*BM(:,:,5)*qno;

Gn = zeros(8,8,nip);
Gn(2,2,1) = Qin_into1(1);
Gn(3,3,1) = Qin_into1(1);
Gn(4,6,1) = Qin_into1(3);
Gn(6,4,1) = Qin_into1(3);
Gn(5,6,1) = Qin_into1(2);
Gn(6,5,1) = Qin_into1(2);
Gn(7,7,1) = Qin_into1(4);
Gn(2,2,2) = Qin_into2(1);
Gn(3,3,2) = Qin_into2(1);
Gn(4,6,2) = Qin_into2(3);
Gn(6,4,2) = Qin_into2(3);
Gn(5,6,2) = Qin_into2(2);
Gn(6,5,2) = Qin_into2(2);
Gn(7,7,2) = Qin_into2(4);
Gn(2,2,3) = Qin_into3(1);
Gn(3,3,3) = Qin_into3(1);
Gn(4,6,3) = Qin_into3(3);
Gn(6,4,3) = Qin_into3(3);
Gn(5,6,3) = Qin_into3(2);
Gn(6,5,3) = Qin_into3(2);
Gn(7,7,3) = Qin_into3(4);
Gn(2,2,4) = Qin_into4(1);
Gn(3,3,4) = Qin_into4(1);
Gn(4,6,4) = Qin_into4(3);
Gn(6,4,4) = Qin_into4(3);
Gn(5,6,4) = Qin_into4(2);
Gn(6,5,4) = Qin_into4(2);
Gn(7,7,4) = Qin_into4(4);
Gn(2,2,5) = Qin_into5(1);
Gn(3,3,5) = Qin_into5(1);
Gn(4,6,5) = Qin_into5(3);
Gn(6,4,5) = Qin_into5(3);
Gn(5,6,5) = Qin_into5(2);
Gn(6,5,5) = Qin_into5(2);
Gn(7,7,5) = Qin_into5(4);

Kg=wts(1)*B(:,:,1)'*Gn(:,:,1)*B(:,:,1)+...
   wts(2)*B(:,:,2)'*Gn(:,:,2)*B(:,:,2)+...
   wts(3)*B(:,:,3)'*Gn(:,:,3)*B(:,:,3)+...
   wts(4)*B(:,:,4)'*Gn(:,:,4)*B(:,:,4)+...
   wts(5)*B(:,:,5)'*Gn(:,:,5)*B(:,:,5);

% if ~isempty(FEL)
%    % Moment release w.r.t My
%    % left end
%    if isequal(FEL(1,2),2)
%       [Kt] = CondensationMxL(Kt);
%       [Kg] = CondensationMxL(Kg);
%    end
%    % right end
%    if isequal(FEL(1,3),2)
%       [Kt] = CondensationMxR(Kt);
%       [Kg] = CondensationMxR(Kg);
%    end
% 
%    % Moment release w.r.t My
%    % left end
%    if isequal(FEL(1,4),2)
%       [Kt] = CondensationMyL(Kt);
%       [Kg] = CondensationMyL(Kg);
%    end
%    % right end
%    if isequal(FEL(1,5),2)
%       [Kt] = CondensationMyR(Kt);
%       [Kg] = CondensationMyR(Kg);
%    end
% 
%    % Moment release w.r.t Mz
%    % left end
%    if isequal(FEL(1,6),2)
%       [Kt] = CondensationMzL(Kt);
%       [Kg] = CondensationMzL(Kg);
%    end
%    % right end
%    if isequal(FEL(1,7),2)
%       [Kt] = CondensationMzR(Kt);
%       [Kg] = CondensationMzR(Kg);
%    end
% 
%    % Warping free
%    % left end
%    if isequal(FEL(1,8),2)
%       [Kt] = CondensationWL(Kt);
%       [Kg] = CondensationWL(Kg);
%    end
%    % right end
%    if isequal(FEL(1,9),2)
%       [Kt] = CondensationWR(Kt);
%       [Kg] = CondensationWR(Kg);
%    end
% end