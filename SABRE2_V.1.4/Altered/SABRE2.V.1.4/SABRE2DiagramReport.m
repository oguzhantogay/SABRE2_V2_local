function  SABRE2DiagramReport(JNodevalue,Massemble,SNodevalue,RNCc,NCc,...
   Nshe1,Nshe2,DUP1,DUP2,Funew,Qintf,tau,Rpg,Rpc,Rpt,Rh,Myc,Myt,My,Jval,Phi_Mmax,Phi_Py,UC,Rval,...
   ri_report_edit,pt_title_name,axesm,vstm,IncreL,gammma,mfilename,...
   AR,AS,AE,AI,ANE,ANI,LIAType,NLIAType,ap_da_buttongroup)
% Developed by Woo Yong Jeong.
% Date : 02/01/2015.
% ************************************************************************
% **************              Report results               ***************
% ************************************************************************

xn = sum(sum(SNodevalue(:,:,3)));   % Total number of Elements
mem=length(Massemble(:,1));         % Total number of members
njnode=length(JNodevalue(:,1));     % Total number of joints
HType = 0;
for i = 1:mem
   for j = 1:max(SNodevalue(i,:,2))
      for k = 1:SNodevalue(i,j,3)
         if isequal(SNodevalue(i,j,11),1)
            HType = HType+1;
         end           
      end
   end
end
if isequal(HType,0)
   HomoType=0;
elseif isequal(HType,xn)
   HomoType=1;
else
   HomoType=2;
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
bfb1=DUP1(:,6);bfb2=DUP2(:,6);  % Bottom flange width
tfb1=DUP1(:,7);tfb2=DUP2(:,7);  % Bottom flange thickness
bft1=DUP1(:,8);bft2=DUP2(:,8);  % Top flange width
tft1=DUP1(:,9);tft2=DUP2(:,9);  % Top flange thickness
Dg1=DUP1(:,10);Dg2=DUP2(:,10);  % dw:Web depth (y-dir)
tw1=DUP1(:,11);tw2=DUP2(:,11);  % Web thickness
hg1=DUP1(:,13);hg2=DUP2(:,13);  % h : Distance between flange centroids

% -------------------------- Geometric dimension of Cross-section : P299 S
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
ytbar1 = ( bft1.*tft1.*tft1/2+tw1.*Dg1.*(tft1+Dg1/2)+ ...
   bfb1.*tfb1.*(tft1+Dg1+tfb1/2) )./Ag1;
Dct1 = ytbar1 - tft1;   % top of Web depth to centroid
Dcb1 = Dg1 - Dct1;      % bottom of Web depth to centroid
hct1 = ytbar1 - tft1/2; % top flange centroid to centroid
hcb1 = hg1 - hct1;      % bottom flange centroid to centroid
% End node
Ag2 =  tft2.*bft2 + tw2.*Dg2  + tfb2.*bfb2;
ytbar2 = ( bft2.*tft2.*tft2/2+tw2.*Dg2.*(tft2+Dg2/2)+ ...
   bfb2.*tfb2.*(tft2+Dg2+tfb2/2) )./Ag2;
Dct2 = ytbar2 - tft2;   % top of Web depth to centroid
Dcb2 = Dg2 - Dct2;      % bottom of Web depth to centroid
hct2 = ytbar2 - tft2/2; % top flange centroid to centroid
hcb2 = hg2 - hct2;      % bottom flange centroid to centroid
% -------------------------- Geometric dimension of Cross-section : P299 E

% *** Global frame angle for each element without considering shear center
alpharef = zeros(xn,2);    
for i=1:xn
    opp = yg2(i,1)-yg1(i,1);  % element depth in y-dir
    adj = xg2(i,1)-xg1(i,1);  % element length in x-dir         
    alpharef(i,1)=MI(i,1);
    alpharef(i,2)=atan2(opp,adj); % Only global frame angle
end 

% Calculate Initial Member x-dir Nodal Coordinates for Each Member
[MemLength]=InitialEleLengthRendering(xg1,yg1,zg1,xg2,yg2,zg2,SNodevalue);

q = 0; val1=zeros(xn,1);
for i = 1:mem
   for j=1:sum(SNodevalue(i,:,3))
      val1(q+j,1) = Rval(i,2);
   end
 q = sum(SNodevalue(i,:,3))+q;
end

% ----------------------------------------------- Tapering angle
NTshe1=zeros(xn,4);NTshe2=zeros(xn,4);
segnum(1,1)=0;          % (Start node number - 1) for each member
ys1=zeros(xn,1);ys2=zeros(xn,1);
for i = 1:mem
   switch Rval(i,2) 
      
      case 1                                    % mid-web depth ; val = 1
         
         for k = 1:sum(SNodevalue(i,:,3))
            ys1(k+segnum(i,1),1)=Dg1(k+segnum(i,1),1)/2 - Dst1(k+segnum(i,1),1); 
            ys2(k+segnum(i,1),1)=Dg2(k+segnum(i,1),1)/2 - Dst2(k+segnum(i,1),1);    % Shear center               
            if isequal(k+segnum(i,1),segnum(i,1)+1)
               NTshe1(k+segnum(i,1),1)=k+segnum(i,1);
               NTshe2(k+segnum(i,1),1)=k+segnum(i,1);
               NTshe1(k+segnum(i,1),2)=0;
               NTshe2(k+segnum(i,1),2)=MemLength(k+segnum(i,1),1);
               NTshe1(k+segnum(i,1),3)=ys1(k+segnum(i,1),1);
               NTshe2(k+segnum(i,1),3)=ys2(k+segnum(i,1),1);
               NTshe1(k+segnum(i,1),4)=zg1(k+segnum(i,1),1);
               NTshe2(k+segnum(i,1),4)=zg2(k+segnum(i,1),1);
            else
               NTshe1(k+segnum(i,1),1)=k+segnum(i,1);
               NTshe2(k+segnum(i,1),1)=k+segnum(i,1);
               NTshe1(k+segnum(i,1),2)=MemLength(k+segnum(i,1)-1,1);
               NTshe2(k+segnum(i,1),2)=MemLength(k+segnum(i,1),1);
               NTshe1(k+segnum(i,1),3)=ys1(k+segnum(i,1),1);
               NTshe2(k+segnum(i,1),3)=ys2(k+segnum(i,1),1);
               NTshe1(k+segnum(i,1),4)=zg1(k+segnum(i,1),1);
               NTshe2(k+segnum(i,1),4)=zg2(k+segnum(i,1),1);
            end
         end            
      
      case 2                                 % top of web; val = 2
         
         for k = 1:sum(SNodevalue(i,:,3))
            ys1(k+segnum(i,1),1)=-Dst1(k+segnum(i,1),1);
            ys2(k+segnum(i,1),1)=-Dst2(k+segnum(i,1),1);                % Shear center              
            if isequal(k+segnum(i,1),segnum(i,1)+1)
               NTshe1(k+segnum(i,1),1)=k+segnum(i,1);
               NTshe2(k+segnum(i,1),1)=k+segnum(i,1);
               NTshe1(k+segnum(i,1),2)=0;
               NTshe2(k+segnum(i,1),2)=MemLength(k+segnum(i,1),1);
               NTshe1(k+segnum(i,1),3)=ys1(k+segnum(i,1),1);
               NTshe2(k+segnum(i,1),3)=ys2(k+segnum(i,1),1);
               NTshe1(k+segnum(i,1),4)=zg1(k+segnum(i,1),1);
               NTshe2(k+segnum(i,1),4)=zg2(k+segnum(i,1),1);
            else
               NTshe1(k+segnum(i,1),1)=k+segnum(i,1);
               NTshe2(k+segnum(i,1),1)=k+segnum(i,1);
               NTshe1(k+segnum(i,1),2)=MemLength(k+segnum(i,1)-1,1);
               NTshe2(k+segnum(i,1),2)=MemLength(k+segnum(i,1),1);
               NTshe1(k+segnum(i,1),3)=ys1(k+segnum(i,1),1);
               NTshe2(k+segnum(i,1),3)=ys2(k+segnum(i,1),1);
               NTshe1(k+segnum(i,1),4)=zg1(k+segnum(i,1),1);
               NTshe2(k+segnum(i,1),4)=zg2(k+segnum(i,1),1);
            end  
         end       
       
      case 3                                 % bottom of web; val = 3
         
         for k = 1:sum(SNodevalue(i,:,3))
            ys1(k+segnum(i,1),1)=Dsb1(k+segnum(i,1),1); 
            ys2(k+segnum(i,1),1)=Dsb2(k+segnum(i,1),1);              % Shear center                
            if isequal(k+segnum(i,1),segnum(i,1)+1)
               NTshe1(k+segnum(i,1),1)=k+segnum(i,1);
               NTshe2(k+segnum(i,1),1)=k+segnum(i,1);
               NTshe1(k+segnum(i,1),2)=0;
               NTshe2(k+segnum(i,1),2)=MemLength(k+segnum(i,1),1);
               NTshe1(k+segnum(i,1),3)=ys1(k+segnum(i,1),1);
               NTshe2(k+segnum(i,1),3)=ys2(k+segnum(i,1),1);
               NTshe1(k+segnum(i,1),4)=zg1(k+segnum(i,1),1);
               NTshe2(k+segnum(i,1),4)=zg2(k+segnum(i,1),1);
            else
               NTshe1(k+segnum(i,1),1)=k+segnum(i,1);
               NTshe2(k+segnum(i,1),1)=k+segnum(i,1);
               NTshe1(k+segnum(i,1),2)=MemLength(k+segnum(i,1)-1,1);
               NTshe2(k+segnum(i,1),2)=MemLength(k+segnum(i,1),1);
               NTshe1(k+segnum(i,1),3)=ys1(k+segnum(i,1),1);
               NTshe2(k+segnum(i,1),3)=ys2(k+segnum(i,1),1);
               NTshe1(k+segnum(i,1),4)=zg1(k+segnum(i,1),1);
               NTshe2(k+segnum(i,1),4)=zg2(k+segnum(i,1),1);
            end
         end
   end 
   segnum(i+1,1) = segnum(i,1) + sum(SNodevalue(i,:,3));
end   

% Preallocationg
taper1 = zeros(xn,3); taper2 = zeros(xn,3);
for n = 1:xn
[tap1,tap2]=TapedEleLength(NTshe1(n,2),NTshe1(n,3),NTshe1(n,4), ...
   NTshe2(n,2),NTshe2(n,3),NTshe2(n,4),alpharef(n,2));
taper1(n,:)=tap1; % Which is the same as xg.
taper2(n,:)=tap2; % Which is the same as yg.
end   

% Starting Node for each member
segnum(1,1)=0;    % (Start node number - 1) for each member
for i = 1:mem
   for k = 1:sum(SNodevalue(i,:,3))            
      NG1(k+segnum(i,1),1)=DUP1(segnum(i,1)+1,3);
      NG2(k+segnum(i,1),1)=DUP1(segnum(i,1)+1,3);
      NG1(k+segnum(i,1),2)=DUP1(segnum(i,1)+1,4);
      NG2(k+segnum(i,1),2)=DUP1(segnum(i,1)+1,4);
      NG1(k+segnum(i,1),3)=DUP1(segnum(i,1)+1,5);
      NG2(k+segnum(i,1),3)=DUP1(segnum(i,1)+1,5);
   end
   segnum(i+1,1) = segnum(i,1) + sum(SNodevalue(i,:,3));
end

MemLength1=NTshe1(:,2);MemLength2=NTshe2(:,2);

% Initial Global frame nodal coordinates w.r.t Shear center
xg1=Nshe1(:,1);
yg1=Nshe1(:,2);
zg1=Nshe1(:,3);
xg2=Nshe2(:,1);
yg2=Nshe2(:,2);
zg2=Nshe2(:,3);

% ********** Global frame angle for each element considering shear center
alphatap = zeros(xn,2);
for i=1:xn
    opp = yg2(i,1)-yg1(i,1);  % element depth in y-dir
    adj = xg2(i,1)-xg1(i,1);  % element length in x-dir         
    alphatap(i,1)=MI(i,1);
    alphatap(i,2)=atan2(opp,adj);     % Global frame angle + Tapered Angle
end 

% Calculate Initial Element Length for longitudianl direction.
[DX]=InitialEleLength(xn,DUP1(:,3),DUP1(:,4),DUP1(:,5),DUP2(:,3),DUP2(:,4),DUP2(:,5));

Qintf=round(Qintf*10^3)/10^3; 

   [filename, pathname] = uiputfile({'*.txt';'*.*'},'Save');	
   % If 'Cancel' was selected then return
   if isequal([filename,pathname],[0,0]) || isempty(filename) || isempty(pathname)
      return
   else
      File = fullfile(pathname,filename);   
      % Define a file name of I/O 
      outfile =strcat(File);   % Output file name.
      out = fopen(outfile,'w');                       % Output file is opened.  

      if isequal(get(ri_report_edit,'Value'),1)
         
      elseif isequal(get(ri_report_edit,'Value'),2)      
         if ~isempty(Qintf)
            %WRITING NODAL INFORMATION
            fprintf(out,'****************************************************************\n');
            fprintf(out,'*       Non-prismatic & mono-symmetric I-girder analysis       *\n');
            fprintf(out,'*                         Axial Force                          *\n');
            fprintf(out,'****************************************************************\n');
            fprintf(out,'\n');
            fprintf(out,['* ',mfilename,'\n']);
            if isequal(AR,1)
               fprintf(out,'* 1st Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AS,1)
               fprintf(out,'* 2nd Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AE,1) 
               if isequal(LIAType,0)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end   
            elseif isequal(AI,2) || isequal(AI,1) || isequal(AI,3) 
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end               
            elseif isequal(AI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end 
               
            elseif isequal(ANE,1) 
               if isequal(NLIAType,0)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end                 
            elseif isequal(ANI,2) || isequal(ANI,1) || isequal(ANI,3)
               if isequal(NLIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end 
            elseif isequal(ANI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end                
            end
            fprintf(out,'\n'); 
            fprintf(out,'  EL#        x-coord      y-coord        Fx\n');
            fprintf(out,'\n'); 
            nip=2;
            for i = 1:xn 
               Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
               sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
               0 0 1];

               zeta=[-1 1];
               DXe=DX(i,1)/2*zeta+DX(i,1)/2;
               DXe=DXe';

               for p=1:(nip-1)
                  % *************************** Rotation
                  % top flage start node
                  SN6=[MemLength1(i,1)+DXe(p,1) (0) (0)];
                  % top flage end node
                  SN13=[MemLength1(i,1)+DXe(p+1,1) (0) (0)];
                  % *************************** Global Rotation
                  SN6=Rz*SN6';SN6=SN6'; 
                  SN13=Rz*SN13';SN13=SN13';
                  % *************************** Global Translation to reference axis   
                  % top flage start node
                  SN6 = SN6+NG1(i,:);
                  % top flage end node
                  SN13 = SN13+NG2(i,:);       
                  fprintf(out,'  %3.0f %12.1f %12.1f %12.1f\n',i,SN6(1,1),SN6(1,2),-Qintf(i,1));
                  fprintf(out,'  %3.0f %12.1f %12.1f %12.1f\n',i,SN13(1,1),SN13(1,2),Qintf(i,8));

               end 
            end  % for end            
            fprintf(out,'\n');           
         end            

      elseif isequal(get(ri_report_edit,'Value'),3)   
         if ~isempty(Qintf)
            %WRITING NODAL INFORMATION
            fprintf(out,'****************************************************************\n');
            fprintf(out,'*       Non-prismatic & mono-symmetric I-girder analysis       *\n');
            fprintf(out,'*                  Shear Force Y direction                     *\n');
            fprintf(out,'****************************************************************\n');
            fprintf(out,'\n');
            fprintf(out,['* ',mfilename,'\n']);
            if isequal(AR,1)
               fprintf(out,'* 1st Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AS,1)
               fprintf(out,'* 2nd Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AE,1) 
               if isequal(LIAType,0)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end   
            elseif isequal(AI,2) || isequal(AI,1) || isequal(AI,3) 
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end     
            elseif isequal(AI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end                
            elseif isequal(ANE,1) 
               if isequal(NLIAType,0)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end                 
            elseif isequal(ANI,2) || isequal(ANI,1) || isequal(ANI,3)
               if isequal(NLIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end  
            elseif isequal(ANI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end                       
            end
            fprintf(out,'\n'); 
            fprintf(out,'  EL#        x-coord      y-coord        Sy\n');
            fprintf(out,'\n'); 
            nip=2;
            for i = 1:xn 
               Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
               sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
               0 0 1];

               zeta=[-1 1];
               DXe=DX(i,1)/2*zeta+DX(i,1)/2;
               DXe=DXe';

               for p=1:(nip-1)
                  % *************************** Rotation
                  % top flage start node
                  SN6=[MemLength1(i,1)+DXe(p,1) (0) (0)];
                  % top flage end node
                  SN13=[MemLength1(i,1)+DXe(p+1,1) (0) (0)];
                  % *************************** Global Rotation
                  SN6=Rz*SN6';SN6=SN6'; 
                  SN13=Rz*SN13';SN13=SN13';
                  % *************************** Global Translation to reference axis   
                  % top flage start node
                  SN6 = SN6+NG1(i,:);
                  % top flage end node
                  SN13 = SN13+NG2(i,:);       
                  fprintf(out,'  %3.0f %12.1f %12.1f %12.1f\n',i,SN6(1,1),SN6(1,2),Qintf(i,2));
                  fprintf(out,'  %3.0f %12.1f %12.1f %12.1f\n',i,SN13(1,1),SN13(1,2),-Qintf(i,9));

               end 
            end  % for end            
            fprintf(out,'\n');           
         end                           
         
      elseif isequal(get(ri_report_edit,'Value'),4)  
         if ~isempty(Qintf)
            %WRITING NODAL INFORMATION
            fprintf(out,'****************************************************************\n');
            fprintf(out,'*       Non-prismatic & mono-symmetric I-girder analysis       *\n');
            fprintf(out,'*                  Shear Force Z direction                     *\n');
            fprintf(out,'****************************************************************\n');
            fprintf(out,'\n');
            fprintf(out,['* ',mfilename,'\n']);
            if isequal(AR,1)
               fprintf(out,'* 1st Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AS,1)
               fprintf(out,'* 2nd Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AE,1) 
               if isequal(LIAType,0)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end   
            elseif isequal(AI,2) || isequal(AI,1) || isequal(AI,3) 
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end  
            elseif isequal(AI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end                
            elseif isequal(ANE,1) 
               if isequal(NLIAType,0)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end                 
            elseif isequal(ANI,2) || isequal(ANI,1) || isequal(ANI,3)
               if isequal(NLIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end
            elseif isequal(ANI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end                       
            end
            fprintf(out,'\n'); 
            fprintf(out,'  EL#        x-coord      y-coord        Sz\n');
            fprintf(out,'\n'); 
            nip=2;
            for i = 1:xn 
               Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
               sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
               0 0 1];

               zeta=[-1 1];
               DXe=DX(i,1)/2*zeta+DX(i,1)/2;
               DXe=DXe';

               for p=1:(nip-1)
                  % *************************** Rotation
                  % top flage start node
                  SN6=[MemLength1(i,1)+DXe(p,1) (0) (0)];
                  % top flage end node
                  SN13=[MemLength1(i,1)+DXe(p+1,1) (0) (0)];
                  % *************************** Global Rotation
                  SN6=Rz*SN6';SN6=SN6'; 
                  SN13=Rz*SN13';SN13=SN13';
                  % *************************** Global Translation to reference axis   
                  % top flage start node
                  SN6 = SN6+NG1(i,:);
                  % top flage end node
                  SN13 = SN13+NG2(i,:);       
                  fprintf(out,'  %3.0f %12.1f %12.1f %12.1f\n',i,SN6(1,1),SN6(1,2),-Qintf(i,3));
                  fprintf(out,'  %3.0f %12.1f %12.1f %12.1f\n',i,SN13(1,1),SN13(1,2),Qintf(i,10));

               end 
            end  % for end            
            fprintf(out,'\n');           
         end          
       
      elseif isequal(get(ri_report_edit,'Value'),5)     
         if ~isempty(Qintf)
            %WRITING NODAL INFORMATION
            fprintf(out,'****************************************************************\n');
            fprintf(out,'*       Non-prismatic & mono-symmetric I-girder analysis       *\n');
            fprintf(out,'*                           Torque                             *\n');
            fprintf(out,'****************************************************************\n');
            fprintf(out,'\n');
            fprintf(out,['* ',mfilename,'\n']);
            if isequal(AR,1)
               fprintf(out,'* 1st Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AS,1)
               fprintf(out,'* 2nd Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AE,1) 
               if isequal(LIAType,0)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end   
            elseif isequal(AI,2) || isequal(AI,1) || isequal(AI,3) 
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end      
            elseif isequal(AI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end                
            elseif isequal(ANE,1) 
               if isequal(NLIAType,0)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end                 
            elseif isequal(ANI,2) || isequal(ANI,1) || isequal(ANI,3)
               if isequal(NLIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end
            elseif isequal(ANI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end                       
            end
            fprintf(out,'\n'); 
            fprintf(out,'  EL#        x-coord      y-coord        Tx\n');
            fprintf(out,'\n'); 
            nip=2;
            for i = 1:xn 
               Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
               sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
               0 0 1];

               zeta=[-1 1];
               DXe=DX(i,1)/2*zeta+DX(i,1)/2;
               DXe=DXe';

               for p=1:(nip-1)
                  % *************************** Rotation
                  % top flage start node
                  SN6=[MemLength1(i,1)+DXe(p,1) (0) (0)];
                  % top flage end node
                  SN13=[MemLength1(i,1)+DXe(p+1,1) (0) (0)];
                  % *************************** Global Rotation
                  SN6=Rz*SN6';SN6=SN6'; 
                  SN13=Rz*SN13';SN13=SN13';
                  % *************************** Global Translation to reference axis   
                  % top flage start node
                  SN6 = SN6+NG1(i,:);
                  % top flage end node
                  SN13 = SN13+NG2(i,:);       
                  fprintf(out,'  %3.0f %12.1f %12.1f %12.1f\n',i,SN6(1,1),SN6(1,2),-Qintf(i,4));
                  fprintf(out,'  %3.0f %12.1f %12.1f %12.1f\n',i,SN13(1,1),SN13(1,2),Qintf(i,11));

               end 
            end  % for end            
            fprintf(out,'\n');           
         end 
                 
      elseif isequal(get(ri_report_edit,'Value'),6)     
         if ~isempty(Qintf)
            %WRITING NODAL INFORMATION
            fprintf(out,'****************************************************************\n');
            fprintf(out,'*       Non-prismatic & mono-symmetric I-girder analysis       *\n');
            fprintf(out,'*                          Moment Y                            *\n');
            fprintf(out,'****************************************************************\n');
            fprintf(out,'\n');
            fprintf(out,['* ',mfilename,'\n']);
            if isequal(AR,1)
               fprintf(out,'* 1st Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AS,1)
               fprintf(out,'* 2nd Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AE,1) 
               if isequal(LIAType,0)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end   
            elseif isequal(AI,2) || isequal(AI,1) || isequal(AI,3) 
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end     
            elseif isequal(AI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end                
            elseif isequal(ANE,1) 
               if isequal(NLIAType,0)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end                 
            elseif isequal(ANI,2) || isequal(ANI,1) || isequal(ANI,3)
               if isequal(NLIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end 
            elseif isequal(ANI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end                       
            end
            fprintf(out,'\n'); 
            fprintf(out,'  EL#        x-coord      y-coord        My\n');
            fprintf(out,'\n'); 
            nip=2;
            for i = 1:xn 
               Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
               sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
               0 0 1];

               zeta=[-1 1];
               DXe=DX(i,1)/2*zeta+DX(i,1)/2;
               DXe=DXe';

               for p=1:(nip-1)
                  % *************************** Rotation
                  % top flage start node
                  SN6=[MemLength1(i,1)+DXe(p,1) (0) (0)];
                  % top flage end node
                  SN13=[MemLength1(i,1)+DXe(p+1,1) (0) (0)];
                  % *************************** Global Rotation
                  SN6=Rz*SN6';SN6=SN6'; 
                  SN13=Rz*SN13';SN13=SN13';
                  % *************************** Global Translation to reference axis   
                  % top flage start node
                  SN6 = SN6+NG1(i,:);
                  % top flage end node
                  SN13 = SN13+NG2(i,:);       
                  fprintf(out,'  %3.0f %12.1f %12.1f %12.1f\n',i,SN6(1,1),SN6(1,2),-Qintf(i,5));
                  fprintf(out,'  %3.0f %12.1f %12.1f %12.1f\n',i,SN13(1,1),SN13(1,2),Qintf(i,12));

               end 
            end  % for end            
            fprintf(out,'\n');           
         end          
          
      elseif isequal(get(ri_report_edit,'Value'),7)   
         if ~isempty(Qintf)
            %WRITING NODAL INFORMATION
            fprintf(out,'****************************************************************\n');
            fprintf(out,'*       Non-prismatic & mono-symmetric I-girder analysis       *\n');
            fprintf(out,'*                          Moment Z                            *\n');
            fprintf(out,'****************************************************************\n');
            fprintf(out,'\n');
            fprintf(out,['* ',mfilename,'\n']);
            if isequal(AR,1)
               fprintf(out,'* 1st Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AS,1)
               fprintf(out,'* 2nd Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AE,1) 
               if isequal(LIAType,0)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end   
            elseif isequal(AI,2) || isequal(AI,1) || isequal(AI,3) 
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end   
            elseif isequal(AI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end                
            elseif isequal(ANE,1) 
               if isequal(NLIAType,0)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end                 
            elseif isequal(ANI,2) || isequal(ANI,1) || isequal(ANI,3)
               if isequal(NLIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end  
            elseif isequal(ANI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end                       
            end
            fprintf(out,'\n'); 
            fprintf(out,'  EL#        x-coord      y-coord        Mz\n');
            fprintf(out,'\n'); 
            nip=2;
            for i = 1:xn 
               Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
               sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
               0 0 1];

               zeta=[-1 1];
               DXe=DX(i,1)/2*zeta+DX(i,1)/2;
               DXe=DXe';

               for p=1:(nip-1)
                  % *************************** Rotation
                  % top flage start node
                  SN6=[MemLength1(i,1)+DXe(p,1) (0) (0)];
                  % top flage end node
                  SN13=[MemLength1(i,1)+DXe(p+1,1) (0) (0)];
                  % *************************** Global Rotation
                  SN6=Rz*SN6';SN6=SN6'; 
                  SN13=Rz*SN13';SN13=SN13';
                  % *************************** Global Translation to reference axis   
                  % top flage start node
                  SN6 = SN6+NG1(i,:);
                  % top flage end node
                  SN13 = SN13+NG2(i,:);       
                  fprintf(out,'  %3.0f %12.1f %12.1f %12.1f\n',i,SN6(1,1),SN6(1,2),-Qintf(i,6));
                  fprintf(out,'  %3.0f %12.1f %12.1f %12.1f\n',i,SN13(1,1),SN13(1,2),Qintf(i,13));

               end 
            end  % for end            
            fprintf(out,'\n');           
         end          
         
      elseif isequal(get(ri_report_edit,'Value'),8)    
         if ~isempty(Qintf)
            %WRITING NODAL INFORMATION
            fprintf(out,'****************************************************************\n');
            fprintf(out,'*       Non-prismatic & mono-symmetric I-girder analysis       *\n');
            fprintf(out,'*                          Bi-moment                           *\n');
            fprintf(out,'****************************************************************\n');
            fprintf(out,'\n');
            fprintf(out,['* ',mfilename,'\n']);
            if isequal(AR,1)
               fprintf(out,'* 1st Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AS,1)
               fprintf(out,'* 2nd Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AE,1) 
               if isequal(LIAType,0)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end   
            elseif isequal(AI,2) || isequal(AI,1) || isequal(AI,3) 
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end     
            elseif isequal(AI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end                
            elseif isequal(ANE,1) 
               if isequal(NLIAType,0)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end                 
            elseif isequal(ANI,2) || isequal(ANI,1) || isequal(ANI,3)
               if isequal(NLIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end  
            elseif isequal(ANI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end                       
            end
            fprintf(out,'\n'); 
            fprintf(out,'  EL#        x-coord      y-coord        Bi\n');
            fprintf(out,'\n'); 
            nip=2;
            for i = 1:xn 
               Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
               sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
               0 0 1];

               zeta=[-1 1];
               DXe=DX(i,1)/2*zeta+DX(i,1)/2;
               DXe=DXe';

               for p=1:(nip-1)
                  % *************************** Rotation
                  % top flage start node
                  SN6=[MemLength1(i,1)+DXe(p,1) (0) (0)];
                  % top flage end node
                  SN13=[MemLength1(i,1)+DXe(p+1,1) (0) (0)];
                  % *************************** Global Rotation
                  SN6=Rz*SN6';SN6=SN6'; 
                  SN13=Rz*SN13';SN13=SN13';
                  % *************************** Global Translation to reference axis   
                  % top flage start node
                  SN6 = SN6+NG1(i,:);
                  % top flage end node
                  SN13 = SN13+NG2(i,:);       
                  fprintf(out,'  %3.0f %12.1f %12.1f %12.1f\n',i,SN6(1,1),SN6(1,2),-Qintf(i,7));
                  fprintf(out,'  %3.0f %12.1f %12.1f %12.1f\n',i,SN13(1,1),SN13(1,2),Qintf(i,14));

               end 
            end  % for end            
            fprintf(out,'\n');           
         end           
       
      elseif isequal(get(ri_report_edit,'Value'),9)
         if ~isempty(tau)
            %WRITING NODAL INFORMATION
            fprintf(out,'****************************************************************\n');
            fprintf(out,'*       Non-prismatic & mono-symmetric I-girder analysis       *\n');
            fprintf(out,'*                             SRF                              *\n');
            fprintf(out,'****************************************************************\n');
            fprintf(out,'\n');
            fprintf(out,['* ',mfilename,'\n']);
            if isequal(AR,1)
               fprintf(out,'* 1st Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AS,1)
               fprintf(out,'* 2nd Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AE,1) 
               if isequal(LIAType,0)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end   
            elseif isequal(AI,2) || isequal(AI,1) || isequal(AI,3) 
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end   
            elseif isequal(AI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end                
            elseif isequal(ANE,1) 
               if isequal(NLIAType,0)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end                 
            elseif isequal(ANI,2) || isequal(ANI,1) || isequal(ANI,3)
               if isequal(NLIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end  
            elseif isequal(ANI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end                       
            end
            fprintf(out,'\n'); 
            fprintf(out,'  EL#   itp#       x-coord      y-coord       SRF\n');
            fprintf(out,'\n');            
            tau1=tau(1:4,:);
            tau2=tau(2:5,:);
            nip=5;
            for i = 1:xn 
               Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
               sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
               0 0 1];

               zeta=[-1 -sqrt(3/7) 0 sqrt(3/7) 1];
               DXe=DX(i,1)/2*zeta+DX(i,1)/2;
               DXe=DXe';

               for p=1:(nip-1)
                  % *************************** Rotation
                  % top flage start node
                  SN6=[MemLength1(i,1)+DXe(p,1) (0) (0)];
                  % top flage end node
                  SN13=[MemLength1(i,1)+DXe(p+1,1) (0) (0)];
                  % *************************** Global Rotation
                  SN6=Rz*SN6';SN6=SN6'; 
                  SN13=Rz*SN13';SN13=SN13';
                  % *************************** Global Translation to reference axis   
                  % top flage start node
                  SN6 = SN6+NG1(i,:);
                  % top flage end node
                  SN13 = SN13+NG2(i,:);       
                  fprintf(out,'  %3.0f %5.0f %12.3f %12.3f %12.3f\n',i,p,SN6(1,1),SN6(1,2),tau1(p,i));
                  if isequal(p,4)
                     fprintf(out,'  %3.0f %5.0f %12.3f %12.3f %12.3f\n',i,p+1,SN13(1,1),SN13(1,2),tau2(p,i));
                  end

               end 
            end  % for end            
            fprintf(out,'\n');           
         end
         
      elseif isequal(get(ri_report_edit,'Value'),10)
         if ~isempty(Rpg)
            %WRITING NODAL INFORMATION
            fprintf(out,'****************************************************************\n');
            fprintf(out,'*       Non-prismatic & mono-symmetric I-girder analysis       *\n');
            fprintf(out,'*                              Rpg                             *\n');
            fprintf(out,'****************************************************************\n');
            fprintf(out,'\n');
            fprintf(out,['* ',mfilename,'\n']);
            if isequal(AR,1)
               fprintf(out,'* 1st Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AS,1)
               fprintf(out,'* 2nd Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AE,1) 
               if isequal(LIAType,0)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end   
            elseif isequal(AI,2) || isequal(AI,1) || isequal(AI,3) 
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end  
            elseif isequal(AI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end                
            elseif isequal(ANE,1) 
               if isequal(NLIAType,0)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end                 
            elseif isequal(ANI,2) || isequal(ANI,1) || isequal(ANI,3)
               if isequal(NLIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end 
            elseif isequal(ANI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end                       
            end
            fprintf(out,'\n'); 
            fprintf(out,'  EL#   itp#       x-coord      y-coord       Rpg\n');
            fprintf(out,'\n');            
            Rpg1=Rpg(1:4,:);
            Rpg2=Rpg(2:5,:);
            nip=5;
            for i = 1:xn 
               Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
               sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
               0 0 1];

               zeta=[-1 -sqrt(3/7) 0 sqrt(3/7) 1];
               DXe=DX(i,1)/2*zeta+DX(i,1)/2;
               DXe=DXe';

               for p=1:(nip-1)
                  % *************************** Rotation
                  % top flage start node
                  SN6=[MemLength1(i,1)+DXe(p,1) (0) (0)];
                  % top flage end node
                  SN13=[MemLength1(i,1)+DXe(p+1,1) (0) (0)];
                  % *************************** Global Rotation
                  SN6=Rz*SN6';SN6=SN6'; 
                  SN13=Rz*SN13';SN13=SN13';
                  % *************************** Global Translation to reference axis   
                  % top flage start node
                  SN6 = SN6+NG1(i,:);
                  % top flage end node
                  SN13 = SN13+NG2(i,:);       
                  fprintf(out,'  %3.0f %5.0f %12.3f %12.3f %12.3f\n',i,p,SN6(1,1),SN6(1,2),Rpg1(p,i));
                  if isequal(p,4)
                     fprintf(out,'  %3.0f %5.0f %12.3f %12.3f %12.3f\n',i,p+1,SN13(1,1),SN13(1,2),Rpg2(p,i));
                  end

               end 
            end  % for end            
            fprintf(out,'\n');           
         end
         
      elseif isequal(get(ri_report_edit,'Value'),11)
         if ~isempty(Rpc)
            %WRITING NODAL INFORMATION
            fprintf(out,'****************************************************************\n');
            fprintf(out,'*       Non-prismatic & mono-symmetric I-girder analysis       *\n');
            fprintf(out,'*                              Rpc                             *\n');
            fprintf(out,'****************************************************************\n');
            fprintf(out,'\n');
            fprintf(out,['* ',mfilename,'\n']);
            if isequal(AR,1)
               fprintf(out,'* 1st Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AS,1)
               fprintf(out,'* 2nd Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AE,1) 
               if isequal(LIAType,0)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end   
            elseif isequal(AI,2) || isequal(AI,1) || isequal(AI,3) 
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end   
            elseif isequal(AI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end                
            elseif isequal(ANE,1) 
               if isequal(NLIAType,0)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end                 
            elseif isequal(ANI,2) || isequal(ANI,1) || isequal(ANI,3)
               if isequal(NLIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end  
            elseif isequal(ANI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end                       
            end
            fprintf(out,'\n'); 
            fprintf(out,'  EL#   itp#       x-coord      y-coord       Rpc\n');
            fprintf(out,'\n');            
            Rpc1=Rpc(1:4,:);
            Rpc2=Rpc(2:5,:);
            nip=5;
            for i = 1:xn 
               Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
               sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
               0 0 1];

               zeta=[-1 -sqrt(3/7) 0 sqrt(3/7) 1];
               DXe=DX(i,1)/2*zeta+DX(i,1)/2;
               DXe=DXe';

               for p=1:(nip-1)
                  % *************************** Rotation
                  % top flage start node
                  SN6=[MemLength1(i,1)+DXe(p,1) (0) (0)];
                  % top flage end node
                  SN13=[MemLength1(i,1)+DXe(p+1,1) (0) (0)];
                  % *************************** Global Rotation
                  SN6=Rz*SN6';SN6=SN6'; 
                  SN13=Rz*SN13';SN13=SN13';
                  % *************************** Global Translation to reference axis   
                  % top flage start node
                  SN6 = SN6+NG1(i,:);
                  % top flage end node
                  SN13 = SN13+NG2(i,:);       
                  fprintf(out,'  %3.0f %5.0f %12.3f %12.3f %12.3f\n',i,p,SN6(1,1),SN6(1,2),Rpc1(p,i));
                  if isequal(p,4)
                     fprintf(out,'  %3.0f %5.0f %12.3f %12.3f %12.3f\n',i,p+1,SN13(1,1),SN13(1,2),Rpc2(p,i));
                  end

               end 
            end  % for end            
            fprintf(out,'\n');           
         end
         
      elseif isequal(get(ri_report_edit,'Value'),12)
         if ~isempty(Rpt)
            %WRITING NODAL INFORMATION
            fprintf(out,'****************************************************************\n');
            fprintf(out,'*       Non-prismatic & mono-symmetric I-girder analysis       *\n');
            fprintf(out,'*                              Rpt                             *\n');
            fprintf(out,'****************************************************************\n');
            fprintf(out,'\n');
            fprintf(out,['* ',mfilename,'\n']);
            if isequal(AR,1)
               fprintf(out,'* 1st Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AS,1)
               fprintf(out,'* 2nd Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AE,1) 
               if isequal(LIAType,0)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end   
            elseif isequal(AI,2) || isequal(AI,1) || isequal(AI,3) 
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end  
            elseif isequal(AI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end                
            elseif isequal(ANE,1) 
               if isequal(NLIAType,0)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end                 
            elseif isequal(ANI,2) || isequal(ANI,1) || isequal(ANI,3)
               if isequal(NLIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end 
            elseif isequal(ANI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end                       
            end
            fprintf(out,'\n'); 
            fprintf(out,'  EL#   itp#       x-coord      y-coord       Rpt\n');
            fprintf(out,'\n');            
            Rpt1=Rpt(1:4,:);
            Rpt2=Rpt(2:5,:);
            nip=5;
            for i = 1:xn 
               Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
               sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
               0 0 1];

               zeta=[-1 -sqrt(3/7) 0 sqrt(3/7) 1];
               DXe=DX(i,1)/2*zeta+DX(i,1)/2;
               DXe=DXe';

               for p=1:(nip-1)
                  % *************************** Rotation
                  % top flage start node
                  SN6=[MemLength1(i,1)+DXe(p,1) (0) (0)];
                  % top flage end node
                  SN13=[MemLength1(i,1)+DXe(p+1,1) (0) (0)];
                  % *************************** Global Rotation
                  SN6=Rz*SN6';SN6=SN6'; 
                  SN13=Rz*SN13';SN13=SN13';
                  % *************************** Global Translation to reference axis   
                  % top flage start node
                  SN6 = SN6+NG1(i,:);
                  % top flage end node
                  SN13 = SN13+NG2(i,:);       
                  fprintf(out,'  %3.0f %5.0f %12.3f %12.3f %12.3f\n',i,p,SN6(1,1),SN6(1,2),Rpt1(p,i));
                  if isequal(p,4)
                     fprintf(out,'  %3.0f %5.0f %12.3f %12.3f %12.3f\n',i,p+1,SN13(1,1),SN13(1,2),Rpt2(p,i));
                  end

               end 
            end  % for end            
            fprintf(out,'\n');           
         end
         
      elseif isequal(get(ri_report_edit,'Value'),13)
         if ~isempty(Rh)
            %WRITING NODAL INFORMATION
            fprintf(out,'****************************************************************\n');
            fprintf(out,'*       Non-prismatic & mono-symmetric I-girder analysis       *\n');
            fprintf(out,'*                              Rh                              *\n');
            fprintf(out,'****************************************************************\n');
            fprintf(out,'\n');
            fprintf(out,['* ',mfilename,'\n']);
            if isequal(AR,1)
               fprintf(out,'* 1st Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AS,1)
               fprintf(out,'* 2nd Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AE,1) 
               if isequal(LIAType,0)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end   
            elseif isequal(AI,2) || isequal(AI,1) || isequal(AI,3) 
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end  
            elseif isequal(AI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end                
            elseif isequal(ANE,1) 
               if isequal(NLIAType,0)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end                 
            elseif isequal(ANI,2) || isequal(ANI,1) || isequal(ANI,3)
               if isequal(NLIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end  
            elseif isequal(ANI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end                       
            end
            fprintf(out,'\n'); 
            fprintf(out,'  EL#   itp#       x-coord      y-coord        Rh\n');
            fprintf(out,'\n');            
            Rh1=Rh(1:4,:);
            Rh2=Rh(2:5,:);
            nip=5;
            for i = 1:xn 
               Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
               sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
               0 0 1];

               zeta=[-1 -sqrt(3/7) 0 sqrt(3/7) 1];
               DXe=DX(i,1)/2*zeta+DX(i,1)/2;
               DXe=DXe';

               for p=1:(nip-1)
                  % *************************** Rotation
                  % top flage start node
                  SN6=[MemLength1(i,1)+DXe(p,1) (0) (0)];
                  % top flage end node
                  SN13=[MemLength1(i,1)+DXe(p+1,1) (0) (0)];
                  % *************************** Global Rotation
                  SN6=Rz*SN6';SN6=SN6'; 
                  SN13=Rz*SN13';SN13=SN13';
                  % *************************** Global Translation to reference axis   
                  % top flage start node
                  SN6 = SN6+NG1(i,:);
                  % top flage end node
                  SN13 = SN13+NG2(i,:);       
                  fprintf(out,'  %3.0f %5.0f %12.3f %12.3f %12.3f\n',i,p,SN6(1,1),SN6(1,2),Rh1(p,i));
                  if isequal(p,4)
                     fprintf(out,'  %3.0f %5.0f %12.3f %12.3f %12.3f\n',i,p+1,SN13(1,1),SN13(1,2),Rh2(p,i));
                  end

               end 
            end  % for end            
            fprintf(out,'\n');           
         end
         
      elseif isequal(get(ri_report_edit,'Value'),14)
         if ~isempty(Myc)
            %WRITING NODAL INFORMATION
            fprintf(out,'****************************************************************\n');
            fprintf(out,'*       Non-prismatic & mono-symmetric I-girder analysis       *\n');
            fprintf(out,'*                             Myc                              *\n');
            fprintf(out,'****************************************************************\n');
            fprintf(out,'\n');
            fprintf(out,['* ',mfilename,'\n']);
            if isequal(AR,1)
               fprintf(out,'* 1st Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AS,1)
               fprintf(out,'* 2nd Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AE,1) 
               if isequal(LIAType,0)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end   
            elseif isequal(AI,2) || isequal(AI,1) || isequal(AI,3) 
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end    
            elseif isequal(AI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end                
            elseif isequal(ANE,1) 
               if isequal(NLIAType,0)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end                 
            elseif isequal(ANI,2) || isequal(ANI,1) || isequal(ANI,3)
               if isequal(NLIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end  
            elseif isequal(ANI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end                       
            end
            fprintf(out,'\n'); 
            fprintf(out,'  EL#   itp#       x-coord      y-coord       Myc\n');
            fprintf(out,'\n');            
            Myc1=Myc(1:4,:);
            Myc2=Myc(2:5,:);
            nip=5;
            for i = 1:xn 
               Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
               sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
               0 0 1];

               zeta=[-1 -sqrt(3/7) 0 sqrt(3/7) 1];
               DXe=DX(i,1)/2*zeta+DX(i,1)/2;
               DXe=DXe';

               for p=1:(nip-1)
                  % *************************** Rotation
                  % top flage start node
                  SN6=[MemLength1(i,1)+DXe(p,1) (0) (0)];
                  % top flage end node
                  SN13=[MemLength1(i,1)+DXe(p+1,1) (0) (0)];
                  % *************************** Global Rotation
                  SN6=Rz*SN6';SN6=SN6'; 
                  SN13=Rz*SN13';SN13=SN13';
                  % *************************** Global Translation to reference axis   
                  % top flage start node
                  SN6 = SN6+NG1(i,:);
                  % top flage end node
                  SN13 = SN13+NG2(i,:);       
                  fprintf(out,'  %3.0f %5.0f %12.3f %12.3f %12.3f\n',i,p,SN6(1,1),SN6(1,2),Myc1(p,i));
                  if isequal(p,4)
                     fprintf(out,'  %3.0f %5.0f %12.3f %12.3f %12.3f\n',i,p+1,SN13(1,1),SN13(1,2),Myc2(p,i));
                  end

               end 
            end  % for end            
            fprintf(out,'\n');           
         end  
         
      elseif isequal(get(ri_report_edit,'Value'),15)
         if ~isempty(Myt)
            %WRITING NODAL INFORMATION
            fprintf(out,'****************************************************************\n');
            fprintf(out,'*       Non-prismatic & mono-symmetric I-girder analysis       *\n');
            fprintf(out,'*                             Myt                              *\n');
            fprintf(out,'****************************************************************\n');
            fprintf(out,'\n');
            fprintf(out,['* ',mfilename,'\n']);
            if isequal(AR,1)
               fprintf(out,'* 1st Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AS,1)
               fprintf(out,'* 2nd Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AE,1) 
               if isequal(LIAType,0)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end   
            elseif isequal(AI,2) || isequal(AI,1) || isequal(AI,3) 
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end  
            elseif isequal(AI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end                
            elseif isequal(ANE,1) 
               if isequal(NLIAType,0)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end                 
            elseif isequal(ANI,2) || isequal(ANI,1) || isequal(ANI,3)
               if isequal(NLIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end 
            elseif isequal(ANI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end                       
            end
            fprintf(out,'\n'); 
            fprintf(out,'  EL#   itp#       x-coord      y-coord       Myt\n');
            fprintf(out,'\n');            
            Myt1=Myt(1:4,:);
            Myt2=Myt(2:5,:);
            nip=5;
            for i = 1:xn 
               Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
               sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
               0 0 1];

               zeta=[-1 -sqrt(3/7) 0 sqrt(3/7) 1];
               DXe=DX(i,1)/2*zeta+DX(i,1)/2;
               DXe=DXe';

               for p=1:(nip-1)
                  % *************************** Rotation
                  % top flage start node
                  SN6=[MemLength1(i,1)+DXe(p,1) (0) (0)];
                  % top flage end node
                  SN13=[MemLength1(i,1)+DXe(p+1,1) (0) (0)];
                  % *************************** Global Rotation
                  SN6=Rz*SN6';SN6=SN6'; 
                  SN13=Rz*SN13';SN13=SN13';
                  % *************************** Global Translation to reference axis   
                  % top flage start node
                  SN6 = SN6+NG1(i,:);
                  % top flage end node
                  SN13 = SN13+NG2(i,:);       
                  fprintf(out,'  %3.0f %5.0f %12.3f %12.3f %12.3f\n',i,p,SN6(1,1),SN6(1,2),Myt1(p,i));
                  if isequal(p,4)
                     fprintf(out,'  %3.0f %5.0f %12.3f %12.3f %12.3f\n',i,p+1,SN13(1,1),SN13(1,2),Myt2(p,i));
                  end

               end 
            end  % for end            
            fprintf(out,'\n');           
         end    
         
      elseif isequal(get(ri_report_edit,'Value'),16)
         if ~isempty(My)
            %WRITING NODAL INFORMATION
            fprintf(out,'****************************************************************\n');
            fprintf(out,'*       Non-prismatic & mono-symmetric I-girder analysis       *\n');
            fprintf(out,'*                              My                              *\n');
            fprintf(out,'****************************************************************\n');
            fprintf(out,'\n');
            fprintf(out,['* ',mfilename,'\n']);
            if isequal(AR,1)
               fprintf(out,'* 1st Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AS,1)
               fprintf(out,'* 2nd Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AE,1) 
               if isequal(LIAType,0)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end   
            elseif isequal(AI,2) || isequal(AI,1) || isequal(AI,3) 
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end
            elseif isequal(AI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end                
            elseif isequal(ANE,1) 
               if isequal(NLIAType,0)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end                 
            elseif isequal(ANI,2) || isequal(ANI,1) || isequal(ANI,3)
               if isequal(NLIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end  
            elseif isequal(ANI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end                       
            end
            fprintf(out,'\n'); 
            fprintf(out,'  EL#   itp#       x-coord      y-coord        My\n');
            fprintf(out,'\n');            
            My1=My(1:4,:);
            My2=My(2:5,:);
            nip=5;
            for i = 1:xn 
               Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
               sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
               0 0 1];

               zeta=[-1 -sqrt(3/7) 0 sqrt(3/7) 1];
               DXe=DX(i,1)/2*zeta+DX(i,1)/2;
               DXe=DXe';

               for p=1:(nip-1)
                  % *************************** Rotation
                  % top flage start node
                  SN6=[MemLength1(i,1)+DXe(p,1) (0) (0)];
                  % top flage end node
                  SN13=[MemLength1(i,1)+DXe(p+1,1) (0) (0)];
                  % *************************** Global Rotation
                  SN6=Rz*SN6';SN6=SN6'; 
                  SN13=Rz*SN13';SN13=SN13';
                  % *************************** Global Translation to reference axis   
                  % top flage start node
                  SN6 = SN6+NG1(i,:);
                  % top flage end node
                  SN13 = SN13+NG2(i,:);       
                  fprintf(out,'  %3.0f %5.0f %12.3f %12.3f %12.3f\n',i,p,SN6(1,1),SN6(1,2),My1(p,i));
                  if isequal(p,4)
                     fprintf(out,'  %3.0f %5.0f %12.3f %12.3f %12.3f\n',i,p+1,SN13(1,1),SN13(1,2),My2(p,i));
                  end

               end 
            end  % for end            
            fprintf(out,'\n');           
         end  
        
      elseif isequal(get(ri_report_edit,'Value'),17)
         if ~isempty(Jval)
            %WRITING NODAL INFORMATION
            fprintf(out,'****************************************************************\n');
            fprintf(out,'*       Non-prismatic & mono-symmetric I-girder analysis       *\n');
            fprintf(out,'*                           J values                           *\n');
            fprintf(out,'****************************************************************\n');
            fprintf(out,'\n');
            fprintf(out,['* ',mfilename,'\n']);
            if isequal(AR,1)
               fprintf(out,'* 1st Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AS,1)
               fprintf(out,'* 2nd Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AE,1) 
               if isequal(LIAType,0)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end   
            elseif isequal(AI,2) || isequal(AI,1) || isequal(AI,3) 
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end  
            elseif isequal(AI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end                
            elseif isequal(ANE,1) 
               if isequal(NLIAType,0)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end                 
            elseif isequal(ANI,2) || isequal(ANI,1) || isequal(ANI,3)
               if isequal(NLIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end  
            elseif isequal(ANI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end                       
            end
            fprintf(out,'\n'); 
            fprintf(out,'  EL#   itp#       x-coord      y-coord       Jval\n');
            fprintf(out,'\n');            
            Jval1=Jval(1:4,:);
            Jval2=Jval(2:5,:);
            nip=5;
            for i = 1:xn 
               Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
               sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
               0 0 1];

               zeta=[-1 -sqrt(3/7) 0 sqrt(3/7) 1];
               DXe=DX(i,1)/2*zeta+DX(i,1)/2;
               DXe=DXe';

               for p=1:(nip-1)
                  % *************************** Rotation
                  % top flage start node
                  SN6=[MemLength1(i,1)+DXe(p,1) (0) (0)];
                  % top flage end node
                  SN13=[MemLength1(i,1)+DXe(p+1,1) (0) (0)];
                  % *************************** Global Rotation
                  SN6=Rz*SN6';SN6=SN6'; 
                  SN13=Rz*SN13';SN13=SN13';
                  % *************************** Global Translation to reference axis   
                  % top flage start node
                  SN6 = SN6+NG1(i,:);
                  % top flage end node
                  SN13 = SN13+NG2(i,:);       
                  fprintf(out,'  %3.0f %5.0f %12.3f %12.3f %12.3f\n',i,p,SN6(1,1),SN6(1,2),Jval1(p,i));
                  if isequal(p,4)
                     fprintf(out,'  %3.0f %5.0f %12.3f %12.3f %12.3f\n',i,p+1,SN13(1,1),SN13(1,2),Jval2(p,i));
                  end

               end 
            end  % for end            
            fprintf(out,'\n');           
         end  
         
      elseif isequal(get(ri_report_edit,'Value'),18)
         if ~isempty(Phi_Mmax)
            %WRITING NODAL INFORMATION
            fprintf(out,'****************************************************************\n');
            fprintf(out,'*       Non-prismatic & mono-symmetric I-girder analysis       *\n');
            fprintf(out,'*                           Phi_Mmax                           *\n');
            fprintf(out,'****************************************************************\n');
            fprintf(out,'\n');
            fprintf(out,['* ',mfilename,'\n']);
            if isequal(AR,1)
               fprintf(out,'* 1st Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AS,1)
               fprintf(out,'* 2nd Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AE,1) 
               if isequal(LIAType,0)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end   
            elseif isequal(AI,2) || isequal(AI,1) || isequal(AI,3) 
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end 
            elseif isequal(AI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end                
            elseif isequal(ANE,1) 
               if isequal(NLIAType,0)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end                 
            elseif isequal(ANI,2) || isequal(ANI,1) || isequal(ANI,3)
               if isequal(NLIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end  
            elseif isequal(ANI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end                       
            end
            fprintf(out,'\n'); 
            fprintf(out,'  EL#   itp#       x-coord      y-coord     Phi_Mmax\n');
            fprintf(out,'\n');            
            Phi_Mmax1=Phi_Mmax(1:4,:);
            Phi_Mmax2=Phi_Mmax(2:5,:);
            nip=5;
            for i = 1:xn 
               Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
               sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
               0 0 1];

               zeta=[-1 -sqrt(3/7) 0 sqrt(3/7) 1];
               DXe=DX(i,1)/2*zeta+DX(i,1)/2;
               DXe=DXe';

               for p=1:(nip-1)
                  % *************************** Rotation
                  % top flage start node
                  SN6=[MemLength1(i,1)+DXe(p,1) (0) (0)];
                  % top flage end node
                  SN13=[MemLength1(i,1)+DXe(p+1,1) (0) (0)];
                  % *************************** Global Rotation
                  SN6=Rz*SN6';SN6=SN6'; 
                  SN13=Rz*SN13';SN13=SN13';
                  % *************************** Global Translation to reference axis   
                  % top flage start node
                  SN6 = SN6+NG1(i,:);
                  % top flage end node
                  SN13 = SN13+NG2(i,:);       
                  fprintf(out,'  %3.0f %5.0f %12.3f %12.3f %12.3f\n',i,p,SN6(1,1),SN6(1,2),Phi_Mmax1(p,i));
                  if isequal(p,4)
                     fprintf(out,'  %3.0f %5.0f %12.3f %12.3f %12.3f\n',i,p+1,SN13(1,1),SN13(1,2),Phi_Mmax2(p,i));
                  end

               end 
            end  % for end            
            fprintf(out,'\n');           
         end  
         
      elseif isequal(get(ri_report_edit,'Value'),19)
         if ~isempty(Phi_Py)
            %WRITING NODAL INFORMATION
            fprintf(out,'****************************************************************\n');
            fprintf(out,'*       Non-prismatic & mono-symmetric I-girder analysis       *\n');
            fprintf(out,'*                            Phi_Pye                           *\n');
            fprintf(out,'****************************************************************\n');
            fprintf(out,'\n');
            fprintf(out,['* ',mfilename,'\n']);
            if isequal(AR,1)
               fprintf(out,'* 1st Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AS,1)
               fprintf(out,'* 2nd Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AE,1) 
               if isequal(LIAType,0)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end   
            elseif isequal(AI,2) || isequal(AI,1) || isequal(AI,3) 
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end   
            elseif isequal(AI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end                
            elseif isequal(ANE,1) 
               if isequal(NLIAType,0)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end                 
            elseif isequal(ANI,2) || isequal(ANI,1) || isequal(ANI,3)
               if isequal(NLIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end  
            elseif isequal(ANI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end                       
            end
            fprintf(out,'\n'); 
            fprintf(out,'  EL#   itp#       x-coord      y-coord      Phi_Py\n');
            fprintf(out,'\n');            
            Phi_Py1=Phi_Py(1:4,:);
            Phi_Py2=Phi_Py(2:5,:);
            nip=5;
            for i = 1:xn 
               Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
               sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
               0 0 1];

               zeta=[-1 -sqrt(3/7) 0 sqrt(3/7) 1];
               DXe=DX(i,1)/2*zeta+DX(i,1)/2;
               DXe=DXe';

               for p=1:(nip-1)
                  % *************************** Rotation
                  % top flage start node
                  SN6=[MemLength1(i,1)+DXe(p,1) (0) (0)];
                  % top flage end node
                  SN13=[MemLength1(i,1)+DXe(p+1,1) (0) (0)];
                  % *************************** Global Rotation
                  SN6=Rz*SN6';SN6=SN6'; 
                  SN13=Rz*SN13';SN13=SN13';
                  % *************************** Global Translation to reference axis   
                  % top flage start node
                  SN6 = SN6+NG1(i,:);
                  % top flage end node
                  SN13 = SN13+NG2(i,:);       
                  fprintf(out,'  %3.0f %5.0f %12.3f %12.3f %12.3f\n',i,p,SN6(1,1),SN6(1,2),Phi_Py1(p,i));
                  if isequal(p,4)
                     fprintf(out,'  %3.0f %5.0f %12.3f %12.3f %12.3f\n',i,p+1,SN13(1,1),SN13(1,2),Phi_Py2(p,i));
                  end

               end 
            end  % for end            
            fprintf(out,'\n');           
         end   

         
      elseif isequal(get(ri_report_edit,'Value'),20)
         if ~isempty(UC)
            %WRITING NODAL INFORMATION
            fprintf(out,'****************************************************************\n');
            fprintf(out,'*       Non-prismatic & mono-symmetric I-girder analysis       *\n');
            fprintf(out,'*                              UC                              *\n');
            fprintf(out,'****************************************************************\n');
            fprintf(out,'\n');
            fprintf(out,['* ',mfilename,'\n']);
            if isequal(AR,1)
               fprintf(out,'* 1st Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AS,1)
               fprintf(out,'* 2nd Order Elastic Analysis Results\n');
               fprintf(out,'* Increment #%d\n',IncreL);
            elseif isequal(AE,1) 
               if isequal(LIAType,0)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Elastic Linear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end   
            elseif isequal(AI,2) || isequal(AI,1) || isequal(AI,3) 
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end     
            elseif isequal(AI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Linear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Linear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
               end                
            elseif isequal(ANE,1) 
               if isequal(NLIAType,0)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Elastic Nonlinear Buckling Analysis Results\n');
%                   fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
%                if isequal(HomoType,0)
%                   fprintf(out,'* Homogeneous Member(s)\n');
%                elseif isequal(HomoType,1)
%                   fprintf(out,'* Hybrid Member(s)\n');
%                end                 
            elseif isequal(ANI,2) || isequal(ANI,1) || isequal(ANI,3)
               if isequal(NLIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);   
               elseif isequal(NLIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
                  fprintf(out,'* Mode #%d\n',IncreL);
                  fprintf(out,'* Applied Load Ratio = %12.5f\n',gammma);           
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end  
            elseif isequal(ANI,4)
               if isequal(LIAType,0)
                  fprintf(out,'* Inelastic Nonlinear Buckling Check Results\n');
                  fprintf(out,'* Current Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);   
               elseif isequal(LIAType,1)
                  fprintf(out,'* Inelastic Nonlinear Buckling Analysis Results\n');
                  fprintf(out,'* Modified Strength Eqs.\n');
%                   if gammma < 1
%                      fprintf(out,'* The Structure Cannot Support the Specified Load.\n');
%                   else
%                      fprintf(out,'* The Structure Can Support the Specified Load.\n');
%                   end
                  fprintf(out,'* Eigenvalue = %12.5f\n',gammma);            
               end      
               if isequal(HomoType,0)
                  fprintf(out,'* Homogeneous Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end
               elseif isequal(HomoType,1)
                  fprintf(out,'* Hybrid Member(s)\n');
                     switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
                        case 'da_on'    
                           fprintf(out,'* DM Stiffness is applied\n');
                        case 'da_off'
                           fprintf(out,'* DM Stiffness is not applied\n');
                     end                  
               end                       
            end
            fprintf(out,'\n'); 
            fprintf(out,'  EL#   itp#       x-coord      y-coord      UC \n');
            fprintf(out,'\n');            
            UC1=UC(1:4,:);
            UC2=UC(2:5,:);
            nip=5;
            for i = 1:xn 
               Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
               sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
               0 0 1];

               zeta=[-1 -sqrt(3/7) 0 sqrt(3/7) 1];
               DXe=DX(i,1)/2*zeta+DX(i,1)/2;
               DXe=DXe';

               for p=1:(nip-1)
                  % *************************** Rotation
                  % top flage start node
                  SN6=[MemLength1(i,1)+DXe(p,1) (0) (0)];
                  % top flage end node
                  SN13=[MemLength1(i,1)+DXe(p+1,1) (0) (0)];
                  % *************************** Global Rotation
                  SN6=Rz*SN6';SN6=SN6'; 
                  SN13=Rz*SN13';SN13=SN13';
                  % *************************** Global Translation to reference axis   
                  % top flage start node
                  SN6 = SN6+NG1(i,:);
                  % top flage end node
                  SN13 = SN13+NG2(i,:);       
                  fprintf(out,'  %3.0f %5.0f %12.3f %12.3f %12.3f\n',i,p,SN6(1,1),SN6(1,2),UC1(p,i));
                  if isequal(p,4)
                     fprintf(out,'  %3.0f %5.0f %12.3f %12.3f %12.3f\n',i,p+1,SN13(1,1),SN13(1,2),UC2(p,i));
                  end

               end 
            end  % for end            
            fprintf(out,'\n');           
         end            
         
         
      end
      fclose(out);
   end







