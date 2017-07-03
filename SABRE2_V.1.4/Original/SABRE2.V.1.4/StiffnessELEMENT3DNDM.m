function [Kt,Kgg,Qino,Kh2,Qin_into]=StiffnessELEMENT3DNDM(bfb,tfb,bft,tft,Dg,yc,ht,hb,Dt,Db,hst,... 
    hsb,ys,tw,Afillet,L,E,G,fillet,hstp,hsbp,ysp,bftp,bfbp,...
    theta1x,theta1z,theta1y,theta2x,theta2z,theta2y,theta1xp,theta2xp,qno,FEL,ap_da_buttongroup,taub)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
% ************************************************************************
% *****        Stiffness Matrix DM for Nonlinear Only            *********
% ************************************************************************
% Number of integration points
nip=5; % leave at 5 for now

% Integration point locations and weights
zeta=[-1 -sqrt(3/7) 0 sqrt(3/7) 1]; % 5 points Gauss-Lobatto rule
xe=L/2*zeta+L/2;
wts=[0.1 49/90 32/45 49/90 0.1]/2*L;
         
% Calculate section properties
% Only the tapers and must do it linearly
bfbe=bfb(1)*(1-xe/L)+bfb(2)*xe/L;  
bfte=bft(1)*(1-xe/L)+bft(2)*xe/L;
tfbe=tfb(1)*(1-xe/L)+tfb(2)*xe/L;  
tfte=tft(1)*(1-xe/L)+tft(2)*xe/L;
De=Dg(1)*(1-xe/L)+Dg(2)*xe/L;           
twe=tw(1)*(1-xe/L)+tw(2)*xe/L;
Afillete=Afillet(1)*(1-xe/L)+Afillet(2)*xe/L;
yce=yc(1)*(1-xe/L)+yc(2)*xe/L;
hte=ht(1)*(1-xe/L)+ht(2)*xe/L;
hbe=hb(1)*(1-xe/L)+hb(2)*xe/L;
Dte=Dt(1)*(1-xe/L)+Dt(2)*xe/L;
Dbe=Db(1)*(1-xe/L)+Db(2)*xe/L;
hste=hst(1)*(1-xe/L)+hst(2)*xe/L;
hsbe=hsb(1)*(1-xe/L)+hsb(2)*xe/L;
yse=ys(1)*(1-xe/L)+ys(2)*xe/L;


Afb = bfbe.*tfbe;
Aft = bfte.*tfte;
Aw  = De.*twe;
h = hte+hbe;

% Distantance from top/bottom flange centroid to NA
hcfb = (Aft.*(h) + Aw.*(De/2+tfbe/2))./(Afb+Aft+Aw); 
hcft = h - hcfb;    

% Distantance from top/bottom flange centroid to shear center
Ift = bfte.^3.*tfte/12; % Top flange weak axis moment of inertia
Ifb = bfbe.^3.*tfbe/12; % Bottom flange weak axis moment of inertia
Iwy = De.*(twe.^3)/12;

do = yse+De/2+tfbe; 

hufb = do - tfbe/2;        % SC    
huft = h - hufb;           % SC   

hsft = Ifb.*h./(Ifb+Ift);
hsfb = Ift.*h./(Ifb+Ift);

yuc = hcfb-hufb;

Db = hufb-tfbe/2;
Dt = huft-tfte/2;
% ------------------------------------------------------------------------
% ----------------------  Section Properties            ------------------
% ------------------------------------------------------------------------
% stong axis w.r.t User define axis
Io = bfte.*(tfte.^3)/12 + twe.*(De.^3)/12 + bfbe.*(tfbe.^3)/12;

if isequal(fillet(1,1),1)
   Ae=zeros(1,nip);Iux=zeros(1,nip);Iy=zeros(1,nip);Cwa=zeros(1,nip);
   for i=1:nip
      Ae(1,i)  = fillet(1,2);
      Iux(1,i) = fillet(1,4);
      Iy(1,i)  = fillet(1,8);  
      Cwa(1,i) = fillet(1,13);
   end 
else
   Ae = bfbe.*tfbe+bfte.*tfte+De.*twe+Afillete;  % ok
   Iux = Io + Afb.*hufb.^2 + Aft.*huft.^2  + Aw.*(De/2-hufb+tfbe/2).^2;   
   r_Afillet = sqrt(Afillete/(4-pi));
   Iux_Afillet = 4*(1-5*pi/16)*r_Afillet.^4 +(Afillete/2).*Db.^2 +(Afillete/2).*Dt.^2;
   Iux = Iux + Iux_Afillet;
   Iy = Ifb + Ift +Iwy; 
   Iy_Afillet = 4*(1-5*pi/16)*r_Afillet.^4 +Afillete.*(twe/2).^2; 
   Iy = Iy + Iy_Afillet;
   Cwa = Ifb.*Ift.*h.^2./(Ifb + Ift);
end





Ipp = bfte.*( (Dt+tfte).^5 - Dt.^5 )/5 + (bfte.^3).*( (Dt+tfte).^3 - Dt.^3 )/18 ...
    + (bfte.^5).*tfte/80 + bfbe.*( (Db+tfbe).^5 - Db.^5 )/5 ...
    + (bfbe.^3).*( (Db+tfbe).^3 - Db.^3 )/18 + (bfbe.^5).*tfbe/80 ...
    +  twe.*( Dt.^5 + Db.^5 )/5 + (twe.^3).*( Dt.^3 + Db.^3 )/18 ...
    + (twe.^5).*(Dt + Db)/80; 

Ip = Iux +Iy;

k11 = Ae; 
k21 = -yuc.*Ae;
k22 = Iux;
k33 = Iy;
k41 = Ip;
k42 = -(  Aft.*(Dt.^2+Dt.*tfte+tfte.^2/2) .*huft ...
        - Afb.*(Db.^2+Db.*tfbe+tfbe.^2/2) .*hufb ...
        + Aw .* (Dt.^2 + Db.^2).*(Dt - Db)/4 ...
        + Ift.*huft - Ifb.*hufb + Iwy.*(Dt - Db)/2 );
k44 = Ipp;
k55 = Cwa;
    Rt = -2*hstp-ysp+yse.*bftp./bfte;
    Rb = 2*hsbp-ysp+yse.*bfbp./bfbe;

k63 = Rt.*Ift+Rb.*Ifb;
k65 = -hste.*Rt.*Ift+ hsbe.*Rb.*Ifb;
k66 = (Rt.^2).*Ift+(Rb.^2).*Ifb;

if isequal(fillet(1,1),1)
   J=zeros(1,nip);
   for i=1:nip
      J(1,i)=fillet(1,12);
   end
else
   J=De.*(twe.^3)/3+(bfte.*(tfte.^3)/3).*(1-0.63*tfte./bfte) ...
      +(bfbe.*(tfbe.^3)/3).*(1-0.63*tfbe./bfbe);  % ok
end

% Section stiffness matrix
Ks=zeros(6,6,nip);
switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')
   case 'da_on'
      Ks(1,1,:)=0.8*E*k11;
      Ks(1,2,:)=0.8*E*k21;
      Ks(2,1,:)=Ks(1,2,:);
      Ks(2,2,:)=0.8*E*k22.*taub';
      Ks(3,3,:)=0.8*E*k33.*taub';
      Ks(4,1,:)=0.8*E*k41;
      Ks(1,4,:)=Ks(4,1,:);
      Ks(4,2,:)=0.8*E*k42;
      Ks(2,4,:)=Ks(4,2,:);
      Ks(4,4,:)=0.8*E*k44;
      Ks(5,5,:)=0.8*E*k55;
      Ks(6,3,:)=0.8*E*k63;
      Ks(3,6,:)=Ks(6,3,:);
      Ks(6,5,:)=0.8*E*k65; 
      Ks(5,6,:)=Ks(6,5,:); 
      Ks(6,6,:)=0.8*E*k66+0.8*G*J;
   case 'da_off'
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
end

% Shape functions (cubic)
Nu1p=1/L;
Nv1p=1-4*(xe/L)+3*(xe/L).^2;
Nv1pp=-4*(1/L)+6*xe*(1/L).^2;
Nv2p=-2*(xe/L)+3*(xe/L).^2;
Nv2pp=-2*(1/L)+6*xe*(1/L).^2;
Nw1p=-Nv1p;
Nw1pp=-Nv1pp;
Nw2p=-Nv2p;
Nw2pp=-Nv2pp;

N1=(1-3*(xe/L).^2+2*(xe/L).^3);
N1p=-6*xe*(1/L).^2+6*xe.^2*(1/L).^3; 
N1pp= -6*(1/L).^2+12*xe*(1/L).^3; 

N2 = xe-2*xe.^2*(1/L)+xe.^3*(1/L).^2;
N2p = 1-4*(xe/L)+3*(xe/L).^2; 
N2pp = -4*(1/L)+6*xe*(1/L).^2;

N3 = 3*(xe/L).^2-2*(xe/L).^3;
N3p =6*xe*(1/L).^2-6*xe.^2*(1/L).^3;
N3pp =6*(1/L).^2-12*xe*(1/L).^3;

N4 = 1-xe.^2*(1/L)+xe.^3*(1/L).^2;
N4p = -2*(xe/L)+3*(xe/L).^2;
N4pp = -2*(1/L)+6*xe*(1/L).^2;

B=zeros(8,9,nip);
B(1,1,:)=Nu1p;
B(2,3,:)=Nv1p;
B(2,7,:)=Nv2p;
B(3,4,:)=Nw1p;
B(3,8,:)=Nw2p;

B(4,3,:)=Nv1pp;
B(4,7,:)=Nv2pp;
B(5,4,:)=Nw1pp;
B(5,8,:)=Nw2pp;

B(6,2,:)=N1;
B(6,5,:)=N2;
B(6,6,:)=N3;
B(6,9,:)=N4;

B(7,2,:)=N1p;
B(7,5,:)=N2p;
B(7,6,:)=N3p;
B(7,9,:)=N4p;

B(8,2,:)=N1pp;
B(8,5,:)=N2pp;
B(8,6,:)=N3pp;
B(8,9,:)=N4pp;

% -------------------------------------- Load height for distributed loads
H=zeros(9,9,nip);
H(2,2,:)=N1.*N1;
H(2,5,:)=N1.*N2;
H(2,6,:)=N1.*N3;
H(2,9,:)=N1.*N4;

H(5,2,:)=N2.*N1;
H(5,5,:)=N2.*N2;
H(5,6,:)=N2.*N3;
H(5,9,:)=N2.*N4;

H(6,2,:)=N3.*N1;
H(6,5,:)=N3.*N2;
H(6,6,:)=N3.*N3;
H(6,9,:)=N3.*N4;

H(9,2,:)=N4.*N1;
H(9,5,:)=N4.*N2;
H(9,6,:)=N4.*N3;
H(9,9,:)=N4.*N4;

% ----------------------------------------------------------------------
% ---------------                    3DN                ----------------
% ----------------------------------------------------------------------
Kh2=0*(hste(1)+tfte(1)/2)*wts(1)*H(:,:,1)+...
   0*(hste(2)+tfte(2)/2)*wts(2)*H(:,:,2)+...
   0*(hste(3)+tfte(3)/2)*wts(3)*H(:,:,3)+...
   0*(hste(4)+tfte(4)/2)*wts(4)*H(:,:,4)+...
   0*(hste(5)+tfte(5)/2)*wts(5)*H(:,:,5);




















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

% Natutal frame
Kt=wts(1)*B(:,:,1)'*Q(:,:,1)'*Ks(:,:,1)*Q(:,:,1)*B(:,:,1)+...
   wts(2)*B(:,:,2)'*Q(:,:,2)'*Ks(:,:,2)*Q(:,:,2)*B(:,:,2)+...
   wts(3)*B(:,:,3)'*Q(:,:,3)'*Ks(:,:,3)*Q(:,:,3)*B(:,:,3)+...
   wts(4)*B(:,:,4)'*Q(:,:,4)'*Ks(:,:,4)*Q(:,:,4)*B(:,:,4)+...
   wts(5)*B(:,:,5)'*Q(:,:,5)'*Ks(:,:,5)*Q(:,:,5)*B(:,:,5);

if ~isempty(FEL)  
   % Moment release w.r.t My
   % left end
   if isequal(FEL(1,2),2)
      [Kt] = CondensationMxL(Kt);
   end
   % right end
   if isequal(FEL(1,3),2)
      [Kt] = CondensationMxR(Kt);
   end 
   
   % Moment release w.r.t My
   % left end
   if isequal(FEL(1,4),2)
      [Kt] = CondensationMyL(Kt);
   end
   % right end
   if isequal(FEL(1,5),2)
      [Kt] = CondensationMyR(Kt);
   end   
   
   % Moment release w.r.t Mz
   % left end
   if isequal(FEL(1,6),2)
      [Kt] = CondensationMzL(Kt);
   end
   % right end
   if isequal(FEL(1,7),2)
      [Kt] = CondensationMzR(Kt);
   end

   % Warping free
   % left end
   if isequal(FEL(1,8),2)
      [Kt] = CondensationWL(Kt);
   end
   % right end
   if isequal(FEL(1,9),2)
      [Kt] = CondensationWR(Kt);
   end
end

% Natural frame
Qino=Kt*qno; % internal force

Dq1=wts(1)*Ks(:,:,1)*QM(:,:,1)*BM(:,:,1)+...
   wts(2)*Ks(:,:,2)*QM(:,:,2)*BM(:,:,2)+...
   wts(3)*Ks(:,:,3)*QM(:,:,3)*BM(:,:,3)+...
   wts(4)*Ks(:,:,4)*QM(:,:,4)*BM(:,:,4)+...
   wts(5)*Ks(:,:,5)*QM(:,:,5)*BM(:,:,5);
Dq=Dq1./L;

Qin_into=Dq*qno;

if ~isempty(FEL)
   if isequal(FEL(1,4),2)
      Qin_into(3)=-Qino(4,1);
   end

   if isequal(FEL(1,5),2)
      Qin_into(3)=Qino(8,1);
   end
   
   if isequal(FEL(1,6),2)
      Qin_into(2)=-Qino(3,1);
   end

   if isequal(FEL(1,7),2)
      Qin_into(2)=Qino(7,1);
   end
   
   if isequal(FEL(1,8),2)
      Qin_into(4)=-Qino(5,1);
   end

   if isequal(FEL(1,9),2)
      Qin_into(4)=Qino(9,1);
   end
end

P=Qin_into(1);
Mz = Qin_into(2);
My = Qin_into(3);
W = Qin_into(4);
Bi = Qin_into(5);
Tsv = Qin_into(6);


Gn = zeros(8,8,nip);
Gn(2,2,:) = P;
Gn(3,3,:) = P;
Gn(4,6,:) = My;
Gn(6,4,:) = My;
Gn(5,6,:) = Mz;
Gn(6,5,:) = Mz;
Gn(7,7,:) = W;

Kgg=wts(1)*B(:,:,1)'*Gn(:,:,1)*B(:,:,1)+...
   wts(2)*B(:,:,2)'*Gn(:,:,2)*B(:,:,2)+...
   wts(3)*B(:,:,3)'*Gn(:,:,3)*B(:,:,3)+...
   wts(4)*B(:,:,4)'*Gn(:,:,4)*B(:,:,4)+...
   wts(5)*B(:,:,5)'*Gn(:,:,5)*B(:,:,5);

if ~isempty(FEL)  
   % Moment release w.r.t My
   % left end
   if isequal(FEL(1,2),2)
      [Kgg] = CondensationMxL(Kgg);
   end
   % right end
   if isequal(FEL(1,3),2)
      [Kgg] = CondensationMxR(Kgg);
   end 
   
   % Moment release w.r.t My
   % left end
   if isequal(FEL(1,4),2)
      [Kgg] = CondensationMyL(Kgg);
   end
   % right end
   if isequal(FEL(1,5),2)
      [Kgg] = CondensationMyR(Kgg);
   end   
   
   % Moment release w.r.t Mz
   % left end
   if isequal(FEL(1,6),2)
      [Kgg] = CondensationMzL(Kgg);
   end
   % right end
   if isequal(FEL(1,7),2)
      [Kgg] = CondensationMzR(Kgg);
   end

   % Warping free
   % left end
   if isequal(FEL(1,8),2)
      [Kgg] = CondensationWL(Kgg);
   end
   % right end
   if isequal(FEL(1,9),2)
      [Kgg] = CondensationWR(Kgg);
   end
end
% GM = zeros(12,12,nip);
% GM(3,3,:) = 4*P/30;
% GM(3,6,:) = -P/30;
% GM(4,4,:) = 4*P/30;
% GM(4,7,:) = -P/30;
% GM(6,6,:) = 4*P/30;
% GM(6,3,:) = -P/30;
% GM(7,7,:) = 4*P/30;
% GM(7,4,:) = -P/30;
% GM(8,10,:) = My;
% GM(9,10,:) = Mz;
% GM(10,8,:) = My;
% GM(10,9,:) = Mz;
% GM(11,11,:) = W;
% KggM=wts(1)*BM(:,:,1)'*GM(:,:,1)*BM(:,:,1)+...
%    wts(2)*BM(:,:,2)'*GM(:,:,2)*BM(:,:,2)+...
%    wts(3)*BM(:,:,3)'*GM(:,:,3)*BM(:,:,3)+...
%    wts(4)*BM(:,:,4)'*GM(:,:,4)*BM(:,:,4)+...
%    wts(5)*BM(:,:,5)'*GM(:,:,5)*BM(:,:,5);

% Kt=round(Kt*10^9)/10^9;
% Kgg=round(Kgg*10^9)/10^9;


