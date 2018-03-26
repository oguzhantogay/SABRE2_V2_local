function [PrPeL]=StiffnessELEMENT3DPePel(bfb,tfb,bft,tft,Dg,yc,ht,hb,Dt,Db,hst,... 
   hsb,ys,tw,Afillet,L,E,fillet,ytbar,Qin)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
% ************************************************************************
% *************   Initial Effective Area Calculation          ************
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
   end 
else
   Ae = bfbe.*tfbe+bfte.*tfte+De.*twe+Afillete;  % ok
   Iux = Io + Afb.*hufb.^2 + Aft.*huft.^2  + Aw.*(De/2-hufb+tfbe/2).^2;   
   r_Afillet = sqrt(Afillete/(4-pi));
   Iux_Afillet = 4*(1-5*pi/16)*r_Afillet.^4 +(Afillete/2).*Db.^2 +(Afillete/2).*Dt.^2;
   Iux = Iux + Iux_Afillet;
end


% ------------------------------------------------------------------------
% -------               Calculate Internal Forces                  -------
% ------------------------------------------------------------------------

Pt = -Qin(1,1)*(1-xe/L)+Qin(1,8)*xe/L;
Pt=round(Pt*10^9)/10^9;


PrPeL = abs(Pt)/(pi^2*E*min(Iux)/L^2);

PrPeL=PrPeL';

