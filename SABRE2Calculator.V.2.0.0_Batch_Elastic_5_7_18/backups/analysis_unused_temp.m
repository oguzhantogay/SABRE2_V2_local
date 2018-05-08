

%     % *** Global frame angle for each element without considering shear center
% %     q = 0; alpharef = zeros(nelem,2); 
% % %     for j=1:sum(SNodevalue(i,:,3))          
% %     opp = Geometry_data(Member_data(3,i),2)-Geometry_data(Member_data(2,i),2); % element depth in y-dir
% %     adj = Geometry_data(Member_data(3,i),1)-Geometry_data(Member_data(2,i),1); % element length in x-dir         
% %       alpharef(q+j,1)=MI(q+j,1);
% %       alpharef(q+j,2)=atan2(opp,adj); % Only global frame angle      
% % %     end
% %     q = sum(SNodevalue(i,:,3))+q; %number of elements per segment
%    % ----------------------------------------------------- Centroidal Angle S 
% %     DLe1 = zeros(nelem,3);DLe2 = zeros(nelem,3);
% %     for i=1:nelem
% %        Rz=[cos(-alpharef(i,2)) -sin(-alpharef(i,2)) 0; sin(-alpharef(i,2)) cos(-alpharef(i,2)) 0; 0 0 1];
% %        DLe1(i,:)=Rz*[xg1(i,1);yg1(i,1);0];
% %        DLe2(i,:)=Rz*[xg2(i,1);yg2(i,1);0];
% %     end 





% % ********** Global frame angle for each element considering shear center
% % alphatap = zeros(nelem,2);
% % for i=1:nelem
% %     opp = yg2(i,1)-yg1(i,1);        % element depth in y-dir
% %     adj = xg2(i,1)-xg1(i,1);        % element length in x-dir         
% %     alphatap(i,1)=MI(i,1);
% %     alphatap(i,2)=atan2(opp,adj);   % Global frame angle w.r.t Shear center
% % end
% % angletap = alphatap - alpharef;
% % % ----------------------------------------------- Tapering angle
% % segnum(1,1)=0;          % (Start node number - 1) for each nummember
% % ys1=zeros(nelem,1);ys2=zeros(nelem,1);yc1=zeros(nelem,1);yc2=zeros(nelem,1);
% % for i = 1:nmembers
% %    switch Rval(i,2)  
% %       case 1                                    % mid-web depth ; val = 1     
% %          for k = 1:sum(SNodevalue(i,:,3))
% %             ys1(k+segnum(i,1),1)=Dg1(k+segnum(i,1),1)/2 - Dst1(k+segnum(i,1),1); 
% %             ys2(k+segnum(i,1),1)=Dg2(k+segnum(i,1),1)/2 - Dst2(k+segnum(i,1),1);    % Shear center   
% %             yc1(k+segnum(i,1),1)=Dg1(k+segnum(i,1),1)/2 - Dct1(k+segnum(i,1),1); 
% %             yc2(k+segnum(i,1),1)=Dg2(k+segnum(i,1),1)/2 - Dct2(k+segnum(i,1),1);    % Centroid                   
% %          end            
% %       case 2                                    % top of web; val = 2
% %          for k = 1:sum(SNodevalue(i,:,3))
% %             ys1(k+segnum(i,1),1)=-Dst1(k+segnum(i,1),1);
% %             ys2(k+segnum(i,1),1)=-Dst2(k+segnum(i,1),1);                % Shear center        
% %             yc1(k+segnum(i,1),1)=-Dct1(k+segnum(i,1),1);
% %             yc2(k+segnum(i,1),1)=-Dct2(k+segnum(i,1),1);                % Centroid              
% %          end           
% %       case 3                                    % bottom of web; val = 3
% %          for k = 1:sum(SNodevalue(i,:,3))
% %             ys1(k+segnum(i,1),1)=Dsb1(k+segnum(i,1),1); 
% %             ys2(k+segnum(i,1),1)=Dsb2(k+segnum(i,1),1);              % Shear center      
% %             yc1(k+segnum(i,1),1)=Dcb1(k+segnum(i,1),1); 
% %             yc2(k+segnum(i,1),1)=Dcb2(k+segnum(i,1),1);              % Centroid                   
% %          end        
% %    end 
% %    segnum(i+1,1) = segnum(i,1) + sum(SNodevalue(i,:,3));
% % end   

% %     % Angle between shear center and centroid
% %     oppc(i,1) = yc2(i,1)-yc1(i,1);                                                         % element depth centroid in y-dir
% %     adj(i,1) = DLe2(i,1)-DLe1(i,1);                                                        % element length in x-dir         
% %     alphacen(i,1)=atan2(oppc(i,1),adj(i,1));                                               % Global frame angle w.r.t Shear center
% %     opps(i,1) = ys2(i,1)-ys1(i,1);                                                         % element depth shear center in y-dir
% %     alphasc(i,1)=atan2(opps(i,1),adj(i,1));                                                % Global frame angle w.r.t Shear center     
% %     CSangel(i,1) = alphacen(i,1) -  alphasc(i,1);                                          % Angle between centroid and shear center 
% % 
% %     % Tapering factors
% %     dX0(i,1) = xg2(i,1)-xg1(i,1);                                                          % dx
% %     dY0(i,1) = yg2(i,1)-yg1(i,1);                                                          % dy
% %     dZ0(i,1) = zg2(i,1)-zg1(i,1);                                                          % dz
% %     L0(i,1) = sqrt((dX0(i,1))^2 +(dY0(i,1))^2+(dZ0(i,1))^2);                                    % Element lenght
% %     hstp(i,1) = (hst2(i,1)-hst1(i,1))/L0(i,1);                                                  % first derivatives for hst
% %     hsbp(i,1) = (hsb2(i,1)-hsb1(i,1))/L0(i,1);                                                  % first derivatives for hsb
% %     ysp(i,1)  = (ys2(i,1) -ys1(i,1))/L0(i,1);                                                   % first derivatives for ys
% %     bftp(i,1) = (bft2(i,1)-bft1(i,1))/L0(i,1);                                                  % first derivatives for bft
% %     bfbp(i,1) = (bfb2(i,1)-bfb1(i,1))/L0(i,1);                                                  % first derivatives for bfb


% % % Incremental Loading
% % dF = lambda*Qe(:,1);
% % 
% % [dFn]=CurrentDisplacement(dF,nnodes,nodedof); % including supports nodes;
% % dFn1 = zeros(nelem,7); dFn2 = zeros(nelem,7);
% % for i=1:nelem
% %    for j=1:7
% %       dFn1(i,j)=dFn(MI(i,2),j); 
% %       dFn2(i,j)=dFn(MI(i,3),j);
% %    end
% % end  
% % 
% % % Load transform
% % dF=zeros(nDOF,1);
% % for n=1:nelem
% %     % Rigid offset for Supports in Element Frame
% %     Rsd = eye(14);
% %     Rsd(1,6)=-rxd1(n); Rsd(8,13)=-rxd2(n);
% % 
% %     % Rigid offset for Loads in Element Frame
% %     LHd = eye(14);
% %     LHd(1,6)=offset_pointload(n); LHd(8,13)=Lrd2(n);  
% % 
% %     % Inverse Rotation from Global Frame to Element Frame
% %     RLz=[cos(-alpharef(n,2)) -sin(-alpharef(n,2)) 0; ...
% %       sin(-alpharef(n,2)) cos(-alpharef(n,2)) 0; ...
% %       0 0 1];
% %     eL1 = [1; 0; 0];eL1 = RLz*eL1;
% %     eL2 = [0; 1; 0];eL2 = RLz*eL2;
% %     eL3 = [0; 0; 1];eL3 = RLz*eL3;
% % 
% %     [GLe]=CoordTransform(eL1,eL2,eL3);
% % 
% %     % Load Transform using Rigid Offset within Element Frame
% %     Ft = LHd'*Rsd'*GLe*[dFn1(n,:)'/Ldp1(n,2);dFn2(n,:)'/Ldp2(n,2)];
% % 
% %     % Rotation from Element Frame to Global Frame
% %     RRz=[cos(alpharef(n,2)) -sin(alpharef(n,2)) 0; ...
% %       sin(alpharef(n,2)) cos(alpharef(n,2)) 0; ...
% %       0 0 1];
% %     eR1 = [1; 0; 0];eR1 = RRz*eR1;
% %     eR2 = [0; 1; 0];eR2 = RRz*eR2;
% %     eR3 = [0; 0; 1];eR3 = RRz*eR3;
% % 
% %     [GRe]=CoordTransform(eR1,eR2,eR3);
% % 
% %     Ft=GRe*Ft;
% %     % Assemble
% %     [dF] = assemble2(dF,Ft,MI,n);
% % end
% % % ------------------------------------------------------ Load Transform E
% % 
% % % apply Supports and Incremental Loading
% % ind=(1:nDOF)';              % Define ind
% % ind=ind(logical(BC(:,1)));  % Supports
% % dF(ind,:)=[];               % Update Incremental Loading


% % ------------------------------------------------------------------------
% % ----------------             Self weight           ---------------------
% % ------------------------------------------------------------------------
% SUEC1(nelem,20)=0; SUEC2(nelem,20)=0;
% SUNCe1=zeros(nelem,3); SUNCe2=zeros(nelem,3);
% 
% 
% % switch get(get(ap_sw_buttongroup,'SelectedObject'),'Tag')
% %    case 'sw_on' 
% %       for i=1:numelem
% %           if isequal(PNC1(i,6),1) && ~isequal(PNC2(i,6),1)
% %               SUEC2(i,6)=-Ag1(i,1)*rho(i,1)-Ag2(i,1)*rho(i,1);
% %           elseif ~isequal(PNC1(i,6),1) && isequal(PNC2(i,6),1)
% %               SUEC1(i,6)=-Ag1(i,1)*rho(i,1)-Ag2(i,1)*rho(i,1);
% %           else
% %               SUEC1(i,6)=-Ag1(i,1)*rho(i,1);
% %               SUEC2(i,6)=-Ag2(i,1)*rho(i,1);
% %           end
% %       end
% %       
% %    case 'sw_off'
% % end
% %    
% % for i=1:numelem
% %    Rz=[cos(-alpharef(i,2)) -sin(-alpharef(i,2)) 0; ...
% %    sin(-alpharef(i,2)) cos(-alpharef(i,2)) 0; ...
% %    0 0 1];
% % 
% %    SUNCe1(i,:)=Rz*[SUEC1(i,5);SUEC1(i,6);SUEC1(i,7)];
% %    SUNCe2(i,:)=Rz*[SUEC2(i,5);SUEC2(i,6);SUEC2(i,7)];   
% % end
% % 
% % % ------------------------------------------------------------------------
% % % ----------------     Distributed Load Height       ---------------------
% % % ------------------------------------------------------------------------
% % LUNCe=zeros(nelem,3);      
% % for i=1:nelem
% %     Rz=[cos(-alpharef(i,2)) -sin(-alpharef(i,2)) 0; ...
% %     sin(-alpharef(i,2)) cos(-alpharef(i,2)) 0; ...
% %     0 0 1];
% %     LUNCe(i,:)=Rz*[LUEC(i,5);LUEC(i,6);LUEC(i,7)];
% % end

% % % ------------------------------------------------------------------------
% % % ----------------             Shear Spring          ---------------------
% % % ------------------------------------------------------------------------
% % KSg=zeros(nodedof*nnodes,nodedof*nnodes);
% % if ~isempty(BNC1) 
% %    alphashear = zeros(length(BNC1(:,1)),2);   
% %    BNC1e=zeros(length(BNC1(:,1)),3); 
% %    BNC2e=zeros(length(BNC1(:,1)),3);
% %    soffset_support=zeros(length(BNC1(:,1)),1);
% %    srd2=zeros(length(BNC1(:,1)),1);
% %    
% %    
% %    for i=1:length(BNC1(:,1))  
% %       SRd = eye(nodedof*nnodes);
% %       opp = BNC2(i,4)-BNC1(i,4);  % element depth in y-dir
% %       adj = BNC2(i,3)-BNC1(i,3);  % element length in x-dir         
% %       alphashear(i,1)=BNC1(i,1);
% %       alphashear(i,2)=atan2(opp,adj); % Only global frame angle
% %       Rz=[cos(-alphashear(i,2)) -sin(-alphashear(i,2)) 0; ...
% %       sin(-alphashear(i,2)) cos(-alphashear(i,2)) 0; ...
% %       0 0 1];
% %       BNC1e(i,:)=Rz*[BNC1(i,6);BNC1(i,7);BNC1(i,8)];
% %       BNC2e(i,:)=Rz*[BNC2(i,6);BNC2(i,7);BNC2(i,8)];
% %       KS=zeros(nodedof*nnodes,nodedof*nnodes);
% %       KS((BNC1(i,2)-1)*7+1,(BNC1(i,2)-1)*7+1)= BNC1e(i,1)+KS((BNC1(i,2)-1)*7+1,(BNC1(i,2)-1)*7+1);
% %       KS((BNC2(i,2)-1)*7+1,(BNC2(i,2)-1)*7+1)= BNC2e(i,1)+KS((BNC2(i,2)-1)*7+1,(BNC2(i,2)-1)*7+1);
% %       KS((BNC2(i,2)-1)*7+1,(BNC1(i,2)-1)*7+1)= -BNC2e(i,1);
% %       KS((BNC1(i,2)-1)*7+1,(BNC2(i,2)-1)*7+1)= -BNC2e(i,1);
% %       KS((BNC1(i,2)-1)*7+2,(BNC1(i,2)-1)*7+2)= BNC1e(i,2)+KS((BNC1(i,2)-1)*7+2,(BNC1(i,2)-1)*7+2);
% %       KS((BNC2(i,2)-1)*7+2,(BNC2(i,2)-1)*7+2)= BNC2e(i,2)+KS((BNC2(i,2)-1)*7+2,(BNC2(i,2)-1)*7+2);
% %       KS((BNC2(i,2)-1)*7+2,(BNC1(i,2)-1)*7+2)= -BNC2e(i,2);
% %       KS((BNC1(i,2)-1)*7+2,(BNC2(i,2)-1)*7+2)= -BNC2e(i,2);
% %       KS((BNC1(i,2)-1)*7+3,(BNC1(i,2)-1)*7+3)= BNC1e(i,3)+KS((BNC1(i,2)-1)*7+3,(BNC1(i,2)-1)*7+3);
% %       KS((BNC2(i,2)-1)*7+3,(BNC2(i,2)-1)*7+3)= BNC2e(i,3)+KS((BNC2(i,2)-1)*7+3,(BNC2(i,2)-1)*7+3);
% %       KS((BNC2(i,2)-1)*7+3,(BNC1(i,2)-1)*7+3)= -BNC2e(i,3);
% %       KS((BNC1(i,2)-1)*7+3,(BNC2(i,2)-1)*7+3)= -BNC2e(i,3);   
% %       if isequal(BNC1(i,9),1) || isequal(BNC1(i,9),0)% Top
% %          soffset_support(i,1)=-(hst1(i,1)+tft1(i,1)/2);         
% %       elseif isequal(BNC1(i,9),2) % Shear Center
% %          soffset_support(i,1)=0;     
% %       elseif isequal(BNC1(i,9),3) % Bottom
% %          soffset_support(i,1)=(hsb1(i,1)+tfb1(i,1)/2);
% %       end      
% %       if isequal(BNC2(i,9),1) || isequal(BNC2(i,9),0)% Top
% %          srd2(i,1)=-(hst2(i,1)+tft2(i,1)/2);
% %       elseif isequal(BNC2(i,9),2) % Shear Center
% %          srd2(i,1)=0;      
% %       elseif isequal(BNC2(i,9),3) % Bottom
% %          srd2(i,1)=(hsb2(i,1)+tfb2(i,1)/2);
% %       end       
% %       SRd((BNC1(i,2)-1)*7+3,(BNC1(i,2)-1)*7+4) = -soffset_support(i,1);   
% %       SRd((BNC2(i,2)-1)*7+3,(BNC2(i,2)-1)*7+4) = -srd2(i,1); 
% %       KSg=SRd'*KS*SRd +KSg;
% %    end 
% % end
% % 
% % KS=KSg;
% % 
% % % ------------------------------------------------------------------------
% % % ----------------            Ground Spring          ---------------------
% % % ------------------------------------------------------------------------
% % % Section properties at each element under natural frame
% % bfb=RNCc(:,5);  % Bottom flange width
% % tfb=RNCc(:,6);  % Bottom flange thickness
% % bft=RNCc(:,7);  % Top flange width
% % tft=RNCc(:,8);  % Top flange thickness
% % hg=RNCc(:,12);  % h : Distance between flange centroids
% % % Shear center
% % % bottom flange centroid to shear center
% % hsb = (tft.*bft.^3.*hg)./(tfb.*bfb.^3+tft.*bft.^3); 
% % hst = hg - hsb;    % top flange centroid to shear center
% % 
% % grd=zeros(nnodes,1);
% % if ~isempty(BNC)    
% %    for i=1:nnodes
% %       if isequal(BNC(i,13),1) || isequal(BNC(i,13),0)% Shear Center
% %          grd(i,1)=0;         
% %       elseif isequal(BNC(i,13),2) % Top              
% %          grd(i,1)=-(hst(i,1)+tft(i,1)/2);
% %       elseif isequal(BNC(i,13),3) % Bottom
% %          grd(i,1)=(hsb(i,1)+tfb(i,1)/2);
% %       end 
% %    end
% % end
% % 
% % KBe=zeros(nodedof*nnodes,nodedof*nnodes);
% % GRd = eye(nodedof*nnodes);
% % if ~isempty(BNC)
% %    for i = 1:nnodes
% %        for j = 1:nodedof
% %        KBe((i-1)*nodedof+j,(i-1)*nodedof+j) = BNC(i,j+4);  
% %        end
% %        GRd((i-1)*nodedof+3,(i-1)*nodedof+4) = -grd(i,1);
% %    end
% % end
% % 
% % KB=GRd'*KBe*GRd;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%analysis below
%         DE=zeros(14,1); SE=zeros(14,1);
%         if ~isempty(LUEC)
%          [Kt,Kgg,Qino,Kh2,Gn]=StiffnessELEMENT3DSlender([bfb1(n);bfb2(n)],...
%             [tfb1(n);tfb2(n)],[bft1(n);bft2(n)],[tft1(n);tft2(n)],...
%             [Dg1(n);Dg2(n)],[yc1(n);yc2(n)],[ht1(n);ht2(n)],[hb1(n);hb2(n)], ...
%             [Dt1(n);Dt2(n)],[Db1(n);Db2(n)],[hst1(n);hst2(n)],[hsb1(n);hsb2(n)], ...
%             [ys1(n);ys2(n)],[tw1(n);tw2(n)],[Afillet1(n),Afillet2(n)],L0(n,1),E(n,1),G(n,1),fillet(n,:),...
%             hstp(n),hsbp(n),ysp(n),bftp(n),bfbp(n), ...
%             theta1numelem,theta1zn,theta1yn,theta2numelem,theta2zn,theta2yn,...
%             theta1xpn,theta2xpn,qno,LUNCe(n,2),LUEC(n,17),FEL(n,:),slender(:,n));
% 
%          % Distributed Loads
%          DE(2,1)=LUNCe(n,2)*L0(n,1)/2;
%          DE(6,1)=LUNCe(n,2)*L0(n,1)^2/12;
%          DE(9,1)=LUNCe(n,2)*L0(n,1)/2;
%          DE(13,1)=-LUNCe(n,2)*L0(n,1)^2/12;
%          DE(1,1)=LUNCe(n,1)*L0(n,1)/2;
%          DE(8,1)=LUNCe(n,1)*L0(n,1)/2;
%          DE(3,1)=LUNCe(n,3)*L0(n,1)/2;
%          DE(10,1)=LUNCe(n,3)*L0(n,1)/2;
% 
%         else

% 
%         if ~isempty(SUEC1)
%          % Self Weight
%          SE(2,1)=SUNCe1(n,2)*L0(n,1)/2;
%          SE(6,1)=SUNCe1(n,2)*L0(n,1)^2/12;
%          SE(9,1)=SUNCe2(n,2)*L0(n,1)/2;
%          SE(13,1)=-SUNCe2(n,2)*L0(n,1)^2/12;
% 
%          SE(1,1)=SUNCe1(n,1)*L0(n,1)/2;
%          SE(8,1)=SUNCe2(n,1)*L0(n,1)/2;
% 
%          SE(3,1)=SUNCe1(n,3)*L0(n,1)/2;
%          SE(10,1)=SUNCe2(n,3)*L0(n,1)/2; 
%         end    





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% internal force garbage

% 
% qno=Pbar*Rd*Ge'*[unew1(n,:)';unew2(n,:)'];
% % Natural frame
% Qino=Kt*qno; % internal force
% 
% % ------------------------------------------------------------------------
% % -------               Calculate Internal Forces                  -------
% % ------------------------------------------------------------------------
% % Calculate internal forces
% QeiD = Pbar'*Qino;
% % -- Postprocessing for Moment from SC to Centroid S
% [det1,det2,det3] = GlobalDisTransform(angletap);
% [GDet]=CoordTransform(det1,det2,det3);
% QeiDt = GDet*Pbar'*Qino;
% % -- Postprocessing for Moment from SC to Centroid E
% % Update Internal Moment w.r.t centroidal axis yc(1)
% QeiD(6,1) = QeiD(6,1) + QeiDt(1,1)*(yc(1)-ys(1));
% QeiD(13,1) = QeiD(13,1) + QeiDt(8,1)*(yc(2)-ys(2));
% Mzt = -QeiD(6,1)*(1-xe/L)+QeiD(13,1)*xe/L;
% Mzt=round(Mzt*10^9)/10^9;
% 
% % ------------- Distributed Load & Self weight S
% % Rigid offset for Supports in Element Frame
% Rsd = eye(14);
% Rsd(1,6)=-rxd1(n); Rsd(8,13)=-rxd2(n);  
% 
% [de1,de2,de3] = GlobalDisTransform(alpharef(n,2));      
% [GDe]=CoordTransform(de1,de2,de3);
% if isequal(increment,1)
%  DG = GDe*Ld'*Rsd'*DE + GDe*Lsd'*Rsd'*SE;           
% else
%  DG = GDe*Ld'*Rsd'*DE;           
% end 
% % ------------- Distributed Load & Self weight E
% 
% % Interforce resultants w.r.t Element frame
% Qei = Pbar'*Qino;
% 
% % Geometrix Stiffness
% [Kext1,Kext2]=ExternalGStiffness(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L(n,1),Qino);
% 
% 
% 
% % Interforce resultants w.r.t Global frame
% Qg =Ge*Qei;
% 
% % -------------------------------------------- Save Internal Force S
% QeiD = Pbar'*Qino;
% % -- Postprocessing for Moment from SC to Centroid S
% [det1,det2,det3] = GlobalDisTransform(angletap(n,2));
% [GDet]=CoordTransform(det1,det2,det3);          
% QeiDt = GDet*Pbar'*Qino;
% % -- Postprocessing for Moment from SC to Centroid E
% % Update Internal Moment w.r.t centroidal axis
% QeiD(6,1) = QeiD(6,1) + QeiDt(1,1)*(yc1(n,1)-ys1(n,1));
% QeiD(13,1) = QeiD(13,1) + QeiDt(8,1)*(yc2(n,1)-ys2(n,1)); 
% if ~isempty(SUEC1)
%  QeiD(2,1)=-SE(2,1)+QeiD(2,1);
%  QeiD(9,1)=-SE(9,1)+QeiD(9,1);
% 
%  QeiD(6,1)=-SE(6,1)+QeiD(6,1);
%  QeiD(13,1)=-SE(13,1)+QeiD(13,1); 
% end        
% if ~isempty(LUEC)
%  QeiD(2,1)=-DE(2,1)*(increment*lambda)+QeiD(2,1);
%  QeiD(9,1)=-DE(9,1)*(increment*lambda)+QeiD(9,1);
% 
%  QeiD(6,1)=-DE(6,1)*(increment*lambda)+QeiD(6,1);
%  QeiD(13,1)=-DE(13,1)*(increment*lambda)+QeiD(13,1); 
% end    
% QgD =Ge*QeiD;  
% Qing(n,:) = QgD(:);  
% % Postprocessing for Axial and Shear force from SC to Centroid
% [dec1,dec2,dec3] = GlobalDisTransform(-CSangel(n,2));
% [GDec]=CoordTransform(dec1,dec2,dec3);          
% QeiDc = GDec*Pbar'*Qino;     
% QeiD(1,1)=QeiDc(1,1); 
% QeiD(2,1)=QeiDc(2,1);
% QeiD(8,1)=QeiDc(8,1); 
% QeiD(9,1)=QeiDc(9,1);  
% if ~isempty(SUEC1)
%  QeiD(2,1)=-SE(2,1)+QeiD(2,1);       
%  QeiD(9,1)=-SE(9,1)+QeiD(9,1);  
% end
% if ~isempty(LUEC)
%  QeiD(2,1)=-DE(2,1)*(increment*lambda)+QeiD(2,1);       
%  QeiD(9,1)=-DE(9,1)*(increment*lambda)+QeiD(9,1);  
% end       
% Qin(n,:) = QeiD(:); 
