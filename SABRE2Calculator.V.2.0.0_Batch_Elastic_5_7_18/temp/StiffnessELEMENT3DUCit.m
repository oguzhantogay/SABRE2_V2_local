function [UC,slender]=StiffnessELEMENT3DUCit(bfb,tfb,bft,tft,Dg,yc,ht,hb,Dt,Db,hst,... 
   hsb,ys,tw,Afillet,L,E,G,fillet,hstp,hsbp,ysp,bftp,bfbp,...
   theta1x,theta1z,theta1y,theta2x,theta2z,theta2y,theta1xp,theta2xp,qno,gam,Fy,Fyfi,Fyw,Fyfo,ytbar,Pbar,FEL,LIAType,HomoType,Phi_Py,angletap,CSangel)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
% ************************************************************************
% *****************            Checking UC           *********************
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
ytbare=ytbar(1)*(1-xe/L)+ytbar(2)*xe/L;

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

% Calculate the total fillet area and radius of the area.
Afillets = Ae-(bfbe.*tfbe+bfte.*tfte+De.*twe);  % ok
r_Afillets = sqrt(Afillets/(4-pi));

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

N4 = -xe.^2*(1/L)+xe.^3*(1/L).^2;
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

% % -------------------------------------- Load height for distributed loads
% H=zeros(9,9,nip);
% H(2,2,:)=N1.*N1;
% H(2,5,:)=N1.*N2;
% H(2,6,:)=N1.*N3;
% H(2,9,:)=N1.*N4;
% 
% H(5,2,:)=N2.*N1;
% H(5,5,:)=N2.*N2;
% H(5,6,:)=N2.*N3;
% H(5,9,:)=N2.*N4;
% 
% H(6,2,:)=N3.*N1;
% H(6,5,:)=N3.*N2;
% H(6,6,:)=N3.*N3;
% H(6,9,:)=N3.*N4;
% 
% H(9,2,:)=N4.*N1;
% H(9,5,:)=N4.*N2;
% H(9,6,:)=N4.*N3;
% H(9,9,:)=N4.*N4;
% 
% if isequal(dhn,1) || isequal(dhn,0)
%    Kh2=0*(hste(1)+tfte(1)/2)*wts(1)*H(:,:,1)+...
%       0*(hste(2)+tfte(2)/2)*wts(2)*H(:,:,2)+...
%       0*(hste(3)+tfte(3)/2)*wts(3)*H(:,:,3)+...
%       0*(hste(4)+tfte(4)/2)*wts(4)*H(:,:,4)+...
%       0*(hste(5)+tfte(5)/2)*wts(5)*H(:,:,5);
% elseif isequal(dhn,2) % Top
%    Kh2=qy*(hste(1)+tfte(1)/2)*wts(1)*H(:,:,1)+...
%       qy*(hste(2)+tfte(2)/2)*wts(2)*H(:,:,2)+...
%       qy*(hste(3)+tfte(3)/2)*wts(3)*H(:,:,3)+...
%       qy*(hste(4)+tfte(4)/2)*wts(4)*H(:,:,4)+...
%       qy*(hste(5)+tfte(5)/2)*wts(5)*H(:,:,5);
% 
% elseif isequal(dhn,3) % Bottom
%    Kh2=qy*(-hsbe(1)-tfbe(1)/2)*wts(1)*H(:,:,1)+...
%       qy*(-hste(2)-tfbe(2)/2)*wts(2)*H(:,:,2)+...
%       qy*(-hste(3)-tfbe(3)/2)*wts(3)*H(:,:,3)+...
%       qy*(-hste(4)-tfbe(4)/2)*wts(4)*H(:,:,4)+...
%       qy*(-hste(5)-tfbe(5)/2)*wts(5)*H(:,:,5);
% elseif isequal(dhn,4) % Centroid
%    Kh2=qy*(-yuc(1))*wts(1)*H(:,:,1)+...
%       qy*(-yuc(2))*wts(2)*H(:,:,2)+...
%       qy*(-yuc(3))*wts(3)*H(:,:,3)+...
%       qy*(-yuc(4))*wts(4)*H(:,:,4)+...
%       qy*(-yuc(5))*wts(5)*H(:,:,5);   
% end

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

% ------------------------------------------------------------------------
% -------               Calculate Internal Forces                  -------
% ------------------------------------------------------------------------
% Calculate internal forces
QeiD = Pbar'*Qino;
% -- Postprocessing for Moment from SC to Centroid S
[det1,det2,det3] = GlobalDisTransform(angletap);
[GDet]=CoordTransform(det1,det2,det3);          
QeiDt = GDet*Pbar'*Qino;
% -- Postprocessing for Moment from SC to Centroid E
% Update Internal Moment w.r.t centroidal axis yc(1)
QeiD(6,1) = QeiD(6,1) + QeiDt(1,1)*(yc(1)-ys(1));
QeiD(13,1) = QeiD(13,1) + QeiDt(8,1)*(yc(2)-ys(2)); 
% Postprocessing for Axial and Shear force from SC to Centroid
[dec1,dec2,dec3] = GlobalDisTransform(-CSangel);
[GDec]=CoordTransform(dec1,dec2,dec3);          
QeiDc = GDec*Pbar'*Qino;     
QeiD(1,1)=QeiDc(1,1); 
QeiD(2,1)=QeiDc(2,1);
QeiD(8,1)=QeiDc(8,1); 
QeiD(9,1)=QeiDc(9,1); 
Pt = -QeiD(1,1)*(1-xe/L)+QeiD(8,1)*xe/L;
Mzt = -QeiD(6,1)*(1-xe/L)+QeiD(13,1)*xe/L; 
Pt=round(Pt*10^9)/10^9;
Mzt=round(Mzt*10^9)/10^9;
Phi_Py=Phi_Py';

% ------------------------------------------------------------------------
% -------                Calculate Design Resource                 -------
% ------------------------------------------------------------------------
bften=zeros(1,nip); tften=zeros(1,nip); bfcom=zeros(1,nip);
tfcom=zeros(1,nip); yten=zeros(1,nip); ycom=zeros(1,nip);
Dcten=zeros(1,nip);Dccom=zeros(1,nip);
for i=1:nip
   if isequal(round(Mzt(1,i)*10^4)/10^4,0)
      if i < nip
         if Mzt(1,i+1) < 0 % top flange is tension.
            bften(1,i)=bfte(1,i);
            tften(1,i)=tfte(1,i);
            bfcom(1,i)=bfbe(1,i);
            tfcom(1,i)=tfbe(1,i);
            yten(1,i) =ytbare(1,i);
            ycom(1,i) =De(1,i)+tfbe(1,i)+tfte(1,i)-ytbare(1,i);
            Dcten(1,i) = ytbare(1,i)-tfte(1,i);
            Dccom(1,i) = De(1,i)-Dcten(1,i); 
            Fyhten = Fyfi;
            Fyhcom = Fyfo;     

         else
            bften(1,i)=bfbe(1,i);
            tften(1,i)=tfbe(1,i);
            bfcom(1,i)=bfte(1,i);
            tfcom(1,i)=tfte(1,i);
            yten(1,i) =De(1,i)+tfbe(1,i)+tfte(1,i)-ytbare(1,i);
            ycom(1,i) =ytbare(1,i);
            Dccom(1,i) = ytbare(1,i)-tfte(1,i);
            Dcten(1,i) = De(1,i)-Dccom(1,i); 
            Fyhten = Fyfo;
            Fyhcom = Fyfi;      
         end         
         
      else
         if Mzt(1,nip-1) < 0 % top flange is tension.
            bften(1,i)=bfte(1,i);
            tften(1,i)=tfte(1,i);
            bfcom(1,i)=bfbe(1,i);
            tfcom(1,i)=tfbe(1,i);
            yten(1,i) =ytbare(1,i);
            ycom(1,i) =De(1,i)+tfbe(1,i)+tfte(1,i)-ytbare(1,i);
            Dcten(1,i) = ytbare(1,i)-tfte(1,i);
            Dccom(1,i) = De(1,i)-Dcten(1,i); 
            Fyhten = Fyfi;
            Fyhcom = Fyfo;     

         else
            bften(1,i)=bfbe(1,i);
            tften(1,i)=tfbe(1,i);
            bfcom(1,i)=bfte(1,i);
            tfcom(1,i)=tfte(1,i);
            yten(1,i) =De(1,i)+tfbe(1,i)+tfte(1,i)-ytbare(1,i);
            ycom(1,i) =ytbare(1,i);
            Dccom(1,i) = ytbare(1,i)-tfte(1,i);
            Dcten(1,i) = De(1,i)-Dccom(1,i); 
            Fyhten = Fyfo;
            Fyhcom = Fyfi;      
         end           
         
         
      end
 
   else
      if Mzt(1,i) < 0 % top flange is tension.
         bften(1,i)=bfte(1,i);
         tften(1,i)=tfte(1,i);
         bfcom(1,i)=bfbe(1,i);
         tfcom(1,i)=tfbe(1,i);
         yten(1,i) =ytbare(1,i);
         ycom(1,i) =De(1,i)+tfbe(1,i)+tfte(1,i)-ytbare(1,i);
         Dcten(1,i) = ytbare(1,i)-tfte(1,i);
         Dccom(1,i) = De(1,i)-Dcten(1,i); 
         Fyhten = Fyfi;
         Fyhcom = Fyfo;     

      else
         bften(1,i)=bfbe(1,i);
         tften(1,i)=tfbe(1,i);
         bfcom(1,i)=bfte(1,i);
         tfcom(1,i)=tfte(1,i);
         yten(1,i) =De(1,i)+tfbe(1,i)+tfte(1,i)-ytbare(1,i);
         ycom(1,i) =ytbare(1,i);
         Dccom(1,i) = ytbare(1,i)-tfte(1,i);
         Dcten(1,i) = De(1,i)-Dccom(1,i); 
         Fyhten = Fyfo;
         Fyhcom = Fyfi;      
      end
   end
end

if isequal(HomoType,0)
    Fycom = Fy;
    Fyten = Fy;
    Fyw = Fy;
else
    Fycom = Fyhcom;
    Fyten = Fyhten;  
    Fyw=Fyw;
end

Mzt=abs(Mzt);

if isequal(fillet(1,1),1)
   Ix=zeros(1,nip);
   for i=1:nip
      Ix(1,i) = fillet(1,4);
   end 
else
   Ix=bfcom.*tfcom.^3/12+bfcom.*tfcom.*(ycom-tfcom/2).^2 + ...
      twe.*De.^3/12 + twe.*De.*(ycom-De/2-tfcom).^2 + ...
      bften.*tften.^3/12 + bften.*tften.*(ycom-tften/2-De-tfcom).^2;    
   r_Afillet = sqrt(Afillete/(4-pi));
   Ix_Afillet = 4*(1-5*pi/16)*r_Afillet.^4 +(Afillete/2).*Db.^2 +(Afillete/2).*Dt.^2;
   Ix = Ix + Ix_Afillet;
end
Sxc=Ix./ycom;
Sxt=Ix./yten;

% Section moment of inertia w.r.t minor axis
Iyc=(tfcom.*bfcom.^3)./12;
Iyt=(tften.*bften.^3)./12;

if isequal(fillet(1,1),1)
   Iy=zeros(1,nip);
   for i=1:nip
      Iy(1,i)  = fillet(1,8);
   end
else
   r_Afillet = sqrt(Afillete/(4-pi));
   Iy = Iyc + Iyt+ De.*twe.^3/12;
   Iy_Afillet = 4*(1-5*pi/16)*r_Afillet.^4 +Afillete.*(twe/2).^2;  
   Iy = Iy + Iy_Afillet;  
end

% Yield moments
Myc=Sxc.*Fycom;
Myt=Sxt.*Fyten;
My=min(Myc,Myt);

% Plastic NA in web from compression top of web
Dcp = (bften.*tften*Fyten+De.*twe*Fyw-bfcom.*tfcom*Fycom)./(2.*twe*Fyw);
for i=1:nip
   if Dcp(1,i) < 0
      Dcp(1,i) = 0;
   elseif Dcp(1,i) > De(1,i)
      Dcp(1,i) = De(1,i);
   end
end

Fyfillet = min( min(Fycom,Fyten), Fyw);
if isequal(fillet(1,1),1)
   Zx=zeros(1,nip);
   for i=1:nip
      Zx(1,i)  = fillet(1,5);
   end
   Mphybrid=Fycom.*Zx;
else
   Zx=zeros(1,nip);
   Mphybrid=zeros(1,nip);
   tfcc=zeros(1,nip);
   tfcchy=zeros(1,nip);
   tftt=zeros(1,nip);
   tftthy=zeros(1,nip);
   for i=1:nip
       if isequal(Dcp(1,i),0)
        tfcc(1,i) = (bfcom(1,i)*tfcom(1,i)+bften(1,i)*tften(1,i)+De(1,i)*twe(1,i))/(2*bfcom(1,i));
        Zx(1,i) = bfcom(1,i)*tfcc(1,i)*(tfcc(1,i)/2)  +De(1,i)*twe(1,i)*(De(1,i)/2+tfcom(1,i)-tfcc(1,i)) +...
            bften(1,i)*tften(1,i)*(De(1,i)+tfcom(1,i)-tfcc(1,i)+tften(1,i)/2) + bfcom(1,i)*(tfcom(1,i)-tfcc(1,i))^2/2;
        
        tfcchy(1,i) = (bfcom(1,i)*tfcom(1,i)*Fycom+bften(1,i)*tften(1,i)*Fyten+Fyw*De(1,i)*twe(1,i))/(2*Fycom*bfcom(1,i));
        Mphybrid(1,i) = bfcom(1,i)*tfcchy(1,i)*(tfcchy(1,i)/2)*Fycom  +De(1,i)*twe(1,i)*(De(1,i)/2+tfcom(1,i)-tfcchy(1,i))*Fyw +...
            bften(1,i)*tften(1,i)*(De(1,i)+tfcom(1,i)-tfcchy(1,i)+tften(1,i)/2)*Fyten + bfcom(1,i)*(tfcom(1,i)-tfcchy(1,i))^2*Fycom/2;        
       elseif isequal(Dcp(1,i),De(1,i))
        tftt(1,i) = (bfcom(1,i)*tfcom(1,i)+bften(1,i)*tften(1,i)+De(1,i)*twe(1,i))/(2*bften(1,i));
        Zx(1,i) = bften(1,i)*tftt(1,i)*(tftt(1,i)/2)  +De(1,i)*twe(1,i)*(De(1,i)/2+tften(1,i)-tftt(1,i)) +...
            bfcom(1,i)*tfcom(1,i)*(De(1,i)+tften(1,i)-tftt(1,i)+tfcom(1,i)/2) + bften(1,i)*(tften(1,i)-tftt(1,i))^2/2;  
        
        tftthy(1,i) = (bfcom(1,i)*tfcom(1,i)*Fycom+bften(1,i)*tften(1,i)*Fyten+Fyw*De(1,i)*twe(1,i))/(2*Fyten*bften(1,i));
        Mphybrid(1,i) = bften(1,i)*tftthy(1,i)*(tftthy(1,i)/2)*Fyten  +De(1,i)*twe(1,i)*(De(1,i)/2+tften(1,i)-tftthy(1,i))*Fyw +...
            bfcom(1,i)*tfcom(1,i)*(De(1,i)+tften(1,i)-tftthy(1,i)+tfcom(1,i)/2)*Fycom + bften(1,i)*(tften(1,i)-tftthy(1,i))^2*Fyten/2;          
       else      
        Zx(1,i) = bfcom(1,i)*tfcom(1,i)*(Dcp(1,i)+tfcom(1,i)/2) +Dcp(1,i)*twe(1,i)*Dcp(1,i)/2 + ...
          bften(1,i)*tften(1,i)*(De(1,i)-Dcp(1,i)+tften(1,i)/2) + (((De(1,i)-Dcp(1,i))^2)/2 )*twe(1,i);  
      
        Mphybrid(1,i) = bfcom(1,i)*tfcom(1,i)*(Dcp(1,i)+tfcom(1,i)/2)*Fycom +Dcp(1,i)*twe(1,i)*Dcp(1,i)/2*Fyw + ...
            bften(1,i)*tften(1,i)*(De(1,i)-Dcp(1,i)+tften(1,i)/2)*Fyten + (((De(1,i)-Dcp(1,i))^2)/2 )*twe(1,i)*Fyw + ...
            (Afillete(1,i)/2)*(Dcp(1,i))*Fyfillet + (Afillete(1,i)/2)*(De(1,i)-Dcp(1,i))*Fyfillet;       
       end
   end
  
   Zx_Afillet =  (Afillete/2).*(Dcp) + (Afillete/2).*(De-Dcp);
   Zx = Zx + Zx_Afillet;
  
end


%-----------------------------------------------------------
Rh=zeros(1,nip);
if isequal(HomoType,0)
   for i=1:nip
      Rh(1,i) = 1;
   end
   Mp=min(Fycom.*Zx,1.6.*My);
   
elseif isequal(HomoType,1)

   Dn=zeros(1,nip);Afn=zeros(1,nip);fn=zeros(1,nip);
   for i=1:nip
      if isequal(Dcten(1,i),Dccom(1,i))
         if Myt(1,i) > Myc(1,i)     % Compression yielding first
            Dn(1,i) = Dccom(1,i);
            Afn(1,i) = bfcom(1,i)*tfcom(1,i);
            fn(1,i) = Fycom;
         else                       % Tension yielding first
            Dn(1,i) = Dcten(1,i);
            Afn(1,i) = bften(1,i)*tften(1,i);
            fn(1,i) = Fyten;
         end
      else
         Dn(1,i) = max(Dcten(1,i),Dccom(1,i));
         if isequal(Dn(1,i),Dcten(1,i))
            Afn(1,i) = bften(1,i)*tften(1,i);
            if Myt(1,i) > Myc(1,i)     % Compression yielding first
               fn(1,i) = Fycom*(Dcten(1,i)+tften(1,i))/(Dccom(1,i)+tfcom(1,i)); 
            else
               fn(1,i) = Fyten;  
            end
         else
            Afn(1,i) = bfcom(1,i)*tfcom(1,i);
            if Myt(1,i) > Myc(1,i)     % Compression yielding first
               fn(1,i) = Fycom; 
            else
               fn(1,i) = Fyten*(Dccom(1,i)+tfcom(1,i))/(Dcten(1,i)+tften(1,i));  
            end            

         end
      end
   end
    
   beta=zeros(1,nip);
   for i=1:nip
      beta(1,i) = 2*Dn(1,i)*twe(1,i)/Afn(1,i);
   end  
   
   rho=zeros(1,nip);
   for i=1:nip
      rho(1,i) = min(1,Fyw/fn(1,i));
   end
   
   for i=1:nip
      if Fycom <= Fyw && Fyten <= Fyw
         Rh(1,i) = 1;
      else
         Rh(1,i) = ( 12 + beta(1,i)*(3*rho(1,i)-rho(1,i)^3) )/(12+2*beta(1,i));
      end
      
   end  
   
   Mp=min(Mphybrid,1.6.*My);
end

%-----------------------------------------------------------

% Web slenderness limits
% twice the distance from the cross-section centroid to the inside face of
% the compression flange
hc = 2.*(ycom-tfcom) -2*r_Afillets;
Dc = hc/2;
% twice the distance from the plastic neutral axis to the inside face of
% the compression flange
hp = 2.*Dcp -2*r_Afillets;
% slender web limit
lam_rw=zeros(1,nip);lam_rw1=zeros(1,nip);
for i=1:nip
    if isequal(LIAType,0)
        lam_rw(1,i) = 5.7*sqrt(E/Fycom); % slender web limit
    elseif isequal(LIAType,1)
        lam_rw1(1,i) = 3.1+2.5*bfcom(1,i)*tfcom(1,i)/( Dc(1,i)*twe(1,i));
        lam_rw(1,i) = max(4.6, min(5.7,lam_rw1(1,i)))*sqrt(E/Fycom);
    end
end

% compact web limit
lam_pw=zeros(1,nip);
if isequal(HomoType,0)
   for i=1:nip
       if hp(1,i) < 0 % web compact
          lam_pw(1,i)= 0; 
       else
          if isequal(bfcom(1,i),bften(1,i)) && isequal(tfcom(1,i),tften(1,i)) 
             lam_pw(1,i) = 3.76*sqrt(E/Fycom);
          else
             lam_pw(1,i) = min( (hc(1,i)/hp(1,i))*sqrt(E/Fycom) /(0.54*Mp(1,i)/My(1,i)-0.09)^2 ,lam_rw(1,i));
          end
       end
   end
elseif isequal(HomoType,1)  
   for i=1:nip 
       if hp(1,i) < 0 % web compact
          lam_pw(1,i)= 0; 
       else       
          if isequal(bfcom(1,i),bften(1,i)) && isequal(tfcom(1,i),tften(1,i)) 
             lam_pw(1,i) = 3.76*sqrt(E/Fycom);
          else
             lam_pw(1,i) = min( (hc(1,i)/hp(1,i))*sqrt(E/Fycom) /(0.54*Mp(1,i)/( Rh(1,i)*My(1,i) )-0.09)^2 ,lam_rw(1,i));
          end 
       end
   end
end

% web width to thickness ratio
lam_w = hc./twe;

% Web distance between fillets
De_fillet = De -2*r_Afillets;
kc=min(max(0.35,4./sqrt(De_fillet./twe)),0.76);

%-----------------------------------------------------------FLf flange
FLf=zeros(1,nip);
if isequal(HomoType,0)
    for i=1:nip
       if ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3  % Slender web
            FLf(1,i) = 0.7*Fycom;
       else
           if Sxt(1,i)/Sxc(1,i) >= 0.7
               FLf(1,i) = 0.7*Fycom;
           else
               FLf(1,i)= min(Fycom*Sxt(1,i)/Sxc(1,i),0.7*Fycom);        
           end           
       end
    end
elseif isequal(HomoType,1)
    for i=1:nip
       if ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3 % Slender web
            FLf(1,i)= max(min(0.7*Fycom,Fyw),0.5*Fycom);
       else
            FLf(1,i)= max( min(min(Rh(1,i)*Fyten*Sxt(1,i)/Sxc(1,i),0.7*Fycom),Fyw) ,0.5*Fycom);          
       end
    end
end

%-----------------------------------------------------------
% Flange slenderness limits
lam_f = bfcom./(2.*tfcom);
% compact flange limit
lam_pf = 0.38*sqrt(E/Fycom);
% slender flange limit
lam_rf=0.95.*sqrt(kc.*E./FLf);
% [lam_f,lam_rf,lam_pf]

% Web plastification factor - compression Rpc
Rpc=zeros(1,nip);
if isequal(HomoType,0)  
    for i=1:nip
       if ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3  % Slender web
           Rpc(1,i)=1;  
       else
           if isequal(hp(1,i),0) % web compact
              Rpc(1,i) = Mp(1,i)/Myc(1,i); 
           else           
             if lam_w(1,i) <= lam_pw(1,i) % web compact
                Rpc(1,i) = Mp(1,i)/Myc(1,i);
             elseif lam_w(1,i) > lam_pw(1,i) && lam_w(1,i) <= lam_rw(1,i) % web noncompact
                Rpc(1,i) = min((Mp(1,i)/Myc(1,i) - (Mp(1,i)/Myc(1,i) - 1)...
                   *((lam_w(1,i)-lam_pw(1,i))/(lam_rw(1,i)-lam_pw(1,i))) ), Mp(1,i)/Myc(1,i));
             end     
           end
       end
    end
   
elseif isequal(HomoType,1)
    for i=1:nip
       if ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3  % Slender web
           Rpc(1,i)=Rh(1,i);  
       else
           if isequal(hp(1,i),0) % web compact
              Rpc(1,i) = Mp(1,i)/Myc(1,i); 
           else           
             if lam_w(1,i) <= lam_pw(1,i) % web compact
                Rpc(1,i) = Mp(1,i)/Myc(1,i);
             elseif lam_w(1,i) > lam_pw(1,i) && lam_w(1,i) <= lam_rw(1,i) % web noncompact
                Rpc(1,i) = min((Mp(1,i)/Myc(1,i) - (Mp(1,i)/Myc(1,i) - Rh(1,i))...
                   *((lam_w(1,i)-lam_pw(1,i))/(lam_rw(1,i)-lam_pw(1,i))) ), Mp(1,i)/Myc(1,i));
             end     
           end
       end
    end        
end

% Web bend buckling factor
aw=hc.*twe./(bfcom.*tfcom);
Rpg=zeros(1,nip);lam_rwRpg=zeros(1,nip);
for i=1:nip
   if ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3 % Slender web
      if isequal(LIAType,0)
         Rpg(1,i)=min((1-(aw(1,i)./(1200+300*aw(1,i))).*(lam_w(1,i)-5.7*sqrt(E/Fycom)) ),1);   
      elseif isequal(LIAType,1)
         lam_rwRpg(1,i) = 3.1+2.5*bfcom(1,i)*tfcom(1,i)/( Dc(1,i)*twe(1,i));
         lam_rwRpg(1,i) = max(4.6, min(5.7,lam_rwRpg(1,i)))*sqrt(E/Fycom);         
         Rpg(1,i)=min((1-(aw(1,i)./(1200+300*aw(1,i))).*(lam_w(1,i)-lam_rwRpg(1,i)) ),1);
      end
   else
      Rpg(1,i)=1;
   end
end

% Lateral Torsional Buckling(LTB)
MmaxL=zeros(1,nip);
if isequal(HomoType,0)
    for i=1:nip
      if ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3  % Slender web
         MmaxL(1,i) = Rpg(1,i)*Myc(1,i);
      else % compact / noncompact
         MmaxL(1,i) = Rpc(1,i)*Myc(1,i); 
      end
    end
elseif isequal(HomoType,1)
    for i=1:nip
      if ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3  % Slender web
         MmaxL(1,i) = Rh(1,i)*Rpg(1,i)*Myc(1,i);
      else % compact / noncompact
         MmaxL(1,i) = Rpc(1,i)*Myc(1,i);
      end       
    end    
end

% Compression flange local bucklling(FLB)
Mn_FLB=zeros(1,nip);Fcr_FLB=zeros(1,nip);
if isequal(HomoType,0)
   for i=1:nip
     % F2,F3.Doubly symmetric I-shape with compact web 
     if isequal( round(Sxt(1,i)*10^9)/10^9,round(Sxc(1,i)*10^9)/10^9 ) ...
           && lam_w(1,i) <= lam_pw(1,i) 
        if lam_f(1,i) < lam_pf              % Compact flange
           Mn_FLB(1,i)=MmaxL(1,i);       
        elseif lam_f(1,i) >= lam_rf(1,i)    % Slender flange
           Mn_FLB(1,i)=0.9*E*kc(1,i)*Sxc(1,i);
        else                                % Noncompact flange
           Mn_FLB(1,i)=Mp(1,i)-( Mp(1,i)-0.7*Fycom*Sxc(1,i) )*( (lam_f(1,i)-lam_pf)/(lam_rf(1,i)-lam_pf) );
        end
     % F5.I-shape with slender web   
     elseif ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3  % Slender web 
        if lam_f(1,i) < lam_pf              % Compact flange
           Mn_FLB(1,i)=MmaxL(1,i); 
        elseif lam_f(1,i) >= lam_rf(1,i)    % Slender flange
           Fcr_FLB(1,i)=0.9*E*kc(1,i)/( bfcom(1,i)/(2*tfcom(1,i)) )^2;
           Mn_FLB(1,i)=Rpg(1,i)*Fcr_FLB(1,i)*Sxc(1,i);
        else                                % Noncompact flange
           Fcr_FLB(1,i)=(Fycom - 0.3*Fycom*( (lam_f(1,i)-lam_pf)/(lam_rf(1,i)-lam_pf) ) );
           Mn_FLB(1,i)=Rpg(1,i)*Fcr_FLB(1,i)*Sxc(1,i);        
        end
     % F4. Other I-shape   
     else
        if lam_f(1,i) < lam_pf              % Compact flange
           Mn_FLB(1,i)=MmaxL(1,i); 
        elseif lam_f(1,i) >= lam_rf(1,i)    % Slender flange
           Mn_FLB(1,i)=0.9*E*kc(1,i)*Sxc(1,i)/(lam_f(1,i))^2;
        else                                % Noncompact flange
           Mn_FLB(1,i)=(Rpc(1,i)*Myc(1,i)-(Rpc(1,i)*Myc(1,i)-FLf(1,i)*Sxc(1,i))...
              *((lam_f(1,i)-lam_pf)/(lam_rf(1,i)-lam_pf)) );
        end            
     end
   end
   
elseif isequal(HomoType,1)
   for i=1:nip          
      if lam_f(1,i) < lam_pf   % Compact flange
         Mn_FLB(1,i)=Rpg(1,i)*Rpc(1,i)*Myc(1,i); 
      elseif lam_f(1,i) >= lam_rf(1,i)    % Slender flange
         Fcr_FLB(1,i)=0.9*E*kc(1,i)/( bfcom(1,i)/(2*tfcom(1,i)) )^2;
         Mn_FLB(1,i)=Rpg(1,i)*Fcr_FLB(1,i)*Sxc(1,i);
      else                                % Noncompact flange
         Mn_FLB(1,i)=Rpg(1,i)*((Rpc(1,i)*Myc(1,i)-(Rpc(1,i)*Myc(1,i)-FLf(1,i)*Sxc(1,i))...
            *((lam_f(1,i)-lam_pf)/(lam_rf(1,i)-lam_pf)) ));            
      end         
   end   
end

% Tension flange yielding(TFY)
% Tension flange yielding limit state Rpt
Rpt=zeros(1,nip);
if isequal(HomoType,0)
    for i=1:nip
       if ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3 % Slender web
           Rpt(1,i)=1;  
       else    
           if isequal(hp(1,i),0) % web compact
              Rpt(1,i) = Mp(1,i)/Myt(1,i);
           else  
              if lam_w(1,i) <= lam_pw(1,i) % web compact
                 Rpt(1,i) = Mp(1,i)/Myt(1,i);
              elseif lam_rw(1,i) >= lam_w(1,i) &&  lam_w(1,i) > lam_pw(1,i) % web noncompact
                 Rpt(1,i) = min((Mp(1,i)/Myt(1,i) - (Mp(1,i)/Myt(1,i) - 1)...
                    *((lam_w(1,i)-lam_pw(1,i))/(lam_rw(1,i)-lam_pw(1,i))) ), Mp(1,i)/Myt(1,i));
              end  
           end
       end
    end
    
elseif isequal(HomoType,1)
    for i=1:nip
       if ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3  % Slender web
           Rpt(1,i)=Rh(1,i);  
       else    
           if isequal(hp(1,i),0) % web compact
              Rpt(1,i) = Mp(1,i)/Myt(1,i);
           else  
              if lam_w(1,i) <= lam_pw(1,i) % web compact
                 Rpt(1,i) = Mp(1,i)/Myt(1,i);
              elseif lam_rw(1,i) >= lam_w(1,i) &&  lam_w(1,i) > lam_pw(1,i) % web noncompact
                 Rpt(1,i) = min((Mp(1,i)/Myt(1,i) - (Mp(1,i)/Myt(1,i) - Rh(1,i))...
                    *((lam_w(1,i)-lam_pw(1,i))/(lam_rw(1,i)-lam_pw(1,i))) ), Mp(1,i)/Myt(1,i));
              end  
           end
       end
    end    
end

Mn_TFY=zeros(1,nip);
if isequal(HomoType,0)
    for i=1:nip
       % F5.I-shape with slender web 
       if ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3 % Slender web
          if round(Sxt(1,i)*10^9)/10^9 >= round(Sxc(1,i)*10^9)/10^9 
             Mn_TFY(1,i) = MmaxL(1,i); 
          else
             Mn_TFY(1,i)= Fyten*Sxt(1,i);
          end
       % F4.   
       elseif ~isequal( round(Sxt(1,i)*10^9)/10^9,round(Sxc(1,i)*10^9)/10^9 ) ...
             && lam_w(1,i) <= lam_rw(1,i)
          if round(Sxt(1,i)*10^9)/10^9 >= round(Sxc(1,i)*10^9)/10^9 
             Mn_TFY(1,i) = MmaxL(1,i); 
          else
             Mn_TFY(1,i)= Rpt(1,i)*Myt(1,i);
          end
       else
          Mn_TFY(1,i) = MmaxL(1,i);
       end
    end
elseif isequal(HomoType,1)
    for i=1:nip
        Mn_TFY(1,i)= Rpt(1,i)*Myt(1,i);
    end    
end

Mmax=zeros(1,nip);
for i=1:nip  
      Mmax(1,i) = min(min(MmaxL(1,i),Mn_FLB(1,i)) ,Mn_TFY(1,i)) ; 
end
% [MmaxL;Mn_FLB;Mn_TFY;Mmax]

% ------------------------------------------------------------------------
% -------                      Unity Check                         -------
% ------------------------------------------------------------------------
Phi_Pn=gam*abs(Pt); % Updated Internal Force including Effective Area

% Unity check 
Puc=Phi_Pn./Phi_Py;
Muc=gam*Mzt./ (0.9*Mmax);
UC=zeros(1,nip);
for i=1:nip
   % Non-compact for flange under flexure
   % Slender web under uniform axial compression
   if lam_f(1,i) > lam_pf || lam_w(1,i) > 1.49*sqrt(E/Fycom)
      UC(1,i)=Puc(1,i)+Muc(1,i);
   else
      if Puc(1,i)/Muc(1,i) >= 0.2/0.9
         UC(1,i)=Puc(1,i)+(8/9)*Muc(1,i);
      else
         UC(1,i)=Puc(1,i)/2+Muc(1,i);
      end    
   end
end

% ------------------------------------------------------------------------
% -------                Slenderness Check                         -------
% ------------------------------------------------------------------------
slender=zeros(1,nip);
for i=1:nip
   if ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3  % Slender web
      slender(1,i) = 1; % 1 is slender
   end
end

UC=UC';
slender=slender';

