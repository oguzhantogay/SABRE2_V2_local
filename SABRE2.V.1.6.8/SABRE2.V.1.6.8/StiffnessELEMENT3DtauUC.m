function [tau,tau_a,Rpg,Rpc,Rpt,Rh,Myc,My,Myt,Phi_Mmax,UC,Mmax,Py,psy,...
   MmaxL,Mn_FLB,Mn_TFY,PrPeL]=StiffnessELEMENT3DtauUC(bfb,tfb,bft,tft,Dg,ht,hb,... 
   ys,tw,Afillet,L,E,fillet,gam,Fy,Fyfi,Fyw,Fyfo,ytbar,LIAType,HomoType,Aef,Phi_Py,Pt,Mzt)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
% ************************************************************************
% *****************         SRF Calculation          *********************
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
hte=ht(1)*(1-xe/L)+ht(2)*xe/L;
hbe=hb(1)*(1-xe/L)+hb(2)*xe/L;
yse=ys(1)*(1-xe/L)+ys(2)*xe/L;
ytbare=ytbar(1)*(1-xe/L)+ytbar(2)*xe/L;

Afb = bfbe.*tfbe;
Aft = bfte.*tfte;
Aw  = De.*twe;
h = hte+hbe;

% Distantance from top/bottom flange centroid to NA
hcfb = (Aft.*(h) + Aw.*(De/2+tfbe/2))./(Afb+Aft+Aw); 
   

% Distantance from top/bottom flange centroid to shear center
Ift = bfte.^3.*tfte/12; % Top flange weak axis moment of inertia
Ifb = bfbe.^3.*tfbe/12; % Bottom flange weak axis moment of inertia
Iwy = De.*(twe.^3)/12;

% % Singly symmetric factor
% ratioBT=Ift/(Ift+Ifb);

do = yse+De/2+tfbe;  

hufb = do - tfbe/2;        % SC    
huft = h - hufb;           % SC    

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

if isequal(fillet(1,1),1)
   J=zeros(1,nip);
   for i=1:nip
      J(1,i)=fillet(1,12);
   end
else
   J=De.*(twe.^3)/3+(bfte.*(tfte.^3)/3).*(1-0.63*tfte./bfte) ...
      +(bfbe.*(tfbe.^3)/3).*(1-0.63*tfbe./bfbe);  % ok
end

% ------------------------------------------------------------------------
% -------               Calculate Internal Forces                  -------
% ------------------------------------------------------------------------
Aef=Aef';
Phi_Py=Phi_Py';
Pt=Pt';
Mzt=Mzt';

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

%-----------------------------------------------------------FL web
FL=zeros(1,nip);
if isequal(HomoType,0)
    for i=1:nip
       if ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3 % Slender web   
          if isequal(LIAType,0) 
             FL(1,i) = 0.7*Fycom;
          elseif isequal(LIAType,1)
             FL(1,i) = 0.5*Fycom;  
          end
       else
           if Sxt(1,i)/Sxc(1,i) >= 0.7
              if isequal(LIAType,0) 
                 FL(1,i) = 0.7*Fycom;
              elseif isequal(LIAType,1)
                 FL(1,i) = 0.5*Fycom;  
              end
           else
              if isequal(LIAType,0) 
                 FL(1,i)= min(Fycom*Sxt(1,i)/Sxc(1,i),0.7*Fycom);
              elseif isequal(LIAType,1)
                 FL(1,i) = 0.5*Fycom;  
              end         
           end           
       end
    end
elseif isequal(HomoType,1)
    for i=1:nip
       if ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3 % Slender web
          if isequal(LIAType,0) 
             FL(1,i)= max(min(0.7*Fyhcom,Fyw),0.5*Fyhcom);
          elseif isequal(LIAType,1)
             FL(1,i) = 0.5*Fyhcom;  
          end  
       else
          if isequal(LIAType,0) 
             FL(1,i)= max( min(min(Rh(1,i)*Fyhten*Sxt(1,i)/Sxc(1,i),0.7*Fyhcom),Fyw) ,0.5*Fyhcom);
          elseif isequal(LIAType,1)
             FL(1,i) = 0.5*Fyhcom;  
          end           
       end
    end
end

%-----------------------------------------------------------FLf flange
FLf=zeros(1,nip);
if isequal(HomoType,0)
    for i=1:nip
       if ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3 % Slender web
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
       if ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3 % Slender web
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
       if ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3 % Slender web
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

% Unified rt calculation
% rt = bfcom./sqrt( 12*(h./Dt + (aw/6).*De.^2./(h.*Dt)) );
Dt= tfbe+tfte+De; % Total depth
hc_rt = 2.*(ycom-tfcom);
Awc = hc_rt.*twe/2;
aw_rt=hc_rt.*twe./(bfcom.*tfcom);
rt=zeros(1,nip);
for i=1:nip
   rt(1,i) = bfcom(1,i)/sqrt( 12*(h(1,i)/Dt(1,i) + (aw_rt(1,i)/6)*De(1,i)^2*(1+(6/4)*Afillets(1,i)/Awc(1,i))/(h(1,i)*Dt(1,i)) ) );
end
rts = sqrt(sqrt(Iy.*Cwa)./Sxc);

if isequal(fillet(1,1),1)
   ry = zeros(1,nip);
   for i=1:nip
      ry(1,i)  = fillet(1,11); 
   end
else
   ry = sqrt(Iy./Ae);
end

% Lateral Torsional Buckling(LTB)
MmaxL=zeros(1,nip);
if isequal(HomoType,0)
    for i=1:nip
      if ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3 % Slender web
         MmaxL(1,i) = Rpg(1,i)*Myc(1,i);
      else % compact / noncompact
         MmaxL(1,i) = Rpc(1,i)*Myc(1,i); 
      end
    end
elseif isequal(HomoType,1)
    for i=1:nip
      if ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3 % Slender web
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
     elseif ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3 % Slender web 
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
       if ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3 % Slender web
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
PrPeL = abs(Pt)/(pi^2*E*min(Iux)/L^2);
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

% [Phi_Pn;Mzt;Puc;Muc;(8/9)*Muc;Puc+(8/9)*Muc;UC]
RaMmax=Mmax./MmaxL;
% ------------------------------------------------------------------------
% -------    Column Inelastic Stiffness Reduction Factor tau_a     -------
% ------------------------------------------------------------------------
% Column inelastic strength equation
tau_a=zeros(1,nip);
for i=1:nip
   if Puc(1,i) > 0.390
      tau_a(1,i)=-2.724*Puc(1,i)*log(Puc(1,i));
   else
      tau_a(1,i)=1;
   end
end 

for i=1:nip
    if round(tau_a(1,i)*10^3)/10^3 <=0
        tau_a(1,i)=10^(-3);
    end    
end

for i=1:nip
   tau_a(1,i)=tau_a(1,i)*Aef(1,i)/Ae(1,i);
end 
% Column inelastic strength equation for SRF
tau_asrf=zeros(1,nip);
for i=1:nip
   if UC(1,i) > 0.390
      tau_asrf(1,i)=-2.724*UC(1,i)*log(UC(1,i));
   else
      tau_asrf(1,i)=1;
   end
end 

for i=1:nip
   tau_asrf(1,i)=tau_asrf(1,i)*Aef(1,i)/Ae(1,i);
end 

for i=1:nip
    if round(tau_asrf(1,i)*10^3)/10^3 <=0
        tau_asrf(1,i)=10^(-3);
    end    
end

Lp=zeros(1,nip);
if isequal(HomoType,0)
    for i=1:nip        
       if isequal(LIAType,0)
           % F2,F3.Doubly symmetric I-shape with compact / noncompact web
            if isequal(round(Sxc(1,i)*10^6)/10^6,round(Sxt(1,i)*10^6)/10^6) && lam_w(1,i) < lam_pw(1,i)
                Lp(1,i) = 1.76*ry(1,i)*sqrt(E/Fycom);
            else
                Lp(1,i) = 1.1*rt(1,i)*sqrt(E/Fycom);        
            end        
        elseif isequal(LIAType,1)
                Lp(1,i) = 0.63*rt(1,i)*sqrt(E/Fycom);        
        end        
    end
elseif isequal(HomoType,1)
   for i=1:nip
      if isequal(LIAType,0)    
         Lp(1,i) = 1.1*rt(1,i)*sqrt(E/Fycom);            
      elseif isequal(LIAType,1)
         Lp(1,i) = 0.63*rt(1,i)*sqrt(E/Fycom);
      end   
   end
end

Lr=zeros(1,nip);
for i=1:nip
   if isequal(LIAType,0)
     % F2,F3.Doubly symmetric I-shape with compact / noncompact web
      if isequal(round(Sxc(1,i)*10^6)/10^6,round(Sxt(1,i)*10^6)/10^6) && lam_w(1,i) < lam_pw(1,i)
         Lr(1,i) = (1.95*rts(1,i)*E/FL(1,i))*sqrt(J(1,i)/(Sxc(1,i)*h(1,i)) + sqrt((J(1,i)/(Sxc(1,i)*h(1,i)))^2 + 6.76*(FL(1,i)/E)^2) );
      elseif ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3 % Slender web
         Lr(1,i) = pi*rt(1,i)*sqrt(E/FL(1,i));
      else
         Lr(1,i) = (1.95*rt(1,i)*E/FL(1,i))*sqrt(J(1,i)/(Sxc(1,i)*h(1,i)) + sqrt((J(1,i)/(Sxc(1,i)*h(1,i)))^2 + 6.76*(FL(1,i)/E)^2) );
      end
   elseif isequal(LIAType,1)
     % F2,F3.Doubly symmetric I-shape with compact / noncompact web  
     if isequal(round(Sxc(1,i)*10^6)/10^6,round(Sxt(1,i)*10^6)/10^6) && lam_w(1,i) < lam_pw(1,i)
        Lr(1,i) = (1.95*rts(1,i)*E/FL(1,i))*sqrt(J(1,i)/(Sxc(1,i)*h(1,i)) + sqrt((J(1,i)/(Sxc(1,i)*h(1,i)))^2 + 6.76*(FL(1,i)/E)^2) );      
     elseif ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3 % Slender web
        Lr(1,i) = pi*rt(1,i)*sqrt(E/FL(1,i));         
     else 
        Lr(1,i) = (1.95*rt(1,i)*E/FL(1,i))*sqrt(J(1,i)/(Sxc(1,i)*h(1,i)) + sqrt((J(1,i)/(Sxc(1,i)*h(1,i)))^2 + 6.76*(FL(1,i)/E)^2) ); 
     end
   end
end

tau_ltb=zeros(1,nip); X2=zeros(1,nip); Y=zeros(1,nip);
for i=1:nip
  if ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3 % Slender web
      if isequal(HomoType,0)      
         if isequal(LIAType,0)
             if Rpg(1,i)*UC(1,i)*RaMmax(1,i) <= Rpg(1,i)*FL(1,i)/Fycom   
                 tau_ltb(1,i) = 1;   
             elseif ( Rpg(1,i)*UC(1,i)*RaMmax(1,i) > Rpg(1,i)*FL(1,i)/Fycom )    &&  ( Rpg(1,i)*UC(1,i)*RaMmax(1,i) <= (0.9*MmaxL(1,i) )/ (0.9*Myc(1,i) ) )     
                 tau_ltb(1,i) = UC(1,i)*RaMmax(1,i)*(  (    (1-UC(1,i)*RaMmax(1,i)) / (1-FL(1,i)/Fycom) ) * (sqrt(Fycom/FL(1,i)) - 1.1/pi) +1.1/pi   )^2; 
             else
                 tau_ltb(1,i) = UC(1,i)*RaMmax(1,i)*(  (    (1-UC(1,i)*RaMmax(1,i)) / (1-FL(1,i)/Fycom) ) * (sqrt(Fycom/FL(1,i)) - 1.1/pi) +1.1/pi   )^2;          
             end     
         elseif isequal(LIAType,1)
             if Rpg(1,i)*UC(1,i)*RaMmax(1,i) <= Rpg(1,i)*FL(1,i)/Fycom   
                 tau_ltb(1,i) = 1;   
             elseif ( Rpg(1,i)*UC(1,i)*RaMmax(1,i) > Rpg(1,i)*FL(1,i)/Fycom )    &&  ( Rpg(1,i)*UC(1,i)*RaMmax(1,i) <= (0.9*MmaxL(1,i) )/ (0.9*Myc(1,i) ) )     
                 tau_ltb(1,i) = UC(1,i)*RaMmax(1,i)*(  (    (1-UC(1,i)*RaMmax(1,i)) / (1-FL(1,i)/Fycom) ) * (sqrt(Fycom/FL(1,i)) - 0.63/pi) +0.63/pi   )^2; 
             else
                 tau_ltb(1,i) = UC(1,i)*RaMmax(1,i)*(  (    (1-UC(1,i)*RaMmax(1,i)) / (1-FL(1,i)/Fycom) ) * (sqrt(Fycom/FL(1,i)) - 0.63/pi) +0.63/pi   )^2;          
             end           
         end
      elseif isequal(HomoType,1)
         if isequal(LIAType,0)
             if Rpg(1,i)*Rh(1,i)*UC(1,i)*RaMmax(1,i) <= Rpg(1,i)*FL(1,i)/Fycom   
                 tau_ltb(1,i) = 1;   
             elseif ( Rpg(1,i)*Rh(1,i)*UC(1,i)*RaMmax(1,i) > Rpg(1,i)*FL(1,i)/Fycom )    &&  ( Rpg(1,i)*Rh(1,i)*UC(1,i)*RaMmax(1,i) <= (0.9*MmaxL(1,i) )/ (0.9*Myc(1,i) ) )     
                 tau_ltb(1,i) = Rh(1,i)*UC(1,i)*RaMmax(1,i)*(  (    (Rh(1,i)-Rh(1,i)*UC(1,i)*RaMmax(1,i)) / (Rh(1,i)-FL(1,i)/Fycom) ) * (sqrt(Fycom/FL(1,i)) - 1.1/pi) +1.1/pi   )^2; 
             else
                 tau_ltb(1,i) = Rh(1,i)*UC(1,i)*RaMmax(1,i)*(  (    (Rh(1,i)-Rh(1,i)*UC(1,i)*RaMmax(1,i)) / (Rh(1,i)-FL(1,i)/Fycom) ) * (sqrt(Fycom/FL(1,i)) - 1.1/pi) +1.1/pi   )^2;          
             end     
         elseif isequal(LIAType,1)
             if Rpg(1,i)*Rh(1,i)*UC(1,i)*RaMmax(1,i) <= Rpg(1,i)*FL(1,i)/Fycom   
                 tau_ltb(1,i) = 1;   
             elseif ( Rpg(1,i)*Rh(1,i)*UC(1,i)*RaMmax(1,i) > Rpg(1,i)*FL(1,i)/Fycom )    &&  ( Rpg(1,i)*Rh(1,i)*UC(1,i)*RaMmax(1,i) <= (0.9*MmaxL(1,i) )/ (0.9*Myc(1,i) ) )     
                 tau_ltb(1,i) = Rh(1,i)*UC(1,i)*RaMmax(1,i)*(  (    (Rh(1,i)-Rh(1,i)*UC(1,i)*RaMmax(1,i)) / (Rh(1,i)-FL(1,i)/Fycom) ) * (sqrt(Fycom/FL(1,i)) - 0.63/pi) +0.63/pi   )^2; 
             else
                 tau_ltb(1,i) = Rh(1,i)*UC(1,i)*RaMmax(1,i)*(  (    (Rh(1,i)-Rh(1,i)*UC(1,i)*RaMmax(1,i)) / (Rh(1,i)-FL(1,i)/Fycom) ) * (sqrt(Fycom/FL(1,i)) - 0.63/pi) +0.63/pi   )^2;          
             end           
         end          
      end
      
  else % compact / noncompact
      Y(1,i)= ( ((1-UC(1,i)*RaMmax(1,i)) / (1-FL(1,i)/(Rpc(1,i)*Fycom))) ...
         * (Lr(1,i)/rt(1,i)-Lp(1,i)/rt(1,i)) + Lp(1,i)/rt(1,i) )*(Rpc(1,i)*UC(1,i)*RaMmax(1,i))*(Fycom/(E*1.95));  
      X2(1,i)=Sxc(1,i)*h(1,i)/J(1,i);
      if Rpc(1,i)*UC(1,i)*RaMmax(1,i) <= FL(1,i)/Fycom
          tau_ltb(1,i) = 1; 
      elseif ( Rpc(1,i)*UC(1,i)*RaMmax(1,i) > FL(1,i)/Fycom)    &&  ( Rpc(1,i)*UC(1,i)*RaMmax(1,i) <= (0.9*MmaxL(1,i) )/ (0.9*Myc(1,i) ) )               
          tau_ltb(1,i) = sqrt(    (  Y(1,i)^4 * X2(1,i) )  /  (   6.76*X2(1,i)*(Fycom/E)^2*(Rpc(1,i)*UC(1,i)*RaMmax(1,i))^2 +2*Y(1,i)^2   )     );
      else
          tau_ltb(1,i) = sqrt(    (  Y(1,i)^4 * X2(1,i) )  /  (   6.76*X2(1,i)*(Fycom/E)^2*(Rpc(1,i)*UC(1,i)*RaMmax(1,i))^2 +2*Y(1,i)^2   )     );
      end       

  end
end

psy=zeros(1,nip);
for i=1:nip
   if isequal(round((abs(Pt(1,i))/Phi_Py(1,i))*10^3)/10^3 ,0) && ...
           isequal(round( (Mzt(1,i)/ (0.9*Mmax(1,i))) *10^3)/10^3,0)
      psy(1,i) = 0;  
   else
      psy(1,i) = atan2( (abs(Pt(1,i))./Phi_Py(1,i)) , (Mzt(1,i)./ (0.9*Mmax(1,i))) );
   end
      
end

SRF=zeros(1,nip);
for i=1:nip
   if ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3 % Slender web     
    SRF(1,i)= (1-psy(1,i)/(pi/2))*0.9*Rpg(1,i)*tau_ltb(1,i) +( psy(1,i)/(pi/2))*0.7893*tau_asrf(1,i); 
   else % compact / noncompact 
    SRF(1,i)= (1-psy(1,i)/(pi/2))*0.9*tau_ltb(1,i) +( psy(1,i)/(pi/2))*0.7893*tau_asrf(1,i);   
   end
end

Py=Phi_Py/0.9;
Phi_Mmax=0.9*Mmax;
UC=UC';
tau = SRF';
Py=Py';
psy=psy';
Rpg=Rpg';
Rpc=Rpc';
Rpt=Rpt';
Rh=Rh';
Myc=Myc';
My=My';
Myt=Myt';
Phi_Mmax=Phi_Mmax';
PrPeL=PrPeL';
% tau_a
% tau_ltb
% [1,tau_ltb*0.9]
% [2,tau_a*0.7893]
% [3,SRF]


% De./twe
% bfcom./(2*tfcom)
% De./bfcom
% De./bften
% Ae
% Dcp
% Dc
% Dc./De
% Dcp./De
% Dcp./Dc
% aw_rt
% ry
% rt

% Iyc./Iyt
% Iy
% Ix
% Sxc
% Sxt
% Mp
% 
% Myc
% Myt
% My
% Rh
% lam_w
% lam_pw
% lam_rw
% Rpt
% Rpc
% Rpg

% Lp
% Lr


