function [ANI,gammma,FunewR,EGunew,Qintf,QintfE,Qint1,Qint2,MI,tau,Rpg,Rpc,Rpt,Rh,Myc,Myt,My,Jval,Phi_Mmax,Phi_Py,UC,PrPeL,crLTB,LGv] = AnalysisNonIEBuckling(Massemble,...
   Rval,JNodevalue_i,JNodevalue_j,SNodevalue,RNCc,Nshe1,Nshe2,DUP1,DUP2,LNC,LNC1,LNC2,...
   LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,nmode,ninc,lambda,pt_title_name,...
   ap_sw_buttongroup,ap_da_buttongroup,ap_cv_buttongroup,JeongP,BrentP,NLIAType)
% Developed by Woo Yong Jeong.
% Date : 2/01/2015.
% ************************************************************************
% *******      Nonlinear Inelastic Eigenvalue Buckling Load        *******
% ************************************************************************
% ************************** Wait1
wh = waitbar(0,'Initializing waitbar...');


xn = sum(sum(SNodevalue(:,:,3)));      % Total number of Elements
N = length(RNCc(:,1));                 % Total number of Nodes
mem=length(Massemble(:,1));            % Total number of members
nodedof=7;                    % Number of degree of freedom in each node
nDOF = nodedof*N;             % Total number of dofs

Qint1=zeros(xn,nodedof,(round(ninc/lambda))); % Preallocationg 
Qint2=zeros(xn,nodedof,(round(ninc/lambda))); % Preallocationg 
Qintf=zeros(xn,nodedof*2,(round(ninc/lambda))); % Preallocationg
QintfE=zeros(xn,nodedof*2,(round(ninc/lambda))); % Preallocationg
% Preallocationg Elastic modulus, Shear modulus, Yield stress, Density
nel = 1; E = zeros(xn,1); G = zeros(xn,1); Fy = zeros(xn,1);stRho = zeros(xn,1); 
Fyfo = zeros(xn,1); Fyw = zeros(xn,1); Fyfi = zeros(xn,1); HomoType= zeros(xn,1);
fillet=zeros(xn,1);         
for i = 1:mem
   for j = 1:max(SNodevalue(i,:,2))
      for k = 1:SNodevalue(i,j,3)
         E(nel,1)=SNodevalue(i,j,4);      % Elastic modulus in each element
         G(nel,1)=SNodevalue(i,j,5);      % Shear modulus in each element
         Fy(nel,1)=SNodevalue(i,j,6);     % Yield Stress
         stRho(nel,1)=SNodevalue(i,j,7);  % Density
         Fyfo(nel,1)=SNodevalue(i,j,8);   % Yield Stress flage 1 
         Fyw(nel,1)=SNodevalue(i,j,9);    % Yield Stress web
         Fyfi(nel,1)=SNodevalue(i,j,10);  % Yield Stress flage 2
         HomoType(nel,1)=SNodevalue(i,j,11);
         
         % Data calling
         fillet(nel,1)=Massemble(i,4);    % Selection of AISC section
         fillet(nel,2)=Massemble(i,5);    % A
         fillet(nel,3)=Massemble(i,6);    % W
         fillet(nel,4)=Massemble(i,7);    % Ix
         fillet(nel,5)=Massemble(i,8);    % Zx
         fillet(nel,6)=Massemble(i,9);    % Sx
         fillet(nel,7)=Massemble(i,10);   % rx
         fillet(nel,8)=Massemble(i,11);   % Iy
         fillet(nel,9)=Massemble(i,12);   % Zy
         fillet(nel,10)=Massemble(i,13);  % Sy
         fillet(nel,11)=Massemble(i,14);  % ry
         fillet(nel,12)=Massemble(i,15);  % J
         fillet(nel,13)=Massemble(i,16);  % Cw
         nel=nel+1;
      end
   end
end

% Number of restraints
nFix = sum(PNC(:,5)+PNC(:,6)+PNC(:,7)+PNC(:,8)+PNC(:,9)+PNC(:,10)+PNC(:,11));
if isempty(FEL)
   FEL(xn,9)=0;
end

% ------------------------------------------------------------------------
% ----------------------      Model generation       ---------------------
% ------------------------------------------------------------------------
% Nodes for each element (# ele, #node start, #node end)
MI=[DUP1(:,1),DUP1(:,2),DUP2(:,2)];

% Global frame coordinates at each element.
% Start node : node(1) and end node : node(2) for each element
xg1=DUP1(:,3);xg2=DUP2(:,3);  % element length : xg1(start) xg2(end)
yg1=DUP1(:,4);yg2=DUP2(:,4);  % element length : xg1(start) xg2(end)
zg1=DUP1(:,5);zg2=DUP2(:,5);  % element length : xg1(start) xg2(end)

% Section properties at each element under natural frame
bfb1=Nshe1(:,4);bfb2=Nshe2(:,4);  % Bottom flange width
tfb1=Nshe1(:,5);tfb2=Nshe2(:,5);  % Bottom flange thickness
bft1=Nshe1(:,6);bft2=Nshe2(:,6);  % Top flange width
tft1=Nshe1(:,7);tft2=Nshe2(:,7);  % Top flange thickness
Dg1=Nshe1(:,8);Dg2=Nshe2(:,8);  % dw:Web depth (y-dir)
tw1=Nshe1(:,9);tw2=Nshe2(:,9);  % Web thickness
hg1=Nshe1(:,11);hg2=Nshe2(:,11);  % h : Distance between flange centroids
Afillet1=Nshe1(:,12);Afillet2=Nshe2(:,12);  % h : Distance between flange centroids
% -------------------------------- Geometric dimension of Cross-section S
% Mid-web depth 
Dt1=Dg1/2;        Dt2=Dg2/2;        % top of Web depth to mid web depth
Db1=Dt1;          Db2=Dt2;          % bottom of Web depth to mid web depth
ht1=Dt1+tft1/2;   ht2=Dt2+tft2/2;   % top flange centroid to mid web depth
hb1=Db1 + tfb1/2; hb2=Db2 + tfb2/2; % bottom flange centroid to mid web depth

% Shear center
% Start node
% bottom flange centroid to shear center
hsb1 = (tft1.*bft1.^3.*hg1)./(tfb1.*bfb1.^3+tft1.*bft1.^3); 
Dsb1 = hsb1 - tfb1/2; % bottom of Web depth to shear center
hst1 = hg1 - hsb1;    % top flange centroid to shear center
Dst1 = hst1 - tft1/2; % top of Web depth to shear center
% End node
% bottom flange centroid to shear center
hsb2 = (tft2.*bft2.^3.*hg2)./(tfb2.*bfb2.^3+tft2.*bft2.^3); 
Dsb2 = hsb2 - tfb2/2; % bottom of Web depth to shear center
hst2 = hg2 - hsb2;    % top flange centroid to shear center
Dst2 = hst2 - tft2/2;    % top of Web depth to shear center

% Centroid Axis ; ytbar = top flange to centroid
% Start node
Ag1 =  tft1.*bft1 + tw1.*Dg1  + tfb1.*bfb1;
ytbar1 = ( bft1.*tft1.*tft1/2+tw1.*Dg1.*(tft1+Dg1/2)+ bfb1.*tfb1.*(tft1+Dg1+tfb1/2) )./Ag1;
Dct1 = ytbar1 - tft1;   % top of Web depth to centroid
Dcb1 = Dg1 - Dct1;      % bottom of Web depth to centroid
hct1 = ytbar1 - tft1/2; % top flange centroid to centroid
hcb1 = hg1 - hct1;      % bottom flange centroid to centroid
% End node
Ag2 =  tft2.*bft2 + tw2.*Dg2  + tfb2.*bfb2;
ytbar2 = ( bft2.*tft2.*tft2/2+tw2.*Dg2.*(tft2+Dg2/2)+ bfb2.*tfb2.*(tft2+Dg2+tfb2/2) )./Ag2;
Dct2 = ytbar2 - tft2;   % top of Web depth to centroid
Dcb2 = Dg2 - Dct2;      % bottom of Web depth to centroid
hct2 = ytbar2 - tft2/2; % top flange centroid to centroid
hcb2 = hg2 - hct2;      % bottom flange centroid to centroid
CSD1 = hct1-hst1;
CSD2 = hct2-hst2;
% -------------------------------- Geometric dimension of Cross-section E

% *** Global frame angle for each element without considering shear center
q = 0; alpharef = zeros(xn,2);    
for i = 1:mem
   for j=1:sum(SNodevalue(i,:,3))          
      opp = JNodevalue_j(i,4)-JNodevalue_i(i,4);  % element depth in y-dir
      adj = JNodevalue_j(i,3)-JNodevalue_i(i,3);  % element length in x-dir         
      alpharef(q+j,1)=MI(q+j,1);
      alpharef(q+j,2)=atan2(opp,adj); % Only global frame angle      
   end
 q = sum(SNodevalue(i,:,3))+q;
end

% ----------------------------------------------------- Centroidal Angle S
DLe1 = zeros(xn,3);DLe2 = zeros(xn,3);
for i=1:xn
   Rz=[cos(-alpharef(i,2)) -sin(-alpharef(i,2)) 0; sin(-alpharef(i,2)) cos(-alpharef(i,2)) 0; 0 0 1];
   DLe1(i,:)=Rz*[xg1(i,1);yg1(i,1);0];
   DLe2(i,:)=Rz*[xg2(i,1);yg2(i,1);0];
end 
% ----------------------------------------------------- Centroidal Angle E

% Update Global frame nodal coordinates w.r.t Shear center
xg1=Nshe1(:,1); yg1=Nshe1(:,2); zg1=Nshe1(:,3);
xg2=Nshe2(:,1); yg2=Nshe2(:,2); zg2=Nshe2(:,3);

% ********** Global frame angle for each element considering shear center
alphatap = zeros(xn,2);
for i=1:xn
    opp = yg2(i,1)-yg1(i,1);        % element depth in y-dir
    adj = xg2(i,1)-xg1(i,1);        % element length in x-dir         
    alphatap(i,1)=MI(i,1);
    alphatap(i,2)=atan2(opp,adj);   % Global frame angle w.r.t Shear center
end
angletap = alphatap - alpharef;
% ----------------------------------------------- Tapering angle
segnum(1,1)=0;          % (Start node number - 1) for each member
ys1=zeros(xn,1);ys2=zeros(xn,1);yc1=zeros(xn,1);yc2=zeros(xn,1);
for i = 1:mem
   switch Rval(i,2)  
      
      case 1                                    % mid-web depth ; val = 1
         
         for k = 1:sum(SNodevalue(i,:,3))
            ys1(k+segnum(i,1),1)=Dg1(k+segnum(i,1),1)/2 - Dst1(k+segnum(i,1),1); 
            ys2(k+segnum(i,1),1)=Dg2(k+segnum(i,1),1)/2 - Dst2(k+segnum(i,1),1);    % Shear center   
            yc1(k+segnum(i,1),1)=Dg1(k+segnum(i,1),1)/2 - Dct1(k+segnum(i,1),1); 
            yc2(k+segnum(i,1),1)=Dg2(k+segnum(i,1),1)/2 - Dct2(k+segnum(i,1),1);    % Centroid                   
         end        
            
      case 2                                    % top of web; val = 2
        
         for k = 1:sum(SNodevalue(i,:,3))
            ys1(k+segnum(i,1),1)=-Dst1(k+segnum(i,1),1);
            ys2(k+segnum(i,1),1)=-Dst2(k+segnum(i,1),1);                % Shear center        
            yc1(k+segnum(i,1),1)=-Dct1(k+segnum(i,1),1);
            yc2(k+segnum(i,1),1)=-Dct2(k+segnum(i,1),1);                % Centroid              
         end        
       
      case 3                                    % bottom of web; val = 3
        
         for k = 1:sum(SNodevalue(i,:,3))
            ys1(k+segnum(i,1),1)=Dsb1(k+segnum(i,1),1); 
            ys2(k+segnum(i,1),1)=Dsb2(k+segnum(i,1),1);              % Shear center      
            yc1(k+segnum(i,1),1)=Dcb1(k+segnum(i,1),1); 
            yc2(k+segnum(i,1),1)=Dcb2(k+segnum(i,1),1);              % Centroid                   
         end        
   end 
   segnum(i+1,1) = segnum(i,1) + sum(SNodevalue(i,:,3));
end   

% ------------------------------------------------------------------------
% --------       Angle between centroid and shear center         ---------
% ------------------------------------------------------------------------
alphacen = zeros(xn,2);alphasc = zeros(xn,2);
for i=1:xn
    oppc = yc2(i,1)-yc1(i,1);        % element depth centroid in y-dir
    adj = DLe2(i,1)-DLe1(i,1);       % element length in x-dir         
    alphacen(i,1)=MI(i,1);
    alphacen(i,2)=atan2(oppc,adj);   % Global frame angle w.r.t Shear center
    opps = ys2(i,1)-ys1(i,1);        % element depth shear center in y-dir
    alphasc(i,1)=MI(i,1);
    alphasc(i,2)=atan2(opps,adj);   % Global frame angle w.r.t Shear center     
end
CSangel = alphacen -  alphasc;   

% ------------------------------------------------------------------------
% ----------          Reset Shear Center and Centroid        -------------
% ------------------------------------------------------------------------
segnum(1,1)=0; 
for i = 1:mem                                  % mid-web depth ; val = 1
   for k = 1:sum(SNodevalue(i,:,3))
      ys1(k+segnum(i,1),1)=Dg1(k+segnum(i,1),1)/2 - Dst1(k+segnum(i,1),1); 
      ys2(k+segnum(i,1),1)=Dg2(k+segnum(i,1),1)/2 - Dst2(k+segnum(i,1),1);    % Shear center    
      yc1(k+segnum(i,1),1)=Dg1(k+segnum(i,1),1)/2 - Dct1(k+segnum(i,1),1); 
      yc2(k+segnum(i,1),1)=Dg2(k+segnum(i,1),1)/2 - Dct2(k+segnum(i,1),1);    % Centroid           
   end        
   segnum(i+1,1) = segnum(i,1) + sum(SNodevalue(i,:,3));
end 

% ------------------------------------------------------------------------
% ----------------          Tapering factors        ----------------------
% ------------------------------------------------------------------------
% first derivatives for hst; hsb; ys; bft; bfb
% Calculate Initial Element Length for longitudianl direction.
[DX]=InitialEleLength(xn,xg1,yg1,zg1,xg2,yg2,zg2);
% Preallocationg
hstp = zeros(xn,1); hsbp = zeros(xn,1);
ysp = zeros(xn,1); bftp = zeros(xn,1); bfbp = zeros(xn,1);
for i=1:xn
    hstp(i,1) = ( hst2(i,1)-hst1(i,1) )/DX(i,1);
    hsbp(i,1) = ( hsb2(i,1)-hsb1(i,1) )/DX(i,1);
    ysp(i,1)  = ( ys2(i,1) -ys1(i,1)  )/DX(i,1);
    bftp(i,1) = ( bft2(i,1)-bft1(i,1) )/DX(i,1);
    bfbp(i,1) = ( bfb2(i,1)-bfb1(i,1) )/DX(i,1);
end

% ------------------------------------------------------------------------
% --------------------      Rigid offset for Supports  -------------------
% ------------------------------------------------------------------------
rd1=zeros(xn,1); 
for i=1:xn
   if isequal(PNC1(i,7),0)
      rd1(i,1)=0;
   else
      if isequal(PNC1(i,13),1) || isequal(PNC1(i,13),0)% None
         rd1(i,1)=0;
      elseif isequal(PNC1(i,13),2) % Top
         rd1(i,1)=-(hst1(i,1)+tft1(i,1)/2);      
      elseif isequal(PNC1(i,13),3) % Bottom
         rd1(i,1)=(hsb1(i,1)+tfb1(i,1)/2);
      elseif isequal(PNC1(i,13),4) % Centroid
         rd1(i,1)=CSD1(i,1);      
      end
   end
end
rd2=zeros(xn,1);
for i=1:xn
   if isequal(PNC2(i,7),0)
      rd2(i,1)=0;
   else   
      if isequal(PNC2(i,13),1) || isequal(PNC2(i,13),0)% None
         rd2(i,1)=0;
      elseif isequal(PNC2(i,13),2) % Top
         rd2(i,1)=-(hst2(i,1)+tft2(i,1)/2);      
      elseif isequal(PNC2(i,13),3) % Bottom
         rd2(i,1)=(hsb2(i,1)+tfb2(i,1)/2);
      elseif isequal(PNC2(i,13),4) % Bottom
         rd2(i,1)=CSD2(i,1);      
      end
   end
end

rxd1=zeros(xn,1); 
for i=1:xn
   if isequal(PNC1(i,5),0) && isequal(PNC1(i,6),0)
      rxd1(i,1)=0;
   else   
      if isequal(PNC1(i,13),1) || isequal(PNC1(i,13),0)% None
         rxd1(i,1)=0;
      elseif isequal(PNC1(i,13),2) % Top
         rxd1(i,1)=-(hst1(i,1)+tft1(i,1)/2);      
      elseif isequal(PNC1(i,13),3) % Bottom
         rxd1(i,1)=(hsb1(i,1)+tfb1(i,1)/2);
      elseif isequal(PNC1(i,13),4) % Centroid
         rxd1(i,1)=CSD1(i,1);      
      end
   end
end
rxd2=zeros(xn,1);
for i=1:xn
   if isequal(PNC2(i,5),0) && isequal(PNC2(i,6),0)
      rxd2(i,1)=0;
   else     
      if isequal(PNC2(i,13),1) || isequal(PNC2(i,13),0)% None
         rxd2(i,1)=0;
      elseif isequal(PNC2(i,13),2) % Top
         rxd2(i,1)=-(hst2(i,1)+tft2(i,1)/2);      
      elseif isequal(PNC2(i,13),3) % Bottom
         rxd2(i,1)=(hsb2(i,1)+tfb2(i,1)/2);
      elseif isequal(PNC2(i,13),4) % Bottom
         rxd2(i,1)=CSD2(i,1);      
      end
   end
end

% ------------------------------------------------------------------------
% ----------------      Rigid offset for Point Loads     -----------------
% ------------------------------------------------------------------------
Lrd1=zeros(xn,1); 
for i=1:xn
   if isequal(LNC1(i,5),0)
      Lrd1(i,1)=0;
   else     
      if isequal(LNC1(i,13),1) || isequal(LNC1(i,13),0)% None
         Lrd1(i,1)=0;
      elseif isequal(LNC1(i,13),2) % Top
         Lrd1(i,1)=-(hst1(i,1)+tft1(i,1)/2);      
      elseif isequal(LNC1(i,13),3) % Bottom
         Lrd1(i,1)=(hsb1(i,1)+tfb1(i,1)/2);
      elseif isequal(LNC1(i,13),4) % Centroid
         Lrd1(i,1)=CSD1(i,1); 
      elseif isequal(LNC1(i,13),5) % Mid-Web
         Lrd1(i,1)=-(hst1(i,1)-tft1(i,1)/2-Dt1(i,1));          
      end
   end
end
Lrd2=zeros(xn,1);
for i=1:xn
   if isequal(LNC2(i,5),0)
      Lrd2(i,1)=0;
   else    
      if isequal(LNC2(i,13),1) || isequal(LNC2(i,13),0)% None
         Lrd2(i,1)=0;
      elseif isequal(LNC2(i,13),2) % Top
         Lrd2(i,1)=-(hst2(i,1)+tft2(i,1)/2);      
      elseif isequal(LNC2(i,13),3) % Bottom
         Lrd2(i,1)=(hsb2(i,1)+tfb2(i,1)/2);
      elseif isequal(LNC2(i,13),4) % Centroid
         Lrd2(i,1)=CSD2(i,1); 
      elseif isequal(LNC2(i,13),5) % Mid-Web
         Lrd2(i,1)=-(hst2(i,1)-tft2(i,1)/2-Dt2(i,1));         
      end
   end
end

% ------------------------------------------------------------------------
% ----------------      Rigid offset for Uniform Loads     ---------------
% ------------------------------------------------------------------------
Lud1=zeros(xn,1); Lud2=zeros(xn,1);
if ~isempty(LUEC)
   for i=1:xn
      if isequal(LUEC(i,5),0)
         Lud1(i,1)=0;
      else       
         if isequal(LUEC(i,17),1) || isequal(LUEC(i,17),0)% None
            Lud1(i,1)=0;
         elseif isequal(LUEC(i,17),2) % Top
            Lud1(i,1)=-(hst1(i,1)+tft1(i,1)/2);      
         elseif isequal(LUEC(i,17),3) % Bottom
            Lud1(i,1)=(hsb1(i,1)+tfb1(i,1)/2);
         elseif isequal(LUEC(i,17),4) % Centroid
            Lud1(i,1)=CSD1(i,1); 
         elseif isequal(LUEC(i,17),5) % Mid-Web
            Lud1(i,1)=-(hst1(i,1)-tft1(i,1)/2-Dt1(i,1));             
         end
      end
   end

   for i=1:xn
      if isequal(LUEC(i,5),0)
         Lud2(i,1)=0;
      else       
         if isequal(LUEC(i,17),1) || isequal(LUEC(i,17),0)% None
            Lud2(i,1)=0;
         elseif isequal(LUEC(i,17),2) % Top
            Lud2(i,1)=-(hst2(i,1)+tft2(i,1)/2);      
         elseif isequal(LUEC(i,17),3) % Bottom
            Lud2(i,1)=(hsb2(i,1)+tfb2(i,1)/2);
         elseif isequal(LUEC(i,17),4) % Centroid
            Lud2(i,1)=CSD2(i,1);  
         elseif isequal(LUEC(i,17),5) % Mid-Web 
            Lud2(i,1)=-(hst2(i,1)-tft2(i,1)/2-Dt2(i,1));             
         end
      end
   end
end

% ------------------------------------------------------------------------
% ------       Boundary Conditions & External Force matrix        --------
% ------------------------------------------------------------------------
% Preallocationg
BC = zeros(N,1); Qe = zeros(N,1); 
for i = 1:N
   for j = 1:nodedof    
      BC((i-1)*nodedof+j,1) =  PNC(i,j+4);    % Boundary Conditions
      
      if isempty(LNC)
         Qe =[];
      else
         Qe((i-1)*nodedof+j,1) =  LNC(i,j+4); % Point Loads
      end

   end
end

% Incremental Loading
dF = lambda*Qe(:,1);
% ------------------------------------------------------ Load Transform S
% Check duplicated nodal points
numb = unique([MI(:,2);MI(:,3)]);
cot = hist([MI(:,2);MI(:,3)],numb);
Ldupcount=zeros(N,2);
for i=1:N
   Ldupcount(i,1)=numb(i,1);
   Ldupcount(i,2)=cot(1,i);
end
Ldp1 = zeros(xn,2); Ldp2 = zeros(xn,2);
for i=1:xn
   for j=1:2
      Ldp1(i,1)=Ldupcount(MI(i,2),1);
      Ldp1(i,2)=Ldupcount(MI(i,2),2);
      Ldp2(i,1)=Ldupcount(MI(i,3),1);     
      Ldp2(i,2)=Ldupcount(MI(i,3),2);          
   end
end  

[dFn]=CurrentDisplacement(dF,N,nodedof); % including supports nodes;

dFn1 = zeros(xn,7); dFn2 = zeros(xn,7);
for i=1:xn
   for j=1:7
      dFn1(i,j)=dFn(MI(i,2),j); 
      dFn2(i,j)=dFn(MI(i,3),j);
   end
end  

% Load transform
dF=zeros(nDOF,1);
for n=1:xn
   % Rigid offset for Supports in Element Frame
   Rsd = eye(14);
%    Rsd(3,4)=rd1(n);  Rsd(10,11)=rd2(n); 
   Rsd(1,6)=-rxd1(n); Rsd(8,13)=-rxd2(n);
   
   % Rigid offset for Loads in Element Frame
   LHd = eye(14);
   LHd(1,6)=Lrd1(n); LHd(8,13)=Lrd2(n);  
  
   % Inverse Rotation from Global Frame to Element Frame
   RLz=[cos(-alpharef(n,2)) -sin(-alpharef(n,2)) 0; ...
      sin(-alpharef(n,2)) cos(-alpharef(n,2)) 0; ...
      0 0 1];
   eL1 = [1; 0; 0];eL1 = RLz*eL1;
   eL2 = [0; 1; 0];eL2 = RLz*eL2;
   eL3 = [0; 0; 1];eL3 = RLz*eL3;
   
   [GLe]=CoordTransform(eL1,eL2,eL3);
   
   % Load Transform using Rigid Offset within Element Frame
   Ft = LHd'*Rsd'*GLe*[dFn1(n,:)'/Ldp1(n,2);dFn2(n,:)'/Ldp2(n,2)];
   
   % Rotation from Element Frame to Global Frame
   RRz=[cos(alpharef(n,2)) -sin(alpharef(n,2)) 0; ...
      sin(alpharef(n,2)) cos(alpharef(n,2)) 0; ...
      0 0 1];
   eR1 = [1; 0; 0];eR1 = RRz*eR1;
   eR2 = [0; 1; 0];eR2 = RRz*eR2;
   eR3 = [0; 0; 1];eR3 = RRz*eR3;

   [GRe]=CoordTransform(eR1,eR2,eR3);
   
   Ft=GRe*Ft;
   % Assemble
   [dF] = assemble2(dF,Ft,MI,n);
end
% ------------------------------------------------------ Load Transform E

% apply Supports and Incremental Loading
ind=(1:nDOF)';              % Define ind
ind=ind(logical(BC(:,1)));  % Supports
dF(ind,:)=[];               % Update Incremental Loading

% ------------------------------------------------------------------------
% --------------------           Load Height.         --------------------
% ------------------------------------------------------------------------
hd1=zeros(xn,1); hd2=zeros(xn,1);
d1=zeros(xn,1);  d2=zeros(xn,1);

if ~isempty(LNC)
   LNCe1=zeros(xn,3);
   LNCe2=zeros(xn,3);

   for i=1:xn
      Rz=[cos(-alpharef(i,2)) -sin(-alpharef(i,2)) 0; ...
      sin(-alpharef(i,2)) cos(-alpharef(i,2)) 0; ...
      0 0 1];

      LNCe1(i,:)=Rz*[LNC1(i,5);LNC1(i,6);LNC1(i,7)];
      LNCe2(i,:)=Rz*[LNC2(i,5);LNC2(i,6);LNC2(i,7)];

      if isequal(LNC1(i,13),1) || isequal(LNC1(i,13),0)% None
         hd1(i,1)=0;
      elseif isequal(LNC1(i,13),2) % Top
         hd1(i,1)=hst1(i,1)+tft1(i,1)/2 +LNC1(i,12);
      elseif isequal(LNC1(i,13),3) % Bottom
         hd1(i,1)=-(hsb1(i,1)+tfb1(i,1)/2 +LNC1(i,12) );
      elseif isequal(LNC1(i,13),4) % Centroid
         hd1(i,1)=-( CSD1(i,1) +LNC1(i,12) );      
      elseif isequal(LNC1(i,13),5) % Mid-Web
         hd1(i,1)=hst1(i,1)-tft1(i,1)/2-Dt1(i,1) +LNC1(i,12);          
      end

      if isequal(LNC2(i,13),1) || isequal(LNC2(i,13),0)% None
         hd2(i,1)=0;
      elseif isequal(LNC2(i,13),2) % Top
         hd2(i,1)=hst2(i,1)+tft2(i,1)/2 +LNC2(i,12);
      elseif isequal(LNC2(i,13),3) % Bottom
         hd2(i,1)=-(hsb2(i,1)+tfb2(i,1)/2 +LNC2(i,12) );
      elseif isequal(LNC2(i,13),4) % Centroid
         hd2(i,1)=-( CSD2(i,1)+LNC2(i,12) ); 
      elseif isequal(LNC2(i,13),5) % Mid-Web
         hd2(i,1)=hst2(i,1)-tft2(i,1)/2-Dt2(i,1) +LNC2(i,12);         
      end

      d1(i,1)=LNCe1(i,2)*hd1(i,1)/Ldp1(i,2);
      d2(i,1)=LNCe2(i,2)*hd2(i,1)/Ldp2(i,2);
   end
end

% ------------------------------------------------------------------------
% ----------------             Self weight           ---------------------
% ------------------------------------------------------------------------
SUEC1(xn,20)=0; SUEC2(xn,20)=0;
SUNCe1=zeros(xn,3); SUNCe2=zeros(xn,3);
switch get(get(ap_sw_buttongroup,'SelectedObject'),'Tag')
   case 'sw_on' 
      for i=1:xn
          if isequal(PNC1(i,6),1) && ~isequal(PNC2(i,6),1)
              SUEC2(i,6)=-Ag1(i,1)*stRho(i,1)-Ag2(i,1)*stRho(i,1);
          elseif ~isequal(PNC1(i,6),1) && isequal(PNC2(i,6),1)
              SUEC1(i,6)=-Ag1(i,1)*stRho(i,1)-Ag2(i,1)*stRho(i,1);
          else
              SUEC1(i,6)=-Ag1(i,1)*stRho(i,1);
              SUEC2(i,6)=-Ag2(i,1)*stRho(i,1);
          end
      end
      
   case 'sw_off'
end
   
for i=1:xn
   Rz=[cos(-alpharef(i,2)) -sin(-alpharef(i,2)) 0; ...
   sin(-alpharef(i,2)) cos(-alpharef(i,2)) 0; ...
   0 0 1];

   SUNCe1(i,:)=Rz*[SUEC1(i,5);SUEC1(i,6);SUEC1(i,7)];
   SUNCe2(i,:)=Rz*[SUEC2(i,5);SUEC2(i,6);SUEC2(i,7)];   
end

% ------------------------------------------------------------------------
% ----------------     Distributed Load Height       ---------------------
% ------------------------------------------------------------------------
if ~isempty(LUEC) 
   LUNCe=zeros(xn,3);      
   for i=1:xn
      Rz=[cos(-alpharef(i,2)) -sin(-alpharef(i,2)) 0; ...
      sin(-alpharef(i,2)) cos(-alpharef(i,2)) 0; ...
      0 0 1];

      LUNCe(i,:)=Rz*[LUEC(i,5);LUEC(i,6);LUEC(i,7)];
   end
end

% ------------------------------------------------------------------------
% ----------------             Shear Spring          ---------------------
% ------------------------------------------------------------------------
KSg=zeros(nodedof*N,nodedof*N);
if ~isempty(BNC1) 
   alphashear = zeros(length(BNC1(:,1)),2);   
   BNC1e=zeros(length(BNC1(:,1)),3); 
   BNC2e=zeros(length(BNC1(:,1)),3);
   srd1=zeros(length(BNC1(:,1)),1);
   srd2=zeros(length(BNC1(:,1)),1);
   
   
   for i=1:length(BNC1(:,1))  
      SRd = eye(nodedof*N);
      
      opp = BNC2(i,4)-BNC1(i,4);  % element depth in y-dir
      adj = BNC2(i,3)-BNC1(i,3);  % element length in x-dir         
      alphashear(i,1)=BNC1(i,1);
      alphashear(i,2)=atan2(opp,adj); % Only global frame angle
       
      Rz=[cos(-alphashear(i,2)) -sin(-alphashear(i,2)) 0; ...
      sin(-alphashear(i,2)) cos(-alphashear(i,2)) 0; ...
      0 0 1];
   
      BNC1e(i,:)=Rz*[BNC1(i,6);BNC1(i,7);BNC1(i,8)];
      BNC2e(i,:)=Rz*[BNC2(i,6);BNC2(i,7);BNC2(i,8)];
      
      KS=zeros(nodedof*N,nodedof*N);
      KS((BNC1(i,2)-1)*7+1,(BNC1(i,2)-1)*7+1)= BNC1e(i,1)+KS((BNC1(i,2)-1)*7+1,(BNC1(i,2)-1)*7+1);
      KS((BNC2(i,2)-1)*7+1,(BNC2(i,2)-1)*7+1)= BNC2e(i,1)+KS((BNC2(i,2)-1)*7+1,(BNC2(i,2)-1)*7+1);
      KS((BNC2(i,2)-1)*7+1,(BNC1(i,2)-1)*7+1)= -BNC2e(i,1);
      KS((BNC1(i,2)-1)*7+1,(BNC2(i,2)-1)*7+1)= -BNC2e(i,1);
      
      KS((BNC1(i,2)-1)*7+2,(BNC1(i,2)-1)*7+2)= BNC1e(i,2)+KS((BNC1(i,2)-1)*7+2,(BNC1(i,2)-1)*7+2);
      KS((BNC2(i,2)-1)*7+2,(BNC2(i,2)-1)*7+2)= BNC2e(i,2)+KS((BNC2(i,2)-1)*7+2,(BNC2(i,2)-1)*7+2);
      KS((BNC2(i,2)-1)*7+2,(BNC1(i,2)-1)*7+2)= -BNC2e(i,2);
      KS((BNC1(i,2)-1)*7+2,(BNC2(i,2)-1)*7+2)= -BNC2e(i,2);
      
      KS((BNC1(i,2)-1)*7+3,(BNC1(i,2)-1)*7+3)= BNC1e(i,3)+KS((BNC1(i,2)-1)*7+3,(BNC1(i,2)-1)*7+3);
      KS((BNC2(i,2)-1)*7+3,(BNC2(i,2)-1)*7+3)= BNC2e(i,3)+KS((BNC2(i,2)-1)*7+3,(BNC2(i,2)-1)*7+3);
      KS((BNC2(i,2)-1)*7+3,(BNC1(i,2)-1)*7+3)= -BNC2e(i,3);
      KS((BNC1(i,2)-1)*7+3,(BNC2(i,2)-1)*7+3)= -BNC2e(i,3);   
      
      if isequal(BNC1(i,9),1) || isequal(BNC1(i,9),0)% Top
         srd1(i,1)=-(hst1(i,1)+tft1(i,1)/2);         
      elseif isequal(BNC1(i,9),2) % None
         srd1(i,1)=0;     
      elseif isequal(BNC1(i,9),3) % Bottom
         srd1(i,1)=(hsb1(i,1)+tfb1(i,1)/2);
      end      
 
      if isequal(BNC2(i,9),1) || isequal(BNC2(i,9),0)% Top
         srd2(i,1)=-(hst2(i,1)+tft2(i,1)/2);
      elseif isequal(BNC2(i,9),2) % None
         srd2(i,1)=0;      
      elseif isequal(BNC2(i,9),3) % Bottom
         srd2(i,1)=(hsb2(i,1)+tfb2(i,1)/2);
      end
            
      SRd((BNC1(i,2)-1)*7+3,(BNC1(i,2)-1)*7+4) = -srd1(i,1);   
      SRd((BNC2(i,2)-1)*7+3,(BNC2(i,2)-1)*7+4) = -srd2(i,1); 

      KSg=SRd'*KS*SRd +KSg;

   end 
end

KS=KSg;

% ------------------------------------------------------------------------
% ----------------            Ground Spring          ---------------------
% ------------------------------------------------------------------------
% Section properties at each element under natural frame
bfb=RNCc(:,5);  % Bottom flange width
tfb=RNCc(:,6);  % Bottom flange thickness
bft=RNCc(:,7);  % Top flange width
tft=RNCc(:,8);  % Top flange thickness
hg=RNCc(:,12);  % h : Distance between flange centroids
% Shear center
% bottom flange centroid to shear center
hsb = (tft.*bft.^3.*hg)./(tfb.*bfb.^3+tft.*bft.^3); 
hst = hg - hsb;    % top flange centroid to shear center

grd=zeros(N,1);
if ~isempty(BNC)    
   for i=1:N
      if isequal(BNC(i,13),1) || isequal(BNC(i,13),0)% None
         grd(i,1)=0;         
      elseif isequal(BNC(i,13),2) % Top              
         grd(i,1)=-(hst(i,1)+tft(i,1)/2);
      elseif isequal(BNC(i,13),3) % Bottom
         grd(i,1)=(hsb(i,1)+tfb(i,1)/2);
      end 
   end
end

KBe=zeros(nodedof*N,nodedof*N);
GRd = eye(nodedof*N);
if ~isempty(BNC)
   for i = 1:N
       for j = 1:nodedof
       KBe((i-1)*nodedof+j,(i-1)*nodedof+j) = BNC(i,j+4);  
       end
       GRd((i-1)*nodedof+3,(i-1)*nodedof+4) = -grd(i,1);
   end
end

KB=GRd'*KBe*GRd;

% ------------------------------------------------------------------------
% --------      Nonlinear Inelastic Bucklling Analysis       -------------
% ------------------------------------------------------------------------
Fn = zeros((nDOF-nFix),1);
increment = 1; gam = 1; crLTB=0; LGv=0; 
Bflag = 0;
EGunew=[]; Funew=[];
tolerance = 0.0001; niter = 30;
tau=[];Rpg=[];Rpc=[];Rpt=[];Rh=[];Myc=[];My=[];Phi_Py=[];Myt=[];Phi_Mmax=[];PrPeL=zeros(5,xn);
flag= 0; FLflag=0; % Plastic criterion
pn=0; nn=0; Fflag=0; Sflag=0; gammap=[]; gamman=[];gamp=[]; gamn=[]; 
nic = 0; pic = 0; Pmax_UC=[];Nmax_UC=[]; PFn=[]; NFn=[]; 
while increment < 100      % Convergence increments
 
   %--------------------------------------------------------------------
   %------------------         Slenderness S      ----------------------
   %--------------------------------------------------------------------        
   % set up initial values for global solution; Zero nodal displacements
   % Initial imperfection
   u = zeros(N,1); v = zeros(N,1); w = zeros(N,1);
   wx = zeros(N,1); wy = zeros(N,1); wz = zeros(N,1); wxp = zeros(N,1);

   [L,L0,ul,dX,dY,dZ]=InitialEleVal(xn,xg1,yg1,zg1,xg2,yg2,zg2,u,v,w,MI);

   beta1x=zeros(xn,1);beta1y=zeros(xn,1);beta1z=zeros(xn,1);beta1xp=zeros(xn,1);
   beta2x=zeros(xn,1);beta2y=zeros(xn,1);beta2z=zeros(xn,1);beta2xp=zeros(xn,1);
   for i=1:xn

       beta1x(i,1) = wx(DUP1(i,1),1); beta2x(i,1) = wx(DUP2(i,1),1);
       beta1y(i,1) = wy(DUP1(i,1),1); beta2y(i,1) = wy(DUP2(i,1),1);
       beta1z(i,1) = wz(DUP1(i,1),1); beta2z(i,1) = wz(DUP2(i,1),1);
       beta1xp(i,1) = wxp(DUP1(i,1),1); beta2xp(i,1) = wxp(DUP2(i,1),1);

   end

   % initialize variables
   K=zeros(nDOF);          % global stiffness matrix
   KtBB=zeros(nDOF);       % global tangent stiffness matrix
   KggBB=zeros(nDOF);      % global geometry stiffness matrix
   Fint=zeros(nDOF,1);     % global internal force vector
   DFG=zeros(nDOF,1);     % global internal force vector

   for n = 1:xn

      % Rigid offset
      Rd = eye(14);
      Rd(3,4)=rd1(n,1);Rd(10,11)=rd2(n,1); 
      Rd(1,6)=-rxd1(n,1)*cos(-angletap(n,2));Rd(8,13)=-rxd2(n,1)*cos(-angletap(n,2));
      Rd(2,6)=-rxd1(n,1)*sin(-angletap(n,2));Rd(9,13)=-rxd2(n,1)*sin(-angletap(n,2));

      % Rigid offset for Uniform Loads in Element Frame
      Ld = eye(14);
      Ld(1,6)=Lud1(n,1); Ld(8,13)=Lud2(n,1);  
      % Rigid offset for Self-weight in Element Frame
      Lsd = eye(14);
      Lsd(1,6)=CSD1(n,1); Lsd(8,13)=CSD2(n,1);         

      % Update Nodal Triads using global solution : Angle between Element frame and CR frame 
      [t1,t2,t3,u1,u2,u3] = UpdatedElementNodalTriadsTU(beta1x(n,1),beta2x(n,1),beta1y(n,1),beta2y(n,1),beta1z(n,1),beta2z(n,1),alphatap(n,2));
      [e1,e2,e3,Zetaavg,Zeta1,Zeta2,Eta1,Eta2] = ElementBaseVector(dX(n,1),dY(n,1),dZ(n,1),t2,u2,L(n,1),alphatap(n,2));

      % Deformation in CR frame
      [theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn] = NaturalFrame(t1,t2,t3,u1,u2,u3,e1,e2,e3,beta1xp(n,1),beta2xp(n,1));
      [qno] = ElDisplacement(theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn,ul(n,1));
      [Pbar]=Projection(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1));

      [e1,e2,e3] = GlobalTransform(e1,e2,e3,alphatap(n,2));
      [Ge]=CoordTransform(e1,e2,e3); 

      DE=zeros(14,1); SE=zeros(14,1);
      if ~isempty(LUEC)
         [Kt,Kgg,Qino,Kh2,Gn]=StiffnessELEMENT3D([bfb1(n);bfb2(n)],...
            [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
            [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
            [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
            [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
            hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
            theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
            theta1xpn,theta2xpn,qno,LUNCe(n,2),LUEC(n,17),FEL(n,:));

         % Distributed Loads
         DE(2,1)=LUNCe(n,2)*L0(n,1)/2;
         DE(6,1)=LUNCe(n,2)*L0(n,1)^2/12;
         DE(9,1)=LUNCe(n,2)*L0(n,1)/2;
         DE(13,1)=-LUNCe(n,2)*L0(n,1)^2/12;
         DE(1,1)=LUNCe(n,1)*L0(n,1)/2;
         DE(8,1)=LUNCe(n,1)*L0(n,1)/2;
         DE(3,1)=LUNCe(n,3)*L0(n,1)/2;
         DE(10,1)=LUNCe(n,3)*L0(n,1)/2;

      else
         [Kt,Kgg,Qino,Kh2,Gn]=StiffnessELEMENT3DN([bfb1(n);bfb2(n)],...
            [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
            [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
            [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
            [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
            hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
            theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
            theta1xpn,theta2xpn,qno,FEL(n,:));   
      end

      if ~isempty(SUEC1)
         % Self Weight
         SE(2,1)=SUNCe1(n,2)*L0(n,1)/2;
         SE(6,1)=SUNCe1(n,2)*L0(n,1)^2/12;
         SE(9,1)=SUNCe2(n,2)*L0(n,1)/2;
         SE(13,1)=-SUNCe2(n,2)*L0(n,1)^2/12;

         SE(1,1)=SUNCe1(n,1)*L0(n,1)/2;
         SE(8,1)=SUNCe2(n,1)*L0(n,1)/2;

         SE(3,1)=SUNCe1(n,3)*L0(n,1)/2;
         SE(10,1)=SUNCe2(n,3)*L0(n,1)/2; 
      end

      % ------------- Distributed Load & Self weight S
      % Rigid offset for Supports in Element Frame
      Rsd = eye(14);
%       Rsd(3,4)=rd1(n);  Rsd(10,11)=rd2(n); 
      Rsd(1,6)=-rxd1(n); Rsd(8,13)=-rxd2(n);  

      [de1,de2,de3] = GlobalDisTransform(alpharef(n,2));      
      [GDe]=CoordTransform(de1,de2,de3);   
      DG = GDe*Ld'*Rsd'*DE + GDe*Lsd'*Rsd'*SE;     
      % ------------- Distributed Load & Self weight E 

      % Interforce resultants w.r.t Element frame
      Qei = Pbar'*Qino;

      % Geometrix Stiffness
      [Kext1,Kext2]=ExternalGStiffness(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1),Qino);

      % Load Height.
      [Fe1,Fe2,M] = LoadHeight(d1(n),d2(n));

      % Interforce resultants w.r.t Global frame
      Qg =Ge*Qei;

      % Elastic Tangent Stiffness Matrix
      Kts = Ge*Rd'*(Pbar'*Kt*Pbar)*Rd*Ge';

      % Geometric Stiffness Matrix
      Kggs = Ge*Rd'*(Pbar'*Kgg*Pbar +((Kext1+Kext2)+ (Kext1+Kext2)')/2)*Rd*Ge'+GDe*M*(Fe1+Fe2+Kh2)*M'*GDe';

      % Total Stiffness
      Kg = Kts + Kggs;

      % Assemble
      % Total Stiffness
      [K,Fint,DFG] = assemble(K,Fint,DFG,Kg,Qg,DG,MI,n);
      % Elastic stiffness & Geometric stiffness
      [KtBB,KggBB] = assemble1(KtBB,KggBB,Kts,Kggs,MI,n);

   end

   KtBB=KtBB+KS+KB;
   % Distributed Load
   ind=(1:nDOF)';
   ind=ind(logical(BC(:,1)));
   DFG(ind,:)=[];  

   if isequal(increment,1)
      Fn = dF + lambda*DFG;
   end 

   % Elastic Tangent Stiffness
   ind=(1:nDOF)';
   ind=ind(logical(BC(:,1)));
   KtBB(ind,:)=[];
   KtBB(:,ind)=[];

   if rcond(KtBB) < (10^(-15))
      if isequal(increment,1)
         Bflag = 1;
      else
         Bflag = 2;
      end
      break;
   end

   % Calculate the first nodal displacements
   dus = KtBB\(Fn);     % 1st Elastic displacement

   % Restoration DOF of the nodal displacements considering BC
   [du,RTsuppt]=RTDisplacement(dus,nDOF,BC);

   [unew]=CurrentDisplacement(du,N,nodedof); % including supports nodes;

   unew1 = zeros(xn,7); unew2 = zeros(xn,7);
   for i=1:xn
      for j=1:7
         unew1(i,j)=unew(MI(i,2),j); 
         unew2(i,j)=unew(MI(i,3),j);
      end
   end    

   if isequal(increment,1)
   % -------------------------------------------------------- Slender S     
      slender=zeros(5,xn);
      for n = 1:xn

         % Rigid offset
         Rd = eye(14);
         Rd(3,4)=rd1(n,1);Rd(10,11)=rd2(n,1); 
         Rd(1,6)=-rxd1(n,1)*cos(-angletap(n,2));Rd(8,13)=-rxd2(n,1)*cos(-angletap(n,2));
         Rd(2,6)=-rxd1(n,1)*sin(-angletap(n,2));Rd(9,13)=-rxd2(n,1)*sin(-angletap(n,2)); 

         % Update Nodal Triads using global solution : Angle between Element frame and CR frame 
         [t1,t2,t3,u1,u2,u3] = UpdatedElementNodalTriadsTU(beta1x(n,1),beta2x(n,1),beta1y(n,1),beta2y(n,1),beta1z(n,1),beta2z(n,1),alphatap(n,2));
         [e1,e2,e3,Zetaavg,Zeta1,Zeta2,Eta1,Eta2] = ElementBaseVector(dX(n,1),dY(n,1),dZ(n,1),t2,u2,L(n,1),alphatap(n,2));

         % Deformation in CR frame
         [theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn] = NaturalFrame(t1,t2,t3,u1,u2,u3,e1,e2,e3,beta1xp(n,1),beta2xp(n,1));
         [Pbar]=Projection(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1));

         [e1,e2,e3] = GlobalTransform(e1,e2,e3,alphatap(n,2));
         [Ge]=CoordTransform(e1,e2,e3); 
         qno=Pbar*Rd*Ge'*[unew1(n,:)';unew2(n,:)'];

         slender(:,n)=StiffnessELEMENT3DESL([bfb1(n);bfb2(n)],...
            [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
            [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
            [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
            [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
            hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
            theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
            theta1xpn,theta2xpn,qno,Fy(n,1),Fyfi(n,1),Fyw(n,1),Fyfo(n,1),[ytbar1(n);ytbar2(n)],Pbar,FEL(n,:),NLIAType,HomoType(n,1),angletap(n,2));

      end   
      % -------------------------------------------------------- Slender E         
      Fn = zeros((nDOF-nFix),1);
   end % end increment=1
   
   % ------------------------------------------------------ tau_b S
   % Initial tau_b
   taub=ones(5,xn); 
   % ------------------------------------------------------- tau_b E      
   %--------------------------------------------------------------------
   %------------------         Slenderness E      ----------------------
   %-------------------------------------------------------------------- 

   % set up initial values for global solution; Zero nodal displacements
   % Initial imperfection
   u = zeros(N,1); v = zeros(N,1); w = zeros(N,1);
   wx = zeros(N,1); wy = zeros(N,1); wz = zeros(N,1); wxp = zeros(N,1);

   [L,L0,ul,dX,dY,dZ]=InitialEleVal(xn,xg1,yg1,zg1,xg2,yg2,zg2,u,v,w,MI);

   beta1x=zeros(xn,1);beta1y=zeros(xn,1);beta1z=zeros(xn,1);beta1xp=zeros(xn,1);
   beta2x=zeros(xn,1);beta2y=zeros(xn,1);beta2z=zeros(xn,1);beta2xp=zeros(xn,1);

   for i=1:xn

       beta1x(i,1) = wx(DUP1(i,1),1); beta2x(i,1) = wx(DUP2(i,1),1);
       beta1y(i,1) = wy(DUP1(i,1),1); beta2y(i,1) = wy(DUP2(i,1),1);
       beta1z(i,1) = wz(DUP1(i,1),1); beta2z(i,1) = wz(DUP2(i,1),1);
       beta1xp(i,1) = wxp(DUP1(i,1),1); beta2xp(i,1) = wxp(DUP2(i,1),1);

   end

   %--------------------------------------------------------------------
   %------------------   Calculate Displacement  -----------------------
   %--------------------------------------------------------------------
   % initialize variables
   K=zeros(nDOF);          % global stiffness matrix
   KtBB=zeros(nDOF);       % global tangent stiffness matrix
   KggBB=zeros(nDOF);      % global geometry stiffness matrix
   Fint=zeros(nDOF,1);     % global internal force vector
   DFG=zeros(nDOF,1);     % global internal force vector
   
   Pt=zeros(5,xn);Mzt=zeros(5,xn);
   
   for n = 1:xn
      
      % Rigid offset
      Rd = eye(14);
      Rd(3,4)=rd1(n,1);Rd(10,11)=rd2(n,1); 
      Rd(1,6)=-rxd1(n,1)*cos(-angletap(n,2));Rd(8,13)=-rxd2(n,1)*cos(-angletap(n,2));
      Rd(2,6)=-rxd1(n,1)*sin(-angletap(n,2));Rd(9,13)=-rxd2(n,1)*sin(-angletap(n,2));

      % Rigid offset for Uniform Loads in Element Frame
      Ld = eye(14);
      Ld(1,6)=Lud1(n,1); Ld(8,13)=Lud2(n,1);  
      % Rigid offset for Self-weight in Element Frame
      Lsd = eye(14);
      Lsd(1,6)=CSD1(n,1); Lsd(8,13)=CSD2(n,1);    

      % Update Nodal Triads using global solution : Angle between Element frame and CR frame 
      [t1,t2,t3,u1,u2,u3] = UpdatedElementNodalTriadsTU(beta1x(n,1),beta2x(n,1),beta1y(n,1),beta2y(n,1),beta1z(n,1),beta2z(n,1),alphatap(n,2));
      [e1,e2,e3,Zetaavg,Zeta1,Zeta2,Eta1,Eta2] = ElementBaseVector(dX(n,1),dY(n,1),dZ(n,1),t2,u2,L(n,1),alphatap(n,2));
      et1=e1;et2=e2;et3=e3; % direction of co-rotational frame
      % Deformation in CR frame
      [theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn] = NaturalFrame(t1,t2,t3,u1,u2,u3,e1,e2,e3,beta1xp(n,1),beta2xp(n,1));
      [qno] = ElDisplacement(theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn,ul(n,1));
      [Pbar]=Projection(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1));

      [e1,e2,e3] = GlobalTransform(e1,e2,e3,alphatap(n,2));
      [Ge]=CoordTransform(e1,e2,e3); 
      
      DE=zeros(14,1); SE=zeros(14,1);
      if ~isempty(LUEC)
         [Kt,Kgg,Qino,Kh2,Gn,Pt(:,n),Mzt(:,n)]=StiffnessELEMENT3DKGDM([bfb1(n);bfb2(n)],...
            [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
            [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
            [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
            [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
            hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
            theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
            theta1xpn,theta2xpn,qno,LUNCe(n,2),LUEC(n,17),Pbar,FEL(n,:),slender(:,n),ap_da_buttongroup,angletap(n,2),CSangel(n,2),et1,et2,et3,taub(:,n));
         
         % Distributed Loads
         DE(2,1)=LUNCe(n,2)*L0(n,1)/2;
         DE(6,1)=LUNCe(n,2)*L0(n,1)^2/12;
         DE(9,1)=LUNCe(n,2)*L0(n,1)/2;
         DE(13,1)=-LUNCe(n,2)*L0(n,1)^2/12;
         DE(1,1)=LUNCe(n,1)*L0(n,1)/2;
         DE(8,1)=LUNCe(n,1)*L0(n,1)/2;
         DE(3,1)=LUNCe(n,3)*L0(n,1)/2;
         DE(10,1)=LUNCe(n,3)*L0(n,1)/2;
                
      else
         [Kt,Kgg,Qino,Kh2,Gn,Pt(:,n),Mzt(:,n)]=StiffnessELEMENT3DNKGDM([bfb1(n);bfb2(n)],...
            [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
            [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
            [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
            [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
            hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
            theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
            theta1xpn,theta2xpn,qno,Pbar,FEL(n,:),slender(:,n),ap_da_buttongroup,angletap(n,2),CSangel(n,2),et1,et2,et3,taub(:,n));   
      end    

      if ~isempty(SUEC1)
         % Self Weight
         SE(2,1)=SUNCe1(n,2)*L0(n,1)/2;
         SE(6,1)=SUNCe1(n,2)*L0(n,1)^2/12;
         SE(9,1)=SUNCe2(n,2)*L0(n,1)/2;
         SE(13,1)=-SUNCe2(n,2)*L0(n,1)^2/12;

         SE(1,1)=SUNCe1(n,1)*L0(n,1)/2;
         SE(8,1)=SUNCe2(n,1)*L0(n,1)/2;

         SE(3,1)=SUNCe1(n,3)*L0(n,1)/2;
         SE(10,1)=SUNCe2(n,3)*L0(n,1)/2; 
      end

      % ------------- Distributed Load & Self weight S
      % Rigid offset for Supports in Element Frame
      Rsd = eye(14);
%       Rsd(3,4)=rd1(n);  Rsd(10,11)=rd2(n); 
      Rsd(1,6)=-rxd1(n); Rsd(8,13)=-rxd2(n);  

      [de1,de2,de3] = GlobalDisTransform(alpharef(n,2));      
      [GDe]=CoordTransform(de1,de2,de3);
      if isequal(increment,1)
         DG = GDe*Ld'*Rsd'*DE + GDe*Lsd'*Rsd'*SE;           
      else
         DG = GDe*Ld'*Rsd'*DE;           
      end 
      % ------------- Distributed Load & Self weight E 
      
      % Interforce resultants w.r.t Element frame
      Qei = Pbar'*Qino;

      % Geometrix Stiffness
      [Kext1,Kext2]=ExternalGStiffness(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1),Qino);

      % Load Height.
      [Fe1,Fe2,M] = LoadHeight(d1(n),d2(n));

      % Interforce resultants w.r.t Global frame
      Qg =Ge*Qei;

      % Elastic Tangent Stiffness Matrix
      Kts = Ge*Rd'*(Pbar'*Kt*Pbar)*Rd*Ge';

      % Geometric Stiffness Matrix
      Kggs = Ge*Rd'*(Pbar'*Kgg*Pbar +((Kext1+Kext2)+ (Kext1+Kext2)')/2)*Rd*Ge'+GDe*M*(Fe1+Fe2+Kh2)*M'*GDe';

      % Total Stiffness
      Kg = Kts + Kggs;
      
      % Assemble
      % Total Stiffness
      [K,Fint,DFG] = assemble(K,Fint,DFG,Kg,Qg,DG,MI,n);
      % Elastic stiffness & Geometric stiffness
      [KtBB,KggBB] = assemble1(KtBB,KggBB,Kts,Kggs,MI,n);

   end

   K=K+KS+KB;
   % Distributed Load
   ind=(1:nDOF)';
   ind=ind(logical(BC(:,1)));
   DFG(ind,:)=[];

   % Total Stiffness 
   ind=(1:nDOF)';
   ind=ind(logical(BC(:,1)));
   K(ind,:)=[];
   K(:,ind)=[];   
    
   if isequal(increment,1)
      Fn = dF + lambda*DFG;
      Fn0=Fn;
   end  

   if rcond(K) < (10^(-15))
      if isequal(increment,1)
         Bflag = 1;
      else
         Bflag = 2;
      end
      break;
   end    
   % Calculate the first nodal displacements
   dus = K\(Fn);     % 2nd Elastic displacement

   % Restoration DOF of the nodal displacements considering BC
   [du,RTsuppt]=RTDisplacement(dus,nDOF,BC);
    
   % Initialize
   ucur = zeros(nDOF,1);       % Initialize Current displacement for loading incremente
   ucur_iter = zeros(nDOF,1);  % Initialize Current displacement for iteration 
  
   ucur = ucur+du;

   [unew]=CurrentDisplacement(ucur,N,nodedof); % including supports nodes;

   [L,ul,dX,dY,dZ]=CurrentElelength(xg1,yg1,zg1,xg2,yg2,zg2,xn,unew,L0,MI);

   for i=1:xn

      beta1x(i,1) = unew(MI(i,2),4); beta2x(i,1) = unew(MI(i,3),4);
      beta1y(i,1) = unew(MI(i,2),5); beta2y(i,1) = unew(MI(i,3),5);
      beta1z(i,1) = unew(MI(i,2),6); beta2z(i,1) = unew(MI(i,3),6);
      beta1xp(i,1) = unew(MI(i,2),7); beta2xp(i,1) = unew(MI(i,3),7);

   end

   %--------------------------------------------------------------------
   %------- Calculate Internal Forces & Geometric Stiffness  -----------
   %--------------------------------------------------------------------    
   % initialize variables
   K=zeros(nDOF);          % global stiffness matrix
   KtBB=zeros(nDOF);       % global tangent stiffness matrix
   KggBB=zeros(nDOF);      % global geometry stiffness matrix
   Fint=zeros(nDOF,1);     % global internal force vector
   DFG=zeros(nDOF,1);      % global internal force vector
   
   Pt=zeros(5,xn);Mzt=zeros(5,xn);
   
   for n = 1:xn
      
      % Rigid offset
      Rd = eye(14);
      Rd(3,4)=rd1(n,1);Rd(10,11)=rd2(n,1); 
      Rd(1,6)=-rxd1(n,1)*cos(-angletap(n,2));Rd(8,13)=-rxd2(n,1)*cos(-angletap(n,2));
      Rd(2,6)=-rxd1(n,1)*sin(-angletap(n,2));Rd(9,13)=-rxd2(n,1)*sin(-angletap(n,2));

      % Rigid offset for Uniform Loads in Element Frame
      Ld = eye(14);
      Ld(1,6)=Lud1(n,1); Ld(8,13)=Lud2(n,1);  
      % Rigid offset for Self-weight in Element Frame
      Lsd = eye(14);
      Lsd(1,6)=CSD1(n,1); Lsd(8,13)=CSD2(n,1);         

      % Update Nodal Triads using global solution : Angle between Element frame and CR frame 
      [t1,t2,t3,u1,u2,u3] = UpdatedElementNodalTriadsTU(beta1x(n,1),beta2x(n,1),beta1y(n,1),beta2y(n,1),beta1z(n,1),beta2z(n,1),alphatap(n,2));
      [e1,e2,e3,Zetaavg,Zeta1,Zeta2,Eta1,Eta2] = ElementBaseVector(dX(n,1),dY(n,1),dZ(n,1),t2,u2,L(n,1),alphatap(n,2));
      et1=e1;et2=e2;et3=e3; % direction of co-rotational frame
      % Deformation in CR frame
      [theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn] = NaturalFrame(t1,t2,t3,u1,u2,u3,e1,e2,e3,beta1xp(n,1),beta2xp(n,1));
      [qno] = ElDisplacement(theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn,ul(n,1));
      [Pbar]=Projection(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1));

      [e1,e2,e3] = GlobalTransform(e1,e2,e3,alphatap(n,2));
      [Ge]=CoordTransform(e1,e2,e3); 

      DE=zeros(14,1); SE=zeros(14,1);
      if ~isempty(LUEC)
         [Kt,Kgg,Qino,Kh2,Gn,Pt(:,n),Mzt(:,n)]=StiffnessELEMENT3DKGDM([bfb1(n);bfb2(n)],...
            [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
            [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
            [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
            [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
            hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
            theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
            theta1xpn,theta2xpn,qno,LUNCe(n,2),LUEC(n,17),Pbar,FEL(n,:),slender(:,n),ap_da_buttongroup,angletap(n,2),CSangel(n,2),et1,et2,et3,taub(:,n));
         
         % Distributed Loads
         DE(2,1)=LUNCe(n,2)*L0(n,1)/2;
         DE(6,1)=LUNCe(n,2)*L0(n,1)^2/12;
         DE(9,1)=LUNCe(n,2)*L0(n,1)/2;
         DE(13,1)=-LUNCe(n,2)*L0(n,1)^2/12;
         DE(1,1)=LUNCe(n,1)*L0(n,1)/2;
         DE(8,1)=LUNCe(n,1)*L0(n,1)/2;
         DE(3,1)=LUNCe(n,3)*L0(n,1)/2;
         DE(10,1)=LUNCe(n,3)*L0(n,1)/2;
                
      else
         [Kt,Kgg,Qino,Kh2,Gn,Pt(:,n),Mzt(:,n)]=StiffnessELEMENT3DNKGDM([bfb1(n);bfb2(n)],...
            [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
            [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
            [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
            [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
            hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
            theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
            theta1xpn,theta2xpn,qno,Pbar,FEL(n,:),slender(:,n),ap_da_buttongroup,angletap(n,2),CSangel(n,2),et1,et2,et3,taub(:,n));   
      end      

      if ~isempty(SUEC1)
         % Self Weight
         SE(2,1)=SUNCe1(n,2)*L0(n,1)/2;
         SE(6,1)=SUNCe1(n,2)*L0(n,1)^2/12;
         SE(9,1)=SUNCe2(n,2)*L0(n,1)/2;
         SE(13,1)=-SUNCe2(n,2)*L0(n,1)^2/12;

         SE(1,1)=SUNCe1(n,1)*L0(n,1)/2;
         SE(8,1)=SUNCe2(n,1)*L0(n,1)/2;

         SE(3,1)=SUNCe1(n,3)*L0(n,1)/2;
         SE(10,1)=SUNCe2(n,3)*L0(n,1)/2; 
      end
      
      % ------------- Distributed Load & Self weight S
      % Rigid offset for Supports in Element Frame
      Rsd = eye(14);
%       Rsd(3,4)=rd1(n);  Rsd(10,11)=rd2(n); 
      Rsd(1,6)=-rxd1(n); Rsd(8,13)=-rxd2(n);  

      [de1,de2,de3] = GlobalDisTransform(alpharef(n,2));      
      [GDe]=CoordTransform(de1,de2,de3);
      if isequal(increment,1)
         DG = GDe*Ld'*Rsd'*DE + GDe*Lsd'*Rsd'*SE;           
      else
         DG = GDe*Ld'*Rsd'*DE;           
      end 
      % ------------- Distributed Load & Self weight E 
      
      % Interforce resultants w.r.t Element frame
      Qei = Pbar'*Qino;

      % Geometrix Stiffness
      [Kext1,Kext2]=ExternalGStiffness(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1),Qino);

      % Load Height.
      [Fe1,Fe2,M] = LoadHeight(d1(n),d2(n));

      % Interforce resultants w.r.t Global frame
      Qg =Ge*Qei;

      % Elastic Tangent Stiffness Matrix
      Kts = Ge*Rd'*(Pbar'*Kt*Pbar)*Rd*Ge';

      % Geometric Stiffness Matrix
      Kggs = Ge*Rd'*(Pbar'*Kgg*Pbar +((Kext1+Kext2)+ (Kext1+Kext2)')/2)*Rd*Ge'+GDe*M*(Fe1+Fe2+Kh2)*M'*GDe';

      % Total Stiffness
      Kg = Kts + Kggs;
      
      % Assemble
      % Total Stiffness
      [K,Fint,DFG] = assemble(K,Fint,DFG,Kg,Qg,DG,MI,n);
      % Elastic stiffness & Geometric stiffness
      [KtBB,KggBB] = assemble1(KtBB,KggBB,Kts,Kggs,MI,n);
      
   end
   
   K=K+KS+KB;    
   
   % Total Stiffness 
   ind=(1:nDOF)';
   ind=ind(logical(BC(:,1)));
   K(ind,:)=[];
   K(:,ind)=[];
  
   if rcond(K) < (10^(-15))
      Bflag = 2;
      break;
   end 
   % Calculate the nodal displacements
   du1s = K\(Fn);        % du1s = inv(K)*dF;

   % Restoration DOF of the nodal displacements considering BC
   [du_iter]=IterativeDisplacement(du1s,nDOF,BC,RTsuppt);
 
   
   if increment >1
      LH_gammma = max(Fn./Fn0);
      % -----------------------------------------------------------------
      % ------------            Update Load Height.         -------------
      % -----------------------------------------------------------------
      hd1=zeros(xn,1); hd2=zeros(xn,1);
      d1=zeros(xn,1);  d2=zeros(xn,1);

      if ~isempty(LNC)
         LNCe1=zeros(xn,3);
         LNCe2=zeros(xn,3);

         for i=1:xn
            Rz=[cos(-alpharef(i,2)) -sin(-alpharef(i,2)) 0; ...
            sin(-alpharef(i,2)) cos(-alpharef(i,2)) 0; ...
            0 0 1];

            LNCe1(i,:)=LH_gammma*Rz*[LNC1(i,5);LNC1(i,6);LNC1(i,7)];
            LNCe2(i,:)=LH_gammma*Rz*[LNC2(i,5);LNC2(i,6);LNC2(i,7)];

            if isequal(LNC1(i,13),1) || isequal(LNC1(i,13),0)% None
               hd1(i,1)=0;
            elseif isequal(LNC1(i,13),2) % Top
               hd1(i,1)=hst1(i,1)+tft1(i,1)/2 +LNC1(i,12);
            elseif isequal(LNC1(i,13),3) % Bottom
               hd1(i,1)=-(hsb1(i,1)+tfb1(i,1)/2 +LNC1(i,12) );
            elseif isequal(LNC1(i,13),4) % Centroid
               hd1(i,1)=-( CSD1(i,1) +LNC1(i,12) ); 
            elseif isequal(LNC1(i,13),5) % Mid-Web
               hd1(i,1)=hst1(i,1)-tft1(i,1)/2-Dt1(i,1) +LNC1(i,12);               
            end

            if isequal(LNC2(i,13),1) || isequal(LNC2(i,13),0)% None
               hd2(i,1)=0;
            elseif isequal(LNC2(i,13),2) % Top
               hd2(i,1)=hst2(i,1)+tft2(i,1)/2 +LNC2(i,12);
            elseif isequal(LNC2(i,13),3) % Bottom
               hd2(i,1)=-(hsb2(i,1)+tfb2(i,1)/2 +LNC2(i,12) );
            elseif isequal(LNC2(i,13),4) % Centroid
               hd2(i,1)=-( CSD2(i,1)+LNC2(i,12) );    
            elseif isequal(LNC2(i,13),5) % Mid-Web
               hd2(i,1)=hst2(i,1)-tft2(i,1)/2-Dt2(i,1) +LNC2(i,12);                 
            end

            d1(i,1)=LNCe1(i,2)*hd1(i,1)/2;
            d2(i,1)=LNCe2(i,2)*hd2(i,1)/2;
         end
      end      
   end   

   iter = 1;
   while iter < niter  

      ucur_iter = ucur_iter+du_iter;

      [unew]=CurrentDisplacement(ucur_iter,N,nodedof); % including supports nodes

      [L,ul,dX,dY,dZ]=CurrentElelength(xg1,yg1,zg1,xg2,yg2,zg2,xn,unew,L0,MI);

      for i=1:length(MI(:,1))

         beta1x(i,1) = unew(MI(i,2),4); beta2x(i,1) = unew(MI(i,3),4);
         beta1y(i,1) = unew(MI(i,2),5); beta2y(i,1) = unew(MI(i,3),5);
         beta1z(i,1) = unew(MI(i,2),6); beta2z(i,1) = unew(MI(i,3),6);
         beta1xp(i,1) = unew(MI(i,2),7); beta2xp(i,1) = unew(MI(i,3),7);

      end

      % initialize variables
      K=zeros(nDOF);          % global stiffness matrix
      KtBB=zeros(nDOF);       % global stiffness matrix
      KggBB=zeros(nDOF);      % global stiffness matrix
      Fint=zeros(nDOF,1);     % global internal force vector
      DFG=zeros(nDOF,1);      % global internal force vector
      
      Pt=zeros(5,xn);Mzt=zeros(5,xn);
      
      for n = 1:xn
         
         % Rigid offset
         Rd = eye(14);
         Rd(3,4)=rd1(n,1);Rd(10,11)=rd2(n,1); 
         Rd(1,6)=-rxd1(n,1)*cos(-angletap(n,2));Rd(8,13)=-rxd2(n,1)*cos(-angletap(n,2));
         Rd(2,6)=-rxd1(n,1)*sin(-angletap(n,2));Rd(9,13)=-rxd2(n,1)*sin(-angletap(n,2));

         % Rigid offset for Uniform Loads in Element Frame
         Ld = eye(14);
         Ld(1,6)=Lud1(n,1); Ld(8,13)=Lud2(n,1);  
         % Rigid offset for Self-weight in Element Frame
         Lsd = eye(14);
         Lsd(1,6)=CSD1(n,1); Lsd(8,13)=CSD2(n,1);         

         % Update Nodal Triads using global solution : Angle between Element frame and CR frame 
         [t1,t2,t3,u1,u2,u3] = UpdatedElementNodalTriadsTU(beta1x(n,1),beta2x(n,1),beta1y(n,1),beta2y(n,1),beta1z(n,1),beta2z(n,1),alphatap(n,2));
         [e1,e2,e3,Zetaavg,Zeta1,Zeta2,Eta1,Eta2] = ElementBaseVector(dX(n,1),dY(n,1),dZ(n,1),t2,u2,L(n,1),alphatap(n,2));
         et1=e1;et2=e2;et3=e3; % direction of co-rotational frame
         % Deformation in CR frame
         [theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn] = NaturalFrame(t1,t2,t3,u1,u2,u3,e1,e2,e3,beta1xp(n,1),beta2xp(n,1));
         [qno] = ElDisplacement(theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn,ul(n,1));
         [Pbar]=Projection(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1));

         [e1,e2,e3] = GlobalTransform(e1,e2,e3,alphatap(n,2));
         [Ge]=CoordTransform(e1,e2,e3); 

         DE=zeros(14,1); SE=zeros(14,1);
         if ~isempty(LUEC)
            [Kt,Kgg,Qino,Kh2,Gn,Pt(:,n),Mzt(:,n)]=StiffnessELEMENT3DKGDM([bfb1(n);bfb2(n)],...
               [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
               [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
               [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
               [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
               hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
               theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
               theta1xpn,theta2xpn,qno,LUNCe(n,2),LUEC(n,17),Pbar,FEL(n,:),slender(:,n),ap_da_buttongroup,angletap(n,2),CSangel(n,2),et1,et2,et3,taub(:,n));

            % Distributed Loads
            DE(2,1)=LUNCe(n,2)*L0(n,1)/2;
            DE(6,1)=LUNCe(n,2)*L0(n,1)^2/12;
            DE(9,1)=LUNCe(n,2)*L0(n,1)/2;
            DE(13,1)=-LUNCe(n,2)*L0(n,1)^2/12;
            DE(1,1)=LUNCe(n,1)*L0(n,1)/2;
            DE(8,1)=LUNCe(n,1)*L0(n,1)/2;
            DE(3,1)=LUNCe(n,3)*L0(n,1)/2;
            DE(10,1)=LUNCe(n,3)*L0(n,1)/2;

         else
            [Kt,Kgg,Qino,Kh2,Gn,Pt(:,n),Mzt(:,n)]=StiffnessELEMENT3DNKGDM([bfb1(n);bfb2(n)],...
               [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
               [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
               [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
               [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
               hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
               theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
               theta1xpn,theta2xpn,qno,Pbar,FEL(n,:),slender(:,n),ap_da_buttongroup,angletap(n,2),CSangel(n,2),et1,et2,et3,taub(:,n));   
         end         

         if ~isempty(SUEC1)
            % Self Weight
            SE(2,1)=SUNCe1(n,2)*L0(n,1)/2;
            SE(6,1)=SUNCe1(n,2)*L0(n,1)^2/12;
            SE(9,1)=SUNCe2(n,2)*L0(n,1)/2;
            SE(13,1)=-SUNCe2(n,2)*L0(n,1)^2/12;

            SE(1,1)=SUNCe1(n,1)*L0(n,1)/2;
            SE(8,1)=SUNCe2(n,1)*L0(n,1)/2;

            SE(3,1)=SUNCe1(n,3)*L0(n,1)/2;
            SE(10,1)=SUNCe2(n,3)*L0(n,1)/2; 
         end

         % ------------- Distributed Load & Self weight S
         % Rigid offset for Supports in Element Frame
         Rsd = eye(14);
%          Rsd(3,4)=rd1(n);  Rsd(10,11)=rd2(n); 
         Rsd(1,6)=-rxd1(n); Rsd(8,13)=-rxd2(n);  

         [de1,de2,de3] = GlobalDisTransform(alpharef(n,2));      
         [GDe]=CoordTransform(de1,de2,de3);
         if isequal(increment,1)
            DG = GDe*Ld'*Rsd'*DE + GDe*Lsd'*Rsd'*SE;           
         else
            DG = GDe*Ld'*Rsd'*DE;           
         end 
         % ------------- Distributed Load & Self weight E

         % Interforce resultants w.r.t Element frame
         Qei = Pbar'*Qino;

         % Geometrix Stiffness
         [Kext1,Kext2]=ExternalGStiffness(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1),Qino);

         % Load Height.
         [Fe1,Fe2,M] = LoadHeight(d1(n),d2(n));

         % Interforce resultants w.r.t Global frame
         Qg =Ge*Qei;

         % Elastic Tangent Stiffness Matrix
         Kts = Ge*Rd'*(Pbar'*Kt*Pbar)*Rd*Ge';

         % Geometric Stiffness Matrix
         Kggs = Ge*Rd'*(Pbar'*Kgg*Pbar +((Kext1+Kext2)+ (Kext1+Kext2)')/2)*Rd*Ge'+GDe*M*(Fe1+Fe2+Kh2)*M'*GDe';

         % Total Stiffness
         Kg = Kts + Kggs;

         % Assemble
         % Total Stiffness
         [K,Fint,DFG] = assemble(K,Fint,DFG,Kg,Qg,DG,MI,n);
         % Elastic stiffness & Geometric stiffness
         [KtBB,KggBB] = assemble1(KtBB,KggBB,Kts,Kggs,MI,n);

      end

      Fints = Fint+KS*ucur_iter+KB*ucur_iter;
      % ---------------------------------------------------- Load Transform S
      [dFn]=CurrentDisplacement(Fints,N,nodedof); % including supports nodes;

      dFn1 = zeros(xn,7); dFn2 = zeros(xn,7);
      for i=1:xn
         for j=1:7
            dFn1(i,j)=dFn(MI(i,2),j); 
            dFn2(i,j)=dFn(MI(i,3),j);
         end
      end  

      % Load transform
      Fints=zeros(nDOF,1);
      for n=1:xn
         % Rigid offset for Supports in Element Frame
         Rsd = eye(14);
%          Rsd(3,4)=rd1(n);  Rsd(10,11)=rd2(n); 
         Rsd(1,6)=-rxd1(n); Rsd(8,13)=-rxd2(n);

         % Inverse Rotation from Global Frame to Element Frame
         RLz=[cos(-alpharef(n,2)) -sin(-alpharef(n,2)) 0; ...
            sin(-alpharef(n,2)) cos(-alpharef(n,2)) 0; ...
            0 0 1];
         eL1 = [1; 0; 0];eL1 = RLz*eL1;
         eL2 = [0; 1; 0];eL2 = RLz*eL2;
         eL3 = [0; 0; 1];eL3 = RLz*eL3;

         [GLe]=CoordTransform(eL1,eL2,eL3);

         % Load Transform using Rigid Offset within Element Frame
         % already LHd is included.             
         Ft = Rsd'*GLe*[dFn1(n,:)'/Ldp1(n,2);dFn2(n,:)'/Ldp2(n,2)];

         % Rotation from Element Frame to Global Frame
         RRz=[cos(alpharef(n,2)) -sin(alpharef(n,2)) 0; ...
            sin(alpharef(n,2)) cos(alpharef(n,2)) 0; ...
            0 0 1];
         eR1 = [1; 0; 0];eR1 = RRz*eR1;
         eR2 = [0; 1; 0];eR2 = RRz*eR2;
         eR3 = [0; 0; 1];eR3 = RRz*eR3;

         [GRe]=CoordTransform(eR1,eR2,eR3);

         Ft=GRe*Ft;

         % Assemble
         [Fints] = assemble2(Fints,Ft,MI,n);
      end
      % ---------------------------------------------------- Load Transform E    
      % apply supports
      ind=(1:nDOF)';
      ind=ind(logical(BC(:,1)));
      Fints(ind,:)=[];

      R = Fints - Fn;  
%       norm = sqrt(R'*R);
      if isequal(iter,1)
         norm = sqrt(R'*R);
         normO=norm;
      else
         norm = sqrt(R'*R)/normO;
      end
   
      K=K+KS+KB;
      % Total Stiffness
      ind=(1:nDOF)';
      ind=ind(logical(BC(:,1)));
      K(ind,:)=[];
      K(:,ind)=[]; 

      % Geometric Stiffness
      ind=(1:nDOF)';
      ind=ind(logical(BC(:,1)));
      KggBB(ind,:)=[];
      KggBB(:,ind)=[]; 
      
      if rcond(K) < (10^(-15))
         Bflag = 2;
         break;
      end 
      % Calculate the nodal displacements
      du1s_iter = -inv(K)*R;

      % Restoration DOF of the nodal displacements considering BC   
      [du_iter]=IterativeDisplacement(du1s_iter,nDOF,BC,RTsuppt);

      % Repeat iterations
      iter = iter + 1;

      if norm < tolerance       
         break
      end
   
   end     % iteration end    
      
   % ---------------------------------------------------- Effective Area S  
   pinc=1; Aef=zeros(5,xn);Ae=zeros(5,xn);Phi_Py=zeros(5,xn);
   while pinc < 100                     
      if isequal(pinc,1) % Gross Area
         Aef1=Ae;
         for n = 1:xn              
            [Aef(:,n),Ae(:,n),Phi_Py(:,n)]=StiffnessINELEMENT3DAef([bfb1(n);bfb2(n)],...
               [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
               [Dg1(n);Dg2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)],[ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),fillet(n,:),...
               gam,Fy(n,1),Fyfi(n,1),Fyw(n,1),Fyfo(n,1),[ytbar1(n);ytbar2(n)],HomoType(n,1),Pt(:,n),Mzt(:,n));              
         end        
      else
         Aef1=Aef;
         for n = 1:xn              
            [Aef(:,n),Ae(:,n),Phi_Py(:,n)]=StiffnessINELEMENT3DAefi([bfb1(n);bfb2(n)],...
               [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
               [Dg1(n);Dg2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),fillet(n,:),...
               gam,Fy(n,1),Fyfi(n,1),Fyw(n,1),Fyfo(n,1),[ytbar1(n);ytbar2(n)],HomoType(n,1),Aef(:,n),Pt(:,n),Mzt(:,n));              
         end
         
      end  
      
      AreaE = abs(Aef1 - Aef);
      normAef = sqrt(sum(sum(AreaE'*AreaE)));
      if normAef < 0.001
         break;
      end 
      pinc=pinc+1;
   end %while      
   % ---------------------------------------------------- Effective Area E   

   % ------------------------------------------------------- Unity Check S 
   UC=zeros(5,xn);slender=zeros(5,xn);
   for n = 1:xn
      [UC(:,n),slender(:,n)]=StiffnessELEMENT3DUC([bfb1(n);bfb2(n)],...
         [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
         [Dg1(n);Dg2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
         [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),fillet(n,:),...
         gam,Fy(n,1),Fyfi(n,1),Fyw(n,1),Fyfo(n,1),[ytbar1(n);ytbar2(n)],NLIAType,HomoType(n,1),Phi_Py(:,n),Pt(:,n),Mzt(:,n));
   end
      
   UC = round(UC*10^6)/10^6;
   [max_UCrow, indexrow]=max(UC);
   [max_UC, UCcol]=max(max_UCrow);
   for i=1:xn
      if isequal(max_UCrow(1,i),max_UC)
         UCrow=indexrow(1,i);
         break;
      end
   end   
   % ------------------------------------------------------- Unity Check E
   
   % -------------------- Store maximum or minium UC S
   if max_UC <= 1
      if isequal(nic,0)
         nic=nic+1;
         Nmax_UC(nic,1) = max_UC; 
         NFn(:,nic)=Fn(:,1);         
      else 
         if max(Nmax_UC(:,1)) < max_UC
            nic=nic+1;
            Nmax_UC(nic,1) = max_UC; 
            NFn(:,nic)=Fn(:,1);            
         end         
      end
   else 
      if isequal(pic,0)
         pic=pic+1;
         Pmax_UC(pic,1) = max_UC; 
         PFn(:,pic)=Fn(:,1);         
      else
         if min(Pmax_UC(:,1)) >= max_UC
            pic=pic+1;
            Pmax_UC(pic,1) = max_UC; 
            PFn(:,pic)=Fn(:,1);            
         end         
      end         
   end
   % -------------------- Store maximum or minium UC E   
   
   % ---------------------------------------- Unity Check greater than 1 S
   if max_UC > 1 % if not satisfy Unity Check, find proper UC.
      pinc=1;
      Fflag=Fflag+1; % level of UC violation
      
      while pinc < 100
         % ---------------------------------------------------------------
         % ------------    Root Finding by Updating Loads UC    ----------
         % ---------------------------------------------------------------
         % Find maximum or minimum UC
         [min_PUC, indexPUC]=min(Pmax_UC);
         [max_NUC, indexNUC]=max(Nmax_UC); 
         % Updated Internal Forces
         if isempty(NFn)
            Fn=Fn/max_UC;
         else
            Fn=(PFn(:,indexPUC)+NFn(:,indexNUC))/2;
         end
         
      % ----------------------------------------------------------
      % ---------------             tau_b S          -------------
      % ----------------------------------------------------------
%-------------------------------------------------------------------------
%-----------------              2nd Internal Taub S   --------------------
%-------------------------------------------------------------------------

      % set up initial values for global solution; Zero nodal displacements
      % Initial imperfection
      u = zeros(N,1); v = zeros(N,1); w = zeros(N,1);
      wx = zeros(N,1); wy = zeros(N,1); wz = zeros(N,1); wxp = zeros(N,1);

      [L,L0,ul,dX,dY,dZ]=InitialEleVal(xn,xg1,yg1,zg1,xg2,yg2,zg2,u,v,w,MI);

      beta1x=zeros(xn,1);beta1y=zeros(xn,1);beta1z=zeros(xn,1);beta1xp=zeros(xn,1);
      beta2x=zeros(xn,1);beta2y=zeros(xn,1);beta2z=zeros(xn,1);beta2xp=zeros(xn,1);
      for i=1:xn

          beta1x(i,1) = wx(DUP1(i,1),1); beta2x(i,1) = wx(DUP2(i,1),1);
          beta1y(i,1) = wy(DUP1(i,1),1); beta2y(i,1) = wy(DUP2(i,1),1);
          beta1z(i,1) = wz(DUP1(i,1),1); beta2z(i,1) = wz(DUP2(i,1),1);
          beta1xp(i,1) = wxp(DUP1(i,1),1); beta2xp(i,1) = wxp(DUP2(i,1),1);

      end

      % initialize variables
      K=zeros(nDOF);          % global stiffness matrix
      KtBB=zeros(nDOF);       % global tangent stiffness matrix
      KggBB=zeros(nDOF);      % global geometry stiffness matrix
      Fint=zeros(nDOF,1);     % global internal force vector
      DFG=zeros(nDOF,1);     % global internal force vector

      for n = 1:xn
         
         % Rigid offset
         Rd = eye(14);
         Rd(3,4)=rd1(n,1);Rd(10,11)=rd2(n,1); 
         Rd(1,6)=-rxd1(n,1)*cos(-angletap(n,2));Rd(8,13)=-rxd2(n,1)*cos(-angletap(n,2));
         Rd(2,6)=-rxd1(n,1)*sin(-angletap(n,2));Rd(9,13)=-rxd2(n,1)*sin(-angletap(n,2));

         % Rigid offset for Uniform Loads in Element Frame
         Ld = eye(14);
         Ld(1,6)=Lud1(n,1); Ld(8,13)=Lud2(n,1);  
         % Rigid offset for Self-weight in Element Frame
         Lsd = eye(14);
         Lsd(1,6)=CSD1(n,1); Lsd(8,13)=CSD2(n,1);         

         % Update Nodal Triads using global solution : Angle between Element frame and CR frame 
         [t1,t2,t3,u1,u2,u3] = UpdatedElementNodalTriadsTU(beta1x(n,1),beta2x(n,1),beta1y(n,1),beta2y(n,1),beta1z(n,1),beta2z(n,1),alphatap(n,2));
         [e1,e2,e3,Zetaavg,Zeta1,Zeta2,Eta1,Eta2] = ElementBaseVector(dX(n,1),dY(n,1),dZ(n,1),t2,u2,L(n,1),alphatap(n,2));

         % Deformation in CR frame
         [theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn] = NaturalFrame(t1,t2,t3,u1,u2,u3,e1,e2,e3,beta1xp(n,1),beta2xp(n,1));
         [qno] = ElDisplacement(theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn,ul(n,1));
         [Pbar]=Projection(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1));

         [e1,e2,e3] = GlobalTransform(e1,e2,e3,alphatap(n,2));
         [Ge]=CoordTransform(e1,e2,e3); 

         DE=zeros(14,1); SE=zeros(14,1);
         if ~isempty(LUEC)
            [Kt,Kgg,Qino,Kh2,Gn]=StiffnessELEMENT3D([bfb1(n);bfb2(n)],...
               [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
               [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
               [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
               [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
               hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
               theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
               theta1xpn,theta2xpn,qno,LUNCe(n,2),LUEC(n,17),FEL(n,:));

            % Distributed Loads
            DE(2,1)=LUNCe(n,2)*L0(n,1)/2;
            DE(6,1)=LUNCe(n,2)*L0(n,1)^2/12;
            DE(9,1)=LUNCe(n,2)*L0(n,1)/2;
            DE(13,1)=-LUNCe(n,2)*L0(n,1)^2/12;
            DE(1,1)=LUNCe(n,1)*L0(n,1)/2;
            DE(8,1)=LUNCe(n,1)*L0(n,1)/2;
            DE(3,1)=LUNCe(n,3)*L0(n,1)/2;
            DE(10,1)=LUNCe(n,3)*L0(n,1)/2;

         else
            [Kt,Kgg,Qino,Kh2,Gn]=StiffnessELEMENT3DN([bfb1(n);bfb2(n)],...
               [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
               [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
               [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
               [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
               hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
               theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
               theta1xpn,theta2xpn,qno,FEL(n,:));   
         end

         if ~isempty(SUEC1)
            % Self Weight
            SE(2,1)=SUNCe1(n,2)*L0(n,1)/2;
            SE(6,1)=SUNCe1(n,2)*L0(n,1)^2/12;
            SE(9,1)=SUNCe2(n,2)*L0(n,1)/2;
            SE(13,1)=-SUNCe2(n,2)*L0(n,1)^2/12;

            SE(1,1)=SUNCe1(n,1)*L0(n,1)/2;
            SE(8,1)=SUNCe2(n,1)*L0(n,1)/2;

            SE(3,1)=SUNCe1(n,3)*L0(n,1)/2;
            SE(10,1)=SUNCe2(n,3)*L0(n,1)/2; 
         end

         % ------------- Distributed Load & Self weight S
         % Rigid offset for Supports in Element Frame
         Rsd = eye(14);
   %       Rsd(3,4)=rd1(n);  Rsd(10,11)=rd2(n); 
         Rsd(1,6)=-rxd1(n); Rsd(8,13)=-rxd2(n);  

         [de1,de2,de3] = GlobalDisTransform(alpharef(n,2));      
         [GDe]=CoordTransform(de1,de2,de3);   
         DG = GDe*Ld'*Rsd'*DE + GDe*Lsd'*Rsd'*SE;     
         % ------------- Distributed Load & Self weight E 

         % Interforce resultants w.r.t Element frame
         Qei = Pbar'*Qino;

         % Geometrix Stiffness
         [Kext1,Kext2]=ExternalGStiffness(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1),Qino);

         % Load Height.
         [Fe1,Fe2,M] = LoadHeight(d1(n),d2(n));

         % Interforce resultants w.r.t Global frame
         Qg =Ge*Qei;

         % Elastic Tangent Stiffness Matrix
         Kts = Ge*Rd'*(Pbar'*Kt*Pbar)*Rd*Ge';

         % Geometric Stiffness Matrix
         Kggs = Ge*Rd'*(Pbar'*Kgg*Pbar +((Kext1+Kext2)+ (Kext1+Kext2)')/2)*Rd*Ge'+GDe*M*(Fe1+Fe2+Kh2)*M'*GDe';

         % Total Stiffness
         Kg = Kts + Kggs;

         % Assemble
         % Total Stiffness
         [K,Fint,DFG] = assemble(K,Fint,DFG,Kg,Qg,DG,MI,n);
         % Elastic stiffness & Geometric stiffness
         [KtBB,KggBB] = assemble1(KtBB,KggBB,Kts,Kggs,MI,n);

      end

      K=K+KS+KB;

      % Elastic Tangent Stiffness
      ind=(1:nDOF)';
      ind=ind(logical(BC(:,1)));
      K(ind,:)=[];
      K(:,ind)=[];
      
      if rcond(K) < (10^(-15))
         if isequal(increment,1)
            Bflag = 1;
         else
            Bflag = 2;
         end
         break;
      end
      
      % Calculate the first nodal displacements
      dus = K\(Fn);     % 1st Elastic displacement

%--------------------------------------------- 2nd internal S
% Restoration DOF of the nodal displacements considering BC
[ucur_iter,RTsuppt]=RTDisplacement(dus,nDOF,BC);

% Initialize
iter = 1;
du_iter = zeros(nDOF,1);  % Initialize Current displacement for iteration 

while iter < niter  
    
   ucur_iter = ucur_iter+du_iter;

   [unew]=CurrentDisplacement(ucur_iter,N,nodedof); % including supports node
   
   [L,ul,dX,dY,dZ]=CurrentElelength(xg1,yg1,zg1,xg2,yg2,zg2,xn,unew,L0,MI);

   for i=1:length(MI(:,1))
     
      beta1x(i,1) = unew(MI(i,2),4); beta2x(i,1) = unew(MI(i,3),4);
      beta1y(i,1) = unew(MI(i,2),5); beta2y(i,1) = unew(MI(i,3),5);
      beta1z(i,1) = unew(MI(i,2),6); beta2z(i,1) = unew(MI(i,3),6);
      beta1xp(i,1) = unew(MI(i,2),7); beta2xp(i,1) = unew(MI(i,3),7);

   end
  
   % Reset variables
   K=zeros(nDOF);          % global stiffness matrix
   KtBB=zeros(nDOF);       % global stiffness matrix
   KggBB=zeros(nDOF);      % global stiffness matrix
   Fint=zeros(nDOF,1);     % global internal force vector
   DFG=zeros(nDOF,1);      % global internal force vector
   
   for n = 1:xn
      
      % Rigid offset
      Rd = eye(14);
      Rd(3,4)=rd1(n,1);Rd(10,11)=rd2(n,1); 
      Rd(1,6)=-rxd1(n,1)*cos(-angletap(n,2));Rd(8,13)=-rxd2(n,1)*cos(-angletap(n,2));
      Rd(2,6)=-rxd1(n,1)*sin(-angletap(n,2));Rd(9,13)=-rxd2(n,1)*sin(-angletap(n,2));

      % Rigid offset for Uniform Loads in Element Frame
      Ld = eye(14);
      Ld(1,6)=Lud1(n,1); Ld(8,13)=Lud2(n,1);  
      % Rigid offset for Self-weight in Element Frame
      Lsd = eye(14);
      Lsd(1,6)=CSD1(n,1); Lsd(8,13)=CSD2(n,1);           

      % Update Nodal Triads using global solution : Angle between Element frame and CR frame 
      [t1,t2,t3,u1,u2,u3] = UpdatedElementNodalTriadsTU(beta1x(n,1),beta2x(n,1),beta1y(n,1),beta2y(n,1),beta1z(n,1),beta2z(n,1),alphatap(n,2));
      [e1,e2,e3,Zetaavg,Zeta1,Zeta2,Eta1,Eta2] = ElementBaseVector(dX(n,1),dY(n,1),dZ(n,1),t2,u2,L(n,1),alphatap(n,2));
      et1=e1;et2=e2;et3=e3; % direction of co-rotational frame
      % Deformation in CR frame
      [theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn] = NaturalFrame(t1,t2,t3,u1,u2,u3,e1,e2,e3,beta1xp(n,1),beta2xp(n,1));
      [qno] = ElDisplacement(theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn,ul(n,1));
      [Pbar]=Projection(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1));

      [e1,e2,e3] = GlobalTransform(e1,e2,e3,alphatap(n,2));
      [Ge]=CoordTransform(e1,e2,e3); 
      
      DE=zeros(14,1); SE=zeros(14,1);
      if ~isempty(LUEC)
         [Kt,Kgg,Qino,Kh2,Gn]=StiffnessELEMENT3D([bfb1(n);bfb2(n)],...
            [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
            [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
            [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
            [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
            hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
            theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
            theta1xpn,theta2xpn,qno,LUNCe(n,2),LUEC(n,17),FEL(n,:));

         % Distributed Loads
         DE(2,1)=LUNCe(n,2)*L0(n,1)/2;
         DE(6,1)=LUNCe(n,2)*L0(n,1)^2/12;
         DE(9,1)=LUNCe(n,2)*L0(n,1)/2;
         DE(13,1)=-LUNCe(n,2)*L0(n,1)^2/12;
         DE(1,1)=LUNCe(n,1)*L0(n,1)/2;
         DE(8,1)=LUNCe(n,1)*L0(n,1)/2;
         DE(3,1)=LUNCe(n,3)*L0(n,1)/2;
         DE(10,1)=LUNCe(n,3)*L0(n,1)/2;

      else
         [Kt,Kgg,Qino,Kh2,Gn]=StiffnessELEMENT3DN([bfb1(n);bfb2(n)],...
            [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
            [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
            [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
            [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
            hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
            theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
            theta1xpn,theta2xpn,qno,FEL(n,:));   
      end

      if ~isempty(SUEC1)
         % Self Weight
         SE(2,1)=SUNCe1(n,2)*L0(n,1)/2;
         SE(6,1)=SUNCe1(n,2)*L0(n,1)^2/12;
         SE(9,1)=SUNCe2(n,2)*L0(n,1)/2;
         SE(13,1)=-SUNCe2(n,2)*L0(n,1)^2/12;

         SE(1,1)=SUNCe1(n,1)*L0(n,1)/2;
         SE(8,1)=SUNCe2(n,1)*L0(n,1)/2;

         SE(3,1)=SUNCe1(n,3)*L0(n,1)/2;
         SE(10,1)=SUNCe2(n,3)*L0(n,1)/2; 
      end
      
      % ------------- Distributed Load & Self weight S
      % Rigid offset for Supports in Element Frame
      Rsd = eye(14);
%       Rsd(3,4)=rd1(n);  Rsd(10,11)=rd2(n); 
      Rsd(1,6)=-rxd1(n); Rsd(8,13)=-rxd2(n);  
      
      [de1,de2,de3] = GlobalDisTransform(alpharef(n,2));      
      [GDe]=CoordTransform(de1,de2,de3);
      if isequal(increment,1)
         DG = GDe*Ld'*Rsd'*DE + GDe*Lsd'*Rsd'*SE;           
      else
         DG = GDe*Ld'*Rsd'*DE;           
      end 
      % ------------- Distributed Load & Self weight E
      
      % Interforce resultants w.r.t Element frame
      Qei = Pbar'*Qino;

      % Geometrix Stiffness
      [Kext1,Kext2]=ExternalGStiffness(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1),Qino);

      % Load Height.
      [Fe1,Fe2,M] = LoadHeight(d1(n),d2(n));

      % Interforce resultants w.r.t Global frame
      Qg =Ge*Qei;
      
      % Elastic Tangent Stiffness Matrix
      Kts = Ge*Rd'*(Pbar'*Kt*Pbar)*Rd*Ge';

      % Geometric Stiffness Matrix
      Kggs = Ge*Rd'*(Pbar'*Kgg*Pbar +((Kext1+Kext2)+ (Kext1+Kext2)')/2)*Rd*Ge'+GDe*M*(Fe1+Fe2+Kh2)*M'*GDe';

      % Total Stiffness
      Kg = Kts + Kggs;
      
      % Assemble
      % Total Stiffness
      [K,Fint,DFG] = assemble(K,Fint,DFG,Kg,Qg,DG,MI,n);
      % Elastic stiffness & Geometric stiffness
      [KtBB,KggBB] = assemble1(KtBB,KggBB,Kts,Kggs,MI,n);
      
   end
    
   Fints = Fint+KS*ucur_iter+KB*ucur_iter; % Internal forces in Global Frame
   % ---------------------------------------------------- Load Transform S
   [dFn]=CurrentDisplacement(Fints,N,nodedof); % including supports nodes;

   dFn1 = zeros(xn,7); dFn2 = zeros(xn,7);
   for i=1:xn
      for j=1:7
         dFn1(i,j)=dFn(MI(i,2),j); 
         dFn2(i,j)=dFn(MI(i,3),j);
      end
   end  

   % Load transform
   Fints=zeros(nDOF,1);
   for n=1:xn
      % Rigid offset for Supports in Element Frame
      Rsd = eye(14);
%       Rsd(3,4)=rd1(n);  Rsd(10,11)=rd2(n); 
      Rsd(1,6)=-rxd1(n); Rsd(8,13)=-rxd2(n);

      % Inverse Rotation from Global Frame to Element Frame
      RLz=[cos(-alpharef(n,2)) -sin(-alpharef(n,2)) 0; ...
         sin(-alpharef(n,2)) cos(-alpharef(n,2)) 0; ...
         0 0 1];
      eL1 = [1; 0; 0];eL1 = RLz*eL1;
      eL2 = [0; 1; 0];eL2 = RLz*eL2;
      eL3 = [0; 0; 1];eL3 = RLz*eL3;
   
      [GLe]=CoordTransform(eL1,eL2,eL3);
   
      % Load Transform using Rigid Offset within Element Frame
      % already LHd is included.
      Ft = Rsd'*GLe*[dFn1(n,:)'/Ldp1(n,2);dFn2(n,:)'/Ldp2(n,2)];
      
      % Rotation from Element Frame to Global Frame
      RRz=[cos(alpharef(n,2)) -sin(alpharef(n,2)) 0; ...
         sin(alpharef(n,2)) cos(alpharef(n,2)) 0; ...
         0 0 1];
      eR1 = [1; 0; 0];eR1 = RRz*eR1;
      eR2 = [0; 1; 0];eR2 = RRz*eR2;
      eR3 = [0; 0; 1];eR3 = RRz*eR3;

      [GRe]=CoordTransform(eR1,eR2,eR3);

      Ft=GRe*Ft;
   
      % Assemble
      [Fints] = assemble2(Fints,Ft,MI,n);
   end
   % ---------------------------------------------------- Load Transform E   
   % apply supports
   ind=(1:nDOF)';
   ind=ind(logical(BC(:,1)));
   Fints(ind,:)=[];

   R = Fints - Fn;  
%    norm = sqrt(R'*R);
   if isequal(iter,1)
      norm = sqrt(R'*R);
      normO=norm;
   else
      norm = sqrt(R'*R)/normO;
   end
   
   K=K+KS+KB;
   % Total Stiffness
   ind=(1:nDOF)';
   ind=ind(logical(BC(:,1)));
   K(ind,:)=[];
   K(:,ind)=[];  
 
   % Calculate the nodal displacements
   du1s_iter = -inv(K)*R;

   % Restoration DOF of the nodal displacements considering BC   
   [du_iter]=IterativeDisplacement(du1s_iter,nDOF,BC,RTsuppt);
	
   % Repeat iterations
   iter = iter + 1;
  
   if norm < tolerance    
       break
   end
   
end     % iteration end
%--------------------------------------------- 2nd internal E

      [unew]=CurrentDisplacement(du_iter,N,nodedof); % including supports nodes;

      unew1 = zeros(xn,7); unew2 = zeros(xn,7);
      for i=1:xn
         for j=1:7
            unew1(i,j)=unew(MI(i,2),j); 
            unew2(i,j)=unew(MI(i,3),j);
         end
      end    
%-------------------------------------------------------------------------
%-----------------              2nd Internal Taub E   --------------------
%-------------------------------------------------------------------------            
%       % set up initial values for global solution; Zero nodal displacements
%       % Initial imperfection
%       u = zeros(N,1); v = zeros(N,1); w = zeros(N,1);
%       wx = zeros(N,1); wy = zeros(N,1); wz = zeros(N,1); wxp = zeros(N,1);
% 
%       [L,L0,ul,dX,dY,dZ]=InitialEleVal(xn,xg1,yg1,zg1,xg2,yg2,zg2,u,v,w,MI);
% 
%       beta1x=zeros(xn,1);beta1y=zeros(xn,1);beta1z=zeros(xn,1);beta1xp=zeros(xn,1);
%       beta2x=zeros(xn,1);beta2y=zeros(xn,1);beta2z=zeros(xn,1);beta2xp=zeros(xn,1);
%       for i=1:xn
% 
%           beta1x(i,1) = wx(DUP1(i,1),1); beta2x(i,1) = wx(DUP2(i,1),1);
%           beta1y(i,1) = wy(DUP1(i,1),1); beta2y(i,1) = wy(DUP2(i,1),1);
%           beta1z(i,1) = wz(DUP1(i,1),1); beta2z(i,1) = wz(DUP2(i,1),1);
%           beta1xp(i,1) = wxp(DUP1(i,1),1); beta2xp(i,1) = wxp(DUP2(i,1),1);
% 
%       end
% 
%       % initialize variables
%       K=zeros(nDOF);          % global stiffness matrix
%       KtBB=zeros(nDOF);       % global tangent stiffness matrix
%       KggBB=zeros(nDOF);      % global geometry stiffness matrix
%       Fint=zeros(nDOF,1);     % global internal force vector
%       DFG=zeros(nDOF,1);     % global internal force vector
% 
%       for n = 1:xn
%          
%          % Rigid offset
%          Rd = eye(14);
%          Rd(3,4)=rd1(n,1);Rd(10,11)=rd2(n,1); 
%          Rd(1,6)=-rxd1(n,1)*cos(-angletap(n,2));Rd(8,13)=-rxd2(n,1)*cos(-angletap(n,2));
%          Rd(2,6)=-rxd1(n,1)*sin(-angletap(n,2));Rd(9,13)=-rxd2(n,1)*sin(-angletap(n,2));
% 
%          % Rigid offset for Uniform Loads in Element Frame
%          Ld = eye(14);
%          Ld(1,6)=Lud1(n,1); Ld(8,13)=Lud2(n,1);  
%          % Rigid offset for Self-weight in Element Frame
%          Lsd = eye(14);
%          Lsd(1,6)=CSD1(n,1); Lsd(8,13)=CSD2(n,1);         
% 
%          % Update Nodal Triads using global solution : Angle between Element frame and CR frame 
%          [t1,t2,t3,u1,u2,u3] = UpdatedElementNodalTriadsTU(beta1x(n,1),beta2x(n,1),beta1y(n,1),beta2y(n,1),beta1z(n,1),beta2z(n,1),alphatap(n,2));
%          [e1,e2,e3,Zetaavg,Zeta1,Zeta2,Eta1,Eta2] = ElementBaseVector(dX(n,1),dY(n,1),dZ(n,1),t2,u2,L(n,1),alphatap(n,2));
% 
%          % Deformation in CR frame
%          [theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn] = NaturalFrame(t1,t2,t3,u1,u2,u3,e1,e2,e3,beta1xp(n,1),beta2xp(n,1));
%          [qno] = ElDisplacement(theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn,ul(n,1));
%          [Pbar]=Projection(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1));
% 
%          [e1,e2,e3] = GlobalTransform(e1,e2,e3,alphatap(n,2));
%          [Ge]=CoordTransform(e1,e2,e3); 
% 
%          DE=zeros(14,1); SE=zeros(14,1);
%          if ~isempty(LUEC)
%             [Kt,Kgg,Qino,Kh2,Gn]=StiffnessELEMENT3D([bfb1(n);bfb2(n)],...
%                [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
%                [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
%                [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
%                [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
%                hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
%                theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
%                theta1xpn,theta2xpn,qno,LUNCe(n,2),LUEC(n,17),FEL(n,:));
% 
%             % Distributed Loads
%             DE(2,1)=LUNCe(n,2)*L0(n,1)/2;
%             DE(6,1)=LUNCe(n,2)*L0(n,1)^2/12;
%             DE(9,1)=LUNCe(n,2)*L0(n,1)/2;
%             DE(13,1)=-LUNCe(n,2)*L0(n,1)^2/12;
%             DE(1,1)=LUNCe(n,1)*L0(n,1)/2;
%             DE(8,1)=LUNCe(n,1)*L0(n,1)/2;
%             DE(3,1)=LUNCe(n,3)*L0(n,1)/2;
%             DE(10,1)=LUNCe(n,3)*L0(n,1)/2;
% 
%          else
%             [Kt,Kgg,Qino,Kh2,Gn]=StiffnessELEMENT3DN([bfb1(n);bfb2(n)],...
%                [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
%                [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
%                [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
%                [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
%                hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
%                theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
%                theta1xpn,theta2xpn,qno,FEL(n,:));   
%          end
% 
%          if ~isempty(SUEC1)
%             % Self Weight
%             SE(2,1)=SUNCe1(n,2)*L0(n,1)/2;
%             SE(6,1)=SUNCe1(n,2)*L0(n,1)^2/12;
%             SE(9,1)=SUNCe2(n,2)*L0(n,1)/2;
%             SE(13,1)=-SUNCe2(n,2)*L0(n,1)^2/12;
% 
%             SE(1,1)=SUNCe1(n,1)*L0(n,1)/2;
%             SE(8,1)=SUNCe2(n,1)*L0(n,1)/2;
% 
%             SE(3,1)=SUNCe1(n,3)*L0(n,1)/2;
%             SE(10,1)=SUNCe2(n,3)*L0(n,1)/2; 
%          end
% 
%          % ------------- Distributed Load & Self weight S
%          % Rigid offset for Supports in Element Frame
%          Rsd = eye(14);
%    %       Rsd(3,4)=rd1(n);  Rsd(10,11)=rd2(n); 
%          Rsd(1,6)=-rxd1(n); Rsd(8,13)=-rxd2(n);  
% 
%          [de1,de2,de3] = GlobalDisTransform(alpharef(n,2));      
%          [GDe]=CoordTransform(de1,de2,de3);   
%          DG = GDe*Ld'*Rsd'*DE + GDe*Lsd'*Rsd'*SE;     
%          % ------------- Distributed Load & Self weight E 
% 
%          % Interforce resultants w.r.t Element frame
%          Qei = Pbar'*Qino;
% 
%          % Geometrix Stiffness
%          [Kext1,Kext2]=ExternalGStiffness(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1),Qino);
% 
%          % Load Height.
%          [Fe1,Fe2,M] = LoadHeight(d1(n),d2(n));
% 
%          % Interforce resultants w.r.t Global frame
%          Qg =Ge*Qei;
% 
%          % Elastic Tangent Stiffness Matrix
%          Kts = Ge*Rd'*(Pbar'*Kt*Pbar)*Rd*Ge';
% 
%          % Geometric Stiffness Matrix
%          Kggs = Ge*Rd'*(Pbar'*Kgg*Pbar +((Kext1+Kext2)+ (Kext1+Kext2)')/2)*Rd*Ge'+GDe*M*(Fe1+Fe2+Kh2)*M'*GDe';
% 
%          % Total Stiffness
%          Kg = Kts + Kggs;
% 
%          % Assemble
%          % Total Stiffness
%          [K,Fint,DFG] = assemble(K,Fint,DFG,Kg,Qg,DG,MI,n);
%          % Elastic stiffness & Geometric stiffness
%          [KtBB,KggBB] = assemble1(KtBB,KggBB,Kts,Kggs,MI,n);
% 
%       end
% 
%       KtBB=KtBB+KS+KB;
%       % Distributed Load
%       ind=(1:nDOF)';
%       ind=ind(logical(BC(:,1)));
%       DFG(ind,:)=[];  
% 
% %       if isequal(increment,1)
% %          Fn = dF + lambda*DFG;
% %       end 
% 
%       % Elastic Tangent Stiffness
%       ind=(1:nDOF)';
%       ind=ind(logical(BC(:,1)));
%       KtBB(ind,:)=[];
%       KtBB(:,ind)=[];
%       
%       if rcond(KtBB) < (10^(-15))
%          if isequal(increment,1)
%             Bflag = 1;
%          else
%             Bflag = 2;
%          end
%          break;
%       end
%       
%       % Calculate the first nodal displacements
%       dus = KtBB\(Fn);     % 1st Elastic displacement
% 
%       % Restoration DOF of the nodal displacements considering BC
%       [du,RTsuppt]=RTDisplacement(dus,nDOF,BC);
% 
%       [unew]=CurrentDisplacement(du,N,nodedof); % including supports nodes;
% 
%       unew1 = zeros(xn,7); unew2 = zeros(xn,7);
%       for i=1:xn
%          for j=1:7
%             unew1(i,j)=unew(MI(i,2),j); 
%             unew2(i,j)=unew(MI(i,3),j);
%          end
%       end    
 
      % ------------------------------------------------------ tau_b S
      taub=zeros(5,xn);
      for n = 1:xn      
         % Update Nodal Triads using global solution : Angle between Element frame and CR frame 
         [t1,t2,t3,u1,u2,u3] = UpdatedElementNodalTriadsTU(beta1x(n,1),beta2x(n,1),beta1y(n,1),beta2y(n,1),beta1z(n,1),beta2z(n,1),alphatap(n,2));
         [e1,e2,e3,Zetaavg,Zeta1,Zeta2,Eta1,Eta2] = ElementBaseVector(dX(n,1),dY(n,1),dZ(n,1),t2,u2,L(n,1),alphatap(n,2));

         % Deformation in CR frame
         [theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn] = NaturalFrame(t1,t2,t3,u1,u2,u3,e1,e2,e3,beta1xp(n,1),beta2xp(n,1));
         [Pbar]=Projection(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1));

         [e1,e2,e3] = GlobalTransform(e1,e2,e3,alphatap(n,2));
         [Ge]=CoordTransform(e1,e2,e3); 
         qno=Pbar*Rd*Ge'*[unew1(n,:)';unew2(n,:)'];

         taub(:,n)=StiffnessELEMENT3Dtaub([bfb1(n);bfb2(n)],...
            [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
            [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
            [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
            [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
            hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
            theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
            theta1xpn,theta2xpn,qno,Fy(n,1),Fyfi(n,1),Fyw(n,1),Fyfo(n,1),[ytbar1(n);ytbar2(n)],Pbar,FEL(n,:),HomoType(n,1),angletap(n,2),CSangel(n,2));    
      end   
      % ------------------------------------------------------- tau_b E              
      % ----------------------------------------------------------
      % ---------------             tau_b E          -------------
      % ----------------------------------------------------------                  

         % ---------------------------- Calculate Updated Internal Force S 
         if increment >1
            LH_gammma = max(Fn./Fn0);
            % ------------------------------------------------------------
            % ------------            Update Load Height.         --------
            % ------------------------------------------------------------
            hd1=zeros(xn,1); hd2=zeros(xn,1);
            d1=zeros(xn,1);  d2=zeros(xn,1);

            if ~isempty(LNC)
               LNCe1=zeros(xn,3);
               LNCe2=zeros(xn,3);

               for i=1:xn
                  Rz=[cos(-alpharef(i,2)) -sin(-alpharef(i,2)) 0; ...
                  sin(-alpharef(i,2)) cos(-alpharef(i,2)) 0; ...
                  0 0 1];

                  LNCe1(i,:)=LH_gammma*Rz*[LNC1(i,5);LNC1(i,6);LNC1(i,7)];
                  LNCe2(i,:)=LH_gammma*Rz*[LNC2(i,5);LNC2(i,6);LNC2(i,7)];

                  if isequal(LNC1(i,13),1) || isequal(LNC1(i,13),0)% None
                     hd1(i,1)=0;
                  elseif isequal(LNC1(i,13),2) % Top
                     hd1(i,1)=hst1(i,1)+tft1(i,1)/2 +LNC1(i,12);
                  elseif isequal(LNC1(i,13),3) % Bottom
                     hd1(i,1)=-(hsb1(i,1)+tfb1(i,1)/2 +LNC1(i,12) );
                  elseif isequal(LNC1(i,13),4) % Centroid
                     hd1(i,1)=-( CSD1(i,1) +LNC1(i,12) );  
                  elseif isequal(LNC1(i,13),5) % Mid-Web
                     hd1(i,1)=hst1(i,1)-tft1(i,1)/2-Dt1(i,1) +LNC1(i,12);                       
                  end

                  if isequal(LNC2(i,13),1) || isequal(LNC2(i,13),0)% None
                     hd2(i,1)=0;
                  elseif isequal(LNC2(i,13),2) % Top
                     hd2(i,1)=hst2(i,1)+tft2(i,1)/2 +LNC2(i,12);
                  elseif isequal(LNC2(i,13),3) % Bottom
                     hd2(i,1)=-(hsb2(i,1)+tfb2(i,1)/2 +LNC2(i,12) );
                  elseif isequal(LNC2(i,13),4) % Centroid
                     hd2(i,1)=-( CSD2(i,1)+LNC2(i,12) ); 
                  elseif isequal(LNC2(i,13),5) % Mid-Web
                     hd2(i,1)=hst2(i,1)-tft2(i,1)/2-Dt2(i,1) +LNC2(i,12);                       
                  end

                  d1(i,1)=LNCe1(i,2)*hd1(i,1)/2;
                  d2(i,1)=LNCe2(i,2)*hd2(i,1)/2;
               end
            end      
         end   

         % set up initial values for global solution; Zero nodal displacements
         % Initial imperfection
         u = zeros(N,1); v = zeros(N,1); w = zeros(N,1);
         wx = zeros(N,1); wy = zeros(N,1); wz = zeros(N,1); wxp = zeros(N,1);

         [L,L0,ul,dX,dY,dZ]=InitialEleVal(xn,xg1,yg1,zg1,xg2,yg2,zg2,u,v,w,MI);

         beta1x=zeros(xn,1);beta1y=zeros(xn,1);beta1z=zeros(xn,1);beta1xp=zeros(xn,1);
         beta2x=zeros(xn,1);beta2y=zeros(xn,1);beta2z=zeros(xn,1);beta2xp=zeros(xn,1);

         for i=1:xn

             beta1x(i,1) = wx(DUP1(i,1),1); beta2x(i,1) = wx(DUP2(i,1),1);
             beta1y(i,1) = wy(DUP1(i,1),1); beta2y(i,1) = wy(DUP2(i,1),1);
             beta1z(i,1) = wz(DUP1(i,1),1); beta2z(i,1) = wz(DUP2(i,1),1);
             beta1xp(i,1) = wxp(DUP1(i,1),1); beta2xp(i,1) = wxp(DUP2(i,1),1);

         end

         %----------------------------------------------------------------
         %------------------   Calculate Displacement  -------------------
         %----------------------------------------------------------------
         % initialize variables
         K=zeros(nDOF);          % global stiffness matrix
         KtBB=zeros(nDOF);       % global tangent stiffness matrix
         KggBB=zeros(nDOF);      % global geometry stiffness matrix
         Fint=zeros(nDOF,1);     % global internal force vector
         DFG=zeros(nDOF,1);     % global internal force vector
         
         Pt=zeros(5,xn);Mzt=zeros(5,xn);
         
         for n = 1:xn
            
            % Rigid offset
            Rd = eye(14);
            Rd(3,4)=rd1(n,1);Rd(10,11)=rd2(n,1); 
            Rd(1,6)=-rxd1(n,1)*cos(-angletap(n,2));Rd(8,13)=-rxd2(n,1)*cos(-angletap(n,2));
            Rd(2,6)=-rxd1(n,1)*sin(-angletap(n,2));Rd(9,13)=-rxd2(n,1)*sin(-angletap(n,2));

            % Rigid offset for Uniform Loads in Element Frame
            Ld = eye(14);
            Ld(1,6)=Lud1(n,1); Ld(8,13)=Lud2(n,1);  
            % Rigid offset for Self-weight in Element Frame
            Lsd = eye(14);
            Lsd(1,6)=CSD1(n,1); Lsd(8,13)=CSD2(n,1);        

            % Update Nodal Triads using global solution : Angle between Element frame and CR frame 
            [t1,t2,t3,u1,u2,u3] = UpdatedElementNodalTriadsTU(beta1x(n,1),beta2x(n,1),beta1y(n,1),beta2y(n,1),beta1z(n,1),beta2z(n,1),alphatap(n,2));
            [e1,e2,e3,Zetaavg,Zeta1,Zeta2,Eta1,Eta2] = ElementBaseVector(dX(n,1),dY(n,1),dZ(n,1),t2,u2,L(n,1),alphatap(n,2));
            et1=e1;et2=e2;et3=e3; % direction of co-rotational frame
            % Deformation in CR frame
            [theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn] = NaturalFrame(t1,t2,t3,u1,u2,u3,e1,e2,e3,beta1xp(n,1),beta2xp(n,1));
            [qno] = ElDisplacement(theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn,ul(n,1));
            [Pbar]=Projection(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1));

            [e1,e2,e3] = GlobalTransform(e1,e2,e3,alphatap(n,2));
            [Ge]=CoordTransform(e1,e2,e3); 

            DE=zeros(14,1); SE=zeros(14,1);
            if ~isempty(LUEC)
               [Kt,Kgg,Qino,Kh2,Gn,Pt(:,n),Mzt(:,n)]=StiffnessELEMENT3DKGDM([bfb1(n);bfb2(n)],...
                  [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
                  [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
                  [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
                  [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
                  hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
                  theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
                  theta1xpn,theta2xpn,qno,LUNCe(n,2),LUEC(n,17),Pbar,FEL(n,:),slender(:,n),ap_da_buttongroup,angletap(n,2),CSangel(n,2),et1,et2,et3,taub(:,n));

               % Distributed Loads
               DE(2,1)=LUNCe(n,2)*L0(n,1)/2;
               DE(6,1)=LUNCe(n,2)*L0(n,1)^2/12;
               DE(9,1)=LUNCe(n,2)*L0(n,1)/2;
               DE(13,1)=-LUNCe(n,2)*L0(n,1)^2/12;
               DE(1,1)=LUNCe(n,1)*L0(n,1)/2;
               DE(8,1)=LUNCe(n,1)*L0(n,1)/2;
               DE(3,1)=LUNCe(n,3)*L0(n,1)/2;
               DE(10,1)=LUNCe(n,3)*L0(n,1)/2;

            else
               [Kt,Kgg,Qino,Kh2,Gn,Pt(:,n),Mzt(:,n)]=StiffnessELEMENT3DNKGDM([bfb1(n);bfb2(n)],...
                  [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
                  [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
                  [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
                  [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
                  hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
                  theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
                  theta1xpn,theta2xpn,qno,Pbar,FEL(n,:),slender(:,n),ap_da_buttongroup,angletap(n,2),CSangel(n,2),et1,et2,et3,taub(:,n));   
            end  

            if ~isempty(SUEC1)
               % Self Weight
               SE(2,1)=SUNCe1(n,2)*L0(n,1)/2;
               SE(6,1)=SUNCe1(n,2)*L0(n,1)^2/12;
               SE(9,1)=SUNCe2(n,2)*L0(n,1)/2;
               SE(13,1)=-SUNCe2(n,2)*L0(n,1)^2/12;

               SE(1,1)=SUNCe1(n,1)*L0(n,1)/2;
               SE(8,1)=SUNCe2(n,1)*L0(n,1)/2;

               SE(3,1)=SUNCe1(n,3)*L0(n,1)/2;
               SE(10,1)=SUNCe2(n,3)*L0(n,1)/2; 
            end

            % ------------- Distributed Load & Self weight S
            % Rigid offset for Supports in Element Frame
            Rsd = eye(14);
%             Rsd(3,4)=rd1(n);  Rsd(10,11)=rd2(n); 
            Rsd(1,6)=-rxd1(n); Rsd(8,13)=-rxd2(n);  

            [de1,de2,de3] = GlobalDisTransform(alpharef(n,2));      
            [GDe]=CoordTransform(de1,de2,de3);
            if isequal(increment,1)
               DG = GDe*Ld'*Rsd'*DE + GDe*Lsd'*Rsd'*SE;           
            else
               DG = GDe*Ld'*Rsd'*DE;           
            end 
            % ------------- Distributed Load & Self weight E

            % Interforce resultants w.r.t Element frame
            Qei = Pbar'*Qino;

            % Geometrix Stiffness
            [Kext1,Kext2]=ExternalGStiffness(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1),Qino);

            % Load Height.
            [Fe1,Fe2,M] = LoadHeight(d1(n),d2(n));

            % Interforce resultants w.r.t Global frame
            Qg =Ge*Qei;

            % Elastic Tangent Stiffness Matrix
            Kts = Ge*Rd'*(Pbar'*Kt*Pbar)*Rd*Ge';

            % Geometric Stiffness Matrix
            Kggs = Ge*Rd'*(Pbar'*Kgg*Pbar +((Kext1+Kext2)+ (Kext1+Kext2)')/2)*Rd*Ge'+GDe*M*(Fe1+Fe2+Kh2)*M'*GDe';

            % Total Stiffness
            Kg = Kts + Kggs;

            % Assemble
            % Total Stiffness
            [K,Fint,DFG] = assemble(K,Fint,DFG,Kg,Qg,DG,MI,n);
            % Elastic stiffness & Geometric stiffness
            [KtBB,KggBB] = assemble1(KtBB,KggBB,Kts,Kggs,MI,n);

         end

         K=K+KS+KB;

         % Total Stiffness 
         ind=(1:nDOF)';
         ind=ind(logical(BC(:,1)));
         K(ind,:)=[];
         K(:,ind)=[];   

         if rcond(K) < (10^(-15))
            if isequal(increment,1)
               Bflag = 1;
            else
               Bflag = 2;
            end
            break;
         end    
         % Calculate the first nodal displacements
         dus = K\(Fn);     % 2nd Elastic displacement

         % Restoration DOF of the nodal displacements considering BC
         [du,RTsuppt]=RTDisplacement(dus,nDOF,BC);

         % Initialize
         ucur = zeros(nDOF,1);       % Initialize Current displacement for loading incremente
         ucur_iter = zeros(nDOF,1);  % Initialize Current displacement for iteration 

         ucur = ucur+du;

         [unew]=CurrentDisplacement(ucur,N,nodedof); % including supports nodes;

         [L,ul,dX,dY,dZ]=CurrentElelength(xg1,yg1,zg1,xg2,yg2,zg2,xn,unew,L0,MI);

         for i=1:xn

            beta1x(i,1) = unew(MI(i,2),4); beta2x(i,1) = unew(MI(i,3),4);
            beta1y(i,1) = unew(MI(i,2),5); beta2y(i,1) = unew(MI(i,3),5);
            beta1z(i,1) = unew(MI(i,2),6); beta2z(i,1) = unew(MI(i,3),6);
            beta1xp(i,1) = unew(MI(i,2),7); beta2xp(i,1) = unew(MI(i,3),7);

         end

         %--------------------------------------------------------------------
         %------- Calculate Internal Forces & Geometric Stiffness  -----------
         %--------------------------------------------------------------------    
         % initialize variables
         K=zeros(nDOF);          % global stiffness matrix
         KtBB=zeros(nDOF);       % global tangent stiffness matrix
         KggBB=zeros(nDOF);      % global geometry stiffness matrix
         Fint=zeros(nDOF,1);     % global internal force vector
         DFG=zeros(nDOF,1);      % global internal force vector
         
         Pt=zeros(5,xn);Mzt=zeros(5,xn);
         
         for n = 1:xn
            
            % Rigid offset
            Rd = eye(14);
            Rd(3,4)=rd1(n,1);Rd(10,11)=rd2(n,1); 
            Rd(1,6)=-rxd1(n,1)*cos(-angletap(n,2));Rd(8,13)=-rxd2(n,1)*cos(-angletap(n,2));
            Rd(2,6)=-rxd1(n,1)*sin(-angletap(n,2));Rd(9,13)=-rxd2(n,1)*sin(-angletap(n,2));

            % Rigid offset for Uniform Loads in Element Frame
            Ld = eye(14);
            Ld(1,6)=Lud1(n,1); Ld(8,13)=Lud2(n,1);  
            % Rigid offset for Self-weight in Element Frame
            Lsd = eye(14);
            Lsd(1,6)=CSD1(n,1); Lsd(8,13)=CSD2(n,1);      

            % Update Nodal Triads using global solution : Angle between Element frame and CR frame 
            [t1,t2,t3,u1,u2,u3] = UpdatedElementNodalTriadsTU(beta1x(n,1),beta2x(n,1),beta1y(n,1),beta2y(n,1),beta1z(n,1),beta2z(n,1),alphatap(n,2));
            [e1,e2,e3,Zetaavg,Zeta1,Zeta2,Eta1,Eta2] = ElementBaseVector(dX(n,1),dY(n,1),dZ(n,1),t2,u2,L(n,1),alphatap(n,2));
            et1=e1;et2=e2;et3=e3; % direction of co-rotational frame
            % Deformation in CR frame
            [theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn] = NaturalFrame(t1,t2,t3,u1,u2,u3,e1,e2,e3,beta1xp(n,1),beta2xp(n,1));
            [qno] = ElDisplacement(theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn,ul(n,1));
            [Pbar]=Projection(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1));

            [e1,e2,e3] = GlobalTransform(e1,e2,e3,alphatap(n,2));
            [Ge]=CoordTransform(e1,e2,e3); 

            DE=zeros(14,1); SE=zeros(14,1);
            if ~isempty(LUEC)
               [Kt,Kgg,Qino,Kh2,Gn,Pt(:,n),Mzt(:,n)]=StiffnessELEMENT3DKGDM([bfb1(n);bfb2(n)],...
                  [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
                  [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
                  [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
                  [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
                  hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
                  theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
                  theta1xpn,theta2xpn,qno,LUNCe(n,2),LUEC(n,17),Pbar,FEL(n,:),slender(:,n),ap_da_buttongroup,angletap(n,2),CSangel(n,2),et1,et2,et3,taub(:,n));

               % Distributed Loads
               DE(2,1)=LUNCe(n,2)*L0(n,1)/2;
               DE(6,1)=LUNCe(n,2)*L0(n,1)^2/12;
               DE(9,1)=LUNCe(n,2)*L0(n,1)/2;
               DE(13,1)=-LUNCe(n,2)*L0(n,1)^2/12;
               DE(1,1)=LUNCe(n,1)*L0(n,1)/2;
               DE(8,1)=LUNCe(n,1)*L0(n,1)/2;
               DE(3,1)=LUNCe(n,3)*L0(n,1)/2;
               DE(10,1)=LUNCe(n,3)*L0(n,1)/2;

            else
               [Kt,Kgg,Qino,Kh2,Gn,Pt(:,n),Mzt(:,n)]=StiffnessELEMENT3DNKGDM([bfb1(n);bfb2(n)],...
                  [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
                  [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
                  [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
                  [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
                  hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
                  theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
                  theta1xpn,theta2xpn,qno,Pbar,FEL(n,:),slender(:,n),ap_da_buttongroup,angletap(n,2),CSangel(n,2),et1,et2,et3,taub(:,n));   
            end           

            if ~isempty(SUEC1)
               % Self Weight
               SE(2,1)=SUNCe1(n,2)*L0(n,1)/2;
               SE(6,1)=SUNCe1(n,2)*L0(n,1)^2/12;
               SE(9,1)=SUNCe2(n,2)*L0(n,1)/2;
               SE(13,1)=-SUNCe2(n,2)*L0(n,1)^2/12;

               SE(1,1)=SUNCe1(n,1)*L0(n,1)/2;
               SE(8,1)=SUNCe2(n,1)*L0(n,1)/2;

               SE(3,1)=SUNCe1(n,3)*L0(n,1)/2;
               SE(10,1)=SUNCe2(n,3)*L0(n,1)/2; 
            end

            % ------------- Distributed Load & Self weight S
            % Rigid offset for Supports in Element Frame
            Rsd = eye(14);
%             Rsd(3,4)=rd1(n);  Rsd(10,11)=rd2(n); 
            Rsd(1,6)=-rxd1(n); Rsd(8,13)=-rxd2(n);  

            [de1,de2,de3] = GlobalDisTransform(alpharef(n,2));      
            [GDe]=CoordTransform(de1,de2,de3);
            if isequal(increment,1)
               DG = GDe*Ld'*Rsd'*DE + GDe*Lsd'*Rsd'*SE;           
            else
               DG = GDe*Ld'*Rsd'*DE;           
            end 
            % ------------- Distributed Load & Self weight E

            % Interforce resultants w.r.t Element frame
            Qei = Pbar'*Qino;

            % Geometrix Stiffness
            [Kext1,Kext2]=ExternalGStiffness(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1),Qino);

            % Load Height.
            [Fe1,Fe2,M] = LoadHeight(d1(n),d2(n));

            % Interforce resultants w.r.t Global frame
            Qg =Ge*Qei;

            % Elastic Tangent Stiffness Matrix
            Kts = Ge*Rd'*(Pbar'*Kt*Pbar)*Rd*Ge';

            % Geometric Stiffness Matrix
            Kggs = Ge*Rd'*(Pbar'*Kgg*Pbar +((Kext1+Kext2)+ (Kext1+Kext2)')/2)*Rd*Ge'+GDe*M*(Fe1+Fe2+Kh2)*M'*GDe';

            % Total Stiffness
            Kg = Kts + Kggs;

            % Assemble
            % Total Stiffness
            [K,Fint,DFG] = assemble(K,Fint,DFG,Kg,Qg,DG,MI,n);
            % Elastic stiffness & Geometric stiffness
            [KtBB,KggBB] = assemble1(KtBB,KggBB,Kts,Kggs,MI,n);
      
         end

         K=K+KS+KB;    

         % Total Stiffness 
         ind=(1:nDOF)';
         ind=ind(logical(BC(:,1)));
         K(ind,:)=[];
         K(:,ind)=[];

         if rcond(K) < (10^(-15))
            Bflag = 2;
            break;
         end 
         % Calculate the nodal displacements
         du1s = K\(Fn);        % du1s = inv(K)*dF;

         % Restoration DOF of the nodal displacements considering BC
         [du_iter]=IterativeDisplacement(du1s,nDOF,BC,RTsuppt);

         iter = 1;
         while iter < niter  

            ucur_iter = ucur_iter+du_iter;

            [unew]=CurrentDisplacement(ucur_iter,N,nodedof); % including supports nodes

            [L,ul,dX,dY,dZ]=CurrentElelength(xg1,yg1,zg1,xg2,yg2,zg2,xn,unew,L0,MI);

            for i=1:length(MI(:,1))

               beta1x(i,1) = unew(MI(i,2),4); beta2x(i,1) = unew(MI(i,3),4);
               beta1y(i,1) = unew(MI(i,2),5); beta2y(i,1) = unew(MI(i,3),5);
               beta1z(i,1) = unew(MI(i,2),6); beta2z(i,1) = unew(MI(i,3),6);
               beta1xp(i,1) = unew(MI(i,2),7); beta2xp(i,1) = unew(MI(i,3),7);

            end

            % initialize variables
            K=zeros(nDOF);          % global stiffness matrix
            KtBB=zeros(nDOF);       % global stiffness matrix
            KggBB=zeros(nDOF);      % global stiffness matrix
            Fint=zeros(nDOF,1);     % global internal force vector
            DFG=zeros(nDOF,1);      % global internal force vector
            
            Pt=zeros(5,xn);Mzt=zeros(5,xn);
            
            for n = 1:xn
               
               % Rigid offset
               Rd = eye(14);
               Rd(3,4)=rd1(n,1);Rd(10,11)=rd2(n,1); 
               Rd(1,6)=-rxd1(n,1)*cos(-angletap(n,2));Rd(8,13)=-rxd2(n,1)*cos(-angletap(n,2));
               Rd(2,6)=-rxd1(n,1)*sin(-angletap(n,2));Rd(9,13)=-rxd2(n,1)*sin(-angletap(n,2));

               % Rigid offset for Uniform Loads in Element Frame
               Ld = eye(14);
               Ld(1,6)=Lud1(n,1); Ld(8,13)=Lud2(n,1);  
               % Rigid offset for Self-weight in Element Frame
               Lsd = eye(14);
               Lsd(1,6)=CSD1(n,1); Lsd(8,13)=CSD2(n,1);       

               % Update Nodal Triads using global solution : Angle between Element frame and CR frame 
               [t1,t2,t3,u1,u2,u3] = UpdatedElementNodalTriadsTU(beta1x(n,1),beta2x(n,1),beta1y(n,1),beta2y(n,1),beta1z(n,1),beta2z(n,1),alphatap(n,2));
               [e1,e2,e3,Zetaavg,Zeta1,Zeta2,Eta1,Eta2] = ElementBaseVector(dX(n,1),dY(n,1),dZ(n,1),t2,u2,L(n,1),alphatap(n,2));
               et1=e1;et2=e2;et3=e3; % direction of co-rotational frame
               % Deformation in CR frame
               [theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn] = NaturalFrame(t1,t2,t3,u1,u2,u3,e1,e2,e3,beta1xp(n,1),beta2xp(n,1));
               [qno] = ElDisplacement(theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn,ul(n,1));
               [Pbar]=Projection(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1));

               [e1,e2,e3] = GlobalTransform(e1,e2,e3,alphatap(n,2));
               [Ge]=CoordTransform(e1,e2,e3); 

               DE=zeros(14,1); SE=zeros(14,1);
               if ~isempty(LUEC)
                  [Kt,Kgg,Qino,Kh2,Gn,Pt(:,n),Mzt(:,n)]=StiffnessELEMENT3DKGDM([bfb1(n);bfb2(n)],...
                     [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
                     [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
                     [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
                     [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
                     hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
                     theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
                     theta1xpn,theta2xpn,qno,LUNCe(n,2),LUEC(n,17),Pbar,FEL(n,:),slender(:,n),ap_da_buttongroup,angletap(n,2),CSangel(n,2),et1,et2,et3,taub(:,n));

                  % Distributed Loads
                  DE(2,1)=LUNCe(n,2)*L0(n,1)/2;
                  DE(6,1)=LUNCe(n,2)*L0(n,1)^2/12;
                  DE(9,1)=LUNCe(n,2)*L0(n,1)/2;
                  DE(13,1)=-LUNCe(n,2)*L0(n,1)^2/12;
                  DE(1,1)=LUNCe(n,1)*L0(n,1)/2;
                  DE(8,1)=LUNCe(n,1)*L0(n,1)/2;
                  DE(3,1)=LUNCe(n,3)*L0(n,1)/2;
                  DE(10,1)=LUNCe(n,3)*L0(n,1)/2;

               else
                  [Kt,Kgg,Qino,Kh2,Gn,Pt(:,n),Mzt(:,n)]=StiffnessELEMENT3DNKGDM([bfb1(n);bfb2(n)],...
                     [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
                     [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
                     [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
                     [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
                     hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
                     theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
                     theta1xpn,theta2xpn,qno,Pbar,FEL(n,:),slender(:,n),ap_da_buttongroup,angletap(n,2),CSangel(n,2),et1,et2,et3,taub(:,n));   
               end        

               if ~isempty(SUEC1)
                  % Self Weight
                  SE(2,1)=SUNCe1(n,2)*L0(n,1)/2;
                  SE(6,1)=SUNCe1(n,2)*L0(n,1)^2/12;
                  SE(9,1)=SUNCe2(n,2)*L0(n,1)/2;
                  SE(13,1)=-SUNCe2(n,2)*L0(n,1)^2/12;

                  SE(1,1)=SUNCe1(n,1)*L0(n,1)/2;
                  SE(8,1)=SUNCe2(n,1)*L0(n,1)/2;

                  SE(3,1)=SUNCe1(n,3)*L0(n,1)/2;
                  SE(10,1)=SUNCe2(n,3)*L0(n,1)/2; 
               end

               % ------------- Distributed Load & Self weight S
               % Rigid offset for Supports in Element Frame
               Rsd = eye(14);
%                Rsd(3,4)=rd1(n);  Rsd(10,11)=rd2(n); 
               Rsd(1,6)=-rxd1(n); Rsd(8,13)=-rxd2(n);  

               [de1,de2,de3] = GlobalDisTransform(alpharef(n,2));      
               [GDe]=CoordTransform(de1,de2,de3);
               if isequal(increment,1)
                  DG = GDe*Ld'*Rsd'*DE + GDe*Lsd'*Rsd'*SE;           
               else
                  DG = GDe*Ld'*Rsd'*DE;           
               end 
               % ------------- Distributed Load & Self weight E

               % Interforce resultants w.r.t Element frame
               Qei = Pbar'*Qino;

               % Geometrix Stiffness
               [Kext1,Kext2]=ExternalGStiffness(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1),Qino);

               % Load Height.
               [Fe1,Fe2,M] = LoadHeight(d1(n),d2(n));

               % Interforce resultants w.r.t Global frame
               Qg =Ge*Qei;

               % --------------- Save Internal Force S
               QeiD = Pbar'*Qino;
               % -- Postprocessing for Moment from SC to Centroid S
               [det1,det2,det3] = GlobalDisTransform(angletap(n,2));
               [GDet]=CoordTransform(det1,det2,det3);  
               [GDetc]=CoordTransform(et1,et2,et3); 
               QeiDt = GDet*GDetc*Pbar'*Qino;
               % -- Postprocessing for Moment from SC to Centroid E
               % Update Internal Moment w.r.t centroidal axis
               QeiD(6,1) = QeiD(6,1) + QeiDt(1,1)*(yc1(n,1)-ys1(n,1));
               QeiD(13,1) = QeiD(13,1) + QeiDt(8,1)*(yc2(n,1)-ys2(n,1));        
               if ~isempty(SUEC1)
                  if isequal(increment,1)
                     QeiD(2,1)=-SE(2,1)+QeiD(2,1);
                     QeiD(9,1)=-SE(9,1)+QeiD(9,1);            
                     QeiD(6,1)=-SE(6,1)+QeiD(6,1);
                     QeiD(13,1)=-SE(13,1)+QeiD(13,1);             
                  else
                     QeiD(2,1)=-SE(2,1)*LH_gammma+QeiD(2,1);
                     QeiD(9,1)=-SE(9,1)*LH_gammma+QeiD(9,1);        
                     QeiD(6,1)=-SE(6,1)*LH_gammma+QeiD(6,1);
                     QeiD(13,1)=-SE(13,1)*LH_gammma+QeiD(13,1);              
                  end
               end  

               if ~isempty(LUEC)
                  if isequal(increment,1)
                     QeiD(2,1)=-DE(2,1)+QeiD(2,1);
                     QeiD(9,1)=-DE(9,1)+QeiD(9,1);
                     QeiD(6,1)=-DE(6,1)+QeiD(6,1);
                     QeiD(13,1)=-DE(13,1)+QeiD(13,1);             
                  else
                     QeiD(2,1)=-DE(2,1)*LH_gammma+QeiD(2,1);
                     QeiD(9,1)=-DE(9,1)*LH_gammma+QeiD(9,1);       
                     QeiD(6,1)=-DE(6,1)*LH_gammma+QeiD(6,1);
                     QeiD(13,1)=-DE(13,1)*LH_gammma+QeiD(13,1);                
                  end

               end       
               QgD =Ge*QeiD;  
               Qing(n,:) = QgD(:);  
               % Postprocessing for Axial and Shear force from SC to Centroid
               [dec1,dec2,dec3] = GlobalDisTransform(-CSangel(n,2));
               [GDec]=CoordTransform(dec1,dec2,dec3);          
               QeiDc = GDec*Pbar'*Qino;     
               QeiD(1,1)=QeiDc(1,1); 
               QeiD(2,1)=QeiDc(2,1);
               QeiD(8,1)=QeiDc(8,1); 
               QeiD(9,1)=QeiDc(9,1);   
               if ~isempty(SUEC1)
                  if isequal(increment,1)
                     QeiD(2,1)=-SE(2,1)+QeiD(2,1);       
                     QeiD(9,1)=-SE(9,1)+QeiD(9,1);  
                  else
                     QeiD(2,1)=-SE(2,1)*LH_gammma+QeiD(2,1);       
                     QeiD(9,1)=-SE(9,1)*LH_gammma+QeiD(9,1);                       
                  end
               end
               if ~isempty(LUEC)
                  if isequal(increment,1)
                     QeiD(2,1)=-DE(2,1)+QeiD(2,1);       
                     QeiD(9,1)=-DE(9,1)+QeiD(9,1);  
                  else
                     QeiD(2,1)=-DE(2,1)*LH_gammma+QeiD(2,1);       
                     QeiD(9,1)=-DE(9,1)*LH_gammma+QeiD(9,1);                       
                  end
               end                
               Qin(n,:) = QeiD(:);       
               % --------------- Save Internal Force E 

               % Elastic Tangent Stiffness Matrix
               Kts = Ge*Rd'*(Pbar'*Kt*Pbar)*Rd*Ge';

               % Geometric Stiffness Matrix
               Kggs = Ge*Rd'*(Pbar'*Kgg*Pbar +((Kext1+Kext2)+ (Kext1+Kext2)')/2)*Rd*Ge'+GDe*M*(Fe1+Fe2+Kh2)*M'*GDe';

               % Total Stiffness
               Kg = Kts + Kggs;

               % Assemble
               % Total Stiffness
               [K,Fint,DFG] = assemble(K,Fint,DFG,Kg,Qg,DG,MI,n);
               % Elastic stiffness & Geometric stiffness
               [KtBB,KggBB] = assemble1(KtBB,KggBB,Kts,Kggs,MI,n);

            end

            Fints = Fint+KS*ucur_iter+KB*ucur_iter;
            % ---------------------------------------------------- Load Transform S
            [dFn]=CurrentDisplacement(Fints,N,nodedof); % including supports nodes;

            dFn1 = zeros(xn,7); dFn2 = zeros(xn,7);
            for i=1:xn
               for j=1:7
                  dFn1(i,j)=dFn(MI(i,2),j); 
                  dFn2(i,j)=dFn(MI(i,3),j);
               end
            end  

            % Load transform
            Fints=zeros(nDOF,1);
            for n=1:xn
               % Rigid offset for Supports in Element Frame
               Rsd = eye(14);
%                Rsd(3,4)=rd1(n);  Rsd(10,11)=rd2(n); 
               Rsd(1,6)=-rxd1(n); Rsd(8,13)=-rxd2(n);

               % Inverse Rotation from Global Frame to Element Frame
               RLz=[cos(-alpharef(n,2)) -sin(-alpharef(n,2)) 0; ...
                  sin(-alpharef(n,2)) cos(-alpharef(n,2)) 0; ...
                  0 0 1];
               eL1 = [1; 0; 0];eL1 = RLz*eL1;
               eL2 = [0; 1; 0];eL2 = RLz*eL2;
               eL3 = [0; 0; 1];eL3 = RLz*eL3;

               [GLe]=CoordTransform(eL1,eL2,eL3);

               % Load Transform using Rigid Offset within Element Frame
               % already LHd is included.   
               Ft = Rsd'*GLe*[dFn1(n,:)'/Ldp1(n,2);dFn2(n,:)'/Ldp2(n,2)];

               % Rotation from Element Frame to Global Frame
               RRz=[cos(alpharef(n,2)) -sin(alpharef(n,2)) 0; ...
                  sin(alpharef(n,2)) cos(alpharef(n,2)) 0; ...
                  0 0 1];
               eR1 = [1; 0; 0];eR1 = RRz*eR1;
               eR2 = [0; 1; 0];eR2 = RRz*eR2;
               eR3 = [0; 0; 1];eR3 = RRz*eR3;

               [GRe]=CoordTransform(eR1,eR2,eR3);

               Ft=GRe*Ft;

               % Assemble
               [Fints] = assemble2(Fints,Ft,MI,n);
            end
            % ---------------------------------------------------- Load Transform E                    
            % apply supports
            ind=(1:nDOF)';
            ind=ind(logical(BC(:,1)));
            Fints(ind,:)=[];

            R = Fints - Fn;  
%             norm = sqrt(R'*R);
            if isequal(iter,1)
               norm = sqrt(R'*R);
               normO=norm;
            else
               norm = sqrt(R'*R)/normO;
            end
            
            K=K+KS+KB;
            % Total Stiffness
            ind=(1:nDOF)';
            ind=ind(logical(BC(:,1)));
            K(ind,:)=[];
            K(:,ind)=[]; 

            % Geometric Stiffness
            ind=(1:nDOF)';
            ind=ind(logical(BC(:,1)));
            KggBB(ind,:)=[];
            KggBB(:,ind)=[];    

            if rcond(K) < (10^(-15))
               Bflag = 2;
               break;
            end 
            % Calculate the nodal displacements
            du1s_iter = -inv(K)*R;

            % Restoration DOF of the nodal displacements considering BC   
            [du_iter]=IterativeDisplacement(du1s_iter,nDOF,BC,RTsuppt);

            % Repeat iterations
            iter = iter + 1;

            if norm < tolerance       
               break
            end

         end     % iteration end         

         if norm > 0.01
            du = ucur_iter*0;
         else
            du = ucur_iter;
         end

         [Funew]=FinalDisplacement(Funew,du,N,nodedof,increment); % including supports nodes;         
         % --------------------------------- Internal Foce Update UC > 1 E                
         % ---------------------------- Calculate Updated Internal Force E
            
         % ---------------------------------------------- Effective Area S  
         rinc=1; Aef=zeros(5,xn);Ae=zeros(5,xn);Phi_Py=zeros(5,xn);
         while rinc < 100 
            
            if isequal(rinc,1) % Gross Area
               Aef1=Ae;
               for n = 1:xn              
                  [Aef(:,n),Ae(:,n),Phi_Py(:,n)]=StiffnessINELEMENT3DAef([bfb1(n);bfb2(n)],...
                     [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
                     [Dg1(n);Dg2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)],[ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),fillet(n,:),...
                     gam,Fy(n,1),Fyfi(n,1),Fyw(n,1),Fyfo(n,1),[ytbar1(n);ytbar2(n)],HomoType(n,1),Pt(:,n),Mzt(:,n));              
               end

            else
               Aef1=Aef;
               for n = 1:xn              
                  [Aef(:,n),Ae(:,n),Phi_Py(:,n)]=StiffnessINELEMENT3DAefi([bfb1(n);bfb2(n)],...
                     [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
                     [Dg1(n);Dg2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),fillet(n,:),...
                     gam,Fy(n,1),Fyfi(n,1),Fyw(n,1),Fyfo(n,1),[ytbar1(n);ytbar2(n)],HomoType(n,1),Aef(:,n),Pt(:,n),Mzt(:,n));              
               end

            end              
            
            AreaE = abs(Aef1 - Aef);
            normAef = sqrt(sum(sum(AreaE'*AreaE)));
            if normAef < 0.001
               break;
            end 
            rinc=rinc+1;
         end %while      
         % ---------------------------------------------- Effective Area E          

         % ------------------------------------------------- Unity Check S 
         UC=zeros(5,xn);slender=zeros(5,xn);
         for n = 1:xn
            [UC(:,n),slender(:,n)]=StiffnessELEMENT3DUC([bfb1(n);bfb2(n)],...
               [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
               [Dg1(n);Dg2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
               [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),fillet(n,:),...
               gam,Fy(n,1),Fyfi(n,1),Fyw(n,1),Fyfo(n,1),[ytbar1(n);ytbar2(n)],NLIAType,HomoType(n,1),Phi_Py(:,n),Pt(:,n),Mzt(:,n));
         end

         UC = round(UC*10^6)/10^6;
         [max_UCrow, indexrow]=max(UC);
         [max_UC, UCcol]=max(max_UCrow);
         for i=1:xn
            if isequal(max_UCrow(1,i),max_UC)
               UCrow=indexrow(1,i);
               break;
            end
         end   
         % ------------------------------------------------- Unity Check E 
           
         % -------------------- Store maximum or minium UC S
         if max_UC <= 1
            if isequal(nic,0)
               nic=nic+1;
               Nmax_UC(nic,1) = max_UC; 
               NFn(:,nic)=Fn(:,1);         
            else 
               if max(Nmax_UC(:,1)) < max_UC
                  nic=nic+1;
                  Nmax_UC(nic,1) = max_UC; 
                  NFn(:,nic)=Fn(:,1);            
               end         
            end
         else 
            if isequal(pic,0)
               pic=pic+1;
               Pmax_UC(pic,1) = max_UC; 
               PFn(:,pic)=Fn(:,1);         
            else
               if min(Pmax_UC(:,1)) >= max_UC
                  pic=pic+1;
                  Pmax_UC(pic,1) = max_UC; 
                  PFn(:,pic)=Fn(:,1);            
               end         
            end         
         end
         % -------------------- Store maximum or minium UC E

         if max_UC >= 0.9999 && max_UC < 1.001 
%             [increment,max_UC]
            break;
         end
         pinc=pinc+1;
      end %while 
      
   else % maxUC < 1
   %-----------------------------------------------------------------
   %-----------------      maxUC < 1 S       ------------------------
   %-----------------------------------------------------------------   
      %--------------------------------------------------------------------
      %------------------         tau_b S            ----------------------
      %--------------------------------------------------------------------
%-------------------------------------------------------------------------
%-----------------              2nd Internal Taub S   --------------------
%-------------------------------------------------------------------------

      % set up initial values for global solution; Zero nodal displacements
      % Initial imperfection
      u = zeros(N,1); v = zeros(N,1); w = zeros(N,1);
      wx = zeros(N,1); wy = zeros(N,1); wz = zeros(N,1); wxp = zeros(N,1);

      [L,L0,ul,dX,dY,dZ]=InitialEleVal(xn,xg1,yg1,zg1,xg2,yg2,zg2,u,v,w,MI);

      beta1x=zeros(xn,1);beta1y=zeros(xn,1);beta1z=zeros(xn,1);beta1xp=zeros(xn,1);
      beta2x=zeros(xn,1);beta2y=zeros(xn,1);beta2z=zeros(xn,1);beta2xp=zeros(xn,1);
      for i=1:xn

          beta1x(i,1) = wx(DUP1(i,1),1); beta2x(i,1) = wx(DUP2(i,1),1);
          beta1y(i,1) = wy(DUP1(i,1),1); beta2y(i,1) = wy(DUP2(i,1),1);
          beta1z(i,1) = wz(DUP1(i,1),1); beta2z(i,1) = wz(DUP2(i,1),1);
          beta1xp(i,1) = wxp(DUP1(i,1),1); beta2xp(i,1) = wxp(DUP2(i,1),1);

      end

      % initialize variables
      K=zeros(nDOF);          % global stiffness matrix
      KtBB=zeros(nDOF);       % global tangent stiffness matrix
      KggBB=zeros(nDOF);      % global geometry stiffness matrix
      Fint=zeros(nDOF,1);     % global internal force vector
      DFG=zeros(nDOF,1);     % global internal force vector

      for n = 1:xn
         
         % Rigid offset
         Rd = eye(14);
         Rd(3,4)=rd1(n,1);Rd(10,11)=rd2(n,1); 
         Rd(1,6)=-rxd1(n,1)*cos(-angletap(n,2));Rd(8,13)=-rxd2(n,1)*cos(-angletap(n,2));
         Rd(2,6)=-rxd1(n,1)*sin(-angletap(n,2));Rd(9,13)=-rxd2(n,1)*sin(-angletap(n,2));

         % Rigid offset for Uniform Loads in Element Frame
         Ld = eye(14);
         Ld(1,6)=Lud1(n,1); Ld(8,13)=Lud2(n,1);  
         % Rigid offset for Self-weight in Element Frame
         Lsd = eye(14);
         Lsd(1,6)=CSD1(n,1); Lsd(8,13)=CSD2(n,1);         

         % Update Nodal Triads using global solution : Angle between Element frame and CR frame 
         [t1,t2,t3,u1,u2,u3] = UpdatedElementNodalTriadsTU(beta1x(n,1),beta2x(n,1),beta1y(n,1),beta2y(n,1),beta1z(n,1),beta2z(n,1),alphatap(n,2));
         [e1,e2,e3,Zetaavg,Zeta1,Zeta2,Eta1,Eta2] = ElementBaseVector(dX(n,1),dY(n,1),dZ(n,1),t2,u2,L(n,1),alphatap(n,2));

         % Deformation in CR frame
         [theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn] = NaturalFrame(t1,t2,t3,u1,u2,u3,e1,e2,e3,beta1xp(n,1),beta2xp(n,1));
         [qno] = ElDisplacement(theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn,ul(n,1));
         [Pbar]=Projection(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1));

         [e1,e2,e3] = GlobalTransform(e1,e2,e3,alphatap(n,2));
         [Ge]=CoordTransform(e1,e2,e3); 

         DE=zeros(14,1); SE=zeros(14,1);
         if ~isempty(LUEC)
            [Kt,Kgg,Qino,Kh2,Gn]=StiffnessELEMENT3D([bfb1(n);bfb2(n)],...
               [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
               [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
               [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
               [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
               hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
               theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
               theta1xpn,theta2xpn,qno,LUNCe(n,2),LUEC(n,17),FEL(n,:));

            % Distributed Loads
            DE(2,1)=LUNCe(n,2)*L0(n,1)/2;
            DE(6,1)=LUNCe(n,2)*L0(n,1)^2/12;
            DE(9,1)=LUNCe(n,2)*L0(n,1)/2;
            DE(13,1)=-LUNCe(n,2)*L0(n,1)^2/12;
            DE(1,1)=LUNCe(n,1)*L0(n,1)/2;
            DE(8,1)=LUNCe(n,1)*L0(n,1)/2;
            DE(3,1)=LUNCe(n,3)*L0(n,1)/2;
            DE(10,1)=LUNCe(n,3)*L0(n,1)/2;

         else
            [Kt,Kgg,Qino,Kh2,Gn]=StiffnessELEMENT3DN([bfb1(n);bfb2(n)],...
               [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
               [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
               [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
               [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
               hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
               theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
               theta1xpn,theta2xpn,qno,FEL(n,:));   
         end

         if ~isempty(SUEC1)
            % Self Weight
            SE(2,1)=SUNCe1(n,2)*L0(n,1)/2;
            SE(6,1)=SUNCe1(n,2)*L0(n,1)^2/12;
            SE(9,1)=SUNCe2(n,2)*L0(n,1)/2;
            SE(13,1)=-SUNCe2(n,2)*L0(n,1)^2/12;

            SE(1,1)=SUNCe1(n,1)*L0(n,1)/2;
            SE(8,1)=SUNCe2(n,1)*L0(n,1)/2;

            SE(3,1)=SUNCe1(n,3)*L0(n,1)/2;
            SE(10,1)=SUNCe2(n,3)*L0(n,1)/2; 
         end

         % ------------- Distributed Load & Self weight S
         % Rigid offset for Supports in Element Frame
         Rsd = eye(14);
   %       Rsd(3,4)=rd1(n);  Rsd(10,11)=rd2(n); 
         Rsd(1,6)=-rxd1(n); Rsd(8,13)=-rxd2(n);  

         [de1,de2,de3] = GlobalDisTransform(alpharef(n,2));      
         [GDe]=CoordTransform(de1,de2,de3);   
         DG = GDe*Ld'*Rsd'*DE + GDe*Lsd'*Rsd'*SE;     
         % ------------- Distributed Load & Self weight E 

         % Interforce resultants w.r.t Element frame
         Qei = Pbar'*Qino;

         % Geometrix Stiffness
         [Kext1,Kext2]=ExternalGStiffness(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1),Qino);

         % Load Height.
         [Fe1,Fe2,M] = LoadHeight(d1(n),d2(n));

         % Interforce resultants w.r.t Global frame
         Qg =Ge*Qei;

         % Elastic Tangent Stiffness Matrix
         Kts = Ge*Rd'*(Pbar'*Kt*Pbar)*Rd*Ge';

         % Geometric Stiffness Matrix
         Kggs = Ge*Rd'*(Pbar'*Kgg*Pbar +((Kext1+Kext2)+ (Kext1+Kext2)')/2)*Rd*Ge'+GDe*M*(Fe1+Fe2+Kh2)*M'*GDe';

         % Total Stiffness
         Kg = Kts + Kggs;

         % Assemble
         % Total Stiffness
         [K,Fint,DFG] = assemble(K,Fint,DFG,Kg,Qg,DG,MI,n);
         % Elastic stiffness & Geometric stiffness
         [KtBB,KggBB] = assemble1(KtBB,KggBB,Kts,Kggs,MI,n);

      end

      K=K+KS+KB;

      % Elastic Tangent Stiffness
      ind=(1:nDOF)';
      ind=ind(logical(BC(:,1)));
      K(ind,:)=[];
      K(:,ind)=[];
      
      if rcond(K) < (10^(-15))
         if isequal(increment,1)
            Bflag = 1;
         else
            Bflag = 2;
         end
         break;
      end
      
      % Calculate the first nodal displacements
      dus = K\(Fn);     % 1st Elastic displacement

%--------------------------------------------- 2nd internal S
% Restoration DOF of the nodal displacements considering BC
[ucur_iter,RTsuppt]=RTDisplacement(dus,nDOF,BC);

% Initialize
iter = 1;
du_iter = zeros(nDOF,1);  % Initialize Current displacement for iteration 

while iter < niter  
    
   ucur_iter = ucur_iter+du_iter;

   [unew]=CurrentDisplacement(ucur_iter,N,nodedof); % including supports node
   
   [L,ul,dX,dY,dZ]=CurrentElelength(xg1,yg1,zg1,xg2,yg2,zg2,xn,unew,L0,MI);

   for i=1:length(MI(:,1))
     
      beta1x(i,1) = unew(MI(i,2),4); beta2x(i,1) = unew(MI(i,3),4);
      beta1y(i,1) = unew(MI(i,2),5); beta2y(i,1) = unew(MI(i,3),5);
      beta1z(i,1) = unew(MI(i,2),6); beta2z(i,1) = unew(MI(i,3),6);
      beta1xp(i,1) = unew(MI(i,2),7); beta2xp(i,1) = unew(MI(i,3),7);

   end
  
   % Reset variables
   K=zeros(nDOF);          % global stiffness matrix
   KtBB=zeros(nDOF);       % global stiffness matrix
   KggBB=zeros(nDOF);      % global stiffness matrix
   Fint=zeros(nDOF,1);     % global internal force vector
   DFG=zeros(nDOF,1);      % global internal force vector
   
   for n = 1:xn
      
      % Rigid offset
      Rd = eye(14);
      Rd(3,4)=rd1(n,1);Rd(10,11)=rd2(n,1); 
      Rd(1,6)=-rxd1(n,1)*cos(-angletap(n,2));Rd(8,13)=-rxd2(n,1)*cos(-angletap(n,2));
      Rd(2,6)=-rxd1(n,1)*sin(-angletap(n,2));Rd(9,13)=-rxd2(n,1)*sin(-angletap(n,2));

      % Rigid offset for Uniform Loads in Element Frame
      Ld = eye(14);
      Ld(1,6)=Lud1(n,1); Ld(8,13)=Lud2(n,1);  
      % Rigid offset for Self-weight in Element Frame
      Lsd = eye(14);
      Lsd(1,6)=CSD1(n,1); Lsd(8,13)=CSD2(n,1);           

      % Update Nodal Triads using global solution : Angle between Element frame and CR frame 
      [t1,t2,t3,u1,u2,u3] = UpdatedElementNodalTriadsTU(beta1x(n,1),beta2x(n,1),beta1y(n,1),beta2y(n,1),beta1z(n,1),beta2z(n,1),alphatap(n,2));
      [e1,e2,e3,Zetaavg,Zeta1,Zeta2,Eta1,Eta2] = ElementBaseVector(dX(n,1),dY(n,1),dZ(n,1),t2,u2,L(n,1),alphatap(n,2));
      et1=e1;et2=e2;et3=e3; % direction of co-rotational frame
      % Deformation in CR frame
      [theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn] = NaturalFrame(t1,t2,t3,u1,u2,u3,e1,e2,e3,beta1xp(n,1),beta2xp(n,1));
      [qno] = ElDisplacement(theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn,ul(n,1));
      [Pbar]=Projection(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1));

      [e1,e2,e3] = GlobalTransform(e1,e2,e3,alphatap(n,2));
      [Ge]=CoordTransform(e1,e2,e3); 
      
      DE=zeros(14,1); SE=zeros(14,1);
      if ~isempty(LUEC)
         [Kt,Kgg,Qino,Kh2,Gn]=StiffnessELEMENT3D([bfb1(n);bfb2(n)],...
            [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
            [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
            [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
            [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
            hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
            theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
            theta1xpn,theta2xpn,qno,LUNCe(n,2),LUEC(n,17),FEL(n,:));

         % Distributed Loads
         DE(2,1)=LUNCe(n,2)*L0(n,1)/2;
         DE(6,1)=LUNCe(n,2)*L0(n,1)^2/12;
         DE(9,1)=LUNCe(n,2)*L0(n,1)/2;
         DE(13,1)=-LUNCe(n,2)*L0(n,1)^2/12;
         DE(1,1)=LUNCe(n,1)*L0(n,1)/2;
         DE(8,1)=LUNCe(n,1)*L0(n,1)/2;
         DE(3,1)=LUNCe(n,3)*L0(n,1)/2;
         DE(10,1)=LUNCe(n,3)*L0(n,1)/2;

      else
         [Kt,Kgg,Qino,Kh2,Gn]=StiffnessELEMENT3DN([bfb1(n);bfb2(n)],...
            [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
            [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
            [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
            [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
            hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
            theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
            theta1xpn,theta2xpn,qno,FEL(n,:));   
      end

      if ~isempty(SUEC1)
         % Self Weight
         SE(2,1)=SUNCe1(n,2)*L0(n,1)/2;
         SE(6,1)=SUNCe1(n,2)*L0(n,1)^2/12;
         SE(9,1)=SUNCe2(n,2)*L0(n,1)/2;
         SE(13,1)=-SUNCe2(n,2)*L0(n,1)^2/12;

         SE(1,1)=SUNCe1(n,1)*L0(n,1)/2;
         SE(8,1)=SUNCe2(n,1)*L0(n,1)/2;

         SE(3,1)=SUNCe1(n,3)*L0(n,1)/2;
         SE(10,1)=SUNCe2(n,3)*L0(n,1)/2; 
      end
      
      % ------------- Distributed Load & Self weight S
      % Rigid offset for Supports in Element Frame
      Rsd = eye(14);
%       Rsd(3,4)=rd1(n);  Rsd(10,11)=rd2(n); 
      Rsd(1,6)=-rxd1(n); Rsd(8,13)=-rxd2(n);  
      
      [de1,de2,de3] = GlobalDisTransform(alpharef(n,2));      
      [GDe]=CoordTransform(de1,de2,de3);
      if isequal(increment,1)
         DG = GDe*Ld'*Rsd'*DE + GDe*Lsd'*Rsd'*SE;           
      else
         DG = GDe*Ld'*Rsd'*DE;           
      end 
      % ------------- Distributed Load & Self weight E
      
      % Interforce resultants w.r.t Element frame
      Qei = Pbar'*Qino;

      % Geometrix Stiffness
      [Kext1,Kext2]=ExternalGStiffness(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1),Qino);

      % Load Height.
      [Fe1,Fe2,M] = LoadHeight(d1(n),d2(n));

      % Interforce resultants w.r.t Global frame
      Qg =Ge*Qei;
      
      % Elastic Tangent Stiffness Matrix
      Kts = Ge*Rd'*(Pbar'*Kt*Pbar)*Rd*Ge';

      % Geometric Stiffness Matrix
      Kggs = Ge*Rd'*(Pbar'*Kgg*Pbar +((Kext1+Kext2)+ (Kext1+Kext2)')/2)*Rd*Ge'+GDe*M*(Fe1+Fe2+Kh2)*M'*GDe';

      % Total Stiffness
      Kg = Kts + Kggs;
      
      % Assemble
      % Total Stiffness
      [K,Fint,DFG] = assemble(K,Fint,DFG,Kg,Qg,DG,MI,n);
      % Elastic stiffness & Geometric stiffness
      [KtBB,KggBB] = assemble1(KtBB,KggBB,Kts,Kggs,MI,n);
      
   end
    
   Fints = Fint+KS*ucur_iter+KB*ucur_iter; % Internal forces in Global Frame
   % ---------------------------------------------------- Load Transform S
   [dFn]=CurrentDisplacement(Fints,N,nodedof); % including supports nodes;

   dFn1 = zeros(xn,7); dFn2 = zeros(xn,7);
   for i=1:xn
      for j=1:7
         dFn1(i,j)=dFn(MI(i,2),j); 
         dFn2(i,j)=dFn(MI(i,3),j);
      end
   end  

   % Load transform
   Fints=zeros(nDOF,1);
   for n=1:xn
      % Rigid offset for Supports in Element Frame
      Rsd = eye(14);
%       Rsd(3,4)=rd1(n);  Rsd(10,11)=rd2(n); 
      Rsd(1,6)=-rxd1(n); Rsd(8,13)=-rxd2(n);

      % Inverse Rotation from Global Frame to Element Frame
      RLz=[cos(-alpharef(n,2)) -sin(-alpharef(n,2)) 0; ...
         sin(-alpharef(n,2)) cos(-alpharef(n,2)) 0; ...
         0 0 1];
      eL1 = [1; 0; 0];eL1 = RLz*eL1;
      eL2 = [0; 1; 0];eL2 = RLz*eL2;
      eL3 = [0; 0; 1];eL3 = RLz*eL3;
   
      [GLe]=CoordTransform(eL1,eL2,eL3);
   
      % Load Transform using Rigid Offset within Element Frame
      % already LHd is included.
      Ft = Rsd'*GLe*[dFn1(n,:)'/Ldp1(n,2);dFn2(n,:)'/Ldp2(n,2)];
      
      % Rotation from Element Frame to Global Frame
      RRz=[cos(alpharef(n,2)) -sin(alpharef(n,2)) 0; ...
         sin(alpharef(n,2)) cos(alpharef(n,2)) 0; ...
         0 0 1];
      eR1 = [1; 0; 0];eR1 = RRz*eR1;
      eR2 = [0; 1; 0];eR2 = RRz*eR2;
      eR3 = [0; 0; 1];eR3 = RRz*eR3;

      [GRe]=CoordTransform(eR1,eR2,eR3);

      Ft=GRe*Ft;
   
      % Assemble
      [Fints] = assemble2(Fints,Ft,MI,n);
   end
   % ---------------------------------------------------- Load Transform E   
   % apply supports
   ind=(1:nDOF)';
   ind=ind(logical(BC(:,1)));
   Fints(ind,:)=[];

   R = Fints - Fn;  
%    norm = sqrt(R'*R);
   if isequal(iter,1)
      norm = sqrt(R'*R);
      normO=norm;
   else
      norm = sqrt(R'*R)/normO;
   end
   
   K=K+KS+KB;
   % Total Stiffness
   ind=(1:nDOF)';
   ind=ind(logical(BC(:,1)));
   K(ind,:)=[];
   K(:,ind)=[];  
 
   % Calculate the nodal displacements
   du1s_iter = -inv(K)*R;

   % Restoration DOF of the nodal displacements considering BC   
   [du_iter]=IterativeDisplacement(du1s_iter,nDOF,BC,RTsuppt);
	
   % Repeat iterations
   iter = iter + 1;
  
   if norm < tolerance    
       break
   end
   
end     % iteration end
%--------------------------------------------- 2nd internal E

      [unew]=CurrentDisplacement(du_iter,N,nodedof); % including supports nodes;

      unew1 = zeros(xn,7); unew2 = zeros(xn,7);
      for i=1:xn
         for j=1:7
            unew1(i,j)=unew(MI(i,2),j); 
            unew2(i,j)=unew(MI(i,3),j);
         end
      end    
%-------------------------------------------------------------------------
%-----------------              2nd Internal Taub E   --------------------
%-------------------------------------------------------------------------            
%       % set up initial values for global solution; Zero nodal displacements
%       % Initial imperfection
%       u = zeros(N,1); v = zeros(N,1); w = zeros(N,1);
%       wx = zeros(N,1); wy = zeros(N,1); wz = zeros(N,1); wxp = zeros(N,1);
% 
%       [L,L0,ul,dX,dY,dZ]=InitialEleVal(xn,xg1,yg1,zg1,xg2,yg2,zg2,u,v,w,MI);
% 
%       beta1x=zeros(xn,1);beta1y=zeros(xn,1);beta1z=zeros(xn,1);beta1xp=zeros(xn,1);
%       beta2x=zeros(xn,1);beta2y=zeros(xn,1);beta2z=zeros(xn,1);beta2xp=zeros(xn,1);
%       for i=1:xn
% 
%           beta1x(i,1) = wx(DUP1(i,1),1); beta2x(i,1) = wx(DUP2(i,1),1);
%           beta1y(i,1) = wy(DUP1(i,1),1); beta2y(i,1) = wy(DUP2(i,1),1);
%           beta1z(i,1) = wz(DUP1(i,1),1); beta2z(i,1) = wz(DUP2(i,1),1);
%           beta1xp(i,1) = wxp(DUP1(i,1),1); beta2xp(i,1) = wxp(DUP2(i,1),1);
% 
%       end
% 
%       % initialize variables
%       K=zeros(nDOF);          % global stiffness matrix
%       KtBB=zeros(nDOF);       % global tangent stiffness matrix
%       KggBB=zeros(nDOF);      % global geometry stiffness matrix
%       Fint=zeros(nDOF,1);     % global internal force vector
%       DFG=zeros(nDOF,1);     % global internal force vector
% 
%       for n = 1:xn
%          
%          % Rigid offset
%          Rd = eye(14);
%          Rd(3,4)=rd1(n,1);Rd(10,11)=rd2(n,1); 
%          Rd(1,6)=-rxd1(n,1)*cos(-angletap(n,2));Rd(8,13)=-rxd2(n,1)*cos(-angletap(n,2));
%          Rd(2,6)=-rxd1(n,1)*sin(-angletap(n,2));Rd(9,13)=-rxd2(n,1)*sin(-angletap(n,2));
% 
%          % Rigid offset for Uniform Loads in Element Frame
%          Ld = eye(14);
%          Ld(1,6)=Lud1(n,1); Ld(8,13)=Lud2(n,1);  
%          % Rigid offset for Self-weight in Element Frame
%          Lsd = eye(14);
%          Lsd(1,6)=CSD1(n,1); Lsd(8,13)=CSD2(n,1);         
% 
%          % Update Nodal Triads using global solution : Angle between Element frame and CR frame 
%          [t1,t2,t3,u1,u2,u3] = UpdatedElementNodalTriadsTU(beta1x(n,1),beta2x(n,1),beta1y(n,1),beta2y(n,1),beta1z(n,1),beta2z(n,1),alphatap(n,2));
%          [e1,e2,e3,Zetaavg,Zeta1,Zeta2,Eta1,Eta2] = ElementBaseVector(dX(n,1),dY(n,1),dZ(n,1),t2,u2,L(n,1),alphatap(n,2));
% 
%          % Deformation in CR frame
%          [theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn] = NaturalFrame(t1,t2,t3,u1,u2,u3,e1,e2,e3,beta1xp(n,1),beta2xp(n,1));
%          [qno] = ElDisplacement(theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn,ul(n,1));
%          [Pbar]=Projection(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1));
% 
%          [e1,e2,e3] = GlobalTransform(e1,e2,e3,alphatap(n,2));
%          [Ge]=CoordTransform(e1,e2,e3); 
% 
%          DE=zeros(14,1); SE=zeros(14,1);
%          if ~isempty(LUEC)
%             [Kt,Kgg,Qino,Kh2,Gn]=StiffnessELEMENT3D([bfb1(n);bfb2(n)],...
%                [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
%                [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
%                [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
%                [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
%                hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
%                theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
%                theta1xpn,theta2xpn,qno,LUNCe(n,2),LUEC(n,17),FEL(n,:));
% 
%             % Distributed Loads
%             DE(2,1)=LUNCe(n,2)*L0(n,1)/2;
%             DE(6,1)=LUNCe(n,2)*L0(n,1)^2/12;
%             DE(9,1)=LUNCe(n,2)*L0(n,1)/2;
%             DE(13,1)=-LUNCe(n,2)*L0(n,1)^2/12;
%             DE(1,1)=LUNCe(n,1)*L0(n,1)/2;
%             DE(8,1)=LUNCe(n,1)*L0(n,1)/2;
%             DE(3,1)=LUNCe(n,3)*L0(n,1)/2;
%             DE(10,1)=LUNCe(n,3)*L0(n,1)/2;
% 
%          else
%             [Kt,Kgg,Qino,Kh2,Gn]=StiffnessELEMENT3DN([bfb1(n);bfb2(n)],...
%                [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
%                [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
%                [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
%                [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
%                hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
%                theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
%                theta1xpn,theta2xpn,qno,FEL(n,:));   
%          end
% 
%          if ~isempty(SUEC1)
%             % Self Weight
%             SE(2,1)=SUNCe1(n,2)*L0(n,1)/2;
%             SE(6,1)=SUNCe1(n,2)*L0(n,1)^2/12;
%             SE(9,1)=SUNCe2(n,2)*L0(n,1)/2;
%             SE(13,1)=-SUNCe2(n,2)*L0(n,1)^2/12;
% 
%             SE(1,1)=SUNCe1(n,1)*L0(n,1)/2;
%             SE(8,1)=SUNCe2(n,1)*L0(n,1)/2;
% 
%             SE(3,1)=SUNCe1(n,3)*L0(n,1)/2;
%             SE(10,1)=SUNCe2(n,3)*L0(n,1)/2; 
%          end
% 
%          % ------------- Distributed Load & Self weight S
%          % Rigid offset for Supports in Element Frame
%          Rsd = eye(14);
%    %       Rsd(3,4)=rd1(n);  Rsd(10,11)=rd2(n); 
%          Rsd(1,6)=-rxd1(n); Rsd(8,13)=-rxd2(n);  
% 
%          [de1,de2,de3] = GlobalDisTransform(alpharef(n,2));      
%          [GDe]=CoordTransform(de1,de2,de3);   
%          DG = GDe*Ld'*Rsd'*DE + GDe*Lsd'*Rsd'*SE;     
%          % ------------- Distributed Load & Self weight E 
% 
%          % Interforce resultants w.r.t Element frame
%          Qei = Pbar'*Qino;
% 
%          % Geometrix Stiffness
%          [Kext1,Kext2]=ExternalGStiffness(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1),Qino);
% 
%          % Load Height.
%          [Fe1,Fe2,M] = LoadHeight(d1(n),d2(n));
% 
%          % Interforce resultants w.r.t Global frame
%          Qg =Ge*Qei;
% 
%          % Elastic Tangent Stiffness Matrix
%          Kts = Ge*Rd'*(Pbar'*Kt*Pbar)*Rd*Ge';
% 
%          % Geometric Stiffness Matrix
%          Kggs = Ge*Rd'*(Pbar'*Kgg*Pbar +((Kext1+Kext2)+ (Kext1+Kext2)')/2)*Rd*Ge'+GDe*M*(Fe1+Fe2+Kh2)*M'*GDe';
% 
%          % Total Stiffness
%          Kg = Kts + Kggs;
% 
%          % Assemble
%          % Total Stiffness
%          [K,Fint,DFG] = assemble(K,Fint,DFG,Kg,Qg,DG,MI,n);
%          % Elastic stiffness & Geometric stiffness
%          [KtBB,KggBB] = assemble1(KtBB,KggBB,Kts,Kggs,MI,n);
% 
%       end
% 
%       KtBB=KtBB+KS+KB;
%       % Distributed Load
%       ind=(1:nDOF)';
%       ind=ind(logical(BC(:,1)));
%       DFG(ind,:)=[];  
% 
% %       if isequal(increment,1)
% %          Fn = dF + lambda*DFG;
% %       end 
% 
%       % Elastic Tangent Stiffness
%       ind=(1:nDOF)';
%       ind=ind(logical(BC(:,1)));
%       KtBB(ind,:)=[];
%       KtBB(:,ind)=[];
%       
%       if rcond(KtBB) < (10^(-15))
%          if isequal(increment,1)
%             Bflag = 1;
%          else
%             Bflag = 2;
%          end
%          break;
%       end
%       
%       % Calculate the first nodal displacements
%       dus = KtBB\(Fn);     % 1st Elastic displacement
% 
%       % Restoration DOF of the nodal displacements considering BC
%       [du,RTsuppt]=RTDisplacement(dus,nDOF,BC);
% 
%       [unew]=CurrentDisplacement(du,N,nodedof); % including supports nodes;
% 
%       unew1 = zeros(xn,7); unew2 = zeros(xn,7);
%       for i=1:xn
%          for j=1:7
%             unew1(i,j)=unew(MI(i,2),j); 
%             unew2(i,j)=unew(MI(i,3),j);
%          end
%       end    
   
   % ------------------------------------------------------ tau_b S
   taub=zeros(5,xn);
   for n = 1:xn      
      % Update Nodal Triads using global solution : Angle between Element frame and CR frame 
      [t1,t2,t3,u1,u2,u3] = UpdatedElementNodalTriadsTU(beta1x(n,1),beta2x(n,1),beta1y(n,1),beta2y(n,1),beta1z(n,1),beta2z(n,1),alphatap(n,2));
      [e1,e2,e3,Zetaavg,Zeta1,Zeta2,Eta1,Eta2] = ElementBaseVector(dX(n,1),dY(n,1),dZ(n,1),t2,u2,L(n,1),alphatap(n,2));

      % Deformation in CR frame
      [theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn] = NaturalFrame(t1,t2,t3,u1,u2,u3,e1,e2,e3,beta1xp(n,1),beta2xp(n,1));
      [Pbar]=Projection(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1));

      [e1,e2,e3] = GlobalTransform(e1,e2,e3,alphatap(n,2));
      [Ge]=CoordTransform(e1,e2,e3); 
      qno=Pbar*Rd*Ge'*[unew1(n,:)';unew2(n,:)'];

      taub(:,n)=StiffnessELEMENT3Dtaub([bfb1(n);bfb2(n)],...
         [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
         [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
         [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
         [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
         hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
         theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
         theta1xpn,theta2xpn,qno,Fy(n,1),Fyfi(n,1),Fyw(n,1),Fyfo(n,1),[ytbar1(n);ytbar2(n)],Pbar,FEL(n,:),HomoType(n,1),angletap(n,2),CSangel(n,2));    
   end   
   % ------------------------------------------------------- tau_b E      
   %--------------------------------------------------------------------
   %------------------            tau_b E         ----------------------
   %-------------------------------------------------------------------- 

   % set up initial values for global solution; Zero nodal displacements
   % Initial imperfection
   u = zeros(N,1); v = zeros(N,1); w = zeros(N,1);
   wx = zeros(N,1); wy = zeros(N,1); wz = zeros(N,1); wxp = zeros(N,1);

   [L,L0,ul,dX,dY,dZ]=InitialEleVal(xn,xg1,yg1,zg1,xg2,yg2,zg2,u,v,w,MI);

   beta1x=zeros(xn,1);beta1y=zeros(xn,1);beta1z=zeros(xn,1);beta1xp=zeros(xn,1);
   beta2x=zeros(xn,1);beta2y=zeros(xn,1);beta2z=zeros(xn,1);beta2xp=zeros(xn,1);

   for i=1:xn

       beta1x(i,1) = wx(DUP1(i,1),1); beta2x(i,1) = wx(DUP2(i,1),1);
       beta1y(i,1) = wy(DUP1(i,1),1); beta2y(i,1) = wy(DUP2(i,1),1);
       beta1z(i,1) = wz(DUP1(i,1),1); beta2z(i,1) = wz(DUP2(i,1),1);
       beta1xp(i,1) = wxp(DUP1(i,1),1); beta2xp(i,1) = wxp(DUP2(i,1),1);

   end

   %--------------------------------------------------------------------
   %------------------   Calculate Displacement  -----------------------
   %--------------------------------------------------------------------
   % initialize variables
   K=zeros(nDOF);          % global stiffness matrix
   KtBB=zeros(nDOF);       % global tangent stiffness matrix
   KggBB=zeros(nDOF);      % global geometry stiffness matrix
   Fint=zeros(nDOF,1);     % global internal force vector
   DFG=zeros(nDOF,1);     % global internal force vector
   
   Pt=zeros(5,xn);Mzt=zeros(5,xn);
   
   for n = 1:xn
      
      % Rigid offset
      Rd = eye(14);
      Rd(3,4)=rd1(n,1);Rd(10,11)=rd2(n,1); 
      Rd(1,6)=-rxd1(n,1)*cos(-angletap(n,2));Rd(8,13)=-rxd2(n,1)*cos(-angletap(n,2));
      Rd(2,6)=-rxd1(n,1)*sin(-angletap(n,2));Rd(9,13)=-rxd2(n,1)*sin(-angletap(n,2));

      % Rigid offset for Uniform Loads in Element Frame
      Ld = eye(14);
      Ld(1,6)=Lud1(n,1); Ld(8,13)=Lud2(n,1);  
      % Rigid offset for Self-weight in Element Frame
      Lsd = eye(14);
      Lsd(1,6)=CSD1(n,1); Lsd(8,13)=CSD2(n,1);    

      % Update Nodal Triads using global solution : Angle between Element frame and CR frame 
      [t1,t2,t3,u1,u2,u3] = UpdatedElementNodalTriadsTU(beta1x(n,1),beta2x(n,1),beta1y(n,1),beta2y(n,1),beta1z(n,1),beta2z(n,1),alphatap(n,2));
      [e1,e2,e3,Zetaavg,Zeta1,Zeta2,Eta1,Eta2] = ElementBaseVector(dX(n,1),dY(n,1),dZ(n,1),t2,u2,L(n,1),alphatap(n,2));
      et1=e1;et2=e2;et3=e3; % direction of co-rotational frame
      % Deformation in CR frame
      [theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn] = NaturalFrame(t1,t2,t3,u1,u2,u3,e1,e2,e3,beta1xp(n,1),beta2xp(n,1));
      [qno] = ElDisplacement(theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn,ul(n,1));
      [Pbar]=Projection(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1));

      [e1,e2,e3] = GlobalTransform(e1,e2,e3,alphatap(n,2));
      [Ge]=CoordTransform(e1,e2,e3); 
      
      DE=zeros(14,1); SE=zeros(14,1);
      if ~isempty(LUEC)
         [Kt,Kgg,Qino,Kh2,Gn,Pt(:,n),Mzt(:,n)]=StiffnessELEMENT3DKGDM([bfb1(n);bfb2(n)],...
            [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
            [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
            [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
            [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
            hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
            theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
            theta1xpn,theta2xpn,qno,LUNCe(n,2),LUEC(n,17),Pbar,FEL(n,:),slender(:,n),ap_da_buttongroup,angletap(n,2),CSangel(n,2),et1,et2,et3,taub(:,n));
         
         % Distributed Loads
         DE(2,1)=LUNCe(n,2)*L0(n,1)/2;
         DE(6,1)=LUNCe(n,2)*L0(n,1)^2/12;
         DE(9,1)=LUNCe(n,2)*L0(n,1)/2;
         DE(13,1)=-LUNCe(n,2)*L0(n,1)^2/12;
         DE(1,1)=LUNCe(n,1)*L0(n,1)/2;
         DE(8,1)=LUNCe(n,1)*L0(n,1)/2;
         DE(3,1)=LUNCe(n,3)*L0(n,1)/2;
         DE(10,1)=LUNCe(n,3)*L0(n,1)/2;
                
      else
         [Kt,Kgg,Qino,Kh2,Gn,Pt(:,n),Mzt(:,n)]=StiffnessELEMENT3DNKGDM([bfb1(n);bfb2(n)],...
            [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
            [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
            [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
            [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
            hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
            theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
            theta1xpn,theta2xpn,qno,Pbar,FEL(n,:),slender(:,n),ap_da_buttongroup,angletap(n,2),CSangel(n,2),et1,et2,et3,taub(:,n));   
      end    

      if ~isempty(SUEC1)
         % Self Weight
         SE(2,1)=SUNCe1(n,2)*L0(n,1)/2;
         SE(6,1)=SUNCe1(n,2)*L0(n,1)^2/12;
         SE(9,1)=SUNCe2(n,2)*L0(n,1)/2;
         SE(13,1)=-SUNCe2(n,2)*L0(n,1)^2/12;

         SE(1,1)=SUNCe1(n,1)*L0(n,1)/2;
         SE(8,1)=SUNCe2(n,1)*L0(n,1)/2;

         SE(3,1)=SUNCe1(n,3)*L0(n,1)/2;
         SE(10,1)=SUNCe2(n,3)*L0(n,1)/2; 
      end

      % ------------- Distributed Load & Self weight S
      % Rigid offset for Supports in Element Frame
      Rsd = eye(14);
%       Rsd(3,4)=rd1(n);  Rsd(10,11)=rd2(n); 
      Rsd(1,6)=-rxd1(n); Rsd(8,13)=-rxd2(n);  

      [de1,de2,de3] = GlobalDisTransform(alpharef(n,2));      
      [GDe]=CoordTransform(de1,de2,de3);
      if isequal(increment,1)
         DG = GDe*Ld'*Rsd'*DE + GDe*Lsd'*Rsd'*SE;           
      else
         DG = GDe*Ld'*Rsd'*DE;           
      end 
      % ------------- Distributed Load & Self weight E 
      
      % Interforce resultants w.r.t Element frame
      Qei = Pbar'*Qino;

      % Geometrix Stiffness
      [Kext1,Kext2]=ExternalGStiffness(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1),Qino);

      % Load Height.
      [Fe1,Fe2,M] = LoadHeight(d1(n),d2(n));

      % Interforce resultants w.r.t Global frame
      Qg =Ge*Qei;

      % Elastic Tangent Stiffness Matrix
      Kts = Ge*Rd'*(Pbar'*Kt*Pbar)*Rd*Ge';

      % Geometric Stiffness Matrix
      Kggs = Ge*Rd'*(Pbar'*Kgg*Pbar +((Kext1+Kext2)+ (Kext1+Kext2)')/2)*Rd*Ge'+GDe*M*(Fe1+Fe2+Kh2)*M'*GDe';

      % Total Stiffness
      Kg = Kts + Kggs;
      
      % Assemble
      % Total Stiffness
      [K,Fint,DFG] = assemble(K,Fint,DFG,Kg,Qg,DG,MI,n);
      % Elastic stiffness & Geometric stiffness
      [KtBB,KggBB] = assemble1(KtBB,KggBB,Kts,Kggs,MI,n);

   end

   K=K+KS+KB;

   % Total Stiffness 
   ind=(1:nDOF)';
   ind=ind(logical(BC(:,1)));
   K(ind,:)=[];
   K(:,ind)=[];   

   if rcond(K) < (10^(-15))
      if isequal(increment,1)
         Bflag = 1;
      else
         Bflag = 2;
      end
      break;
   end    
   % Calculate the first nodal displacements
   dus = K\(Fn);     % 2nd Elastic displacement

   % Restoration DOF of the nodal displacements considering BC
   [du,RTsuppt]=RTDisplacement(dus,nDOF,BC);
    
   % Initialize
   ucur = zeros(nDOF,1);       % Initialize Current displacement for loading incremente
   ucur_iter = zeros(nDOF,1);  % Initialize Current displacement for iteration 
  
   ucur = ucur+du;

   [unew]=CurrentDisplacement(ucur,N,nodedof); % including supports nodes;

   [L,ul,dX,dY,dZ]=CurrentElelength(xg1,yg1,zg1,xg2,yg2,zg2,xn,unew,L0,MI);

   for i=1:xn

      beta1x(i,1) = unew(MI(i,2),4); beta2x(i,1) = unew(MI(i,3),4);
      beta1y(i,1) = unew(MI(i,2),5); beta2y(i,1) = unew(MI(i,3),5);
      beta1z(i,1) = unew(MI(i,2),6); beta2z(i,1) = unew(MI(i,3),6);
      beta1xp(i,1) = unew(MI(i,2),7); beta2xp(i,1) = unew(MI(i,3),7);

   end

   %--------------------------------------------------------------------
   %------- Calculate Internal Forces & Geometric Stiffness  -----------
   %--------------------------------------------------------------------    
   % initialize variables
   K=zeros(nDOF);          % global stiffness matrix
   KtBB=zeros(nDOF);       % global tangent stiffness matrix
   KggBB=zeros(nDOF);      % global geometry stiffness matrix
   Fint=zeros(nDOF,1);     % global internal force vector
   DFG=zeros(nDOF,1);      % global internal force vector
   
   Pt=zeros(5,xn);Mzt=zeros(5,xn);
   
   for n = 1:xn
      
      % Rigid offset
      Rd = eye(14);
      Rd(3,4)=rd1(n,1);Rd(10,11)=rd2(n,1); 
      Rd(1,6)=-rxd1(n,1)*cos(-angletap(n,2));Rd(8,13)=-rxd2(n,1)*cos(-angletap(n,2));
      Rd(2,6)=-rxd1(n,1)*sin(-angletap(n,2));Rd(9,13)=-rxd2(n,1)*sin(-angletap(n,2));

      % Rigid offset for Uniform Loads in Element Frame
      Ld = eye(14);
      Ld(1,6)=Lud1(n,1); Ld(8,13)=Lud2(n,1);  
      % Rigid offset for Self-weight in Element Frame
      Lsd = eye(14);
      Lsd(1,6)=CSD1(n,1); Lsd(8,13)=CSD2(n,1);         

      % Update Nodal Triads using global solution : Angle between Element frame and CR frame 
      [t1,t2,t3,u1,u2,u3] = UpdatedElementNodalTriadsTU(beta1x(n,1),beta2x(n,1),beta1y(n,1),beta2y(n,1),beta1z(n,1),beta2z(n,1),alphatap(n,2));
      [e1,e2,e3,Zetaavg,Zeta1,Zeta2,Eta1,Eta2] = ElementBaseVector(dX(n,1),dY(n,1),dZ(n,1),t2,u2,L(n,1),alphatap(n,2));
      et1=e1;et2=e2;et3=e3; % direction of co-rotational frame
      % Deformation in CR frame
      [theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn] = NaturalFrame(t1,t2,t3,u1,u2,u3,e1,e2,e3,beta1xp(n,1),beta2xp(n,1));
      [qno] = ElDisplacement(theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn,ul(n,1));
      [Pbar]=Projection(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1));

      [e1,e2,e3] = GlobalTransform(e1,e2,e3,alphatap(n,2));
      [Ge]=CoordTransform(e1,e2,e3); 

      DE=zeros(14,1); SE=zeros(14,1);
      if ~isempty(LUEC)
         [Kt,Kgg,Qino,Kh2,Gn,Pt(:,n),Mzt(:,n)]=StiffnessELEMENT3DKGDM([bfb1(n);bfb2(n)],...
            [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
            [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
            [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
            [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
            hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
            theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
            theta1xpn,theta2xpn,qno,LUNCe(n,2),LUEC(n,17),Pbar,FEL(n,:),slender(:,n),ap_da_buttongroup,angletap(n,2),CSangel(n,2),et1,et2,et3,taub(:,n));
         
         % Distributed Loads
         DE(2,1)=LUNCe(n,2)*L0(n,1)/2;
         DE(6,1)=LUNCe(n,2)*L0(n,1)^2/12;
         DE(9,1)=LUNCe(n,2)*L0(n,1)/2;
         DE(13,1)=-LUNCe(n,2)*L0(n,1)^2/12;
         DE(1,1)=LUNCe(n,1)*L0(n,1)/2;
         DE(8,1)=LUNCe(n,1)*L0(n,1)/2;
         DE(3,1)=LUNCe(n,3)*L0(n,1)/2;
         DE(10,1)=LUNCe(n,3)*L0(n,1)/2;
                
      else
         [Kt,Kgg,Qino,Kh2,Gn,Pt(:,n),Mzt(:,n)]=StiffnessELEMENT3DNKGDM([bfb1(n);bfb2(n)],...
            [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
            [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
            [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
            [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
            hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
            theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
            theta1xpn,theta2xpn,qno,Pbar,FEL(n,:),slender(:,n),ap_da_buttongroup,angletap(n,2),CSangel(n,2),et1,et2,et3,taub(:,n));   
      end      

      if ~isempty(SUEC1)
         % Self Weight
         SE(2,1)=SUNCe1(n,2)*L0(n,1)/2;
         SE(6,1)=SUNCe1(n,2)*L0(n,1)^2/12;
         SE(9,1)=SUNCe2(n,2)*L0(n,1)/2;
         SE(13,1)=-SUNCe2(n,2)*L0(n,1)^2/12;

         SE(1,1)=SUNCe1(n,1)*L0(n,1)/2;
         SE(8,1)=SUNCe2(n,1)*L0(n,1)/2;

         SE(3,1)=SUNCe1(n,3)*L0(n,1)/2;
         SE(10,1)=SUNCe2(n,3)*L0(n,1)/2; 
      end
      
      % ------------- Distributed Load & Self weight S
      % Rigid offset for Supports in Element Frame
      Rsd = eye(14);
%       Rsd(3,4)=rd1(n);  Rsd(10,11)=rd2(n); 
      Rsd(1,6)=-rxd1(n); Rsd(8,13)=-rxd2(n);  

      [de1,de2,de3] = GlobalDisTransform(alpharef(n,2));      
      [GDe]=CoordTransform(de1,de2,de3);
      if isequal(increment,1)
         DG = GDe*Ld'*Rsd'*DE + GDe*Lsd'*Rsd'*SE;           
      else
         DG = GDe*Ld'*Rsd'*DE;           
      end 
      % ------------- Distributed Load & Self weight E 
      
      % Interforce resultants w.r.t Element frame
      Qei = Pbar'*Qino;

      % Geometrix Stiffness
      [Kext1,Kext2]=ExternalGStiffness(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1),Qino);

      % Load Height.
      [Fe1,Fe2,M] = LoadHeight(d1(n),d2(n));

      % Interforce resultants w.r.t Global frame
      Qg =Ge*Qei;

      % Elastic Tangent Stiffness Matrix
      Kts = Ge*Rd'*(Pbar'*Kt*Pbar)*Rd*Ge';

      % Geometric Stiffness Matrix
      Kggs = Ge*Rd'*(Pbar'*Kgg*Pbar +((Kext1+Kext2)+ (Kext1+Kext2)')/2)*Rd*Ge'+GDe*M*(Fe1+Fe2+Kh2)*M'*GDe';

      % Total Stiffness
      Kg = Kts + Kggs;
      
      % Assemble
      % Total Stiffness
      [K,Fint,DFG] = assemble(K,Fint,DFG,Kg,Qg,DG,MI,n);
      % Elastic stiffness & Geometric stiffness
      [KtBB,KggBB] = assemble1(KtBB,KggBB,Kts,Kggs,MI,n);
      
   end
   
   K=K+KS+KB;    
   
   % Total Stiffness 
   ind=(1:nDOF)';
   ind=ind(logical(BC(:,1)));
   K(ind,:)=[];
   K(:,ind)=[];
  
   if rcond(K) < (10^(-15))
      Bflag = 2;
      break;
   end 
   % Calculate the nodal displacements
   du1s = K\(Fn);        % du1s = inv(K)*dF;

   % Restoration DOF of the nodal displacements considering BC
   [du_iter]=IterativeDisplacement(du1s,nDOF,BC,RTsuppt);
 
   
   if increment >1
      LH_gammma = max(Fn./Fn0);
      % -----------------------------------------------------------------
      % ------------            Update Load Height.         -------------
      % -----------------------------------------------------------------
      hd1=zeros(xn,1); hd2=zeros(xn,1);
      d1=zeros(xn,1);  d2=zeros(xn,1);

      if ~isempty(LNC)
         LNCe1=zeros(xn,3);
         LNCe2=zeros(xn,3);

         for i=1:xn
            Rz=[cos(-alpharef(i,2)) -sin(-alpharef(i,2)) 0; ...
            sin(-alpharef(i,2)) cos(-alpharef(i,2)) 0; ...
            0 0 1];

            LNCe1(i,:)=LH_gammma*Rz*[LNC1(i,5);LNC1(i,6);LNC1(i,7)];
            LNCe2(i,:)=LH_gammma*Rz*[LNC2(i,5);LNC2(i,6);LNC2(i,7)];

            if isequal(LNC1(i,13),1) || isequal(LNC1(i,13),0)% None
               hd1(i,1)=0;
            elseif isequal(LNC1(i,13),2) % Top
               hd1(i,1)=hst1(i,1)+tft1(i,1)/2 +LNC1(i,12);
            elseif isequal(LNC1(i,13),3) % Bottom
               hd1(i,1)=-(hsb1(i,1)+tfb1(i,1)/2 +LNC1(i,12) );
            elseif isequal(LNC1(i,13),4) % Centroid
               hd1(i,1)=-( CSD1(i,1) +LNC1(i,12) );  
            elseif isequal(LNC1(i,13),5) % Mid-Web
               hd1(i,1)=hst1(i,1)-tft1(i,1)/2-Dt1(i,1) +LNC1(i,12);               
            end

            if isequal(LNC2(i,13),1) || isequal(LNC2(i,13),0)% None
               hd2(i,1)=0;
            elseif isequal(LNC2(i,13),2) % Top
               hd2(i,1)=hst2(i,1)+tft2(i,1)/2 +LNC2(i,12);
            elseif isequal(LNC2(i,13),3) % Bottom
               hd2(i,1)=-(hsb2(i,1)+tfb2(i,1)/2 +LNC2(i,12) );
            elseif isequal(LNC2(i,13),4) % Centroid
               hd2(i,1)=-( CSD2(i,1)+LNC2(i,12) );   
            elseif isequal(LNC2(i,13),5) % Mid-Web
               hd2(i,1)=hst2(i,1)-tft2(i,1)/2-Dt2(i,1) +LNC2(i,12);                  
            end

            d1(i,1)=LNCe1(i,2)*hd1(i,1)/2;
            d2(i,1)=LNCe2(i,2)*hd2(i,1)/2;
         end
      end      
   end   

   iter = 1;
   while iter < niter  

      ucur_iter = ucur_iter+du_iter;

      [unew]=CurrentDisplacement(ucur_iter,N,nodedof); % including supports nodes

      [L,ul,dX,dY,dZ]=CurrentElelength(xg1,yg1,zg1,xg2,yg2,zg2,xn,unew,L0,MI);

      for i=1:length(MI(:,1))

         beta1x(i,1) = unew(MI(i,2),4); beta2x(i,1) = unew(MI(i,3),4);
         beta1y(i,1) = unew(MI(i,2),5); beta2y(i,1) = unew(MI(i,3),5);
         beta1z(i,1) = unew(MI(i,2),6); beta2z(i,1) = unew(MI(i,3),6);
         beta1xp(i,1) = unew(MI(i,2),7); beta2xp(i,1) = unew(MI(i,3),7);

      end

      % initialize variables
      K=zeros(nDOF);          % global stiffness matrix
      KtBB=zeros(nDOF);       % global stiffness matrix
      KggBB=zeros(nDOF);      % global stiffness matrix
      Fint=zeros(nDOF,1);     % global internal force vector
      DFG=zeros(nDOF,1);      % global internal force vector
      
      Pt=zeros(5,xn);Mzt=zeros(5,xn);
      
      for n = 1:xn
         
         % Rigid offset
         Rd = eye(14);
         Rd(3,4)=rd1(n,1);Rd(10,11)=rd2(n,1); 
         Rd(1,6)=-rxd1(n,1)*cos(-angletap(n,2));Rd(8,13)=-rxd2(n,1)*cos(-angletap(n,2));
         Rd(2,6)=-rxd1(n,1)*sin(-angletap(n,2));Rd(9,13)=-rxd2(n,1)*sin(-angletap(n,2));

         % Rigid offset for Uniform Loads in Element Frame
         Ld = eye(14);
         Ld(1,6)=Lud1(n,1); Ld(8,13)=Lud2(n,1);  
         % Rigid offset for Self-weight in Element Frame
         Lsd = eye(14);
         Lsd(1,6)=CSD1(n,1); Lsd(8,13)=CSD2(n,1);         

         % Update Nodal Triads using global solution : Angle between Element frame and CR frame 
         [t1,t2,t3,u1,u2,u3] = UpdatedElementNodalTriadsTU(beta1x(n,1),beta2x(n,1),beta1y(n,1),beta2y(n,1),beta1z(n,1),beta2z(n,1),alphatap(n,2));
         [e1,e2,e3,Zetaavg,Zeta1,Zeta2,Eta1,Eta2] = ElementBaseVector(dX(n,1),dY(n,1),dZ(n,1),t2,u2,L(n,1),alphatap(n,2));
         et1=e1;et2=e2;et3=e3; % direction of co-rotational frame
         % Deformation in CR frame
         [theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn] = NaturalFrame(t1,t2,t3,u1,u2,u3,e1,e2,e3,beta1xp(n,1),beta2xp(n,1));
         [qno] = ElDisplacement(theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn,ul(n,1));
         [Pbar]=Projection(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1));

         [e1,e2,e3] = GlobalTransform(e1,e2,e3,alphatap(n,2));
         [Ge]=CoordTransform(e1,e2,e3); 

         DE=zeros(14,1); SE=zeros(14,1);
         if ~isempty(LUEC)
            [Kt,Kgg,Qino,Kh2,Gn,Pt(:,n),Mzt(:,n)]=StiffnessELEMENT3DKGDM([bfb1(n);bfb2(n)],...
               [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
               [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
               [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
               [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
               hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
               theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
               theta1xpn,theta2xpn,qno,LUNCe(n,2),LUEC(n,17),Pbar,FEL(n,:),slender(:,n),ap_da_buttongroup,angletap(n,2),CSangel(n,2),et1,et2,et3,taub(:,n));

            % Distributed Loads
            DE(2,1)=LUNCe(n,2)*L0(n,1)/2;
            DE(6,1)=LUNCe(n,2)*L0(n,1)^2/12;
            DE(9,1)=LUNCe(n,2)*L0(n,1)/2;
            DE(13,1)=-LUNCe(n,2)*L0(n,1)^2/12;
            DE(1,1)=LUNCe(n,1)*L0(n,1)/2;
            DE(8,1)=LUNCe(n,1)*L0(n,1)/2;
            DE(3,1)=LUNCe(n,3)*L0(n,1)/2;
            DE(10,1)=LUNCe(n,3)*L0(n,1)/2;

         else
            [Kt,Kgg,Qino,Kh2,Gn,Pt(:,n),Mzt(:,n)]=StiffnessELEMENT3DNKGDM([bfb1(n);bfb2(n)],...
               [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
               [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
               [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
               [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
               hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
               theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
               theta1xpn,theta2xpn,qno,Pbar,FEL(n,:),slender(:,n),ap_da_buttongroup,angletap(n,2),CSangel(n,2),et1,et2,et3,taub(:,n));   
         end         

         if ~isempty(SUEC1)
            % Self Weight
            SE(2,1)=SUNCe1(n,2)*L0(n,1)/2;
            SE(6,1)=SUNCe1(n,2)*L0(n,1)^2/12;
            SE(9,1)=SUNCe2(n,2)*L0(n,1)/2;
            SE(13,1)=-SUNCe2(n,2)*L0(n,1)^2/12;

            SE(1,1)=SUNCe1(n,1)*L0(n,1)/2;
            SE(8,1)=SUNCe2(n,1)*L0(n,1)/2;

            SE(3,1)=SUNCe1(n,3)*L0(n,1)/2;
            SE(10,1)=SUNCe2(n,3)*L0(n,1)/2; 
         end

         % ------------- Distributed Load & Self weight S
         % Rigid offset for Supports in Element Frame
         Rsd = eye(14);
%          Rsd(3,4)=rd1(n);  Rsd(10,11)=rd2(n); 
         Rsd(1,6)=-rxd1(n); Rsd(8,13)=-rxd2(n);  

         [de1,de2,de3] = GlobalDisTransform(alpharef(n,2));      
         [GDe]=CoordTransform(de1,de2,de3);
         if isequal(increment,1)
            DG = GDe*Ld'*Rsd'*DE + GDe*Lsd'*Rsd'*SE;           
         else
            DG = GDe*Ld'*Rsd'*DE;           
         end 
         % ------------- Distributed Load & Self weight E

         % Interforce resultants w.r.t Element frame
         Qei = Pbar'*Qino;

         % Geometrix Stiffness
         [Kext1,Kext2]=ExternalGStiffness(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1),Qino);

         % Load Height.
         [Fe1,Fe2,M] = LoadHeight(d1(n),d2(n));

         % Interforce resultants w.r.t Global frame
         Qg =Ge*Qei;

         % --------------- Save Internal Force S
         QeiD = Pbar'*Qino;
         % -- Postprocessing for Moment from SC to Centroid S
         [det1,det2,det3] = GlobalDisTransform(angletap(n,2));
         [GDet]=CoordTransform(det1,det2,det3);  
         [GDetc]=CoordTransform(et1,et2,et3); 
         QeiDt = GDet*GDetc*Pbar'*Qino;
         % -- Postprocessing for Moment from SC to Centroid E
         % Update Internal Moment w.r.t centroidal axis
         QeiD(6,1) = QeiD(6,1) + QeiDt(1,1)*(yc1(n,1)-ys1(n,1));
         QeiD(13,1) = QeiD(13,1) + QeiDt(8,1)*(yc2(n,1)-ys2(n,1));        
         if ~isempty(SUEC1)
            if isequal(increment,1)
               QeiD(2,1)=-SE(2,1)+QeiD(2,1);
               QeiD(9,1)=-SE(9,1)+QeiD(9,1);            
               QeiD(6,1)=-SE(6,1)+QeiD(6,1);
               QeiD(13,1)=-SE(13,1)+QeiD(13,1);             
            else
               QeiD(2,1)=-SE(2,1)*LH_gammma+QeiD(2,1);
               QeiD(9,1)=-SE(9,1)*LH_gammma+QeiD(9,1);        
               QeiD(6,1)=-SE(6,1)*LH_gammma+QeiD(6,1);
               QeiD(13,1)=-SE(13,1)*LH_gammma+QeiD(13,1);              
            end
         end  

         if ~isempty(LUEC)
            if isequal(increment,1)
               QeiD(2,1)=-DE(2,1)+QeiD(2,1);
               QeiD(9,1)=-DE(9,1)+QeiD(9,1);
               QeiD(6,1)=-DE(6,1)+QeiD(6,1);
               QeiD(13,1)=-DE(13,1)+QeiD(13,1);             
            else
               QeiD(2,1)=-DE(2,1)*LH_gammma+QeiD(2,1);
               QeiD(9,1)=-DE(9,1)*LH_gammma+QeiD(9,1);       
               QeiD(6,1)=-DE(6,1)*LH_gammma+QeiD(6,1);
               QeiD(13,1)=-DE(13,1)*LH_gammma+QeiD(13,1);                
            end

         end       
         QgD =Ge*QeiD;  
         Qing(n,:) = QgD(:);  
         % Postprocessing for Axial and Shear force from SC to Centroid
         [dec1,dec2,dec3] = GlobalDisTransform(-CSangel(n,2));
         [GDec]=CoordTransform(dec1,dec2,dec3);          
         QeiDc = GDec*Pbar'*Qino;     
         QeiD(1,1)=QeiDc(1,1); 
         QeiD(2,1)=QeiDc(2,1);
         QeiD(8,1)=QeiDc(8,1); 
         QeiD(9,1)=QeiDc(9,1); 
         if ~isempty(SUEC1)
            if isequal(increment,1)
               QeiD(2,1)=-SE(2,1)+QeiD(2,1);       
               QeiD(9,1)=-SE(9,1)+QeiD(9,1);  
            else
               QeiD(2,1)=-SE(2,1)*LH_gammma+QeiD(2,1);       
               QeiD(9,1)=-SE(9,1)*LH_gammma+QeiD(9,1);                 
            end
         end
         if ~isempty(LUEC)
            if isequal(increment,1)
               QeiD(2,1)=-DE(2,1)+QeiD(2,1);       
               QeiD(9,1)=-DE(9,1)+QeiD(9,1); 
            else
               QeiD(2,1)=-DE(2,1)*LH_gammma+QeiD(2,1);       
               QeiD(9,1)=-DE(9,1)*LH_gammma+QeiD(9,1);                 
            end
         end          
         Qin(n,:) = QeiD(:);         
         % --------------- Save Internal Force E 

         % Elastic Tangent Stiffness Matrix
         Kts = Ge*Rd'*(Pbar'*Kt*Pbar)*Rd*Ge';

         % Geometric Stiffness Matrix
         Kggs = Ge*Rd'*(Pbar'*Kgg*Pbar +((Kext1+Kext2)+ (Kext1+Kext2)')/2)*Rd*Ge'+GDe*M*(Fe1+Fe2+Kh2)*M'*GDe';

         % Total Stiffness
         Kg = Kts + Kggs;

         % Assemble
         % Total Stiffness
         [K,Fint,DFG] = assemble(K,Fint,DFG,Kg,Qg,DG,MI,n);
         % Elastic stiffness & Geometric stiffness
         [KtBB,KggBB] = assemble1(KtBB,KggBB,Kts,Kggs,MI,n);

      end

      Fints = Fint+KS*ucur_iter+KB*ucur_iter;
      % ---------------------------------------------------- Load Transform S
      [dFn]=CurrentDisplacement(Fints,N,nodedof); % including supports nodes;

      dFn1 = zeros(xn,7); dFn2 = zeros(xn,7);
      for i=1:xn
         for j=1:7
            dFn1(i,j)=dFn(MI(i,2),j); 
            dFn2(i,j)=dFn(MI(i,3),j);
         end
      end  

      % Load transform
      Fints=zeros(nDOF,1);
      for n=1:xn
         % Rigid offset for Supports in Element Frame
         Rsd = eye(14);
%          Rsd(3,4)=rd1(n);  Rsd(10,11)=rd2(n); 
         Rsd(1,6)=-rxd1(n); Rsd(8,13)=-rxd2(n);

         % Inverse Rotation from Global Frame to Element Frame
         RLz=[cos(-alpharef(n,2)) -sin(-alpharef(n,2)) 0; ...
            sin(-alpharef(n,2)) cos(-alpharef(n,2)) 0; ...
            0 0 1];
         eL1 = [1; 0; 0];eL1 = RLz*eL1;
         eL2 = [0; 1; 0];eL2 = RLz*eL2;
         eL3 = [0; 0; 1];eL3 = RLz*eL3;

         [GLe]=CoordTransform(eL1,eL2,eL3);

         % Load Transform using Rigid Offset within Element Frame
         % already LHd is included.             
         Ft = Rsd'*GLe*[dFn1(n,:)'/Ldp1(n,2);dFn2(n,:)'/Ldp2(n,2)];

         % Rotation from Element Frame to Global Frame
         RRz=[cos(alpharef(n,2)) -sin(alpharef(n,2)) 0; ...
            sin(alpharef(n,2)) cos(alpharef(n,2)) 0; ...
            0 0 1];
         eR1 = [1; 0; 0];eR1 = RRz*eR1;
         eR2 = [0; 1; 0];eR2 = RRz*eR2;
         eR3 = [0; 0; 1];eR3 = RRz*eR3;

         [GRe]=CoordTransform(eR1,eR2,eR3);

         Ft=GRe*Ft;

         % Assemble
         [Fints] = assemble2(Fints,Ft,MI,n);
      end
      % ---------------------------------------------------- Load Transform E    
      % apply supports
      ind=(1:nDOF)';
      ind=ind(logical(BC(:,1)));
      Fints(ind,:)=[];

      R = Fints - Fn;  
%       norm = sqrt(R'*R);
      if isequal(iter,1)
         norm = sqrt(R'*R);
         normO=norm;
      else
         norm = sqrt(R'*R)/normO;
      end
   
      K=K+KS+KB;
      % Total Stiffness
      ind=(1:nDOF)';
      ind=ind(logical(BC(:,1)));
      K(ind,:)=[];
      K(:,ind)=[]; 

      % Geometric Stiffness
      ind=(1:nDOF)';
      ind=ind(logical(BC(:,1)));
      KggBB(ind,:)=[];
      KggBB(:,ind)=[]; 
      
      if rcond(K) < (10^(-15))
         Bflag = 2;
         break;
      end 
      % Calculate the nodal displacements
      du1s_iter = -inv(K)*R;

      % Restoration DOF of the nodal displacements considering BC   
      [du_iter]=IterativeDisplacement(du1s_iter,nDOF,BC,RTsuppt);

      % Repeat iterations
      iter = iter + 1;

      if norm < tolerance       
         break
      end
   
   end     % iteration end
   
   if norm > 0.01
      du = ucur_iter*0;
   else
      du = ucur_iter;
   end

   [Funew]=FinalDisplacement(Funew,du,N,nodedof,increment); % including supports nodes;          
      
   % ---------------------------------------------------- Effective Area S  
   pinc=1; Aef=zeros(5,xn);Ae=zeros(5,xn);Phi_Py=zeros(5,xn);
   while pinc < 100                     
      if isequal(pinc,1) % Gross Area
         Aef1=Ae;
         for n = 1:xn              
            [Aef(:,n),Ae(:,n),Phi_Py(:,n)]=StiffnessINELEMENT3DAef([bfb1(n);bfb2(n)],...
               [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
               [Dg1(n);Dg2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)],[ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),fillet(n,:),...
               gam,Fy(n,1),Fyfi(n,1),Fyw(n,1),Fyfo(n,1),[ytbar1(n);ytbar2(n)],HomoType(n,1),Pt(:,n),Mzt(:,n));              
         end
         
      else
         Aef1=Aef;
         for n = 1:xn              
            [Aef(:,n),Ae(:,n),Phi_Py(:,n)]=StiffnessINELEMENT3DAefi([bfb1(n);bfb2(n)],...
               [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
               [Dg1(n);Dg2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),fillet(n,:),...
               gam,Fy(n,1),Fyfi(n,1),Fyw(n,1),Fyfo(n,1),[ytbar1(n);ytbar2(n)],HomoType(n,1),Aef(:,n),Pt(:,n),Mzt(:,n));              
         end
         
      end  
      
      AreaE = abs(Aef1 - Aef);
      normAef = sqrt(sum(sum(AreaE'*AreaE)));
      if normAef < 0.001
         break;
      end 
      pinc=pinc+1;
   end %while      
   % ---------------------------------------------------- Effective Area E   

   % ------------------------------------------------------- Unity Check S 
   UC=zeros(5,xn);slender=zeros(5,xn);
   for n = 1:xn
      [UC(:,n),slender(:,n)]=StiffnessELEMENT3DUC([bfb1(n);bfb2(n)],...
         [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
         [Dg1(n);Dg2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
         [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),fillet(n,:),...
         gam,Fy(n,1),Fyfi(n,1),Fyw(n,1),Fyfo(n,1),[ytbar1(n);ytbar2(n)],NLIAType,HomoType(n,1),Phi_Py(:,n),Pt(:,n),Mzt(:,n));
   end
      
   UC = round(UC*10^6)/10^6;
   [max_UCrow, indexrow]=max(UC);
   [max_UC, UCcol]=max(max_UCrow);
   for i=1:xn
      if isequal(max_UCrow(1,i),max_UC)
         UCrow=indexrow(1,i);
         break;
      end
   end   
   % ------------------------------------------------------- Unity Check E 
   
   % -------------------- Store maximum or minium UC S
   if max_UC <= 1
      if isequal(nic,0)
         nic=nic+1;
         Nmax_UC(nic,1) = max_UC; 
         NFn(:,nic)=Fn(:,1);         
      else 
         if max(Nmax_UC(:,1)) < max_UC
            nic=nic+1;
            Nmax_UC(nic,1) = max_UC; 
            NFn(:,nic)=Fn(:,1);            
         end         
      end
   else 
      if isequal(pic,0)
         pic=pic+1;
         Pmax_UC(pic,1) = max_UC; 
         PFn(:,pic)=Fn(:,1);         
      else
         if min(Pmax_UC(:,1)) >= max_UC
            pic=pic+1;
            Pmax_UC(pic,1) = max_UC; 
            PFn(:,pic)=Fn(:,1);            
         end         
      end         
   end
   % -------------------- Store maximum or minium UC E   
   
   %-----------------------------------------------------------------
   %-----------------      maxUC < 1 E       ------------------------
   %-----------------------------------------------------------------     
   end %if
   % ---------------------------------------- Unity Check greater than 1 E     
 
   for i = 1:xn
       for j = 1:nodedof
               Qint1(i,j,increment) = Qing(i,j);
               Qint2(i,j,increment) = Qing(i,j+nodedof);
       end
   end     

   for i = 1:xn
       for j = 1:nodedof*2
               QintfE(i,j,increment) = Qin(i,j);
               Qintf(i,j,increment) = Qin(i,j);
       end
   end         
     
   % ------------------------------------------ Updated SRF S
   tau=zeros(5,xn);tau_a=zeros(5,xn);Rpg=zeros(5,xn);Rpc=zeros(5,xn);Rpt=zeros(5,xn);
   Rh=zeros(5,xn);Myc=zeros(5,xn);My=zeros(5,xn);Myt=zeros(5,xn);Phi_Mmax=zeros(5,xn);
   Mmax=zeros(5,xn);Py=zeros(5,xn);psy=zeros(5,xn);MmaxL=zeros(5,xn);
   Mn_FLB=zeros(5,xn);Mn_TFY=zeros(5,xn);
   for n = 1:xn

      [tau(:,n),tau_a(:,n),Rpg(:,n),Rpc(:,n),Rpt(:,n),Rh(:,n),Myc(:,n),My(:,n),Myt(:,n),Phi_Mmax(:,n),...
          UC(:,n),Mmax(:,n),Py(:,n),psy(:,n),MmaxL(:,n),Mn_FLB(:,n),Mn_TFY(:,n),PrPeL(:,n)]=StiffnessELEMENT3DtauUC([bfb1(n);bfb2(n)],...
         [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
         [Dg1(n);Dg2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
         [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),fillet(n,:),...
         gam,Fy(n,1),Fyfi(n,1),Fyw(n,1),Fyfo(n,1),[ytbar1(n);ytbar2(n)],...
         NLIAType,HomoType(n,1),Aef(:,n),Phi_Py(:,n),Pt(:,n),Mzt(:,n));

   end 
   % ------------------------------------------ Updated SRF E   
   
 
   % ------------------------------------------------ Inelastic Analysis S
   % initialize variables
   KtBB=zeros(nDOF);       % global tangent stiffness matrix

   for n = 1:xn
      
      % Rigid offset
      Rd = eye(14);
      Rd(3,4)=rd1(n,1);Rd(10,11)=rd2(n,1); 
      Rd(1,6)=-rxd1(n,1)*cos(-angletap(n,2));Rd(8,13)=-rxd2(n,1)*cos(-angletap(n,2));
      Rd(2,6)=-rxd1(n,1)*sin(-angletap(n,2));Rd(9,13)=-rxd2(n,1)*sin(-angletap(n,2));

      % Rigid offset for Uniform Loads in Element Frame
      Ld = eye(14);
      Ld(1,6)=Lud1(n,1); Ld(8,13)=Lud2(n,1);  
      % Rigid offset for Self-weight in Element Frame
      Lsd = eye(14);
      Lsd(1,6)=CSD1(n,1); Lsd(8,13)=CSD2(n,1);        

      % Update Nodal Triads using global solution : Angle between Element frame and CR frame 
      [t1,t2,t3,u1,u2,u3] = UpdatedElementNodalTriadsTU(beta1x(n,1),beta2x(n,1),beta1y(n,1),beta2y(n,1),beta1z(n,1),beta2z(n,1),alphatap(n,2));
      [e1,e2,e3,Zetaavg,Zeta1,Zeta2,Eta1,Eta2] = ElementBaseVector(dX(n,1),dY(n,1),dZ(n,1),t2,u2,L(n,1),alphatap(n,2));
      
      % Deformation in CR frame
      [theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn] = NaturalFrame(t1,t2,t3,u1,u2,u3,e1,e2,e3,beta1xp(n,1),beta2xp(n,1));
      [Pbar]=Projection(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1));

      [e1,e2,e3] = GlobalTransform(e1,e2,e3,alphatap(n,2));
      [Ge]=CoordTransform(e1,e2,e3); 
      qno=Pbar*Rd*Ge'*[unew1(n,:)';unew2(n,:)'];
       
      [Kt,Jval(:,n)]=StiffnessINELEMENT3D([bfb1(n);bfb2(n)],...
         [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
         [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
         [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
         [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
         hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
         theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,...
         theta1xpn,theta2xpn,tau(:,n),tau_a(:,n),slender(:,n),FEL(n,:));

      % Elastic Tangent Stiffness Matrix
      Kts = Ge*Rd'*(Pbar'*Kt*Pbar)*Rd*Ge';

      [KtBB] = assembleIE(KtBB,Kts,MI,n);
      
   end

   KtBB=KtBB+KS+KB;

   % Elastic Tangent Stiffness
   ind=(1:nDOF)';
   ind=ind(logical(BC(:,1)));
   KtBB(ind,:)=[];
   KtBB(:,ind)=[];
   
   if rcond(KtBB) < (10^(-18))
      Bflag = 2;
      break;
   end

   % ---------------------------------------------------------------------
   % -------              Unity Check for Strength                 -------
   % ---------------------------------------------------------------------
   UC = round(UC*10^6)/10^6;
   [max_UCrow, indexrow]=max(UC);
   [max_UC, UCcol]=max(max_UCrow);
   for i=1:xn
      if isequal(max_UCrow(1,i),max_UC)
         UCrow=indexrow(1,i);
         break;
      end
   end

   if increment >1
      if round(max_UC*10^5)/10^5 >= 1 % Yielding           
         flag=flag+1;
         Fn3=Fn;
      end
   end   
   
   % ---------------------------------------------------------------------
   % -------                Maximum Forces                         -------
   % ---------------------------------------------------------------------
   % LTB & FLB & TFY
   mMmaxL=MmaxL(UCrow,UCcol);
   mMn_FLB=Mn_FLB(UCrow,UCcol);
   mMn_TFY=Mn_TFY(UCrow,UCcol);
   if mMn_FLB < mMmaxL &&  mMn_FLB < mMn_TFY % FLB control
      crLTB=1;
   elseif mMn_TFY < mMmaxL &&  mMn_TFY < mMn_FLB % TFY control
      crLTB=2;
   else % Flexural Yielding
      crLTB=3;
   end
   
   % ---------------------------------------------------------------------
   % -------------------     Eigenvalue Calculation       ----------------
   % ---------------------------------------------------------------------
%    if xn < 4
%       [VV,tmp2]=eigs(KtBB,-KggBB,2,'SM');
%    else
%       [VV,tmp2]=eigs(KtBB,-KggBB,20,'SM');
%    end
   [VV,tmp2]=eig(KtBB,-KggBB);
   tmp2=diag(tmp2);

   if max(tmp2(:,1)) <= 0
      [VV,tmp2]=eigs(KtBB,-KggBB,30,'SM');
      tmp2=diag(tmp2);
   end

   % Eigv=tmp2;
   p=0;
   for i = 1:length(tmp2)
      if tmp2(i) > 0
         p=p+1;
         Eigv(p)= tmp2(i);
         EigVV(:,p) = VV(:,i);
      end
   end

   [sortedEigv,IX]=sort(Eigv);
   sortedEigVV=EigVV(:,IX);
   Eigv=sortedEigv;
   EigVV=sortedEigVV;   
   gammma=zeros(nmode,1); 
   for i = 1:nmode
      gammma(i,1)=Eigv(i);
      EigMode(:,i)=EigVV(:,i);
      [dVV(:,i)]=RTDisplacement(EigMode(:,i),nDOF,BC);
      [EGunew(:,:,i)]=CurrentDisplacement(dVV(:,i),N,nodedof); % including supports nodes
   end

   % Internal force
   Qintf=round(Qintf*10^6)/10^6;
   QintfE=round(QintfE*10^6)/10^6;
   Qint1=round(Qint1*10^6)/10^6; 
   Qint2=round(Qint2*10^6)/10^6;       
   
   % Yielding Criterion 1
   if isequal(flag,2)  % Yielding 
      break; 
   end   
 
   % Load at converged level
   Fn2=Fn; 

   % Convergence critera1
   if gammma >= 0.9999 && gammma <1.001
      if isequal(crLTB,1) || isequal(crLTB,2) || isequal(crLTB,3)
         if max_UC >= 1 % Yielding Criterion 1
            FLflag=FLflag+1;
            Fn3=Fn;
         end
      end 
      break;
   end   
 
%  if isequal(increment,1)
%    lamda1 = 1;
%    lamda = max(Fn./Fn_1);
%    [increment,lamda1,max_UC1,gammma,lamda1/max_UC1]
%    [increment,lamda,max_UC2,gammma,lamda/max_UC2,max_UC]
% else
%    lamda1 = max(Fn_1./Fn0);
%    lamda = max(Fn./Fn0);
%    [increment,lamda1,max_UC1,gammma,lamda1/max_UC1]
%    [increment,lamda,max_UC2,gammma,lamda/max_UC2,max_UC]
% end     

   switch get(get(ap_cv_buttongroup,'SelectedObject'),'Tag')
      case 'cv_on' 
         % -------------------------- Forward Algorithm +Brent Algorithm S         
         if isequal(Sflag,0) % Forward Algorithm
            % Updating loads
            if isequal(increment,1)
               if gammma > 1
                  pn=pn+1;
                  Fnp(:,pn)=Fn(:,1);
                  gammap(1,pn)=gammma;                    
                  Fn=Fn*(1+(gammma-1)/JeongP);
               else
                  nn=nn+1;
                  Fnn(:,nn)=Fn(:,1);
                  gamman(1,nn)=gammma; 
                  flag=0;
                  Fn=Fn*(1-(1-gammma)/JeongP);
               end      
            else
               if gammma > 1
                  pn=pn+1;
                  Fnp(:,pn)=Fn(:,1);
                  gammap(1,pn)=gammma;                  
                  Fn=Fn*(1+(gammma-1)/10);
               else
                  nn=nn+1;
                  Fnn(:,nn)=Fn(:,1);
                  gamman(1,nn)=gammma;                   
                  Fn=Fn*(1-(1-gammma)/10);
                  Sflag=1; Fincrement=increment;                
               end 
            end
            
            if isempty(gamman) || isempty(gammap) 
               Sflag=0;
            end
            
         else % Solutions are bracketed. [FnA,FnB]=[Fnp,Fnn]

            % --------------------------------------- Brent Algorithm S
            if isequal(increment,Fincrement+1)
               gamB=(gamman(1,nn)-1); FnB = Fnn(:,nn);
               gamA=(gammap(1,pn)-1); FnA = Fnp(:,pn);
               gamC = gamA; FnC = FnA;
               mflag = 1; % set mflag                  
            else
               gamS = gammma-1; FnS  = Fn;
               gamD = gamC; FnD=FnC;
               gamC = gamB; FnC=FnB;
               if gamA*gamS < 0
                  gamB=gamS;
                  FnB=FnS;
               else
                  gamA=gamS;
                  FnA = FnS;
               end

            end

            if gamB <= gamA

               if gamA > gamB
                  if ~isequal(gamA,gamC) && ~isequal(gamB,gamC) % Inverse quadratic interpolation to be converged to 1
                     FnS= (gamB*gamC / ((gamA-gamB)*(gamA-gamC)))*FnA ...
                        + (gamA*gamC / ((gamB-gamA)*(gamB-gamC)))*FnB ...
                        + (gamA*gamB / ((gamC-gamA)*(gamC-gamB)))*FnC;                     
                  else % Secant method
                     FnS= FnB - (gamB/(gamB-gamA)) * (FnB-FnA);
                  end
               else % swap
                  if ~isequal(gamA,gamC) && ~isequal(gamB,gamC) % Inverse quadratic interpolation to be converged to 1
                     FnS= (gamA*gamC / ((gamB-gamA)*(gamB-gamC)))*FnB ...
                        + (gamB*gamC / ((gamA-gamB)*(gamA-gamC)))*FnA ...
                        + (gamB*gamA / ((gamC-gamB)*(gamC-gamA)))*FnC;                     
                  else % Secant method
                     FnS= FnA - (gamA/(gamA-gamB)) * (FnA-FnB);
                  end                     
               end

               if isequal(increment,Fincrement+1)
                  SFnAB = abs(sum(3*FnA+FnB)/4);
                  SFnS = abs(sum(FnS)); SFnB = abs(sum(FnB));
                  R_SB = FnS-FnB     ; norm_SB = sqrt(R_SB'*R_SB);
                  R_BCH = (FnB-FnC)/2 ; norm_BCH = sqrt(R_BCH'*R_BCH);                 
                  R_BC = (FnB-FnC)    ; norm_BC = sqrt(R_BC'*R_BC);                       
                  if SFnAB >= SFnS || SFnS >= SFnB 
                     FnS = (FnA+FnB)/2; % Bisection Algorithm
                  elseif isequal(mflag,1) && norm_SB >= norm_BCH
                     FnS = (FnA+FnB)/2; % Bisection Algorithm
                  elseif isequal(mflag,1) && norm_BC < 0.000001
                     FnS = (FnA+FnB)/2; % Bisection Algorithm
                  else
                     mflag = 0;
                  end

               else
                  SFnAB = abs(sum(3*FnA+FnB)/4);
                  SFnS = abs(sum(FnS)); SFnB = abs(sum(FnB));
                  R_SB = FnS-FnB     ; norm_SB = sqrt(R_SB'*R_SB);
                  R_BCH = (FnB-FnC)/2 ; norm_BCH = sqrt(R_BCH'*R_BCH);
                  R_CDH = (FnD-FnD)/2 ; norm_CDH = sqrt(R_CDH'*R_CDH);                  
                  R_BC = (FnB-FnC)    ; norm_BC = sqrt(R_BC'*R_BC);
                  R_CD = (FnD-FnD)    ; norm_CD = sqrt(R_CD'*R_CD);                     
                  if SFnAB >= SFnS || SFnS >= SFnB 
                     FnS = (FnA+FnB)/2; % Bisection Algorithm
                  elseif isequal(mflag,1) && norm_SB >= norm_BCH
                     FnS = (FnA+FnB)/2; % Bisection Algorithm
                  elseif isequal(mflag,1) && norm_BC < 0.000001
                     FnS = (FnA+FnB)/2; % Bisection Algorithm
                  elseif isequal(mflag,0) && norm_SB >= norm_CDH
                     FnS = (FnA+FnB)/2; % Bisection Algorithm
                  elseif isequal(mflag,0) && norm_CD < 0.000001
                     FnS = (FnA+FnB)/2; % Bisection Algorithm                        
                  else
                     mflag = 0;
                  end                    

               end % increment end

            end
        
            Fn=FnS;
         
         end % Sflag end        
         % -------------------------- Forward Algorithm +Brent Algorithm S

      case 'cv_off'

         % ------------------------------------------------------------------
         % ----------------    Root Finding by Updating Loads   -------------
         % ------------------------------------------------------------------
         if increment < 3   
            if gammma > 1 
               pn=pn+1;
               Fnp(:,pn)=Fn(:,1);
               gammap(1,pn)=gammma; 
               gamp=gammma;
               Fn=Fn*(1+(gammma-1)/BrentP);
            else
               nn=nn+1;
               Fnn(:,nn)=Fn(:,1);
               gamman(1,nn)=gammma;
               flag=0;
               gamn=gammma;
               Fn=Fn*gammma;
            end       
%             Fn=Fn*gammma;
         else % Increment > 2
            if isempty(gamp) || isempty(gamn) % gamA*gamB >=0

               % -------------------------- Forward Algorithm +Brent Algorithm S
               if isequal(Sflag,0) % Forward Algorithm
                  % Updating loads

                     if gammma > 1
                        pn=pn+1;
                        Fnp(:,pn)=Fn(:,1);
                        gammap(1,pn)=gammma;                  
                        Fn=Fn*(1+(gammma-1)/10);
                     else
                        nn=nn+1;
                        Fnn(:,nn)=Fn(:,1);
                        gamman(1,nn)=gammma;                   
                        Fn=Fn*(1-(1-gammma)/10);
                        Sflag=1; Fincrement=increment;                
                     end 
                     if isempty(gamman) || isempty(gammap)
                        Sflag=0;
                     end
               else % Solutions are bracketed. [FnA,FnB]=[Fnp,Fnn]

                  % --------------------------------------- Brent Algorithm S
                  if isequal(increment,Fincrement+1)
                     gamB=(gamman(1,nn)-1); FnB = Fnn(:,nn);
                     gamA=(gammap(1,pn)-1); FnA = Fnp(:,pn);
                     gamC = gamA; FnC = FnA;
                     mflag = 1; % set mflag                  
                  else
                     gamS = gammma-1; FnS  = Fn;
                     gamD = gamC; FnD=FnC;
                     gamC = gamB; FnC=FnB;
                     if gamA*gamS < 0
                        gamB=gamS;
                        FnB=FnS;
                     else
                        gamA=gamS;
                        FnA = FnS;
                     end

                  end

                  if gamB <= gamA

                     if gamA > gamB
                        if ~isequal(gamA,gamC) && ~isequal(gamB,gamC) % Inverse quadratic interpolation to be converged to 1
                           FnS= (gamB*gamC / ((gamA-gamB)*(gamA-gamC)))*FnA ...
                              + (gamA*gamC / ((gamB-gamA)*(gamB-gamC)))*FnB ...
                              + (gamA*gamB / ((gamC-gamA)*(gamC-gamB)))*FnC;                     
                        else % Secant method
                           FnS= FnB - (gamB/(gamB-gamA)) * (FnB-FnA);
                        end
                     else % swap
                        if ~isequal(gamA,gamC) && ~isequal(gamB,gamC) % Inverse quadratic interpolation to be converged to 1
                           FnS= (gamA*gamC / ((gamB-gamA)*(gamB-gamC)))*FnB ...
                              + (gamB*gamC / ((gamA-gamB)*(gamA-gamC)))*FnA ...
                              + (gamB*gamA / ((gamC-gamB)*(gamC-gamA)))*FnC;                     
                        else % Secant method
                           FnS= FnA - (gamA/(gamA-gamB)) * (FnA-FnB);
                        end                     
                     end

                     if isequal(increment,Fincrement+1)
                        SFnAB = abs(sum(3*FnA+FnB)/4);
                        SFnS = abs(sum(FnS)); SFnB = abs(sum(FnB));
                        R_SB = FnS-FnB     ; norm_SB = sqrt(R_SB'*R_SB);
                        R_BCH = (FnB-FnC)/2 ; norm_BCH = sqrt(R_BCH'*R_BCH);                 
                        R_BC = (FnB-FnC)    ; norm_BC = sqrt(R_BC'*R_BC);                       
                        if SFnAB >= SFnS || SFnS >= SFnB 
                           FnS = (FnA+FnB)/2; % Bisection Algorithm
                        elseif isequal(mflag,1) && norm_SB >= norm_BCH
                           FnS = (FnA+FnB)/2; % Bisection Algorithm
                        elseif isequal(mflag,1) && norm_BC < 0.000001
                           FnS = (FnA+FnB)/2; % Bisection Algorithm
                        else
                           mflag = 0;
                        end

                     else
                        SFnAB = abs(sum(3*FnA+FnB)/4);
                        SFnS = abs(sum(FnS)); SFnB = abs(sum(FnB));
                        R_SB = FnS-FnB     ; norm_SB = sqrt(R_SB'*R_SB);
                        R_BCH = (FnB-FnC)/2 ; norm_BCH = sqrt(R_BCH'*R_BCH);
                        R_CDH = (FnD-FnD)/2 ; norm_CDH = sqrt(R_CDH'*R_CDH);                  
                        R_BC = (FnB-FnC)    ; norm_BC = sqrt(R_BC'*R_BC);
                        R_CD = (FnD-FnD)    ; norm_CD = sqrt(R_CD'*R_CD);                     
                        if SFnAB >= SFnS || SFnS >= SFnB 
                           FnS = (FnA+FnB)/2; % Bisection Algorithm
                        elseif isequal(mflag,1) && norm_SB >= norm_BCH
                           FnS = (FnA+FnB)/2; % Bisection Algorithm
                        elseif isequal(mflag,1) && norm_BC < 0.000001
                           FnS = (FnA+FnB)/2; % Bisection Algorithm
                        elseif isequal(mflag,0) && norm_SB >= norm_CDH
                           FnS = (FnA+FnB)/2; % Bisection Algorithm
                        elseif isequal(mflag,0) && norm_CD < 0.000001
                           FnS = (FnA+FnB)/2; % Bisection Algorithm                        
                        else
                           mflag = 0;
                        end                    

                     end % increment end

                  end                  
                  
                  Fn=FnS;

               end % Sflag end        
               % -------------------------- Forward Algorithm +Brent Algorithm S               

%                forward Algorithm
            else % Solutions are bracketed. [FnA,FnB]=[Fnp,Fnn]
               % --------------------------------------- Brent Algorithm S
               if isequal(increment,3)
                  gamB=(gamman(1,1)-1); FnB = Fnn(:,1);
                  gamA=(gammap(1,1)-1); FnA = Fnp(:,1);
                  gamC = gamA; FnC = FnA;
                  mflag = 1; % set mflag                  
               else
                  gamS = gammma-1; FnS  = Fn;
                  gamD = gamC; FnD=FnC;
                  gamC = gamB; FnC=FnB;
                  if gamA*gamS < 0
                     gamB=gamS;
                     FnB=FnS;
                  else
                     gamA=gamS;
                     FnA = FnS;
                  end
                  
               end

               if gamB <= gamA
                  
                  if gamA > gamB
                     if ~isequal(gamA,gamC) && ~isequal(gamB,gamC) % Inverse quadratic interpolation to be converged to 1
                        FnS= (gamB*gamC / ((gamA-gamB)*(gamA-gamC)))*FnA ...
                           + (gamA*gamC / ((gamB-gamA)*(gamB-gamC)))*FnB ...
                           + (gamA*gamB / ((gamC-gamA)*(gamC-gamB)))*FnC;                     
                     else % Secant method
                        FnS= FnB - (gamB/(gamB-gamA)) * (FnB-FnA);
                     end
                  else % swap
                     if ~isequal(gamA,gamC) && ~isequal(gamB,gamC) % Inverse quadratic interpolation to be converged to 1
                        FnS= (gamA*gamC / ((gamB-gamA)*(gamB-gamC)))*FnB ...
                           + (gamB*gamC / ((gamA-gamB)*(gamA-gamC)))*FnA ...
                           + (gamB*gamA / ((gamC-gamB)*(gamC-gamA)))*FnC;                     
                     else % Secant method
                        FnS= FnA - (gamA/(gamA-gamB)) * (FnA-FnB);
                     end                     
                  end
                                  
                  if isequal(increment,3)
                     SFnAB = abs(sum(3*FnA+FnB)/4);
                     SFnS = abs(sum(FnS)); SFnB = abs(sum(FnB));
                     R_SB = FnS-FnB     ; norm_SB = sqrt(R_SB'*R_SB);
                     R_BCH = (FnB-FnC)/2 ; norm_BCH = sqrt(R_BCH'*R_BCH);                 
                     R_BC = (FnB-FnC)    ; norm_BC = sqrt(R_BC'*R_BC);                       
                     if SFnAB >= SFnS || SFnS >= SFnB 
                        FnS = (FnA+FnB)/2; % Bisection Algorithm
                     elseif isequal(mflag,1) && norm_SB >= norm_BCH
                        FnS = (FnA+FnB)/2; % Bisection Algorithm
                     elseif isequal(mflag,1) && norm_BC < 0.000001
                        FnS = (FnA+FnB)/2; % Bisection Algorithm
                     else
                        mflag = 0;
                     end
                     
                  else
                     SFnAB = abs(sum(3*FnA+FnB)/4);
                     SFnS = abs(sum(FnS)); SFnB = abs(sum(FnB));
                     R_SB = FnS-FnB     ; norm_SB = sqrt(R_SB'*R_SB);
                     R_BCH = (FnB-FnC)/2 ; norm_BCH = sqrt(R_BCH'*R_BCH);
                     R_CDH = (FnD-FnD)/2 ; norm_CDH = sqrt(R_CDH'*R_CDH);                  
                     R_BC = (FnB-FnC)    ; norm_BC = sqrt(R_BC'*R_BC);
                     R_CD = (FnD-FnD)    ; norm_CD = sqrt(R_CD'*R_CD);                     
                     if SFnAB >= SFnS || SFnS >= SFnB 
                        FnS = (FnA+FnB)/2; % Bisection Algorithm
                     elseif isequal(mflag,1) && norm_SB >= norm_BCH
                        FnS = (FnA+FnB)/2; % Bisection Algorithm
                     elseif isequal(mflag,1) && norm_BC < 0.000001
                        FnS = (FnA+FnB)/2; % Bisection Algorithm
                     elseif isequal(mflag,0) && norm_SB >= norm_CDH
                        FnS = (FnA+FnB)/2; % Bisection Algorithm
                     elseif isequal(mflag,0) && norm_CD < 0.000001
                        FnS = (FnA+FnB)/2; % Bisection Algorithm                        
                     else
                        mflag = 0;
                     end                    
                     
                  end % increment end
                
               end               
               
               Fn=FnS;

            end % Forward or Brent
         
         end % increment < 3 end
   end
   
   % ************************************** Wait2
   perc = increment;
   waitbar(perc/100,wh,sprintf('%d%% along...',perc))
   
   % Repeat increments
   increment = increment + 1;
end     % increment end

% ------------------------------------------------------------------------
% -------------------       Report Final Results       -------------------
% ------------------------------------------------------------------------
if isequal(Bflag,1)
   ANI=1;
   delete(wh)
%    set(am_cv_text,'String','Unstable')
   set(pt_title_name,'String','Inelastic Nonlinear Buckling Analysis did not finish. Please try to check loads and boundry conditions.')
   set(pt_title_name,'Visible','on')  
   gammma=0;   
   Qintf=Qintf(:,:,end)*0;
   QintfE=QintfE(:,:,end)*0;
   Qint1=Qint1(:,:,end)*0; 
   Qint2=Qint2(:,:,end)*0;
   crLTB=0;
elseif isequal(Bflag,2)
   ANI=1;
   delete(wh)
%    set(am_cv_text,'String','Non-converged')
   set(pt_title_name,'String','Inelastic Nonlinear Buckling Analysis did not finish. Please try to use the other Algorithm or Scaled Parameter.')
   set(pt_title_name,'Visible','on')  
   gammma=0;   
   Qintf=Qintf(:,:,end)*0;
   QintfE=QintfE(:,:,end)*0;
   Qint1=Qint1(:,:,end)*0;
   Qint2=Qint2(:,:,end)*0;
   crLTB=0;
else  % converged solution     
   gammmaIn=gammma;
   % ************************************** Wait3
   perc = 100;
   waitbar(perc/100,wh,sprintf('%d%% along...',perc))
   delete(wh)   
   
   % ---------------------------------------------------------------------
   % -------                   Maximum Forces                         ----
   % ---------------------------------------------------------------------
% flag
% FLflag
% crLTB
% gammma
% max_UC

   % Parameters to Check Elastic
   SRF1 = zeros(5,xn);
   for i=1:5
      for j=1:xn
          if isequal(slender(i,j),1)
              SRF1(i,j)= (1-psy(i,j)/(pi/2))*0.9*Rpg(i,j) +( psy(i,j)/(pi/2))*0.7893;
              
          else
              SRF1(i,j)= (1-psy(i,j)/(pi/2))*0.9 +( psy(i,j)/(pi/2))*0.7893;
          end
      end
   end

   Ratio_SRF=tau./SRF1;
   mRatio_SRF=round(min(min(Ratio_SRF(:,:)))*10^4)/10^4;   
   
   if isequal(flag,2) || isequal(FLflag,1) % Flexural Yielding or FLB or TFY control
      ANI=3; 
      if max_UC >= 1
         Qintf=Qintf(:,:,end)/max_UC;
         QintfE=QintfE(:,:,end)/max_UC;
         Qint1=Qint1(:,:,end)/max_UC;
         Qint2=Qint2(:,:,end)/max_UC;
         if isequal(crLTB,1)
            gammma=max(Fn3./Fn0)/max_UC;
            LGv = gammmaIn*gammma;
            set(pt_title_name,'String',['Inelastic Nonlinear Buckling Analysis is completed. Applied Load Ratio = ',num2str(gammma(1,1)),' (FLB)',...
               '.  Applied Load Ratio =',num2str(LGv),' (Buckling)'])
            set(pt_title_name,'Visible','on')  
%             set(am_cv_text,'String','FLB')  
         elseif isequal(crLTB,2)
            gammma=max(Fn3./Fn0)/max_UC;
            LGv = gammmaIn*gammma;
            set(pt_title_name,'String',['Inelastic Nonlinear Buckling Analysis is completed. Applied Load Ratio = ',num2str(gammma(1,1)),' (TFY)',...
               '.  Applied Load Ratio =',num2str(LGv),' (Buckling)'])
            set(pt_title_name,'Visible','on')  
%             set(am_cv_text,'String','TFY')
         elseif isequal(crLTB,3)
            gammma=max(Fn3./Fn0)/max_UC;
            LGv = gammmaIn*gammma;
            set(pt_title_name,'String',['Inelastic Nonlinear Buckling Analysis is completed. Applied Load Ratio = ',num2str(gammma(1,1)),' (CFY)',...
               '.  Applied Load Ratio =',num2str(LGv),' (Buckling)'])
            set(pt_title_name,'Visible','on')   
%             set(am_cv_text,'String','Yielding')
         end
      else
         Qintf=Qintf(:,:,end)*max_UC;
         QintfE=QintfE(:,:,end)*max_UC;
         Qint1=Qint1(:,:,end)*max_UC; 
         Qint2=Qint2(:,:,end)*max_UC; 
         if isequal(crLTB,1)
            gammma=max(Fn3./Fn0)*max_UC;
            LGv = gammmaIn*gammma;
            set(pt_title_name,'String',['Inelastic Nonlinear Buckling Analysis is completed. Applied Load Ratio = ',num2str(gammma(1,1)),' (FLB)',...
               '.  Applied Load Ratio =',num2str(LGv),' (Buckling)'])
            set(pt_title_name,'Visible','on')  
%             set(am_cv_text,'String','FLB')  
         elseif isequal(crLTB,2)
            gammma=max(Fn3./Fn0)*max_UC;
            LGv = gammmaIn*gammma;
            set(pt_title_name,'String',['Inelastic Nonlinear Buckling Analysis is completed. Applied Load Ratio = ',num2str(gammma(1,1)),' (TFY)',...
               '.  Applied Load Ratio =',num2str(LGv),' (Buckling)'])
            set(pt_title_name,'Visible','on')  
%             set(am_cv_text,'String','TFY')
         elseif isequal(crLTB,3)
            gammma=max(Fn3./Fn0)*max_UC;
            LGv = gammmaIn*gammma;
            set(pt_title_name,'String',['Inelastic Nonlinear Buckling Analysis is completed. Applied Load Ratio = ',num2str(gammma(1,1)),' (CFY)',...
               '.  Applied Load Ratio =',num2str(LGv),' (Buckling)'])
            set(pt_title_name,'Visible','on')   
%             set(am_cv_text,'String','Yielding')
         end         
      end

   else % Inelastic control
      crLTB=0;
      if gammmaIn >= 0.999 && gammmaIn <1.001  

         if isequal(mRatio_SRF,1) % Elastic buckling control under Mmax
            ANI=2; % Elastic control
            gammma=max(Fn2./Fn0);
            Qintf=Qintf(:,:,end);
            QintfE=QintfE(:,:,end);
            Qint1=Qint1(:,:,end);
            Qint2=Qint2(:,:,end);
            set(pt_title_name,'String',['Inelastic Nonlinear Buckling Analysis is completed. Applied Load Ratio = ',num2str(gammma(1,1))])
            set(pt_title_name,'Visible','on')  
%             set(am_cv_text,'String','Elastic')               

         else
             ANI=1;
             gammma=max(Fn2./Fn0);   
             Qintf=Qintf(:,:,end);
             QintfE=QintfE(:,:,end);
             Qint1=Qint1(:,:,end); 
             Qint2=Qint2(:,:,end); 
%              set(am_cv_text,'String','Converged')
             set(pt_title_name,'String',['Inelastic Nonlinear Buckling Analysis is completed. Applied Load Ratio = ',num2str(gammma(1,1))])   
             set(pt_title_name,'Visible','on')  
         end

      else
         ANI =1;
%          set(am_cv_text,'String','Non-converged')
         set(pt_title_name,'String','Inelastic Nonlinear Buckling Analysis did not finish. Please try to use the other Algorithm.')
         set(pt_title_name,'Visible','on')
         gammma=0;   
         Qintf=Qintf(:,:,end)*0;
         QintfE=QintfE(:,:,end)*0;
         Qint1=Qint1(:,:,end)*0; 
         Qint2=Qint2(:,:,end)*0; 
      end   

   end

end   
   
if ~isempty(Funew)
   FunewR=Funew(:,:,end);
end   

   