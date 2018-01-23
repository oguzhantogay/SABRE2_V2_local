function [Aef,Ae,Phi_Py]=StiffnessINELEMENT3DAefi(bfb,tfb,bft,tft,Dg,... 
   tw,Afillet,L,E,fillet,gam,Fy,Fyfi,Fyw,Fyfo,ytbar,HomoType,Aef,Pt,Mzt)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
% ************************************************************************
% *************   Effective Area Calculation Iteration       *************
% ************************************************************************
% Number of integration points
nip=5; % leave at 5 for now

% Integration point locations and weights
zeta=[-1 -sqrt(3/7) 0 sqrt(3/7) 1]; % 5 points Gauss-Lobatto rule
xe=L/2*zeta+L/2;
         
% Calculate section properties
bfbe=bfb(1)*(1-xe/L)+bfb(2)*xe/L;  
bfte=bft(1)*(1-xe/L)+bft(2)*xe/L;
tfbe=tfb(1)*(1-xe/L)+tfb(2)*xe/L;  
tfte=tft(1)*(1-xe/L)+tft(2)*xe/L;
De=Dg(1)*(1-xe/L)+Dg(2)*xe/L;           
twe=tw(1)*(1-xe/L)+tw(2)*xe/L;
Afillete=Afillet(1)*(1-xe/L)+Afillet(2)*xe/L;
ytbare=ytbar(1)*(1-xe/L)+ytbar(2)*xe/L;

% ------------------------------------------------------------------------
% ----------------------  Section Properties            ------------------
% ------------------------------------------------------------------------
if isequal(fillet(1,1),1)
   Ae=zeros(1,nip);
   for i=1:nip
      Ae(1,i)  = fillet(1,2);
   end 
else
   Ae = bfbe.*tfbe+bfte.*tfte+De.*twe+Afillete;  % ok
end

% Calculate the total fillet area and radius of the area.
Afillets = Ae-(bfbe.*tfbe+bfte.*tfte+De.*twe);  % ok
r_Afillets = sqrt(Afillets/(4-pi));

% ------------------------------------------------------------------------
% -------               Calculate Internal Forces                  -------
% ------------------------------------------------------------------------
Pt=Pt';
Mzt=Mzt';
Pt=round(Pt*10^9)/10^9;
Mzt=round(Mzt*10^9)/10^9;
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

% Web distance between fillets
De_fillet = De -2*r_Afillets;
kc=min(max(0.35,4./sqrt(De_fillet./twe)),0.76);
% ------------------------------------------------------------------------
% -------         Effective Area for Slender Plate                 -------
% ------------------------------------------------------------------------
Aef=Aef';
Fe=gam*abs(Pt)./Aef;
Fcr=Fe/0.9;

cf1=0.22;
cf2=(1-sqrt(1-4*cf1))/(2*cf1);
cw1=0.18;
cw2=(1-sqrt(1-4*cw1))/(2*cw1);
Fyf=min(Fycom,Fyten);Fyfw=max(Fyf,Fyw);
bfcomf=zeros(1,nip); bftenf=zeros(1,nip); Def=zeros(1,nip); Few=zeros(1,nip);
Aef=zeros(1,nip);Fcrf=zeros(1,nip);Fcrw=zeros(1,nip);
for i=1:nip
   % Compression flange
   Fcrf(1,i)=min(Fcr(1,i),Fyf);
   if bfcom(1,i)/(2*tfcom(1,i)) <= 0.64*sqrt(kc(1,i)*E/Fyf)*sqrt(Fyf/Fcrf(1,i))
      bfcomf(1,i)=bfcom(1,i);
   else
      Few(1,i)= (cf2*0.64*sqrt(kc(1,i)*E/Fyf)/(bfcom(1,i)/(2*tfcom(1,i))))^2*Fyf;
      bfcomf(1,i)=(1-cf1*sqrt(Few(1,i)/Fcrf(1,i)))*sqrt(Few(1,i)/Fcrf(1,i))*bfcom(1,i);
   end
   % Tension flange
   if bften(1,i)/(2*tften(1,i)) <= 0.64*sqrt(kc(1,i)*E/Fyf)*sqrt(Fyf/Fcrf(1,i))
      bftenf(1,i)=bften(1,i);
   else
      Few(1,i)= (cf2*0.64*sqrt(kc(1,i)*E/Fyf)/(bften(1,i)/(2*tften(1,i))))^2*Fyf;
      bftenf(1,i)=(1-cf1*sqrt(Few(1,i)/Fcrf(1,i)))*sqrt(Few(1,i)/Fcrf(1,i))*bften(1,i);
   end  
   Fcrw(1,i)=min(Fcr(1,i),Fyfw);
   % web
   if De_fillet(1,i)/twe(1,i) <= 1.49*sqrt(E/Fyfw)*sqrt(Fyfw/Fcrw(1,i))
      Def(1,i)=De_fillet(1,i);
   else
      Few(1,i)= (cw2*1.49*sqrt(E/Fyfw)/(De_fillet(1,i)/twe(1,i)))^2*Fyfw;
      Def(1,i)=(1-cw1*sqrt(Few(1,i)/Fcrw(1,i)))*sqrt(Few(1,i)/Fcrw(1,i))*De_fillet(1,i);
   end
   
   % Effective Area
   Aef(1,i) = bfcomf(1,i)*tfcom(1,i) + bftenf(1,i)*tften(1,i) ...
      + Def(1,i)*twe(1,i) + Afillets(1,i) + (De(1,i)-De_fillet(1,i)).*twe(1,i);
end

% ------------------------------------------------------------------------
% -------                        Phi_Pye                           -------
% ------------------------------------------------------------------------
Phi_Py=zeros(1,nip);
if isequal(HomoType,0)
   for i=1:nip
      Phi_Py(1,i)=0.9*Fycom*Aef(1,i);
   end
else
   for i=1:nip
      Phi_Py(1,i)=0.9*( bfcomf(1,i)*tfcom(1,i)*Fyf + bftenf(1,i)*tften(1,i)*Fyf ...
         + Def(1,i)*twe(1,i)*Fyw+Afillets(1,i)*Fyw +(De(1,i)-De_fillet(1,i)).*twe(1,i)*Fyw );
   end   
end

Aef=Aef';
Ae=Ae';
Phi_Py=Phi_Py';



