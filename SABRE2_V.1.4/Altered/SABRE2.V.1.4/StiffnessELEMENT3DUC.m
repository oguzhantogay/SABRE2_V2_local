function [UC,slender]=StiffnessELEMENT3DUC(bfb,tfb,bft,tft,Dg,ht,hb,... 
   ys,tw,Afillet,L,E,fillet,gam,Fy,Fyfi,Fyw,Fyfo,ytbar,LIAType,HomoType,Phi_Py,Pt,Mzt)
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

h = hte+hbe;
do = yse+De/2+tfbe;  

hufb = do - tfbe/2;        % SC    
huft = h - hufb;           % SC    

Db = hufb-tfbe/2;
Dt = huft-tfte/2;

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
       if ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3  % Slender web
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
   if ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3  % Slender web
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
       if ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3  % Slender web
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
       if ( Dcp(1,i) > 0 && lam_w(1,i) > lam_rw(1,i)) || Iyc(1,i)/Iyt(1,i) < 0.3  % Slender web
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

