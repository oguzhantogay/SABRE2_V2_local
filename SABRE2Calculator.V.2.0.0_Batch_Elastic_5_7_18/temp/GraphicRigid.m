function [rd1,rd2] = GraphicRigid(Massemble,...
   Rval,SNodevalue,RNCc,Nshe1,Nshe2,DUP1,DUP2,PNC,PNC1,PNC2,FEL)
% Developed by Woo Yong Jeong.
% Date : 2/01/2015.
% ************************************************************************
% *********       Linear Inelastic Eigenvalue Buckling Load       ********
% ************************************************************************

xn = sum(sum(SNodevalue(:,:,3)));      % Total number of Elements
N = length(RNCc(:,1));                 % Total number of Nodes
mem=length(Massemble(:,1));            % Total number of members
nodedof=7;                    % Number of degree of freedom in each node
nDOF = nodedof*N;             % Total number of dofs
% % Preallocationg Elastic modulus, Shear modulus, Yield stress, Density
nel = 1; E = zeros(xn,1); G = zeros(xn,1); Fy = zeros(xn,1);stRho = zeros(xn,1); 
         Fyfi = zeros(xn,1);Fyw = zeros(xn,1);Fyfo = zeros(xn,1);fillet=zeros(xn,1);
         HomoType= zeros(xn,1);
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
   FEL(xn,5)=0;
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
Dst1 = Dg1 - Dsb1;    % top of Web depth to shear center
% End node
% bottom flange centroid to shear center
hsb2 = (tft2.*bft2.^3.*hg2)./(tfb2.*bfb2.^3+tft2.*bft2.^3); 
Dsb2 = hsb2 - tfb2/2; % bottom of Web depth to shear center
hst2 = hg2 - hsb2;    % top flange centroid to shear center
Dst2 = Dg2 - Dsb2;    % top of Web depth to shear center

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
alpharef = zeros(xn,2);    
for i=1:xn
    opp = yg2(i,1)-yg1(i,1);        % element depth in y-dir
    adj = xg2(i,1)-xg1(i,1);        % element length in x-dir         
    alpharef(i,1)=MI(i,1);
    alpharef(i,2)=atan2(opp,adj);   % Global frame angle w.r.t design axis
end 

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
            ys1(k+segnum(i,1),1)=-hst1(k+segnum(i,1),1);
            ys2(k+segnum(i,1),1)=-hst2(k+segnum(i,1),1);                % Shear center        
            yc1(k+segnum(i,1),1)=-hct1(k+segnum(i,1),1);
            yc2(k+segnum(i,1),1)=-hct2(k+segnum(i,1),1);                % Centroid              
         end        
       
      case 3                                    % bottom of web; val = 3
        
         for k = 1:sum(SNodevalue(i,:,3))
            ys1(k+segnum(i,1),1)=hsb1(k+segnum(i,1),1); 
            ys2(k+segnum(i,1),1)=hsb2(k+segnum(i,1),1);              % Shear center      
            yc1(k+segnum(i,1),1)=hcb1(k+segnum(i,1),1); 
            yc2(k+segnum(i,1),1)=hcb2(k+segnum(i,1),1);              % Centroid                   
         end        
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

% ys1=Dg1/2 - Dst1; ys2=Dg2/2 - Dst2;    % Shear center
segnum(1,1)=0; 
for i = 1:mem                                  % mid-web depth ; val = 1

   for k = 1:sum(SNodevalue(i,:,3))
      ys1(k+segnum(i,1),1)=Dg1(k+segnum(i,1),1)/2 - Dst1(k+segnum(i,1),1); 
      ys2(k+segnum(i,1),1)=Dg2(k+segnum(i,1),1)/2 - Dst2(k+segnum(i,1),1);    % Shear center                    
   end        
   segnum(i+1,1) = segnum(i,1) + sum(SNodevalue(i,:,3));
end   

% ------------------------------------------------------------------------
% --------------------      Rigid offset for Supports  -------------------
% ------------------------------------------------------------------------
rd1=zeros(xn,1); 
for i=1:xn
   if ~isequal(0,max(PNC1(i,5:10)))
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
   if ~isequal(0,max(PNC2(i,5:10)))   
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
