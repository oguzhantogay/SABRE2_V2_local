function [gamma] = AnalysisBucklingESL_slender(...
    Geometry_data,Member_data,Loading_data,DistLoading_data,...
    BC_data,Material_data)    

% ************************************************************************
% *********       Linear Elastic Eigenvalue Buckling Load       **********
% ************************************************************************ 

nnodes  =size(Geometry_data,2);                                             % Total number of nodes
nmembers=size(Member_data,2);                                               % Total number of members
nodedof =7;                                                                 % Number of degree of freedom in each node
nDOF    =nodedof*nnodes;                                                    % Total number of dofs
nelem   =sum(Material_data(1,:));                                           % Total number of elements
[E,G,rho,Fy1,Fyw,Fy2]=deal(zeros(nmembers,1));                              % preallocate material arrays
for i = 1:nmembers
     E(i,1)=Material_data(2,i);                                             % Elastic modulus in each element
     G(i,1)=Material_data(3,i);                                             % Shear modulus in each element
     rho(i,1)=Material_data(4,i);                                           % Density
     Fy1(i,1)=Material_data(5,i);                                           % Yield Stress flage 1 
     Fyw(i,1)=Material_data(6,i);                                           % Yield Stress web
     Fy2(i,1)=Material_data(7,i);                                           % Yield Stress flage 2
end

% ------------------------------------------------------------------------
% ----------------------   Global model generation   ---------------------
% ------------------------------------------------------------------------
[xg1,xg2,yg1,yg2,zg1,zg2,bfb1,bfb2,tfb1,tfb2,bft1,bft2,tft1,tft2,Dg1,...
Dg2,tw1,tw2,Dt1,Dt2,Db1,Db2,ht1,ht2,hb1,hb2,hg1,hg2,hsb1,hsb2,Dsb1,...
Dsb2,hst1,hst2,Dst1,Dst2,Dmid1,Dmid2,Ag1,Ag2,ytbar1,ytbar2,Dct1,Dct2,...
Dcb1,Dcb2,hct1,hct2,hcb1,hcb2,CSD1,CSD2]=deal(zeros(nmembers,1));           % preallocate geometry arrays
for i=1:nnodes
    xg1(i,1)=Geometry_data(1,i);                             % global coordinate : xg1(start)
    xg2(i,1)=Geometry_data(1,i);                             % global coordinate : xg2(end)
    yg1(i,1)=Geometry_data(2,i);                             % global coordinate : yg1(start)
    yg2(i,1)=Geometry_data(2,i);                             % global coordinate : yg2(end)
    zg1(i,1)=Geometry_data(3,i);                             % global coordinate : zg1(start)
    zg2(i,1)=Geometry_data(3,i);                             % global coordinate : zg2(end)
    
    % Cross section properties
    bfb1(i,1)=Geometry_data(4,i);                            % Bottom flange width start
    bfb2(i,1)=Geometry_data(4,i);                            % Bottom flange width end
    tfb1(i,1)=Geometry_data(5,i);                            % Bottom flange thickness start
    tfb2(i,1)=Geometry_data(5,i);                            % Bottom flange thickness end
    bft1(i,1)=Geometry_data(6,i);                            % Top flange width start
    bft2(i,1)=Geometry_data(6,i);                            % Top flange width end
    tft1(i,1)=Geometry_data(7,i);                            % Top flange thickness start
    tft2(i,1)=Geometry_data(7,i);                            % Top flange thickness end
    Dg1(i,1)=Geometry_data(8,i);                             % Web depth start
    Dg2(i,1)=Geometry_data(8,i);                             % Web depth end
    tw1(i,1)=Geometry_data(9,i);                             % Web thickness start
    tw2(i,1)=Geometry_data(9,i);                             % Web thickness end
    
    % Mid-web depth
    Dt1(i,1)=Dg1(i,1)/2;             Dt2(i,1)=Dg2(i,1)/2;                   % top of Web depth to mid web depth
    Db1(i,1)=Dt1(i,1);               Db2(i,1)=Dt2(i,1);                     % bottom of Web depth to mid web depth
    ht1(i,1)=Dt1(i,1)+tft1(i,1)/2;   ht2(i,1)=Dt2(i,1)+tft2(i,1)/2;         % top flange centroid to mid web depth
    hb1(i,1)=Db1(i,1)+tfb1(i,1)/2;   hb2(i,1)=Db2(i,1)+tfb2(i,1)/2;         % bottom flange centroid to mid web depth

    % Shear center
    hg1(i,1)  = Dg1(i,1)+tft1(i,1)/2+tfb1(i,1)/2;                           % Distance between flange centroids
    hsb1(i,1) = (tft1(i,1).*bft1(i,1).^3.*hg1(i,1))./(...
        tfb1(i,1).*bfb1(i,1).^3+tft1(i,1).*bft1(i,1).^3);                   % bottom flange centroid to shear center
    Dsb1(i,1) = hsb1(i,1) - tfb1(i,1)/2;                                    % bottom of Web depth to shear center
    hst1(i,1) = hg1(i,1) - hsb1(i,1);                                       % top flange centroid to shear center
    Dst1(i,1) = hst1(i,1) - tft1(i,1)/2;                                    % top of Web depth to shear center
    Dmid1(i,1)= Dsb1(i,1) - Dg1(i,1)/2;                                     % web mid depth to shear center  
    hg2(i,1)  = Dg2(i,1)+tft2(i,1)/2+tfb2(i,1)/2;                           % Distance between flange centroids
    hsb2(i,1) = (tft2(i,1).*bft2(i,1).^3.*hg2(i,1))./(...
        tfb2(i,1).*bfb2(i,1).^3+tft2(i,1).*bft2(i,1).^3);                   % bottom flange centroid to shear center
    Dsb2(i,1) = hsb2(i,1) - tfb2(i,1)/2;                                    % bottom of Web depth to shear center
    hst2(i,1) = hg2(i,1) - hsb2(i,1);                                       % top flange centroid to shear center
    Dst2(i,1) = hst2(i,1) - tft2(i,1)/2;                                    % top of Web depth to shear center
    Dmid2(i,1)= Dsb2(i,1) - Dg2(i,1)/2;                                     % web mid depth to shear center    

    % Centroid Axis
    Ag1(i,1) =  tft1(i,1).*bft1(i,1) + tw1(i,1).*Dg1(i,1)...
        + tfb1(i,1).*bfb1(i,1);                                             % gross area
    ytbar1(i,1) = (bft1(i,1).*tft1(i,1).*tft1(i,1)/2+tw1(i,1).*Dg1(...
        i,1).*(tft1(i,1)+Dg1(i,1)/2)+ bfb1(i,1).*tfb1(i,1).*...             % top flange centroid to section centroid
        (tft1(i,1)+Dg1(i,1)+tfb1(i,1)/2))./Ag1(i,1);
    Dct1(i,1) = ytbar1(i,1) - tft1(i,1);                                    % top of Web depth to section centroid
    Dcb1(i,1) = Dg1(i,1) - Dct1(i,1);                                       % bottom of Web depth to section centroid
    hct1(i,1) = ytbar1(i,1) - tft1(i,1)/2;                                  % top flange centroid to section centroid
    hcb1(i,1) = hg1(i,1) - hct1(i,1);                                       % bottom flange centroid to section centroid
    Ag2(i,1) =  tft2(i,1).*bft2(i,1) + tw2(i,1).*Dg2(i,1)...
        + tfb2(i,1).*bfb2(i,1);                                             % gross area
    ytbar2(i,1) = ( bft2(i,1).*tft2(i,1).*tft2(i,1)/2+tw2(i,1).*Dg2(...
        i,1).*(tft2(i,1)+Dg2(i,1)/2)+ bfb2(i,1).*tfb2(i,1).*...             % top flange centroid to section centroid
        (tft2(i,1)+Dg2(i,1)+tfb2(i,1)/2) )./Ag2(i,1);
    Dct2(i,1) = ytbar2(i,1) - tft2(i,1);                                    % top of Web depth to section centroid
    Dcb2(i,1) = Dg2(i,1) - Dct2(i,1);                                       % bottom of Web depth to section centroid
    hct2(i,1) = ytbar2(i,1) - tft2(i,1)/2;                                  % top flange centroid to section centroid
    hcb2(i,1) = hg2(i,1) - hct2(i,1);                                       % bottom flange centroid to section centroid
    CSD1(i,1) = hct1(i,1)-hst1(i,1);                                        % centroid to shear center
    CSD2(i,1) = hct2(i,1)-hst2(i,1);                                        % centroid to shear center
end    

% ------------------------------------------------------------------------
% --------------------      Rigid offset for Supports  -------------------
% ------------------------------------------------------------------------
offset_support=zeros(nnodes,1);
for i=1:nnodes
    if BC_data(1,i)==1                                                      % Shear Center
        offset_support(i,1)=0;
    elseif BC_data(1,i)==2                                                  % Top
        offset_support(i,1)=-hst1(i,1)-tft1(i,1)/2;      
    elseif BC_data(1,i)==3                                                  % Bottom
        offset_support(i,1)=hsb1(i,1)+tfb1(i,1)/2;
    elseif BC_data(1,i)==4                                                  % Centroid
        offset_support(i,1)=CSD1(i,1);   
    elseif BC_data(1,i)==5                                                  % Mid-web
        offset_support(i,1)=Dmid1(i,1);  
    end
end

% ------------------------------------------------------------------------
% ----------------      Rigid offset for Point Loads     -----------------
% ------------------------------------------------------------------------
offset_pointload=zeros(nnodes,1); 
for i=1:nnodes   
    if Loading_data(7,i)==1                                                 % Shear Center
        offset_pointload(i,1)=0+Loading_data(8,i); 
    elseif Loading_data(7,i)==2                                             % Top
        offset_pointload(i,1)=-hst1(i,1)-tft1(i,1)/2+Loading_data(8,i);      
    elseif Loading_data(7,i)==3                                             % Bottom
        offset_support(i,1)=hsb1(i,1)+tfb1(i,1)/2+Loading_data(8,i);
    elseif Loading_data(7,i)==4                                             % Centroid
        offset_pointload(i,1)=CSD1(i,1)+Loading_data(8,i);    
    elseif Loading_data(7,i)==5                                             % Mid-web
        offset_pointload(i,1)=Dmid1(i,1)+Loading_data(8,i);
    end
end

% ------------------------------------------------------------------------
% ----------------      Rigid offset for Uniform Loads     ---------------
% ------------------------------------------------------------------------
offset_distload=zeros(size(DistLoading_data,2),1);
for i=1:size(DistLoading_data,2) 
    if DistLoading_data(2,i)==1                                             % Shear Center
        offset_distload(i,1)=0+Loading_data(8,Member_data(2,DistLoading_data(1,i)));
    elseif DistLoading_data(2,i)==2                                         % Top
        offset_distload(i,1)=-hst1(i,1)-tft1(i,1)/2+Loading_data(8,Member_data(2,DistLoading_data(1,i)));      
    elseif DistLoading_data(2,i)==3                                         % Bottom
        offset_distload(i,1)=hsb1(i,1)+tfb1(i,1)/2+Loading_data(8,Member_data(2,DistLoading_data(1,i)));
    elseif DistLoading_data(2,i)==4                                         % Centroid
        offset_distload(i,1)=CSD1(i,1)+Loading_data(8,Member_data(2,DistLoading_data(1,i)));   
    elseif DistLoading_data(2,i)==5                                         % Mid-web
        offset_distload(i,1)=Dmid1(i,1)+Loading_data(8,Member_data(2,DistLoading_data(1,i)));
    end
end

% ------------------------------------------------------------------------
% ------       Boundary Conditions & External Force matrix        --------
% ------------------------------------------------------------------------
BC=zeros(nDOF,1); Qe=zeros(nDOF,1);
for i = 1:nnodes
    for j = 1:nodedof    
        BC((i-1)*nodedof+j,1) =  BC_data(j+1,i);                            % Boundary Conditions
        if j>=7
            Qe((i-1)*nodedof+j,1) = 0;
        else
            Qe((i-1)*nodedof+j,1) =  Loading_data(j,i);                     % Point Loads
        end
    end
end

% % % ------------------------------------------------------------------------
% % % --------------------           Load Height.         --------------------              %%%%%%update this section, negative to other load heights?
% % % ------------------------------------------------------------------------
% % [hd1,hd2]=deal(zeros(nelem,1)); counter=0; %need d1 and d2 for load height script
% % for i=1:nnodes
% %     for j=1:Material_data(1,i)
% %         counter=counter+1;
% %         if Loading_data(7,i)==1                                             % Shear Center
% %          hd1(counter,1)=0+Loading_data(8,i);
% %         elseif Loading_data(7,i)==2                                         % Top
% %          hd1(counter,1)=-hst1(i,1)-tft1(i,1)/2+Loading_data(8,i);
% %         elseif Loading_data(7,i)==3                                         % Bottom
% %          hd1(counter,1)=-hsb1(i,1)+hb1(i,1)+LNC1(i,12);
% %         elseif Loading_data(7,i)==4                                         % Centroid
% %          hd1(counter,1)=-( CSD1(i,1) +LNC1(i,12) ); 
% %         elseif Loading_data(7,i)==5                                         % Mid-web
% %          hd1(counter,1)=-( CSD1(i,1) +LNC1(i,12) );    
% %         end
% % 
% %         if isequal(LNC2(i,13),1) || isequal(LNC2(i,13),0)% Shear Center
% %          hd2(i,1)=0;
% %         elseif isequal(LNC2(i,13),2) % Top
% %          hd2(i,1)=hst2(i,1)+tft2(i,1)/2 +LNC2(i,12);
% %         elseif isequal(LNC2(i,13),3) % Mid-Web
% %          hd2(i,1)=-hsb2(i,1)+hb2(i,1)+LNC1(i,12);
% %         elseif isequal(LNC2(i,13),4) % Centroid
% %          hd2(i,1)=-( CSD2(i,1)+LNC2(i,12) );    
% %         end
% %     end
% % end

% ------------------------------------------------------------------------
% --------         Linear Elastic Buckling Analysis           ------------
% ------------------------------------------------------------------------
nmode = 1; ninc = 1; lambda = 1; increment = 1; EGunew=[]; Funew=[];        % Number of modes, number of increments, increment scale
Qint1=zeros(nelem,nodedof,(round(ninc/lambda)));                            % Preallocationg 
Qint2=zeros(nelem,nodedof,(round(ninc/lambda)));                            % Preallocationg 
Qintf=zeros(nelem,nodedof*2,(round(ninc/lambda)));                          % Preallocationg
QintfE=zeros(nelem,nodedof*2,(round(ninc/lambda)));                         % Preallocationg
nip=5;                                                                      % Number of integration points
zeta=[-1 -sqrt(3/7) 0 sqrt(3/7) 1];                                         % 5 points Gauss-Lobatto locations
[L,dX,dY,dZ]=InitialEleVal(nelem,xg1,yg1,zg1,xg2,yg2,zg2);                  % initial global geometry

while increment < (ninc/lambda)+1
K=zeros(nDOF);                                                              % initialize global stiffness matrix
KtBB=zeros(nDOF);                                                           % initialize global tangent stiffness matrix
KggBB=zeros(nDOF);                                                          % initialize global geometry stiffness matrix
Fint=zeros(nDOF,1);                                                         % initialize global internal force vector
DFG=zeros(nDOF,1);                                                          % initialize global internal force vector
angletap = zeros(nelem,2);                                                  %%%%%% Delete me after i actually calculate tapers
[beta1x,beta1y,beta1z,beta1xp,beta2x,beta2y,beta2z,beta2xp]=...
    deal(zeros(nelem,1)); xn=0;

for i = 1:nmember
for j=1:Material_data(1,i)
xn=xn+1;
Rd = eye(14);                                                               % Rigid offset
Rd(3,4)=offset_support(Material_data(2,i),1);
Rd(10,11)=offset_support(Material_data(3,i),1); 
Rd(1,6)=-offset_support(Material_data(2,i),1)*cos(-angletap(xn,2));
Rd(8,13)=-offset_support(Material_data(3,i),1)*cos(-angletap(xn,2));
Rd(2,6)=-offset_support(Material_data(2,i),1)*sin(-angletap(xn,2));
Rd(9,13)=-offset_support(Material_data(3,i),1)*sin(-angletap(xn,2));
Ld = eye(14); Ld(1,6)=offset_distload(xn,1);Ld(8,13)=offset_distload(xn,1); % Rigid offset for Uniform Loads in Element Frame
Lsd = eye(14); Lsd(1,6)=CSD1(xn,1); Lsd(8,13)=CSD2(xn,1);                   % Rigid offset for Self-weight in Element Frame     
[t1,t2,t3,u1,u2,u3] = UpdatedElementNodalTriadsTU(beta1x(xn,1),beta2x(xn... % Update Nodal Triads using global solution : Angle between Element frame and CR frame 
    ,1),beta1y(xn,1),beta2y(xn,1),beta1z(xn,1),beta2z(xn,1),alphatap(xn,2));
[e1,e2,e3,Zetaavg,Zeta1,Zeta2,Eta1,Eta2] = ElementBaseVector(dX(xn,1),...
    dY(xn,1),dZ(xn,1),t2,u2,L(xn,1),alphatap(xn,2));
% [theta1numelem,theta1zn,theta1yn,theta2numelem,theta2zn,theta2yn,...        % Deformation in CR frame
%     theta1xpn,theta2xpn] = NaturalFrame(t1,t2,t3,u1,u2,u3,e1,e2,e3,...
%     beta1xp(xn,1),beta2xp(xn,1));
[Pbar]=Projection(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(xn,1));
[e1,e2,e3] = GlobalTransform(e1,e2,e3,alphatap(n,2));
[Ge]=CoordTransform(e1,e2,e3); 

% ------------------------------------------------------------------------
% ----------------------  Section Properties            ------------------
% ------------------------------------------------------------------------
xe=L/2*zeta+L/2;
wts=[0.1 49/90 32/45 49/90 0.1]/2*L;                                        % Integration weights
if ~isequal(Dg1(i,1),Dg2(i,1))                                              % If tapered web
% Calculate section properties
% Only the tapers and must do it linearly
bfbe=bfb1(i,1)*(1-xe/L)+bfb2(i,1)*xe/L;
bfte=bft1(i,1)*(1-xe/L)+bft2(i,1)*xe/L;
tfbe=tfb1(i,1)*(1-xe/L)+tfb2(i,1)*xe/L;
tfte=tft1(i,1)*(1-xe/L)+tft2(i,1)*xe/L;
De=Dg1(i,1)*(1-xe/L)+Dg2(i,1)*xe/L;
twe=tw1(i,1)*(1-xe/L)+tw2(i,1)*xe/L;
Afillete=Afillet1(i,1)*(1-xe/L)+Afillet2(i,1)*xe/L;
hte=ht1(i,1)*(1-xe/L)+ht2(i,1)*xe/L;
hbe=hb1(i,1)*(1-xe/L)+hb2(i,1)*xe/L;
yse=ys1(i,1)*(1-xe/L)+ys2(i,1)*xe/L;
else
% Use nontapered geometry
bfbe=bfb1(i,1);
bfte=bft1(i,1);
tfbe=tfb1(i,1);
tfte=tft1(i,1);
De=Dg1(i,1);
twe=tw1(i,1);
Afillete=Afillet1(i,1);
hte=ht1(i,1);
hbe=hb1(i,1);
yse=ys1(i,1);
end
Afb=bfbe.*tfbe;Aft=bfte.*tfte;Aw=De.*twe;
h = hte+hbe;
hcfb = (Aft.*(h) + Aw.*(De/2+tfbe/2))./(Afb+Aft+Aw);                        % Distantance from bottom flange centroid to NA
Ift = bfte.^3.*tfte/12;                                                     % Top flange weak axis moment of inertia
Ifb = bfbe.^3.*tfbe/12;                                                     % Bottom flange weak axis moment of inertia
Iwy = De.*(twe.^3)/12;                                                      % Web weak axis moment of inertia
do = yse+De/2+tfbe;
hufb = do - tfbe/2;                                                         % SC
huft = h - hufb;                                                            % SC
yuc = hcfb-hufb;
Db = hufb-tfbe/2;
Dt = huft-tfte/2;

% stong axis w.r.t User define axis
Io = bfte.*(tfte.^3)/12 + twe.*(De.^3)/12 + bfbe.*(tfbe.^3)/12;
Ae = bfbe.*tfbe+bfte.*tfte+De.*twe+Afillete;
Iux = Io + Afb.*hufb.^2 + Aft.*huft.^2  + Aw.*(De/2-hufb+tfbe/2).^2;
r_Afillet = sqrt(Afillete/(4-pi));
Iux_Afillet = 4*(1-5*pi/16)*r_Afillet.^4 +(Afillete/2).*Db.^2 +(Afillete/2).*Dt.^2;
Iux = Iux + Iux_Afillet;
Iy = Ifb + Ift +Iwy;
Iy_Afillet = 4*(1-5*pi/16)*r_Afillet.^4 +Afillete.*(twe/2).^2;
Iy = Iy + Iy_Afillet;
Cwa = Ifb.*Ift.*h.^2./(Ifb + Ift);
Ipp = bfte.*( (Dt+tfte).^5 - Dt.^5 )/5 + (bfte.^3).*( (Dt+tfte).^3 - Dt.^3 )/18 ...
    + (bfte.^5).*tfte/80 + bfbe.*( (Db+tfbe).^5 - Db.^5 )/5 ...
    + (bfbe.^3).*( (Db+tfbe).^3 - Db.^3 )/18 + (bfbe.^5).*tfbe/80 ...
    +  twe.*( Dt.^5 + Db.^5 )/5 + (twe.^3).*( Dt.^3 + Db.^3 )/18 ...
    + (twe.^5).*(Dt + Db)/80;
Ip = Iux +Iy;
Rt = -2*hstp-ysp+yse.*bftp./bfte;
Rb = 2*hsbp-ysp+yse.*bfbp./bfbe;

[Kt]=StiffnessELEMENT3DESL_slender(Ae,yuc,Iux,Iy,Ip,Aft,Dt,...              % Does not currently handle releases, need to finish warping free??
    tfte,huft,Afb,tfbe,Ift,Ifb,Iwy,hufb,Ipp,Cwa,Db,L,E,wts,Rt,Rb,...
    theta1x,theta1z,theta1y,theta2x,theta2z,theta2y,theta1xp,theta2xp);   
   
% Load Height.
% [Fe1,Fe2,M] = LoadHeight(d1(i),d2(i));

% Elastic Tangent Stiffness Matrix
Kts = Ge*Rd'*(Pbar'*Kt*Pbar)*Rd*Ge';

% Geometric Stiffness Matrix
% Kggs = Ge*Rd'*(Pbar'*Kgg*Pbar +((Kext1+Kext2)+ (Kext1+Kext2)')/2)*Rd*Ge'+GDe*M*(Fe1+Fe2+Kh2)*M'*GDe';
Kggs=zeros(size(Kts,1),size(Kts,2));

% Total Stiffness
Kg = Kts + Kggs;

[K,Fint,DFG] = assemble(K,Fint,DFG,Kg,Qg,DG,MI,xn);                         % Total Stiffness
[KtBB,KggBB] = assemble1(KtBB,KggBB,Kts,Kggs,MI,xn);                        % Elastic stiffness & Geometric stiffness
end
end
   
% [Funew]=FinalDisplacement(Funew,du,nnodes,nodedof,increment);               % including supports nodes;
% KtBB=KtBB+KS+KB;

% for i = 1:nelem
%    for j = 1:nodedof
%        Qint1(i,j,increment) = Qing(i,j);
%        Qint2(i,j,increment) = Qing(i,j+nodedof);
%        QintfE(i,2*j,increment) = Qin(i,j);
%        Qintf(i,2*j,increment) = Qin(i,j);
%    end
% end   
increment = increment + 1;                                                  % Repeat increments
end
   
% ------------------------------------------------------------------------
% -------------------       Report Final Results       -------------------
% ------------------------------------------------------------------------
[VV,tmp2]=eig(KtBB,-KggBB);                                                 % calculate eigen value
tmp2=diag(tmp2);

if max(tmp2(:,1)) <= 0
  [VV,tmp2]=eigs(KtBB,-KggBB,30,'SM');
  tmp2=diag(tmp2);
end

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
gamma=zeros(nmode,1); 
for i = 1:nmode
    gamma(i,1)=Eigv(i);
%     EigMode(:,i)=EigVV(:,i);
%     [dVV(:,i)]=RTDisplacement(EigMode(:,i),nDOF,BC);
%     [EGunew(:,:,i)]=CurrentDisplacement(dVV(:,i),nnodes,nodedof); % including supports nodes
end

