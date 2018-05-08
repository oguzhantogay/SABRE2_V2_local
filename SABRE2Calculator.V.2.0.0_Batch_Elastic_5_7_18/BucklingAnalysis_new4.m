function [gamma] = BucklingAnalysis_new4(Geometry_data,Member_data,Loading_data,...
    DistLoading_data,BC_data,Material_data,slend_flag)    
% ************************************************************************
% *********       Linear Elastic Eigenvalue Buckling Load       **********
% ************************************************************************ 
nnodes  =size(Geometry_data,2);                                             % Total number of nodes
nmembers=size(Member_data,2);                                               % Total number of members
nodedof =7;                                                                 % Number of degree of freedom in each node
nelem   =sum(Material_data(1,:));                                           % Total number of elements before removing duplicates
for i=1:size(Member_data,2)                                                 % Remove duplicate nodes in stiffness formulation
    for j=1:size(Member_data,2)
        if Member_data(2,i)==Member_data(3,j)
            nelem=nelem-1;
        end
    end   
end
nDOF    =nodedof*(nelem+nmembers);                                          % Total number of dofs
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
[xg,yg,zg,bfb,tfb,bft,tft,Dg,tw,Dt,Db,ht,hb,hg,hsb,Dsb,...
hst,Dst,Dmid,Ag,ytbar,Dct,Dcb,hct,hcb,CSD,Afillet]=deal(zeros...
(nnodes,1));                                                                % preallocate geometry arrays
for i=1:nnodes
    xg(i,1)=Geometry_data(1,i);                                             % global coordinate : xg
    yg(i,1)=Geometry_data(2,i);                                             % global coordinate : yg
    zg(i,1)=Geometry_data(3,i);                                             % global coordinate : zg
    
    % Cross section properties
    bfb(i,1)=Geometry_data(4,i);                                            % Bottom flange width
    tfb(i,1)=Geometry_data(5,i);                                            % Bottom flange thickness
    bft(i,1)=Geometry_data(6,i);                                            % Top flange width
    tft(i,1)=Geometry_data(7,i);                                            % Top flange thickness
    Dg(i,1)=Geometry_data(8,i);                                             % Web depth
    tw(i,1)=Geometry_data(9,i);                                             % Web thickness
    Afillet(i,1)=Geometry_data(10,i);                                       % Area of fillet weld
    
    % Mid-web depth
    Dt(i,1)=Dg(i,1)/2;                                                      % top of Web depth to mid web depth
    Db(i,1)=Dt(i,1);                                                        % bottom of Web depth to mid web depth
    ht(i,1)=Dt(i,1)+tft(i,1)/2;                                             % top flange centroid to mid web depth
    hb(i,1)=Db(i,1)+tfb(i,1)/2;                                             % bottom flange centroid to mid web depth

    % Shear center
    hg(i,1)=Dg(i,1)+tft(i,1)/2+tfb(i,1)/2;                                  % Distance between flange centroids
    hsb(i,1)=(tft(i,1).*bft(i,1).^3.*hg(i,1))./(tfb(i,1).*bfb(i,1).^3+...
        tft(i,1).*bft(i,1).^3);                                             % bottom flange centroid to shear center
    Dsb(i,1)=hsb(i,1)-tfb(i,1)/2;                                           % bottom of Web depth to shear center
    hst(i,1)=hg(i,1)-hsb(i,1);                                              % top flange centroid to shear center
    Dst(i,1)=hst(i,1)-tft(i,1)/2;                                           % top of Web depth to shear center
    Dmid(i,1)=Dsb(i,1)-Dg(i,1)/2;                                           % web mid depth to shear center  

    % Centroid Axis
    Ag(i,1)=tft(i,1).*bft(i,1)+tw(i,1).*Dg(i,1)+tfb(i,1).*bfb(i,1);         % gross area
    ytbar(i,1)=(bft(i,1).*tft(i,1).*tft(i,1)/2+tw(i,1).*Dg(...
        i,1).*(tft(i,1)+Dg(i,1)/2)+ bfb(i,1).*tfb(i,1).*...                 % top flange centroid to section centroid
        (tft(i,1)+Dg(i,1)+tfb(i,1)/2))./Ag(i,1);
    Dct(i,1)=ytbar(i,1) - tft(i,1);                                         % top of Web depth to section centroid
    Dcb(i,1)=Dg(i,1) - Dct(i,1);                                            % bottom of Web depth to section centroid
    hct(i,1)=ytbar(i,1) - tft(i,1)/2;                                       % top flange centroid to section centroid
    hcb(i,1)=hg(i,1) - hct(i,1);                                            % bottom flange centroid to section centroid
    CSD(i,1) = hct(i,1)-hst(i,1);                                           % centroid to shear center   
end 

% ------------------------------------------------------------------------
% --------------------      Rigid offset for Supports  -------------------
% ------------------------------------------------------------------------
offset_support=zeros(nnodes,1);
for i=1:nnodes
    if BC_data(1,i)==1                                                      % Shear Center
        offset_support(i,1)=0;
    elseif BC_data(1,i)==2                                                  % Top
        offset_support(i,1)=-hst(i,1)-tft(i,1)/2;      
    elseif BC_data(1,i)==3                                                  % Bottom
        offset_support(i,1)=hsb(i,1)+tfb(i,1)/2;
    elseif BC_data(1,i)==4                                                  % Centroid
        offset_support(i,1)=CSD(i,1);   
    elseif BC_data(1,i)==5                                                  % Mid-web
        offset_support(i,1)=Dmid(i,1);  
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
        offset_pointload(i,1)=-hst(i,1)-tft(i,1)/2+Loading_data(8,i);      
    elseif Loading_data(7,i)==3                                             % Bottom
        offset_pointload(i,1)=hsb(i,1)+tfb(i,1)/2+Loading_data(8,i);
    elseif Loading_data(7,i)==4                                             % Centroid
        offset_pointload(i,1)=CSD(i,1)+Loading_data(8,i);    
    elseif Loading_data(7,i)==5                                             % Mid-web
        offset_pointload(i,1)=Dmid(i,1)+Loading_data(8,i);
    end
end

% ------------------------------------------------------------------------
% ----------------      Rigid offset for Uniform Loads     ---------------%%%%%%%%%update alpha here
% ------------------------------------------------------------------------
offset_distload=zeros(size(DistLoading_data,2),1);
for i=1:size(DistLoading_data,2) 
    if DistLoading_data(2,i)==1                                             % Shear Center
        offset_distload(i,1)=0+Loading_data(8,Member_data(2,DistLoading_data(1,i)));
    elseif DistLoading_data(2,i)==2                                         % Top
        offset_distload(i,1)=-hst(i,1)-tft(i,1)/2+Loading_data(8,Member_data(2,DistLoading_data(1,i)));      
    elseif DistLoading_data(2,i)==3                                         % Bottom
        offset_distload(i,1)=hsb(i,1)+tfb(i,1)/2+Loading_data(8,Member_data(2,DistLoading_data(1,i)));
    elseif DistLoading_data(2,i)==4                                         % Centroid
        offset_distload(i,1)=CSD(i,1)+Loading_data(8,Member_data(2,DistLoading_data(1,i)));   
    elseif DistLoading_data(2,i)==5                                         % Mid-web
        offset_distload(i,1)=Dmid(i,1);%+Loading_data(8,Member_data(2,DistLoading_data(1,i)));
    end
end

% ------------------------------------------------------------------------
% ------       Boundary Conditions & External Force matrix        --------
% ------------------------------------------------------------------------
BC=zeros(nodedof*nnodes,1); Qe=zeros(nodedof*nnodes,1);
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

% ------------------------------------------------------------------------
% --------         Linear Elastic Buckling Analysis           ------------
% ------------------------------------------------------------------------
nmode = 1; ninc = 1; lambda = 1; increment = 1;                             % Number of modes, number of increments, increment scale
nip=5;                                                                      % Number of integration points
zeta=[-1 -sqrt(3/7) 0 sqrt(3/7) 1];                                         % 5 points Gauss-Lobatto locations
KeBB=zeros(nDOF);                                                           % initialize global tangent stiffness matrix
KgBB=zeros(nDOF);                                                           % initialize global geometry stiffness matrix
Ks=zeros(6,6,nip,nmembers,max(Material_data(1,:)));
Fint=zeros(nDOF,1);                                                         % initialize global internal force vector
% DFG=zeros(nDOF,1);                                                          % initialize global internal force vector
angletap = zeros(nelem,2);                             %%%%%% Delete me after i actually calculate tapers

[beta1x,beta1y,beta1z,beta2x,beta2y,beta2z,beta1xp,beta2xp]=...
    deal(zeros(nelem,1)); 
for i = 1:nmembers
[L,dX,dY,dZ]=InitialEleVal(Material_data(1,i),...
    Geometry_data(1,Member_data(2,i)),Geometry_data(2,Member_data(2,i)),...
    Geometry_data(3,Member_data(2,i)),Geometry_data(1,Member_data(3,i)),...
    Geometry_data(2,Member_data(3,i)),Geometry_data(3,Member_data(3,i)));   % initial global geometry
for xn=1:Material_data(1,i)
Rd = eye(14);                                                               % Rigid offset of supports
if i==1 && xn==1                                            %%% hard coded, fix me later
Rd(3,4)=offset_support(Member_data(2,i),1);                                 %Eq 2.307         
Rd(1,6)=-offset_support(Member_data(2,i),1)*cos(-angletap(xn,2));         % Rigid offset of supports for tapered sections (still exists with no taper?)
Rd(2,6)=-offset_support(Member_data(2,i),1)*sin(-angletap(xn,2));         % Rigid offset of supports for tapered sections
elseif i==nmembers && xn==Material_data(1,i)
Rd(8,13)=-offset_support(Member_data(3,i),1)*cos(-angletap(xn,2));        % Rigid offset of supports for tapered sections (still exists with no taper?)
Rd(9,13)=-offset_support(Member_data(3,i),1)*sin(-angletap(xn,2));        % Rigid offset of supports for tapered sections
Rd(10,11)=offset_support(Member_data(3,i),1);                               %Eq 2.307
end
% % Ld = eye(14);                                                               % Rigid offset for Uniform Loads in Element Frame
% % Ld(1,6)=offset_distload(xn,1);Ld(8,13)=offset_distload(xn,1); 
% % Lsd = eye(14);                                                              % Rigid offset for Self-weight in Element Frame 
% % Lsd(1,6)=CSD(xn,1); Lsd(8,13)=CSD(xn,1);                       
[t1,t2,t3,u1,u2,u3] = UpdatedElementNodalTriadsTU(beta1x(xn,1),beta2x(xn... % Update Nodal Triads using global solution : Angle between Element frame and CR frame 
    ,1),beta1y(xn,1),beta2y(xn,1),beta1z(xn,1),beta2z(xn,1),angletap(xn,2));
[e1,e2,e3,Zetaavg,Zeta1,Zeta2,Eta1,Eta2] = ElementBaseVector(dX(xn,1),...
    dY(xn,1),dZ(xn,1),t2,u2,L(xn,1),angletap(xn,2));
[Pbar]=Projection(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(xn,1));
[e1,e2,e3] = GlobalTransform(e1,e2,e3,angletap(xn,2));
[Ge]=CoordTransform(e1,e2,e3); 

% Section Properties
xe=L/2*zeta+L/2;
wts=[0.1 49/90 32/45 49/90 0.1]/2.*L;                                       % Integration weights
if ~isequal(Dg(Member_data(2,i),1),Dg(Member_data(2,i),1))                  % Calculate each element cross section if linearly tapered
bfbe=bfb(Member_data(2,i),1)*(1-xe/L)+bfb(Member_data(3,i),1)*xe/L;
bfte=bft(Member_data(2,i),1)*(1-xe/L)+bft(Member_data(3,i),1)*xe/L;        
tfbe=tfb(Member_data(2,i),1)*(1-xe/L)+tfb(Member_data(3,i),1)*xe/L;
tfte=tft(Member_data(2,i),1)*(1-xe/L)+tft(Member_data(3,i),1)*xe/L;
De=Dg(Member_data(2,i),1)*(1-xe/L)+Dg(Member_data(3,i),1)*xe/L;
twe=tw(Member_data(2,i),1)*(1-xe/L)+tw(Member_data(3,i),1)*xe/L;
Afillete=Afillet(Member_data(2,i),1)*(1-xe/L)+Afillet(Member_data(3,i),1)*xe/L;
hte=ht(Member_data(2,i),1)*(1-xe/L)+ht(Member_data(3,i),1)*xe/L;
hbe=hb(Member_data(2,i),1)*(1-xe/L)+hb(Member_data(3,i),1)*xe/L;
yse=Dmid(Member_data(2,i),1)*(1-xe/L)+Dmid(Member_data(3,i),1)*xe/L;
else                                                                        % Use nontapered geometry
bfbe=bfb(Member_data(2,i),1);
bfte=bft(Member_data(2,i),1);
tfbe=tfb(Member_data(2,i),1);
tfte=tft(Member_data(2,i),1);
De=Dg(Member_data(2,i),1);
twe=tw(Member_data(2,i),1);
Afillete=Afillet(Member_data(2,i),1);
hte=ht(Member_data(2,i),1);
hbe=hb(Member_data(2,i),1);
yse=Dmid(Member_data(2,i),1);
end
hstp = (hst(Member_data(3,i),1) -hst(Member_data(2,i),1) )/L(xn,1);         %first derivative of top flange centroid to shear center
hsbp = (hsb(Member_data(3,i),1) -hsb(Member_data(2,i),1) )/L(xn,1);         %first derivative of bottom flange centroid to shear center
ysp  = (Dmid(Member_data(3,i),1)-Dmid(Member_data(2,i),1))/L(xn,1);         %first derivative of web mid depth to shear center 
bftp = (bft(Member_data(3,i),1) -bft(Member_data(2,i),1) )/L(xn,1);         %first derivative of top flange width
bfbp = (bfb(Member_data(3,i),1) -bfb(Member_data(2,i),1) )/L(xn,1);         %first derivative of bottom flange width
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

% stong axis w.r.t user defined axis
Aweb = De.*twe;
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
[theta1x,theta1z,theta1y,theta2x,theta2z,theta2y,theta1xp,theta2xp]...
    = NaturalFrame(t1,t2,t3,u1,u2,u3,e1,e2,e3,beta1xp(xn,1),beta2xp(xn,1));
if slend_flag =='S' 
J=0;
elseif slend_flag == 'N'   
J=De.*(twe.^3)/3+(bfte.*(tfte.^3)/3).*(1-0.63*tfte./bfte)+(bfbe.*...
    (tfbe.^3)/3).*(1-0.63*tfbe./bfbe);    
end

%% Calculate Tangent Stiffness Matrix
[Ke,KS]=Stiffness_Ke(Ae,yuc,Iux,Iy,Ip,Aft,Dt,...              % Does not currently handle releases
    tfte,huft,Afb,tfbe,Ift,Ifb,Iwy,hufb,Ipp,Cwa,Db,L(xn,1),E(i,1),wts(xn,:),Rt,Rb,...
    theta1x,theta1z,theta1y,theta2x,theta2z,theta2y,theta1xp,theta2xp,...
    Aweb,hte,hbe,nip,xe(xn,:),J,G(i,1));   
Ks(:,:,:,i,xn)=KS(:,:,:);                                                   % Local stiffness componets per element
Kts = Ge*Rd'*(Pbar'*Ke*Pbar)*Rd*Ge';                                        % Local Elastic Tangent Stiffness Matrix
[KeBB,Fint] = assemble_Ke(KeBB,Kts,Member_data,i,xn,Material_data,Fint,...
    Loading_data);                                                          % Assemble global tangent stiffness matrix
end
end  
[KeFF,Fff,add] = partition_Ke(KeBB,BC_data,Member_data,Material_data,Fint);                                                          % Partition global matricies to free dof's

%% Update Displacements
Uff = KeFF\(Fff);                                                           % 1st Elastic nodal displacement
U = Uff;    
for i=1:size(add,1)                                                         % manually insert zero displacement for restrained dof's in displacement array
    U = [U(1:add(i,1),1); 0; U(add(i,1)+1:end,1)];
end
unew1 = zeros(size(U,1)/7-1,7); unew2 = zeros(size(U,1)/7-1,7);             % update displacements 
for i=1:size(U,1)/7-1
  for j=1:7
     unew1(i,j)=U(7*(i-1)+j,1); 
     unew2(i,j)=U(7*i+j,1); 
  end
end  

%% Calculate Geometric Stiffness matrix
for i = 1:nmembers
[L,dX,dY,dZ]=InitialEleVal(Material_data(1,i),...
    Geometry_data(1,Member_data(2,i)),Geometry_data(2,Member_data(2,i)),...
    Geometry_data(3,Member_data(2,i)),Geometry_data(1,Member_data(3,i)),...
    Geometry_data(2,Member_data(3,i)),Geometry_data(3,Member_data(3,i)));   % initial global geometry
for xn=1:Material_data(1,i)
Rd = eye(14);                                                               % Rigid offset of supports
if i==1 && xn==1                                            %%% hard coded, fix me later
Rd(3,4)=offset_support(Member_data(2,i),1);                                 %Eq 2.307         
Rd(1,6)=-offset_support(Member_data(2,i),1)*cos(-angletap(xn,2));         % Rigid offset of supports for tapered sections (still exists with no taper?)
Rd(2,6)=-offset_support(Member_data(2,i),1)*sin(-angletap(xn,2));         % Rigid offset of supports for tapered sections
elseif i==nmembers && xn==Material_data(1,i)
Rd(8,13)=-offset_support(Member_data(3,i),1)*cos(-angletap(xn,2));        % Rigid offset of supports for tapered sections (still exists with no taper?)
Rd(9,13)=-offset_support(Member_data(3,i),1)*sin(-angletap(xn,2));        % Rigid offset of supports for tapered sections
Rd(10,11)=offset_support(Member_data(3,i),1);                               %Eq 2.307
end
xe=L/2*zeta+L/2;
wts=[0.1 49/90 32/45 49/90 0.1]/2.*L;
[t1,t2,t3,u1,u2,u3] = UpdatedElementNodalTriadsTU(beta1x(xn,1),beta2x(xn... % Update Nodal Triads using global solution : Angle between Element frame and CR frame 
    ,1),beta1y(xn,1),beta2y(xn,1),beta1z(xn,1),beta2z(xn,1),angletap(xn,2));
[e1,e2,e3,Zetaavg,Zeta1,Zeta2,Eta1,Eta2] = ElementBaseVector(dX(xn,1),...
    dY(xn,1),dZ(xn,1),t2,u2,L(xn,1),angletap(xn,2));
[Pbar]=Projection(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(xn,1));
[e1,e2,e3] = GlobalTransform(e1,e2,e3,angletap(xn,2));
[Ge]=CoordTransform(e1,e2,e3);  
if i>1
qno=Pbar*Rd*Ge'*[unew1(xn+sum(Material_data(1,1:i-1)),:)';unew2(xn+sum(Material_data(1,1:i-1)),:)'];    
else
qno=Pbar*Rd*Ge'*[unew1(xn,:)';unew2(xn,:)']; 
end
[Kgg,Qino]=Stiffness_Kg(Ks(:,:,:,i,xn),...                                  % Local geometric stiffness matrix
    theta1x,theta1z,theta1y,theta2x,theta2z,theta2y,theta1xp,theta2xp,...
    nip,xe(xn,:),wts(xn,:),L(xn,1),qno);  
[Kext1,Kext2]=ExternalGStiffness(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(xn,1),Qino);
if xn==1 && ~isequal(abs(round(Loading_data(2,Member_data(2,i)),8)),0.00000000)
[Kh1,M] = LoadHeight(-Loading_data(2,i)/2*offset_pointload(i,1),0);         % Kh1 (Eq 2.293) is the external work contribution for point loads
elseif xn==Material_data(1,i) && ~isequal(abs(round(Loading_data(2,Member_data(3,i)),8)),0.00000000)
[Kh1,M] = LoadHeight(0,-Loading_data(2,i+1)/2*offset_pointload(i+1,1));      
else
[Kh1,M] = LoadHeight(0,0); 
end
Kh2=zeros(9,9);                                                             % Kh2 (Eq 2.297) is the external work contribution for distributed traction loads

% Geometric Stiffness Matrix
Kgs = Ge*Rd'*(Pbar'*Kgg*Pbar+((Kext1+Kext2)+(Kext1+Kext2)')/2)*Rd*Ge'...
    +Ge*M*(Kh1+Kh2)*M'*Ge';

[KgBB] = assemble_Kg(KgBB,Kgs,Member_data,i,xn,Material_data);   
end
end
[KgFF] = partition_Kg(KgBB,BC_data,Member_data,Material_data);              % Partition global matricies to free dof'
while increment < (ninc/lambda)+1
increment = increment + 1;                                                  % Repeat increments
end

% ------------------------------------------------------------------------
% -------------------       Report Final Results       -------------------
% ------------------------------------------------------------------------  

[VV,tmp2]=eig(KeFF,-KgFF);                                                  % calculate eigen value
tmp2=diag(tmp2);
if max(tmp2(:,1)) <= 0
  [VV,tmp2]=eigs(KeBB,-KgBB,30,'SM');
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
end