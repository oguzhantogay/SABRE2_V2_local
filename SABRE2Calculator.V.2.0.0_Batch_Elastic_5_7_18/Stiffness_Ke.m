function [Kt,Ks]=Stiffness_Ke(Ae,yuc,Iux,Iy,Ip,Aft,Dt,...
    tfte,huft,Afb,tfbe,Ift,Ifb,Iwy,hufb,Ipp,Cwa,Db,L,E,wts,Rt,Rb,...
    theta1x,theta1z,theta1y,theta2x,theta2z,theta2y,theta1xp,theta2xp,...
    Aw,hste,hsbe,nip,xe,J,G)

% ************************************************************************
% ********                Tangent stiffness matrix           *************
% ************************************************************************
k11 = Ae;
k21 = -yuc.*Ae;
k22 = Iux;
k33 = Iy;
k41 = Ip;
k42 = -(  Aft.*(Dt.^2+Dt.*tfte+tfte.^2/2) .*huft ...
        - Afb.*(Db.^2+Db.*tfbe+tfbe.^2/2) .*hufb ...
        + Aw .* (Dt.^2 + Db.^2).*(Dt - Db)/4 ...
        + Ift.*huft - Ifb.*hufb + Iwy.*(Dt - Db)/2);
k44 = Ipp;
k55 = Cwa;
k63 = Rt.*Ift+Rb.*Ifb;
k65 = -hste.*Rt.*Ift+ hsbe.*Rb.*Ifb;
k66 = (Rt.^2).*Ift+(Rb.^2).*Ifb;

% Section stiffness matrix
Ks=zeros(6,6,nip);
Ks(1,1,:)=E*k11;
Ks(1,2,:)=E*k21;
Ks(2,1,:)=Ks(1,2,:);
Ks(2,2,:)=E*k22;
Ks(3,3,:)=E*k33;
Ks(4,1,:)=E*k41;
Ks(1,4,:)=Ks(4,1,:);
Ks(4,2,:)=E*k42;
Ks(2,4,:)=Ks(4,2,:);
Ks(4,4,:)=E*k44;
Ks(5,5,:)=E*k55;
Ks(6,3,:)=E*k63;
Ks(3,6,:)=Ks(6,3,:);
Ks(6,5,:)=E*k65;
Ks(5,6,:)=Ks(6,5,:);
Ks(6,6,:)=E*k66+G*J;                                        

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

% if ~isempty(FEL)
%    % Moment release w.r.t My
%    % left end
%    if isequal(FEL(1,2),2)
%       [Kt] = CondensationMxL(Kt);
%    end
%    % right end
%    if isequal(FEL(1,3),2)
%       [Kt] = CondensationMxR(Kt);
%    end
% 
%    % Moment release w.r.t My
%    % left end
%    if isequal(FEL(1,4),2)
%       [Kt] = CondensationMyL(Kt);
%    end
%    % right end
%    if isequal(FEL(1,5),2)
%       [Kt] = CondensationMyR(Kt);
%    end
% 
%    % Moment release w.r.t Mz
%    % left end
%    if isequal(FEL(1,6),2)
%       [Kt] = CondensationMzL(Kt);
%    end
%    % right end
%    if isequal(FEL(1,7),2)
%       [Kt] = CondensationMzR(Kt);
%    end
% 
%    % Warping free
%    % left end
%    if isequal(FEL(1,8),2)
%       [Kt] = CondensationWL(Kt);
%    end
%    % right end
%    if isequal(FEL(1,9),2)
%       [Kt] = CondensationWR(Kt);
%    end
% end