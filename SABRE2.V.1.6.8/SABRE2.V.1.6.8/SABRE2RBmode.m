function SABRE2RBmode(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,SNodevalue,RNCc,NCc,Nshe1,Nshe2,...
   DUP1,DUP2,EGunew,Rval,LNC,LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,Bhe1,Bhe2,...
   The1,The2,SGhe1,SGhe2,Mhe1,Mhe2,Bhg,Thg,CSg,Dscale,rd_buttongroup,pt_title_name,...
   AR,AS,AE,AI,ANE,ANI,gammma,UC,LIAType,NLIAType,crLTB,LGv,IncreL,LabType,axesm,vstm)
         
% Developed by Woo Yong Jeong.
% Date : 07/01/2013.
% ************************************************************************
% *****       3D Rendering of Deformed shape or Buckling modes        ****
% ************************************************************************
% reset axesm
cla (axesm,'reset'); 

xn = sum(sum(SNodevalue(:,:,3)));   % Total number of Elements
mem=length(Massemble(:,1));         % Total number of members
N = length(RNCc(:,1));              % Total number of Nodes

% ---------------------------------------- Shear Panel Junk S
if ~isempty(BNC1)
   RNC1=zeros(xn,14);RNC2=zeros(xn,14);
   for j=1:xn
       for i=1:length(BNC1(:,1))
           if isequal(BNC1(i,2),DUP1(j,2))           
               if isequal(BNC1(i,9),1) || isequal(BNC1(i,9),0)
                   RNC1(j,13)=2; 
               elseif isequal(BNC1(i,9),2)
                   RNC1(j,13)=1;
               end
           end
           if isequal(BNC2(i,2),DUP2(j,2))
               if isequal(BNC2(i,9),1) || isequal(BNC2(i,9),0)
                   RNC2(j,9)=2; 
               elseif isequal(BNC2(i,9),2)
                   RNC2(j,9)=1;
               end
           end     
       end
   end
end
% ---------------------------------------- Shear Panel Junk E
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
ys1=zeros(xn,1);ys2=zeros(xn,1);yc1=zeros(xn,1);yc2=zeros(xn,1);
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

% ------------------------------------------------------------------------
% ----------------              Rest Depth          ----------------------
% ------------------------------------------------------------------------
% hb1=hb1+tfb1/2;hb2=hb2+tfb2/2;
% ht1=ht1+tft1/2;ht2=ht2+tft2/2;
% hg1=hg1+(tft1/2+tfb1/2)/2;hg2=hg2+(tft2/2+tfb2/2)/2;

% ------------------------------------------------------------------------
% ----------------    Undeformed 3D rendering       ----------------------
% ------------------------------------------------------------------------
Evalue = [];
for i = 1:xn 
   Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
   sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
   0 0 1];
   
   switch val1(i,1)
      
      case 1
         % *************************** Rotation
         % bottom flage start node
         SN1=[MemLength1(i,1) (-Db1(i,1)) (zg1(i,1)+bfb1(i,1)/2)];      
         SN2=[MemLength1(i,1) (-Db1(i,1)) (zg1(i,1)+0)];     
         SN3=[MemLength1(i,1) (-Db1(i,1)) (zg1(i,1)-bfb1(i,1)/2)];
         % top flage start node
         SN5=[MemLength1(i,1) Dt1(i,1) (zg1(i,1)+bft1(i,1)/2)];
         SN6=[MemLength1(i,1) Dt1(i,1) (zg1(i,1)+0)];
         SN7=[MemLength1(i,1) Dt1(i,1) (zg1(i,1)-bft1(i,1)/2)];
         % bottom flage end node
         SN8=[MemLength2(i,1) (-Db2(i,1)) (zg2(i,1)+bfb2(i,1)/2)];
         SN9=[MemLength2(i,1) (-Db2(i,1)) (zg2(i,1)+0)];
         SN10=[MemLength2(i,1) (-Db2(i,1)) (zg2(i,1)-bfb2(i,1)/2)];
         % top flage end node
         SN12=[MemLength2(i,1) Dt2(i,1) (zg2(i,1)+bft2(i,1)/2)];
         SN13=[MemLength2(i,1) Dt2(i,1) (zg2(i,1)+0)];
         SN14=[MemLength2(i,1) Dt2(i,1) (zg2(i,1)-bft2(i,1)/2)];

      case 2     
         % *************************** Rotation
         % bottom flage start node
         SN1=[MemLength1(i,1) (-Dg1(i,1)) (zg1(i,1)+bfb1(i,1)/2)];  
         SN2=[MemLength1(i,1) (-Dg1(i,1)) (zg1(i,1)+0)];    
         SN3=[MemLength1(i,1) (-Dg1(i,1)) (zg1(i,1)-bfb1(i,1)/2)];
         % top flage start node
         SN5=[MemLength1(i,1) 0 (zg1(i,1)+bft1(i,1)/2)];
         SN6=[MemLength1(i,1) 0 (zg1(i,1)+0)]; 
         SN7=[MemLength1(i,1) 0 (zg1(i,1)-bft1(i,1)/2)];
         % bottom flage end node
         SN8=[MemLength2(i,1) (-Dg2(i,1)) (zg2(i,1)+bfb2(i,1)/2)];
         SN9=[MemLength2(i,1) (-Dg2(i,1)) (zg2(i,1)+0)];
         SN10=[MemLength2(i,1) (-Dg2(i,1)) (zg2(i,1)-bfb2(i,1)/2)];
         % top flage end node
         SN12=[MemLength2(i,1) 0 (zg2(i,1)+bft2(i,1)/2)];
         SN13=[MemLength2(i,1) 0 (zg2(i,1)+0)];
         SN14=[MemLength2(i,1) 0 (zg2(i,1)-bft2(i,1)/2)];        

      case 3
         % *************************** Rotation
         % bottom flage start node
         SN1=[MemLength1(i,1) (0) (zg1(i,1)+bfb1(i,1)/2)];
         SN2=[MemLength1(i,1) (0) (zg1(i,1)+0)];    
         SN3=[MemLength1(i,1) (0) (zg1(i,1)-bfb1(i,1)/2)];
         % top flage start node
         SN5=[MemLength1(i,1) Dg1(i,1) (zg1(i,1)+bft1(i,1)/2)];
         SN6=[MemLength1(i,1) Dg1(i,1) (zg1(i,1)+0)];
         SN7=[MemLength1(i,1) Dg1(i,1) (zg1(i,1)-bft1(i,1)/2)];
         % bottom flage end node
         SN8=[MemLength2(i,1) (0) (zg2(i,1)+bfb2(i,1)/2)];
         SN9=[MemLength2(i,1) (0) (zg2(i,1)+0)];
         SN10=[MemLength2(i,1) (0) (zg2(i,1)-bfb2(i,1)/2)];
         % top flage end node
         SN12=[MemLength2(i,1) Dg2(i,1) (zg2(i,1)+bft2(i,1)/2)];
         SN13=[MemLength2(i,1) Dg2(i,1) (zg2(i,1)+0)];
         SN14=[MemLength2(i,1) Dg2(i,1) (zg2(i,1)-bft2(i,1)/2)]; 
      
   end % Switch end
   
   % *************************** Global Rotation
   SN1=Rz*SN1';SN1=SN1';
   SN2=Rz*SN2';SN2=SN2';
   SN3=Rz*SN3';SN3=SN3'; 
   SN5=Rz*SN5';SN5=SN5';
   SN6=Rz*SN6';SN6=SN6'; 
   SN7=Rz*SN7';SN7=SN7'; 
   SN8=Rz*SN8';SN8=SN8';
   SN9=Rz*SN9';SN9=SN9';
   SN10=Rz*SN10';SN10=SN10'; 
   SN12=Rz*SN12';SN12=SN12'; 
   SN13=Rz*SN13';SN13=SN13';
   SN14=Rz*SN14';SN14=SN14';  
   % *************************** Global Translation to reference axis   
   % bottom flage start node
   SN1 = SN1+NG1(i,:);
   SN2 = SN2+NG1(i,:);
   SN3 = SN3+NG1(i,:);
   % top flage start node
   SN5 = SN5+NG1(i,:);
   SN6 = SN6+NG1(i,:);
   SN7 = SN7+NG1(i,:);
   % bottom flage end node
   SN8 = SN8+NG2(i,:);
   SN9 = SN9+NG2(i,:);
   SN10 = SN10+NG2(i,:);
   % top flage end node
   SN12 = SN12+NG2(i,:);
   SN13 = SN13+NG2(i,:);
   SN14 = SN14+NG2(i,:);    

   eLtf=[SN5;SN7;SN12;SN14]; % top flange surface.
   eLweb=[SN2;SN6;SN9;SN13]; % web surface.
   eLbf=[SN1;SN3;SN8;SN10];  % bottom flange surface.
   Xwtf = zeros(2,2); Ywtf = zeros(2,2); Zwtf = zeros(2,2);
   Xwweb = zeros(2,2); Ywweb = zeros(2,2); Zwweb = zeros(2,2);
   Xwbf = zeros(2,2); Ywbf = zeros(2,2); Zwbf = zeros(2,2);
   for k=1:2
      for j=1:2
         % top flange
         Xwtf(k,j) = eLtf((k-1)*2+j,1);
         Ywtf(k,j) = eLtf((k-1)*2+j,2);
         Zwtf(k,j) = eLtf((k-1)*2+j,3);     
         % web
         Xwweb(k,j) = eLweb((k-1)*2+j,1);
         Ywweb(k,j) = eLweb((k-1)*2+j,2);
         Zwweb(k,j) = eLweb((k-1)*2+j,3);       
         % bottom flange
         Xwbf(k,j) = eLbf((k-1)*2+j,1);
         Ywbf(k,j) = eLbf((k-1)*2+j,2);
         Zwbf(k,j) = eLbf((k-1)*2+j,3);       
      end
   end
   switch get(get(rd_buttongroup,'SelectedObject'),'Tag')
      case 'undeformed3d_on'   
         if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
            otf = surf(axesm,Xwtf,Zwtf,Ywtf,'FaceColor',[0.6 0.6 0.6], ...
               'EdgeColor',[0.6 0.6 0.6],'Tag','OTF'); hold on
            oweb = surf(axesm,Xwweb,Zwweb,Ywweb,'FaceColor',[0.7 0.7 0.7],...
               'EdgeColor',[0.6 0.6 0.6],'Tag','OWEB'); hold on
            obf = surf(axesm,Xwbf,Zwbf,Ywbf,'FaceColor',[0.6 0.6 0.6],...
               'EdgeColor',[0.6 0.6 0.6],'Tag','OBF'); hold on        
         elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background
            otf = surf(axesm,Xwtf,Zwtf,Ywtf,'FaceColor',[0.7 0.7 0.7], ...
               'EdgeColor',[0.3 0.3 0.3],'Tag','OTF'); hold on
            oweb = surf(axesm,Xwweb,Zwweb,Ywweb,'FaceColor',[0.8 0.8 0.8],...
               'EdgeColor',[0.3 0.3 0.3],'Tag','OWEB'); hold on
            obf = surf(axesm,Xwbf,Zwbf,Ywbf,'FaceColor',[0.7 0.7 0.7],...
               'EdgeColor',[0.3 0.3 0.3],'Tag','OBF'); hold on   
         end
         
         % Level of transparency.
         alpha([otf,oweb,obf],0.2)
      case 'undeformed3d_off' 
         delete(findobj('Tag','Nshe'));
   end

end  % for end

% ------------------------------------------------------------------------
% ------       Updates of Joints for Deflected shape           -----------
% ------------------------------------------------------------------------
xgd1=DUP1(:,3);
ygd1=DUP1(:,4);
xgs1=Nshe1(:,1);
ygs1=Nshe1(:,2);

xgd2=DUP2(:,3);
ygd2=DUP2(:,4);
xgs2=Nshe2(:,1);
ygs2=Nshe2(:,2);

r=0; 
% PP=[member, start el, end el, 
%     node1 for start el, node2 for start el,node1 for end el, node2 for end el] 
for i = 1:mem
   for j = 1:sum(SNodevalue(i,:,3))                
      if isequal(j,1)
         x1 = xgd1(r+j,1); y1 = ygd1(r+j,1);
         x2 = xgd2(r+j,1); y2 = ygd2(r+j,1);
         x3 = xgs1(r+j,1); y3 = ygs1(r+j,1);         
         Px1 = (y1-y2)*x1-tan(alpharef(r+j,2)+pi/2)*x3*(x1-x2)-(y1-y3)*(x1-x2);         
         Py1 = (y1-y2)*y3-tan(alpharef(r+j,2)+pi/2)*y1*(x1-x2)+(y1-y2)*tan(alpharef(r+j,2)+pi/2)*(x1-x3);          
         Pxy1 = ((y1-y2)-tan(alpharef(r+j,2)+pi/2)*(x1-x2));         
         if isequal(round(abs(Pxy1)),0)
            Px = x1;
            Py = y1;
         elseif isequal(round(abs(x1)),round(abs(x3))) && isequal(round(abs(y1)),round(abs(y3))) 
            Px = x1;
            Py = y1;            
         else
            Px = Px1/Pxy1;
            Py = Py1/Pxy1;              
         end         
         xgd1(r+j,1)=Px; ygd1(r+j,1)=Py;        
   
      elseif isequal(j,sum(SNodevalue(i,:,3)))
         x1 = xgd1(r+j,1); y1 = ygd1(r+j,1);
         x2 = xgd2(r+j,1); y2 = ygd2(r+j,1);
         x3 = xgs2(r+j,1); y3 = ygs2(r+j,1);         
         Px1 = (y1-y2)*x1-tan(alpharef(r+j,2)+pi/2)*x3*(x1-x2)-(y1-y3)*(x1-x2);         
         Py1 = (y1-y2)*y3-tan(alpharef(r+j,2)+pi/2)*y1*(x1-x2)+(y1-y2)*tan(alpharef(r+j,2)+pi/2)*(x1-x3);          
         Pxy1 = ((y1-y2)-tan(alpharef(r+j,2)+pi/2)*(x1-x2));         
         if isequal(round(abs(Pxy1)),0)
            Px = x2;
            Py = y2;
         elseif isequal(round(abs(x2)),round(abs(x3))) && isequal(round(abs(y2)),round(abs(y3))) 
            Px = x2;
            Py = y2;            
         else
            Px = Px1/Pxy1;
            Py = Py1/Pxy1;              
         end         
         xgd2(r+j,1)=Px; ygd2(r+j,1)=Py;             
      end
   end
   r = r+sum(SNodevalue(i,:,3));
end

% Calculate Initial Member x-dir Nodal Coordinates for Each Member
[MemLength]=InitialEleLengthRendering(xgd1,ygd1,zg1,xgd2,ygd2,zg2,SNodevalue);

% ----------------------------------------------- Tapering angle
Dshe1=zeros(xn,4);Dshe2=zeros(xn,4);
segnum(1,1)=0;          % (Start node number - 1) for each member
ys1=zeros(xn,1);ys2=zeros(xn,1);yc1=zeros(xn,1);yc2=zeros(xn,1);
for i = 1:mem
   switch Rval(i,2) 
      
      case 1                                    % mid-web depth ; val = 1
         
         for k = 1:sum(SNodevalue(i,:,3))
            ys1(k+segnum(i,1),1)=Dg1(k+segnum(i,1),1)/2 - Dst1(k+segnum(i,1),1); 
            ys2(k+segnum(i,1),1)=Dg2(k+segnum(i,1),1)/2 - Dst2(k+segnum(i,1),1);    % Shear center               
            if isequal(k+segnum(i,1),segnum(i,1)+1)
               Dshe1(k+segnum(i,1),1)=k+segnum(i,1);
               Dshe2(k+segnum(i,1),1)=k+segnum(i,1);
               Dshe1(k+segnum(i,1),2)=0;
               Dshe2(k+segnum(i,1),2)=MemLength(k+segnum(i,1),1);
               Dshe1(k+segnum(i,1),3)=ys1(k+segnum(i,1),1);
               Dshe2(k+segnum(i,1),3)=ys2(k+segnum(i,1),1);
               Dshe1(k+segnum(i,1),4)=zg1(k+segnum(i,1),1);
               Dshe2(k+segnum(i,1),4)=zg2(k+segnum(i,1),1);
            else
               Dshe1(k+segnum(i,1),1)=k+segnum(i,1);
               Dshe2(k+segnum(i,1),1)=k+segnum(i,1);
               Dshe1(k+segnum(i,1),2)=MemLength(k+segnum(i,1)-1,1);
               Dshe2(k+segnum(i,1),2)=MemLength(k+segnum(i,1),1);
               Dshe1(k+segnum(i,1),3)=ys1(k+segnum(i,1),1);
               Dshe2(k+segnum(i,1),3)=ys2(k+segnum(i,1),1);
               Dshe1(k+segnum(i,1),4)=zg1(k+segnum(i,1),1);
               Dshe2(k+segnum(i,1),4)=zg2(k+segnum(i,1),1);
            end
         end            
      
      case 2                                 % top of web; val = 2
         
         for k = 1:sum(SNodevalue(i,:,3))
            ys1(k+segnum(i,1),1)=-Dst1(k+segnum(i,1),1);
            ys2(k+segnum(i,1),1)=-Dst2(k+segnum(i,1),1);                % Shear center              
            if isequal(k+segnum(i,1),segnum(i,1)+1)
               Dshe1(k+segnum(i,1),1)=k+segnum(i,1);
               Dshe2(k+segnum(i,1),1)=k+segnum(i,1);
               Dshe1(k+segnum(i,1),2)=0;
               Dshe2(k+segnum(i,1),2)=MemLength(k+segnum(i,1),1);
               Dshe1(k+segnum(i,1),3)=ys1(k+segnum(i,1),1);
               Dshe2(k+segnum(i,1),3)=ys2(k+segnum(i,1),1);
               Dshe1(k+segnum(i,1),4)=zg1(k+segnum(i,1),1);
               Dshe2(k+segnum(i,1),4)=zg2(k+segnum(i,1),1);
            else
               Dshe1(k+segnum(i,1),1)=k+segnum(i,1);
               Dshe2(k+segnum(i,1),1)=k+segnum(i,1);
               Dshe1(k+segnum(i,1),2)=MemLength(k+segnum(i,1)-1,1);
               Dshe2(k+segnum(i,1),2)=MemLength(k+segnum(i,1),1);
               Dshe1(k+segnum(i,1),3)=ys1(k+segnum(i,1),1);
               Dshe2(k+segnum(i,1),3)=ys2(k+segnum(i,1),1);
               Dshe1(k+segnum(i,1),4)=zg1(k+segnum(i,1),1);
               Dshe2(k+segnum(i,1),4)=zg2(k+segnum(i,1),1);
            end  
         end       
       
      case 3                                 % bottom of web; val = 3
         
         for k = 1:sum(SNodevalue(i,:,3))
            ys1(k+segnum(i,1),1)=Dsb1(k+segnum(i,1),1); 
            ys2(k+segnum(i,1),1)=Dsb2(k+segnum(i,1),1);              % Shear center                
            if isequal(k+segnum(i,1),segnum(i,1)+1)
               Dshe1(k+segnum(i,1),1)=k+segnum(i,1);
               Dshe2(k+segnum(i,1),1)=k+segnum(i,1);
               Dshe1(k+segnum(i,1),2)=0;
               Dshe2(k+segnum(i,1),2)=MemLength(k+segnum(i,1),1);
               Dshe1(k+segnum(i,1),3)=ys1(k+segnum(i,1),1);
               Dshe2(k+segnum(i,1),3)=ys2(k+segnum(i,1),1);
               Dshe1(k+segnum(i,1),4)=zg1(k+segnum(i,1),1);
               Dshe2(k+segnum(i,1),4)=zg2(k+segnum(i,1),1);
            else
               Dshe1(k+segnum(i,1),1)=k+segnum(i,1);
               Dshe2(k+segnum(i,1),1)=k+segnum(i,1);
               Dshe1(k+segnum(i,1),2)=MemLength(k+segnum(i,1)-1,1);
               Dshe2(k+segnum(i,1),2)=MemLength(k+segnum(i,1),1);
               Dshe1(k+segnum(i,1),3)=ys1(k+segnum(i,1),1);
               Dshe2(k+segnum(i,1),3)=ys2(k+segnum(i,1),1);
               Dshe1(k+segnum(i,1),4)=zg1(k+segnum(i,1),1);
               Dshe2(k+segnum(i,1),4)=zg2(k+segnum(i,1),1);
            end
         end
   end 
   segnum(i+1,1) = segnum(i,1) + sum(SNodevalue(i,:,3));
end   

% Starting Node for each member
segnum(1,1)=0;    % (Start node number - 1) for each member
for i = 1:mem
   for k = 1:sum(SNodevalue(i,:,3))            
      NG1(k+segnum(i,1),1)=xgd1(segnum(i,1)+1,1);
      NG2(k+segnum(i,1),1)=xgd1(segnum(i,1)+1,1);
      NG1(k+segnum(i,1),2)=ygd1(segnum(i,1)+1,1);
      NG2(k+segnum(i,1),2)=ygd1(segnum(i,1)+1,1);
      NG1(k+segnum(i,1),3)=DUP1(segnum(i,1)+1,5);
      NG2(k+segnum(i,1),3)=DUP1(segnum(i,1)+1,5);
   end
   segnum(i+1,1) = segnum(i,1) + sum(SNodevalue(i,:,3));
end

MemLength1=Dshe1(:,2);MemLength2=Dshe2(:,2);
% ------------------------------------------------------------------------
% ----------------            Rigid Offset          ----------------------
% ------------------------------------------------------------------------
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

% Rigid Offset
[rd1,rd2] = GraphicRigid(Massemble,...
   Rval,SNodevalue,RNCc,Nshe1,Nshe2,DUP1,DUP2,PNC,PNC1,PNC2,FEL);

% Global coordiante
EGunew1 = zeros(xn,7); EGunew2 = zeros(xn,7);
for i=1:xn
   for j=1:7
      EGunew1(i,j)=EGunew(MI(i,2),j); 
      EGunew2(i,j)=EGunew(MI(i,3),j);
   end
end  

% Preallocating 
EGunew_ux1=zeros(xn,1);
EGunew_ux2=zeros(xn,1);
EGunew_uy1=zeros(xn,1);
EGunew_uy2=zeros(xn,1);
EGunew_uz1=zeros(xn,1);
EGunew_uz2=zeros(xn,1);  
EGunew_rx1=zeros(xn,1);
EGunew_rx2=zeros(xn,1);
EGunew_ry1=zeros(xn,1);
EGunew_ry2=zeros(xn,1);
EGunew_rz1=zeros(xn,1);
EGunew_rz2=zeros(xn,1);   
EGunew_phx1=zeros(xn,1);
EGunew_phx2=zeros(xn,1);   
for n=1:xn
   
   % Rigid offset for Supports
   Rsd = eye(14);
   Rsd(3,4)=rd1(n);  Rsd(10,11)=rd2(n); 

   % Inverse Rotation from Global Frame to Element Frame
   RLz=[cos(-alpharef(n,2)) -sin(-alpharef(n,2)) 0; ...
      sin(-alpharef(n,2)) cos(-alpharef(n,2)) 0; ...
      0 0 1];
   eL1 = [1; 0; 0];eL1 = RLz*eL1;
   eL2 = [0; 1; 0];eL2 = RLz*eL2;
   eL3 = [0; 0; 1];eL3 = RLz*eL3;

   [GLe]=CoordTransformR(eL1,eL2,eL3);
   
   % element coordinate
   Ft = Rsd*GLe*[EGunew1(n,:)';EGunew2(n,:)'];
   Ft(3,1) = Ft(3,1) -(Dg1(n,1)/2 - Dst1(n,1))*tan(Ft(4,1));
   Ft(10,1) = Ft(10,1) -(Dg2(n,1)/2 - Dst2(n,1))*tan(Ft(11,1));
   
   % Translations
   EGunew_ux1(n,1) = Ft(1,1)*Dscale;
   EGunew_ux2(n,1)=Ft(8,1)*Dscale;
   EGunew_uy1(n,1)=Ft(2,1)*Dscale;
   EGunew_uy2(n,1)=Ft(9,1)*Dscale;
   EGunew_uz1(n,1)=-Ft(3,1)*Dscale;
   EGunew_uz2(n,1)=-Ft(10,1)*Dscale;  
   
   % Rotations
   EGunew_rx1(n,1)=-Ft(4,1)*Dscale;
   EGunew_rx2(n,1)=-Ft(11,1)*Dscale;
   EGunew_ry1(n,1)=-Ft(5,1)*Dscale;
   EGunew_ry2(n,1)=-Ft(12,1)*Dscale;
   EGunew_rz1(n,1)=Ft(6,1)*Dscale;
   EGunew_rz2(n,1)=Ft(13,1)*Dscale;   

   % Warping
   EGunew_phx1(n,1)=-Ft(7,1)*Dscale;
   EGunew_phx2(n,1)=-Ft(14,1)*Dscale;     
end
   
% % Translations
% EGunew_ux1=EGunew(MI(:,2),1)*Dscale;
% EGunew_ux2=EGunew(MI(:,3),1)*Dscale;
% EGunew_uy1=EGunew(MI(:,2),2)*Dscale;
% EGunew_uy2=EGunew(MI(:,3),2)*Dscale;
% EGunew_uz1=-EGunew(MI(:,2),3)*Dscale;
% EGunew_uz2=-EGunew(MI(:,3),3)*Dscale;
% % Rotations
% EGunew_rx1=-EGunew(MI(:,2),4)*Dscale;
% EGunew_rx2=-EGunew(MI(:,3),4)*Dscale;
% EGunew_ry1=-EGunew(MI(:,2),5)*Dscale;
% EGunew_ry2=-EGunew(MI(:,3),5)*Dscale;
% EGunew_rz1=EGunew(MI(:,2),6)*Dscale;
% EGunew_rz2=EGunew(MI(:,3),6)*Dscale;
% 
% % Warping
% EGunew_phx1=-EGunew(MI(:,2),7)*Dscale;
% EGunew_phx2=-EGunew(MI(:,3),7)*Dscale;

% ------------------------------------------------------------------------
% ----------------      Deformed 3D rendering       ----------------------
% ------------------------------------------------------------------------
if ~isempty(JNodevalue)
   % ********************************************** Plot Coordnate Axes S
   if ~isempty(RNCc)  

      xabs = abs(min(RNCc(:,2))-max(RNCc(:,2)));
      yabs = abs(min(RNCc(:,3))-max(RNCc(:,3)));
      zabs = abs(min(-RNCc(:,4))-max(-RNCc(:,4))); 
      
      xabs = max(max(abs(min(RNCc(:,2))), abs(max(RNCc(:,2)))),xabs);
      yabs = max(max(abs(min(RNCc(:,3))), abs(max(RNCc(:,3)))),yabs);
      zabs = max(max(abs(min(-RNCc(:,4))), abs(max(-RNCc(:,4)))),zabs);
      
      
      xEunew= max( max(abs(EGunew_ux1(:,1))),max(abs(EGunew_ux2(:,1))) );
      xmin = min(RNCc(:,2))-1-0.1*xabs-xEunew*2;
      xmax = max(RNCc(:,2))+1+0.1*xabs+xEunew*2;

      yEunew= max( max(abs(EGunew_uy1(:,1))),max(abs(EGunew_uy2(:,1))) );
      ymin = min(RNCc(:,3))-1-0.1*yabs-yEunew*2;
      ymax = max(RNCc(:,3))+1+0.1*yabs+yEunew*2;
      
      
      zEunew= max( max(abs(EGunew_uz1(:,1))),max(abs(EGunew_uz2(:,1))) ); 
      zmin = min(-RNCc(:,4))-1-0.1*zabs-zEunew*2;
      zmax = max(-RNCc(:,4))+1+0.1*zabs+zEunew*2;
      
      mbfb = max(RNCc(:,5));
      mtfb = max(RNCc(:,6));
      mbft = max(RNCc(:,7));
      mtft = max(RNCc(:,8));
      mDg = max(RNCc(:,9));

      bf = max(mbfb,mbft);

      for i = 1:length(Massemble(:,1))
         switch Rval(i,2) 

            case 1                           % mid-web depth; Rval=1
               ydt=mDg/2+2*mtft; 
               ydb=mDg/2+2*mtfb;    % Shear center         

            case 2                           % top of web; Rval = 2
               ydt=0+2*mtft; 
               ydb=mDg+2*mtfb;    % Shear center           

            case 3                           % bottom of web; Rval = 3
               ydt=mDg+2*mtft; 
               ydb=0+2*mtfb;    % Shear center

         end
      end

      if xabs < ydt*3
         if xmax < ydt*2
            xmax=max( xmax,ydt*2 )+1+0.1*xabs;
         end

         if xmin > -ydb*2
            xmin=min(xmin,-ydb*2)-1-0.1*xabs;
         end            
      end

      if yabs < ydt*3
         if ymax < ydt*2
            ymax=max( ymax,ydt*2 )+1+0.1*yabs;
         end

         if ymin > -ydb*2
            ymin=min(ymin,-ydb*2)-1-0.1*yabs;
         end 
      end

      if zabs < bf*2           
         if zmax < bf
            zmax=max( zmax,bf )+1+0.1*zabs;
         end

         if zmin > -bf
            zmin=min(zmin,-bf)-1-0.1*zabs; 
         end
      end
      
   else
      mDg=0;    
      xabs = abs(min(JNodevalue(:,2))-max(JNodevalue(:,2)));
      yabs = abs(min(JNodevalue(:,3))-max(JNodevalue(:,3)));
      zabs = abs(min(-JNodevalue(:,4))-max(-JNodevalue(:,4)));

      xabs = max(max(abs(min(JNodevalue(:,2))), abs(max(JNodevalue(:,2)))),xabs);
      yabs = max(max(abs(min(JNodevalue(:,3))), abs(max(JNodevalue(:,3)))),yabs);
      zabs = max(max(abs(min(-JNodevalue(:,4))), abs(max(-JNodevalue(:,4)))),zabs);
      
      xmin = min(min(JNodevalue(:,2)),0)-1-0.1*xabs;
      xmax = max(max(JNodevalue(:,2)),0)+1+0.1*xabs;

      ymin = min(min(JNodevalue(:,3)),0)-1-0.1*yabs;
      ymax = max(max(JNodevalue(:,3)),0)+1+0.1*yabs; 

      zmin = min(min(-JNodevalue(:,4)),0)-1-0.1*zabs;
      zmax = max(max(-JNodevalue(:,4)),0)+1+0.1*zabs; 

   end

   xa=max( max(max(abs(xmax-xmin),abs(ymax-ymin)),abs(zmax-zmin))/18,(mDg+mtfb+mtft)*1.3); 

   xmax=max(xmax+0.5*xa,xa);
   ymax=max(ymax+0.5*xa,xa);
   zmax=max(zmax+0.5*xa,xa);

   xmin=min(xmin-xa*0.4,-xa*0.8);
   ymin=min(ymin-xa*0.4,-xa*0.8);
   zmin=min(zmin-xa*0.4,-xa*0.8);
   
   delete(findobj('Tag','axis'));
   if isequal(LabType(1,3),0)
   if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
      plot3(axesm,[0 xa*0.8],[0,0],[0,0],'Color','k','linewidth',1,'Tag','axis','HitTest','off');
      hold on;
      plot3(axesm,[0 0],[0,-xa*0.8],[0,0],'Color','k','linewidth',1,'Tag','axis','HitTest','off');
      hold on; 
      plot3(axesm,[0 0],[0,0],[0,xa*0.8],'Color','k','linewidth',1,'Tag','axis','HitTest','off');
      hold on;      
      text(xa*0.9,0,0,'X','FontSize',11,'Tag','axis','HitTest','off','Color','k');
      text(0,-xa*0.9,0,'Z','FontSize',11,'Tag','axis','HitTest','off','Color','k');
      text(0,0,xa*0.9,'Y','FontSize',11,'Tag','axis','HitTest','off','Color','k');  
   elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background   
      plot3(axesm,[0 xa*0.8],[0,0],[0,0],'Color','w','linewidth',1,'Tag','axis','HitTest','off');
      hold on;
      plot3(axesm,[0 0],[0,-xa*0.8],[0,0],'Color','w','linewidth',1,'Tag','axis','HitTest','off');
      hold on; 
      plot3(axesm,[0 0],[0,0],[0,xa*0.8],'Color','w','linewidth',1,'Tag','axis','HitTest','off');
      hold on;      
      text(xa*0.9,0,0,'X','FontSize',11,'Tag','axis','HitTest','off','Color','w');
      text(0,-xa*0.9,0,'Z','FontSize',11,'Tag','axis','HitTest','off','Color','w');
      text(0,0,xa*0.9,'Y','FontSize',11,'Tag','axis','HitTest','off','Color','w');
   end   
   end
   
   set(axesm,'xlim',[xmin xmax],'ylim',[zmin zmax],'zlim',[ymin ymax]) 
   % ********************************************** Plot Coordnate Axes E
end

a=0; u=1; v=1;
for n=1:max(SNodevalue(:,1,1))  % member number

   for m = 1:max(SNodevalue(n,:,2))
     
      SM1=[];SM2=[];SM3=[];
      SM5=[];SM6=[];SM7=[];
      SM8=[];SM9=[];SM10=[];
      SM12=[];SM13=[];SM14=[];
      Xwtf=[];Ywtf=[];Zwtf=[];
      for p = 1:max(SNodevalue(n,m,3))
         i=p+a;
         % Rotation w.r.t Global frame angle + Tapered Angle
         Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
         sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
         0 0 1]; 

         % Rotation w.r.t Eigenvectors
         Rx1=[1 0 0; ...
            0 cos(EGunew_rx1(i,1)) -sin(EGunew_rx1(i,1)); ...
            0 sin(EGunew_rx1(i,1)) cos(EGunew_rx1(i,1))];
         Rx2=[1 0 0; ...
            0 cos(EGunew_rx2(i,1)) -sin(EGunew_rx2(i,1)); ...
            0 sin(EGunew_rx2(i,1)) cos(EGunew_rx2(i,1))];       

         Ry1=[cos(EGunew_ry1(i,1)) 0 sin(EGunew_ry1(i,1)); ...
            0 1 0; ...
            -sin(EGunew_ry1(i,1)) 0 cos(EGunew_ry1(i,1))];
         Ry2=[cos(EGunew_ry2(i,1)) 0 sin(EGunew_ry2(i,1)); ...
            0 1 0; ...
            -sin(EGunew_ry2(i,1)) 0 cos(EGunew_ry2(i,1))];   
         
         Rz1=[cos(EGunew_rz1(i,1)) -sin(EGunew_rz1(i,1)) 0; ...
            -sin(EGunew_rz1(i,1)) cos(EGunew_rz1(i,1)) 0; ...
            0 0 1];  
         Rz2=[cos(EGunew_rz2(i,1)) -sin(EGunew_rz2(i,1)) 0; ...
            -sin(EGunew_rz2(i,1)) cos(EGunew_rz2(i,1)) 0; ...
            0 0 1];   
         
         switch val1(i,1)

            case 1      
               % *************************** Rotation 
               % bottom flage start node
               SX1=[0, (-Db1(i,1)), (bfb1(i,1)/2)];  
               SPX1=Rx1*SX1';SPX1=SPX1';SNX1=(SPX1- SX1);               
               SY1=[0, 0, (bfb1(i,1)/2)];  
               SPY1=Ry1*SY1';SPY1=SPY1';SNY1=(SPY1- SY1);               
               SZ1=[0,(-Db1(i,1)), 0];  
               SPZ1=Rz1*SZ1';SPZ1=SPZ1';SNZ1=(SPZ1- SZ1);                               
               SL1=[( MemLength1(i,1)+sin(Db1(i,1)*EGunew_phx1(i,1))*(bfb1(i,1)/2)),0, 0];                  
               SN1=SNX1+SNY1+SNZ1+SL1+SX1;
    
               SX2=[0, (-Db1(i,1)), 0];  
               SPX2=Rx1*SX2';SPX2=SPX2';SNX2=(SPX2- SX2);               
               SY2=[0, 0, 0];  
               SPY2=Ry1*SY2';SPY2=SPY2';SNY2=(SPY2- SY2);               
               SZ2=[0,(-Db1(i,1)), 0];  
               SPZ2=Rz1*SZ2';SPZ2=SPZ2';SNZ2=(SPZ2- SZ2);                               
               SL2=[( MemLength1(i,1)),0, 0];                  
               SN2=SNX2+SNY2+SNZ2+SL2+SX2;
               
               SX3=[0, (-Db1(i,1)), (-bfb1(i,1)/2)];  
               SPX3=Rx1*SX3';SPX3=SPX3';SNX3=(SPX3- SX3);               
               SY3=[0, 0, (-bfb1(i,1)/2)];  
               SPY3=Ry1*SY3';SPY3=SPY3';SNY3=(SPY3- SY3);               
               SZ3=[0,(-Db1(i,1)), 0];  
               SPZ3=Rz1*SZ3';SPZ3=SPZ3';SNZ3=(SPZ3- SZ3);                               
               SL3=[( MemLength1(i,1)+sin(Db1(i,1)*EGunew_phx1(i,1))*(-bfb1(i,1)/2)),0, 0];                  
               SN3=SNX3+SNY3+SNZ3+SL3+SX3;
               
               % top flage start node
               SX5=[0, (Dt1(i,1)), (bft1(i,1)/2)];  
               SPX5=Rx1*SX5';SPX5=SPX5';SNX5=(SPX5- SX5);               
               SY5=[0, 0, (bft1(i,1)/2)];  
               SPY5=Ry1*SY5';SPY5=SPY5';SNY5=(SPY5- SY5);               
               SZ5=[0,(Dt1(i,1)), 0];  
               SPZ5=Rz1*SZ5';SPZ5=SPZ5';SNZ5=(SPZ5- SZ5);                               
               SL5=[( MemLength1(i,1)+sin(-Dt1(i,1)*EGunew_phx1(i,1))*(bft1(i,1)/2)),0, 0];                  
               SN5=SNX5+SNY5+SNZ5+SL5+SX5;
               
               SX6=[0, (Dt1(i,1)), 0];  
               SPX6=Rx1*SX6';SPX6=SPX6';SNX6=(SPX6- SX6);               
               SY6=[0, 0, 0];  
               SPY6=Ry1*SY6';SPY6=SPY6';SNY6=(SPY6- SY6);               
               SZ6=[0,(Dt1(i,1)), 0];  
               SPZ6=Rz1*SZ6';SPZ6=SPZ6';SNZ6=(SPZ6- SZ6);                               
               SL6=[( MemLength1(i,1)),0, 0];                  
               SN6=SNX6+SNY6+SNZ6+SL6+SX6;
               
               SX7=[0, (Dt1(i,1)), (-bft1(i,1)/2)];  
               SPX7=Rx1*SX7';SPX7=SPX7';SNX7=(SPX7- SX7);               
               SY7=[0, 0, (-bft1(i,1)/2)];  
               SPY7=Ry1*SY7';SPY7=SPY7';SNY7=(SPY7- SY7);               
               SZ7=[0,(Dt1(i,1)), 0];  
               SPZ7=Rz1*SZ7';SPZ7=SPZ7';SNZ7=(SPZ7- SZ7);                               
               SL7=[( MemLength1(i,1)+sin(-Dt1(i,1)*EGunew_phx1(i,1))*(-bft1(i,1)/2)),0, 0];                  
               SN7=SNX7+SNY7+SNZ7+SL7+SX7;


               % bottom flage end node
               SX8=[0, (-Db2(i,1)), (bfb2(i,1)/2)];  
               SPX8=Rx2*SX8';SPX8=SPX8';SNX8=(SPX8- SX8);               
               SY8=[0, 0, (bfb2(i,1)/2)];  
               SPY8=Ry2*SY8';SPY8=SPY8';SNY8=(SPY8- SY8);               
               SZ8=[0,(-Db2(i,1)), 0];  
               SPZ8=Rz2*SZ8';SPZ8=SPZ8';SNZ8=(SPZ8- SZ8);                               
               SL8=[( MemLength2(i,1)+sin(Db2(i,1)*EGunew_phx2(i,1))*(bfb2(i,1)/2)),0, 0];                  
               SN8=SNX8+SNY8+SNZ8+SL8+SX8;
    
               SX9=[0, (-Db2(i,1)), 0];  
               SPX9=Rx2*SX9';SPX9=SPX9';SNX9=(SPX9- SX9);               
               SY9=[0, 0, 0];  
               SPY9=Ry2*SY9';SPY9=SPY9';SNY9=(SPY9- SY9);               
               SZ9=[0,(-Db2(i,1)), 0];  
               SPZ9=Rz2*SZ9';SPZ9=SPZ9';SNZ9=(SPZ9- SZ9);                               
               SL9=[( MemLength2(i,1)),0, 0];                  
               SN9=SNX9+SNY9+SNZ9+SL9+SX9;
               
               SX10=[0, (-Db2(i,1)), (-bfb2(i,1)/2)];  
               SPX10=Rx2*SX10';SPX10=SPX10';SNX10=(SPX10- SX10);               
               SY10=[0, 0, (-bfb2(i,1)/2)];  
               SPY10=Ry2*SY10';SPY10=SPY10';SNY10=(SPY10- SY10);               
               SZ10=[0,(-Db2(i,1)), 0];  
               SPZ10=Rz2*SZ10';SPZ10=SPZ10';SNZ10=(SPZ10- SZ10);                               
               SL10=[( MemLength2(i,1)+sin(Db2(i,1)*EGunew_phx2(i,1))*(-bfb2(i,1)/2)),0, 0];                  
               SN10=SNX10+SNY10+SNZ10+SL10+SX10;
               
               % top flage end node
               SX12=[0, (Dt2(i,1)), (bft2(i,1)/2)];  
               SPX12=Rx2*SX12';SPX12=SPX12';SNX12=(SPX12- SX12);               
               SY12=[0, 0, (bft2(i,1)/2)];  
               SPY12=Ry2*SY12';SPY12=SPY12';SNY12=(SPY12- SY12);               
               SZ12=[0,(Dt2(i,1)), 0];  
               SPZ12=Rz2*SZ12';SPZ12=SPZ12';SNZ12=(SPZ12- SZ12);                               
               SL12=[( MemLength2(i,1)+sin(-Dt2(i,1)*EGunew_phx2(i,1))*(bft2(i,1)/2)),0, 0];                  
               SN12=SNX12+SNY12+SNZ12+SL12+SX12;
               
               SX13=[0, (Dt2(i,1)), 0];  
               SPX13=Rx2*SX13';SPX13=SPX13';SNX13=(SPX13- SX13);               
               SY13=[0, 0, 0];  
               SPY13=Ry2*SY13';SPY13=SPY13';SNY13=(SPY13- SY13);               
               SZ13=[0,(Dt2(i,1)), 0];  
               SPZ13=Rz2*SZ13';SPZ13=SPZ13';SNZ13=(SPZ13- SZ13);                               
               SL13=[( MemLength2(i,1)),0, 0];                  
               SN13=SNX13+SNY13+SNZ13+SL13+SX13;
               
               SX14=[0, (Dt2(i,1)), (-bft2(i,1)/2)];  
               SPX14=Rx2*SX14';SPX14=SPX14';SNX14=(SPX14- SX14);               
               SY14=[0, 0, (-bft2(i,1)/2)];  
               SPY14=Ry2*SY14';SPY14=SPY14';SNY14=(SPY14- SY14);               
               SZ14=[0,(Dt2(i,1)), 0];  
               SPZ14=Rz2*SZ14';SPZ14=SPZ14';SNZ14=(SPZ14- SZ14);                               
               SL14=[( MemLength2(i,1)+sin(-Dt2(i,1)*EGunew_phx2(i,1))*(-bft2(i,1)/2)),0, 0];                  
               SN14=SNX14+SNY14+SNZ14+SL14+SX14;  
 
               % Barcing
               % Mid depth start node
               YN3=[( MemLength1(i,1)+sin(EGunew_rz1(i,1))*(Db1(i,1))), (-Db1(i,1)), (zg1(i,1)+0)];
               YN4=[( MemLength1(i,1)+sin(EGunew_rz1(i,1))*(Db1(i,1))), (-Db1(i,1)), (zg1(i,1)+xa*0.5)];
               YN6=[( MemLength1(i,1)-sin(EGunew_rz1(i,1))*(Dt1(i,1))), Dt1(i,1), (zg1(i,1)+0)];
               YN7=[( MemLength1(i,1)-sin(EGunew_rz1(i,1))*(Dt1(i,1))), Dt1(i,1), (zg1(i,1)+xa*0.5)];
               BN3 = (YN3+YN6)/2;
               BN4 = (YN4+YN7)/2;
               % Mid depth end node
               YN9=[( MemLength2(i,1)+sin(EGunew_rz2(i,1))*(Db2(i,1))), (-Db2(i,1)), (zg2(i,1)+0)];
               YN10=[( MemLength2(i,1)+sin(EGunew_rz2(i,1))*(Db2(i,1))), (-Db2(i,1)), (zg2(i,1)+xa*0.5)];
               YN13=[( MemLength2(i,1)-sin(EGunew_rz2(i,1))*(Dt2(i,1))), Dt2(i,1), (zg2(i,1)+0)];
               YN14=[( MemLength2(i,1)-sin(EGunew_rz2(i,1))*(Dt2(i,1))), Dt2(i,1), (zg2(i,1)+xa*0.5)];
               BN7 = (YN9+YN13)/2;
               BN10 = (YN10+YN14)/2;               
               
               % bottom flage start node
               BN1=[( MemLength1(i,1)+sin(Db1(i,1)*EGunew_phx1(i,1))*(bfb1(i,1)/2)+sin(EGunew_ry1(i,1))*(bfb1(i,1)/2)+sin(EGunew_rz1(i,1))*(Db1(i,1))),...
                  (-Db1(i,1)), (zg1(i,1)+bfb1(i,1)/2)];
               BN2=[( MemLength1(i,1)+sin(Db1(i,1)*EGunew_phx1(i,1))*(bfb1(i,1)/2)+sin(EGunew_ry1(i,1))*(bfb1(i,1)/2)+sin(EGunew_rz1(i,1))*(Db1(i,1))),...
                  (-Db1(i,1)), (zg1(i,1)+bfb1(i,1)/2+xa*0.5)];               
               % bottom flage end node
               BN8=[(MemLength2(i,1)+sin(Db2(i,1)*EGunew_phx2(i,1))*(bfb2(i,1)/2)+sin(EGunew_ry2(i,1))*(bfb2(i,1)/2)+sin(EGunew_rz2(i,1))*(Db2(i,1))), ...
                  (-Db2(i,1)), (zg2(i,1)+bfb2(i,1)/2)];               
               BN9=[(MemLength2(i,1)+sin(Db2(i,1)*EGunew_phx2(i,1))*(bfb2(i,1)/2)+sin(EGunew_ry2(i,1))*(bfb2(i,1)/2)+sin(EGunew_rz2(i,1))*(Db2(i,1))), ...
                  (-Db2(i,1)), (zg2(i,1)+bfb2(i,1)/2+xa*0.5)];                
               % top flage start node
%                SN2=[( MemLength1(i,1)+sin(EGunew_rz1(i,1))*(Db1(i,1))), (-Db1(i,1)), (zg1(i,1)+0)];
               BN5=[(MemLength1(i,1)+sin(-Dt1(i,1)*EGunew_phx1(i,1))*(bft1(i,1)/2)+sin(EGunew_ry1(i,1))*(bft1(i,1)/2)-sin(EGunew_rz1(i,1))*(Dt1(i,1))), ...
                  Dt1(i,1), (zg1(i,1)+bft1(i,1)/2)];               
               BN6=[(MemLength1(i,1)+sin(-Dt1(i,1)*EGunew_phx1(i,1))*(bft1(i,1)/2)+sin(EGunew_ry1(i,1))*(bft1(i,1)/2)-sin(EGunew_rz1(i,1))*(Dt1(i,1))), ...
                  Dt1(i,1), (zg1(i,1)+bft1(i,1)/2+xa*0.5)];
               % top flage end node
               BN12=[(MemLength2(i,1)+sin(-Dt2(i,1)*EGunew_phx2(i,1))*(bft2(i,1)/2)+sin(EGunew_ry2(i,1))*(bft2(i,1)/2)-sin(EGunew_rz2(i,1))*(Dt2(i,1))), ...
                  Dt2(i,1), (zg2(i,1)+bft2(i,1)/2)];
               BN13=[(MemLength2(i,1)+sin(-Dt2(i,1)*EGunew_phx2(i,1))*(bft2(i,1)/2)+sin(EGunew_ry2(i,1))*(bft2(i,1)/2)-sin(EGunew_rz2(i,1))*(Dt2(i,1))), ...
                  Dt2(i,1), (zg2(i,1)+bft2(i,1)/2+xa*0.5)]; 
 
              if ~isempty(BNC1) && ~isempty(BNC2)
               % ****************************************** Shear S
               for k=1:length(BNC1(:,1))
                  if isequal(BNC1(k,2),DUP1(i,2))
                     switch BNC1(k,9)
                        case 1
                           BN5(1,2) =BN5(1,2) -(1-cos(EGunew_rx1(i,1)))*Dt1(i,1);            
                           BN5(1,3) =BN5(1,3) + sin(EGunew_rx1(i,1))*Dt1(i,1);   
                           BN6(1,2) =BN6(1,2) -(1-cos(EGunew_rx1(i,1)))*Dt1(i,1);            
                           BN6(1,3) =BN6(1,3) + sin(EGunew_rx1(i,1))*Dt1(i,1);                         
                           
                        case 2
                           BN5(1,2) =BN3(1,2);            
                           BN5(1,3) =BN3(1,3);                      
                           BN6(1,2) =BN4(1,2);            
                           BN6(1,3) =BN4(1,3); 
                           
                        case 3
                           BN5(1,2) =BN1(1,2) +(1-cos(EGunew_rx1(i,1)))*Db1(i,1);            
                           BN5(1,3) =BN1(1,3) - sin(EGunew_rx1(i,1))*Db1(i,1);                      
                           BN6(1,2) =BN2(1,2) +(1-cos(EGunew_rx1(i,1)))*Db1(i,1);            
                           BN6(1,3) =BN2(1,3) - sin(EGunew_rx1(i,1))*Db1(i,1);                            
                     end
                  end
 
                  if isequal(BNC2(k,2),DUP2(i,2))
                     switch BNC2(k,9)
                        case 1
                           BN12(1,2) =BN12(1,2) -(1-cos(EGunew_rx2(i,1)))*Dt2(i,1);            
                           BN12(1,3) =BN12(1,3) + sin(EGunew_rx2(i,1))*Dt2(i,1); 
                           BN13(1,2) =BN13(1,2) -(1-cos(EGunew_rx2(i,1)))*Dt2(i,1);            
                           BN13(1,3) =BN13(1,3) + sin(EGunew_rx2(i,1))*Dt2(i,1);  
                           
                        case 2
                           BN12(1,2) =BN7(1,2);            
                           BN12(1,3) =BN7(1,3); 
                           BN13(1,2) =BN10(1,2);            
                           BN13(1,3) =BN10(1,3);  
                           
                        case 3
                           BN12(1,2) =BN8(1,2) +(1-cos(EGunew_rx2(i,1)))*Db2(i,1);            
                           BN12(1,3) =BN8(1,3) - sin(EGunew_rx2(i,1))*Db2(i,1); 
                           BN13(1,2) =BN9(1,2) +(1-cos(EGunew_rx2(i,1)))*Db2(i,1);            
                           BN13(1,3) =BN9(1,3) - sin(EGunew_rx2(i,1))*Db2(i,1);                            
                     end
                  end                    
               end
              end
               % ****************************************** Shear E
               
            case 2
               % *************************** Rotation 
               % bottom flage start node
               SX1=[0, (-Db1(i,1)), (bfb1(i,1)/2)];  
               SPX1=Rx1*SX1';SPX1=SPX1';SNX1=(SPX1- SX1);               
               SY1=[0, 0, (bfb1(i,1)/2)];  
               SPY1=Ry1*SY1';SPY1=SPY1';SNY1=(SPY1- SY1);               
               SZ1=[0,(-Db1(i,1)), 0];  
               SPZ1=Rz1*SZ1';SPZ1=SPZ1';SNZ1=(SPZ1- SZ1);                               
               SL1=[( MemLength1(i,1)+sin(Db1(i,1)*EGunew_phx1(i,1))*(bfb1(i,1)/2)),0, 0];   
               SXT1=[0, (-Dg1(i,1)), (bfb1(i,1)/2)];
               SN1=SNX1+SNY1+SNZ1+SL1+SXT1;
    
               SX2=[0, (-Db1(i,1)), 0];  
               SPX2=Rx1*SX2';SPX2=SPX2';SNX2=(SPX2- SX2);               
               SY2=[0, 0, 0];  
               SPY2=Ry1*SY2';SPY2=SPY2';SNY2=(SPY2- SY2);               
               SZ2=[0,(-Db1(i,1)), 0];  
               SPZ2=Rz1*SZ2';SPZ2=SPZ2';SNZ2=(SPZ2- SZ2);                               
               SL2=[( MemLength1(i,1)),0, 0];  
               SXT2=[0, (-Dg1(i,1)), 0];
               SN2=SNX2+SNY2+SNZ2+SL2+SXT2;
               
               SX3=[0, (-Db1(i,1)), (-bfb1(i,1)/2)];  
               SPX3=Rx1*SX3';SPX3=SPX3';SNX3=(SPX3- SX3);               
               SY3=[0, 0, (-bfb1(i,1)/2)];  
               SPY3=Ry1*SY3';SPY3=SPY3';SNY3=(SPY3- SY3);               
               SZ3=[0,(-Db1(i,1)), 0];  
               SPZ3=Rz1*SZ3';SPZ3=SPZ3';SNZ3=(SPZ3- SZ3);                               
               SL3=[( MemLength1(i,1)+sin(Db1(i,1)*EGunew_phx1(i,1))*(-bfb1(i,1)/2)),0, 0];     
               SXT3=[0, (-Dg1(i,1)), (-bfb1(i,1)/2)];
               SN3=SNX3+SNY3+SNZ3+SL3+SXT3;
               
               % top flage start node
               SX5=[0, (Dt1(i,1)), (bft1(i,1)/2)];  
               SPX5=Rx1*SX5';SPX5=SPX5';SNX5=(SPX5- SX5);               
               SY5=[0, 0, (bft1(i,1)/2)];  
               SPY5=Ry1*SY5';SPY5=SPY5';SNY5=(SPY5- SY5);               
               SZ5=[0,(Dt1(i,1)), 0];  
               SPZ5=Rz1*SZ5';SPZ5=SPZ5';SNZ5=(SPZ5- SZ5);                               
               SL5=[( MemLength1(i,1)+sin(-Dt1(i,1)*EGunew_phx1(i,1))*(bft1(i,1)/2)),0, 0]; 
               SXT5=[0, 0, (bft1(i,1)/2)]; 
               SN5=SNX5+SNY5+SNZ5+SL5+SXT5;
               
               SX6=[0, (Dt1(i,1)), 0];  
               SPX6=Rx1*SX6';SPX6=SPX6';SNX6=(SPX6- SX6);               
               SY6=[0, 0, 0];  
               SPY6=Ry1*SY6';SPY6=SPY6';SNY6=(SPY6- SY6);               
               SZ6=[0,(Dt1(i,1)), 0];  
               SPZ6=Rz1*SZ6';SPZ6=SPZ6';SNZ6=(SPZ6- SZ6);                               
               SL6=[( MemLength1(i,1)),0, 0]; 
               SXT6=[0, 0, 0];
               SN6=SNX6+SNY6+SNZ6+SL6+SXT6;
               
               SX7=[0, (Dt1(i,1)), (-bft1(i,1)/2)];  
               SPX7=Rx1*SX7';SPX7=SPX7';SNX7=(SPX7- SX7);               
               SY7=[0, 0, (-bft1(i,1)/2)];  
               SPY7=Ry1*SY7';SPY7=SPY7';SNY7=(SPY7- SY7);               
               SZ7=[0,(Dt1(i,1)), 0];  
               SPZ7=Rz1*SZ7';SPZ7=SPZ7';SNZ7=(SPZ7- SZ7);                               
               SL7=[( MemLength1(i,1)+sin(-Dt1(i,1)*EGunew_phx1(i,1))*(-bft1(i,1)/2)),0, 0];  
               SXT7=[0, 0, (-bft1(i,1)/2)]; 
               SN7=SNX7+SNY7+SNZ7+SL7+SXT7;


               % bottom flage end node
               SX8=[0, (-Db2(i,1)), (bfb2(i,1)/2)];  
               SPX8=Rx2*SX8';SPX8=SPX8';SNX8=(SPX8- SX8);               
               SY8=[0, 0, (bfb2(i,1)/2)];  
               SPY8=Ry2*SY8';SPY8=SPY8';SNY8=(SPY8- SY8);               
               SZ8=[0,(-Db2(i,1)), 0];  
               SPZ8=Rz2*SZ8';SPZ8=SPZ8';SNZ8=(SPZ8- SZ8);                               
               SL8=[( MemLength2(i,1)+sin(Db2(i,1)*EGunew_phx2(i,1))*(bfb2(i,1)/2)),0, 0];  
               SXT8=[0, (-Dg2(i,1)), (bfb2(i,1)/2)];
               SN8=SNX8+SNY8+SNZ8+SL8+SXT8;
    
               SX9=[0, (-Db2(i,1)), 0];  
               SPX9=Rx2*SX9';SPX9=SPX9';SNX9=(SPX9- SX9);               
               SY9=[0, 0, 0];  
               SPY9=Ry2*SY9';SPY9=SPY9';SNY9=(SPY9- SY9);               
               SZ9=[0,(-Db2(i,1)), 0];  
               SPZ9=Rz2*SZ9';SPZ9=SPZ9';SNZ9=(SPZ9- SZ9);                               
               SL9=[( MemLength2(i,1)),0, 0]; 
               SXT9=[0, (-Dg2(i,1)), 0]; 
               SN9=SNX9+SNY9+SNZ9+SL9+SXT9;
               
               SX10=[0, (-Db2(i,1)), (-bfb2(i,1)/2)];  
               SPX10=Rx2*SX10';SPX10=SPX10';SNX10=(SPX10- SX10);               
               SY10=[0, 0, (-bfb2(i,1)/2)];  
               SPY10=Ry2*SY10';SPY10=SPY10';SNY10=(SPY10- SY10);               
               SZ10=[0,(-Db2(i,1)), 0];  
               SPZ10=Rz2*SZ10';SPZ10=SPZ10';SNZ10=(SPZ10- SZ10);                               
               SL10=[( MemLength2(i,1)+sin(Db2(i,1)*EGunew_phx2(i,1))*(-bfb2(i,1)/2)),0, 0]; 
               SXT10=[0, (-Dg2(i,1)), (-bfb2(i,1)/2)];
               SN10=SNX10+SNY10+SNZ10+SL10+SXT10;
               
               % top flage end node
               SX12=[0, (Dt2(i,1)), (bft2(i,1)/2)];  
               SPX12=Rx2*SX12';SPX12=SPX12';SNX12=(SPX12- SX12);               
               SY12=[0, 0, (bft2(i,1)/2)];  
               SPY12=Ry2*SY12';SPY12=SPY12';SNY12=(SPY12- SY12);               
               SZ12=[0,(Dt2(i,1)), 0];  
               SPZ12=Rz2*SZ12';SPZ12=SPZ12';SNZ12=(SPZ12- SZ12);                               
               SL12=[( MemLength2(i,1)+sin(-Dt2(i,1)*EGunew_phx2(i,1))*(bft2(i,1)/2)),0, 0];
               SXT12=[0, 0, (bft2(i,1)/2)];  
               SN12=SNX12+SNY12+SNZ12+SL12+SXT12;
               
               SX13=[0, (Dt2(i,1)), 0];  
               SPX13=Rx2*SX13';SPX13=SPX13';SNX13=(SPX13- SX13);               
               SY13=[0, 0, 0];  
               SPY13=Ry2*SY13';SPY13=SPY13';SNY13=(SPY13- SY13);               
               SZ13=[0,(Dt2(i,1)), 0];  
               SPZ13=Rz2*SZ13';SPZ13=SPZ13';SNZ13=(SPZ13- SZ13);                               
               SL13=[( MemLength2(i,1)),0, 0];  
               SXT13=[0, 0, 0];
               SN13=SNX13+SNY13+SNZ13+SL13+SXT13;
               
               SX14=[0, (Dt2(i,1)), (-bft2(i,1)/2)];  
               SPX14=Rx2*SX14';SPX14=SPX14';SNX14=(SPX14- SX14);               
               SY14=[0, 0, (-bft2(i,1)/2)];  
               SPY14=Ry2*SY14';SPY14=SPY14';SNY14=(SPY14- SY14);               
               SZ14=[0,(Dt2(i,1)), 0];  
               SPZ14=Rz2*SZ14';SPZ14=SPZ14';SNZ14=(SPZ14- SZ14);                               
               SL14=[( MemLength2(i,1)+sin(-Dt2(i,1)*EGunew_phx2(i,1))*(-bft2(i,1)/2)),0, 0];
               SXT14=[0, 0, (-bft2(i,1)/2)];
               SN14=SNX14+SNY14+SNZ14+SL14+SXT14;                

               % Barcing
               % Mid depth start node
               YN3=[( MemLength1(i,1)+sin(EGunew_rz1(i,1))*(Db1(i,1))), (-Dg1(i,1)), (zg1(i,1)+0)];
               YN4=[( MemLength1(i,1)+sin(EGunew_rz1(i,1))*(Db1(i,1))), (-Dg1(i,1)), (zg1(i,1)+xa*0.5)];
               YN6=[( MemLength1(i,1)-sin(EGunew_rz1(i,1))*(Dt1(i,1))), 0, (zg1(i,1)+0)];
               YN7=[( MemLength1(i,1)-sin(EGunew_rz1(i,1))*(Dt1(i,1))), 0, (zg1(i,1)+xa*0.5)];
               BN3 = (YN3+YN6)/2;
               BN4 = (YN4+YN7)/2;
               % Mid depth end node
               YN9=[( MemLength2(i,1)+sin(EGunew_rz2(i,1))*(Db2(i,1))), (-Dg2(i,1)), (zg2(i,1)+0)];
               YN10=[( MemLength2(i,1)+sin(EGunew_rz2(i,1))*(Db2(i,1))), (-Dg2(i,1)), (zg2(i,1)+xa*0.5)];
               YN13=[( MemLength2(i,1)-sin(EGunew_rz2(i,1))*(Dt2(i,1))), 0, (zg2(i,1)+0)];
               YN14=[( MemLength2(i,1)-sin(EGunew_rz2(i,1))*(Dt2(i,1))), 0, (zg2(i,1)+xa*0.5)];
               BN7 = (YN9+YN13)/2;
               BN10 = (YN10+YN14)/2;               
               
               % bottom flage start node
               BN1=[( MemLength1(i,1)+sin(Db1(i,1)*EGunew_phx1(i,1))*(bfb1(i,1)/2)+sin(EGunew_ry1(i,1))*(bfb1(i,1)/2)+sin(EGunew_rz1(i,1))*(Db1(i,1))),...
                  (-Dg1(i,1)), (zg1(i,1)+bfb1(i,1)/2)];
               BN2=[( MemLength1(i,1)+sin(Db1(i,1)*EGunew_phx1(i,1))*(bfb1(i,1)/2)+sin(EGunew_ry1(i,1))*(bfb1(i,1)/2)+sin(EGunew_rz1(i,1))*(Db1(i,1))),...
                  (-Dg1(i,1)), (zg1(i,1)+bfb1(i,1)/2+xa*0.5)];               
               % bottom flage end node
               BN8=[(MemLength2(i,1)+sin(Db2(i,1)*EGunew_phx2(i,1))*(bfb2(i,1)/2)+sin(EGunew_ry2(i,1))*(bfb2(i,1)/2)+sin(EGunew_rz2(i,1))*(Db2(i,1))), ...
                  (-Dg2(i,1)), (zg2(i,1)+bfb2(i,1)/2)];               
               BN9=[(MemLength2(i,1)+sin(Db2(i,1)*EGunew_phx2(i,1))*(bfb2(i,1)/2)+sin(EGunew_ry2(i,1))*(bfb2(i,1)/2)+sin(EGunew_rz2(i,1))*(Db2(i,1))), ...
                  (-Dg2(i,1)), (zg2(i,1)+bfb2(i,1)/2+xa*0.5)];                
               % top flage start node
%                SN2=[( MemLength1(i,1)+sin(EGunew_rz1(i,1))*(Db1(i,1))), (-Db1(i,1)), (zg1(i,1)+0)];
               BN5=[(MemLength1(i,1)+sin(-Dt1(i,1)*EGunew_phx1(i,1))*(bft1(i,1)/2)+sin(EGunew_ry1(i,1))*(bft1(i,1)/2)-sin(EGunew_rz1(i,1))*(Dt1(i,1))), ...
                  0, (zg1(i,1)+bft1(i,1)/2)];               
               BN6=[(MemLength1(i,1)+sin(-Dt1(i,1)*EGunew_phx1(i,1))*(bft1(i,1)/2)+sin(EGunew_ry1(i,1))*(bft1(i,1)/2)-sin(EGunew_rz1(i,1))*(Dt1(i,1))), ...
                  0, (zg1(i,1)+bft1(i,1)/2+xa*0.5)];
               % top flage end node
               BN12=[(MemLength2(i,1)+sin(-Dt2(i,1)*EGunew_phx2(i,1))*(bft2(i,1)/2)+sin(EGunew_ry2(i,1))*(bft2(i,1)/2)-sin(EGunew_rz2(i,1))*(Dt2(i,1))), ...
                  0, (zg2(i,1)+bft2(i,1)/2)];
               BN13=[(MemLength2(i,1)+sin(-Dt2(i,1)*EGunew_phx2(i,1))*(bft2(i,1)/2)+sin(EGunew_ry2(i,1))*(bft2(i,1)/2)-sin(EGunew_rz2(i,1))*(Dt2(i,1))), ...
                  0, (zg2(i,1)+bft2(i,1)/2+xa*0.5)]; 
 
               % ****************************************** Shear S
               if ~isempty(BNC1) && ~isempty(BNC2)
               for k=1:length(BNC1(:,1))
                  if isequal(BNC1(k,2),DUP1(i,2))
                     switch BNC1(k,9)
                        case 1
                           BN5(1,2) =BN5(1,2) -(1-cos(EGunew_rx1(i,1)))*Dt1(i,1);            
                           BN5(1,3) =BN5(1,3) + sin(EGunew_rx1(i,1))*Dt1(i,1);   
                           BN6(1,2) =BN6(1,2) -(1-cos(EGunew_rx1(i,1)))*Dt1(i,1);            
                           BN6(1,3) =BN6(1,3) + sin(EGunew_rx1(i,1))*Dt1(i,1);                         
                           
                        case 2
                           BN5(1,2) =BN3(1,2);            
                           BN5(1,3) =BN3(1,3);                      
                           BN6(1,2) =BN4(1,2);            
                           BN6(1,3) =BN4(1,3); 
                           
                        case 3
                           BN5(1,2) =BN1(1,2) +(1-cos(EGunew_rx1(i,1)))*Db1(i,1);            
                           BN5(1,3) =BN1(1,3) - sin(EGunew_rx1(i,1))*Db1(i,1);                      
                           BN6(1,2) =BN2(1,2) +(1-cos(EGunew_rx1(i,1)))*Db1(i,1);            
                           BN6(1,3) =BN2(1,3) - sin(EGunew_rx1(i,1))*Db1(i,1);                            
                     end
                  end
 
                  if isequal(BNC2(k,2),DUP2(i,2))
                     switch BNC2(k,9)
                        case 1
                           BN12(1,2) =BN12(1,2) -(1-cos(EGunew_rx2(i,1)))*Dt2(i,1);            
                           BN12(1,3) =BN12(1,3) + sin(EGunew_rx2(i,1))*Dt2(i,1); 
                           BN13(1,2) =BN13(1,2) -(1-cos(EGunew_rx2(i,1)))*Dt2(i,1);            
                           BN13(1,3) =BN13(1,3) + sin(EGunew_rx2(i,1))*Dt2(i,1);  
                           
                        case 2
                           BN12(1,2) =BN7(1,2);            
                           BN12(1,3) =BN7(1,3); 
                           BN13(1,2) =BN10(1,2);            
                           BN13(1,3) =BN10(1,3);  
                           
                        case 3
                           BN12(1,2) =BN8(1,2) +(1-cos(EGunew_rx2(i,1)))*Db2(i,1);            
                           BN12(1,3) =BN8(1,3) - sin(EGunew_rx2(i,1))*Db2(i,1); 
                           BN13(1,2) =BN9(1,2) +(1-cos(EGunew_rx2(i,1)))*Db2(i,1);            
                           BN13(1,3) =BN9(1,3) - sin(EGunew_rx2(i,1))*Db2(i,1);                            
                     end
                  end                    
               end
               end
               % ****************************************** Shear E
               
            case 3
               % *************************** Rotation 
               % bottom flage start node
               SX1=[0, (-Db1(i,1)), (bfb1(i,1)/2)];  
               SPX1=Rx1*SX1';SPX1=SPX1';SNX1=(SPX1- SX1);               
               SY1=[0, 0, (bfb1(i,1)/2)];  
               SPY1=Ry1*SY1';SPY1=SPY1';SNY1=(SPY1- SY1);               
               SZ1=[0,(-Db1(i,1)), 0];  
               SPZ1=Rz1*SZ1';SPZ1=SPZ1';SNZ1=(SPZ1- SZ1);                               
               SL1=[( MemLength1(i,1)+sin(Db1(i,1)*EGunew_phx1(i,1))*(bfb1(i,1)/2)),0, 0]; 
               SXb1=[0, 0, (bfb1(i,1)/2)];
               SN1=SNX1+SNY1+SNZ1+SL1+SXb1;
    
               SX2=[0, (-Db1(i,1)), 0];  
               SPX2=Rx1*SX2';SPX2=SPX2';SNX2=(SPX2- SX2);               
               SY2=[0, 0, 0];  
               SPY2=Ry1*SY2';SPY2=SPY2';SNY2=(SPY2- SY2);               
               SZ2=[0,(-Db1(i,1)), 0];  
               SPZ2=Rz1*SZ2';SPZ2=SPZ2';SNZ2=(SPZ2- SZ2);                               
               SL2=[( MemLength1(i,1)),0, 0];   
               SXb2=[0, 0, 0];
               SN2=SNX2+SNY2+SNZ2+SL2+SXb2;
               
               SX3=[0, (-Db1(i,1)), (-bfb1(i,1)/2)];  
               SPX3=Rx1*SX3';SPX3=SPX3';SNX3=(SPX3- SX3);               
               SY3=[0, 0, (-bfb1(i,1)/2)];  
               SPY3=Ry1*SY3';SPY3=SPY3';SNY3=(SPY3- SY3);               
               SZ3=[0,(-Db1(i,1)), 0];  
               SPZ3=Rz1*SZ3';SPZ3=SPZ3';SNZ3=(SPZ3- SZ3);                               
               SL3=[( MemLength1(i,1)+sin(Db1(i,1)*EGunew_phx1(i,1))*(-bfb1(i,1)/2)),0, 0];  
               SXb3=[0, 0, (-bfb1(i,1)/2)]; 
               SN3=SNX3+SNY3+SNZ3+SL3+SXb3;
               
               % top flage start node
               SX5=[0, (Dt1(i,1)), (bft1(i,1)/2)];  
               SPX5=Rx1*SX5';SPX5=SPX5';SNX5=(SPX5- SX5);               
               SY5=[0, 0, (bft1(i,1)/2)];  
               SPY5=Ry1*SY5';SPY5=SPY5';SNY5=(SPY5- SY5);               
               SZ5=[0,(Dt1(i,1)), 0];  
               SPZ5=Rz1*SZ5';SPZ5=SPZ5';SNZ5=(SPZ5- SZ5);                               
               SL5=[( MemLength1(i,1)+sin(-Dt1(i,1)*EGunew_phx1(i,1))*(bft1(i,1)/2)),0, 0];
               SXb5=[0, (Dg1(i,1)), (bft1(i,1)/2)];
               SN5=SNX5+SNY5+SNZ5+SL5+SXb5;
               
               SX6=[0, (Dt1(i,1)), 0];  
               SPX6=Rx1*SX6';SPX6=SPX6';SNX6=(SPX6- SX6);               
               SY6=[0, 0, 0];  
               SPY6=Ry1*SY6';SPY6=SPY6';SNY6=(SPY6- SY6);               
               SZ6=[0,(Dt1(i,1)), 0];  
               SPZ6=Rz1*SZ6';SPZ6=SPZ6';SNZ6=(SPZ6- SZ6);                               
               SL6=[( MemLength1(i,1)),0, 0];
               SXb6=[0, (Dg1(i,1)), 0];
               SN6=SNX6+SNY6+SNZ6+SL6+SXb6;
               
               SX7=[0, (Dt1(i,1)), (-bft1(i,1)/2)];  
               SPX7=Rx1*SX7';SPX7=SPX7';SNX7=(SPX7- SX7);               
               SY7=[0, 0, (-bft1(i,1)/2)];  
               SPY7=Ry1*SY7';SPY7=SPY7';SNY7=(SPY7- SY7);               
               SZ7=[0,(Dt1(i,1)), 0];  
               SPZ7=Rz1*SZ7';SPZ7=SPZ7';SNZ7=(SPZ7- SZ7);                               
               SL7=[( MemLength1(i,1)+sin(-Dt1(i,1)*EGunew_phx1(i,1))*(-bft1(i,1)/2)),0, 0];   
               SXb7=[0, (Dg1(i,1)), (-bft1(i,1)/2)]; 
               SN7=SNX7+SNY7+SNZ7+SL7+SXb7;


               % bottom flage end node
               SX8=[0, (-Db2(i,1)), (bfb2(i,1)/2)];  
               SPX8=Rx2*SX8';SPX8=SPX8';SNX8=(SPX8- SX8);               
               SY8=[0, 0, (bfb2(i,1)/2)];  
               SPY8=Ry2*SY8';SPY8=SPY8';SNY8=(SPY8- SY8);               
               SZ8=[0,(-Db2(i,1)), 0];  
               SPZ8=Rz2*SZ8';SPZ8=SPZ8';SNZ8=(SPZ8- SZ8);                               
               SL8=[( MemLength2(i,1)+sin(Db2(i,1)*EGunew_phx2(i,1))*(bfb2(i,1)/2)),0, 0]; 
               SXb8=[0, 0, (bfb2(i,1)/2)]; 
               SN8=SNX8+SNY8+SNZ8+SL8+SXb8;
    
               SX9=[0, (-Db2(i,1)), 0];  
               SPX9=Rx2*SX9';SPX9=SPX9';SNX9=(SPX9- SX9);               
               SY9=[0, 0, 0];  
               SPY9=Ry2*SY9';SPY9=SPY9';SNY9=(SPY9- SY9);               
               SZ9=[0,(-Db2(i,1)), 0];  
               SPZ9=Rz2*SZ9';SPZ9=SPZ9';SNZ9=(SPZ9- SZ9);                               
               SL9=[( MemLength2(i,1)),0, 0];  
               SXb9=[0, 0, 0];
               SN9=SNX9+SNY9+SNZ9+SL9+SXb9;
               
               SX10=[0, (-Db2(i,1)), (-bfb2(i,1)/2)];  
               SPX10=Rx2*SX10';SPX10=SPX10';SNX10=(SPX10- SX10);               
               SY10=[0, 0, (-bfb2(i,1)/2)];  
               SPY10=Ry2*SY10';SPY10=SPY10';SNY10=(SPY10- SY10);               
               SZ10=[0,(-Db2(i,1)), 0];  
               SPZ10=Rz2*SZ10';SPZ10=SPZ10';SNZ10=(SPZ10- SZ10);                               
               SL10=[( MemLength2(i,1)+sin(Db2(i,1)*EGunew_phx2(i,1))*(-bfb2(i,1)/2)),0, 0]; 
               SXb10=[0, 0, (-bfb2(i,1)/2)]; 
               SN10=SNX10+SNY10+SNZ10+SL10+SXb10;
               
               % top flage end node
               SX12=[0, (Dt2(i,1)), (bft2(i,1)/2)];  
               SPX12=Rx2*SX12';SPX12=SPX12';SNX12=(SPX12- SX12);               
               SY12=[0, 0, (bft2(i,1)/2)];  
               SPY12=Ry2*SY12';SPY12=SPY12';SNY12=(SPY12- SY12);               
               SZ12=[0,(Dt2(i,1)), 0];  
               SPZ12=Rz2*SZ12';SPZ12=SPZ12';SNZ12=(SPZ12- SZ12);                               
               SL12=[( MemLength2(i,1)+sin(-Dt2(i,1)*EGunew_phx2(i,1))*(bft2(i,1)/2)),0, 0];
               SXb12=[0, (Dg2(i,1)), (bft2(i,1)/2)];
               SN12=SNX12+SNY12+SNZ12+SL12+SXb12;
               
               SX13=[0, (Dt2(i,1)), 0];  
               SPX13=Rx2*SX13';SPX13=SPX13';SNX13=(SPX13- SX13);               
               SY13=[0, 0, 0];  
               SPY13=Ry2*SY13';SPY13=SPY13';SNY13=(SPY13- SY13);               
               SZ13=[0,(Dt2(i,1)), 0];  
               SPZ13=Rz2*SZ13';SPZ13=SPZ13';SNZ13=(SPZ13- SZ13);                               
               SL13=[( MemLength2(i,1)),0, 0];   
               SXb13=[0, (Dg2(i,1)), 0];
               SN13=SNX13+SNY13+SNZ13+SL13+SXb13;
               
               SX14=[0, (Dt2(i,1)), (-bft2(i,1)/2)];  
               SPX14=Rx2*SX14';SPX14=SPX14';SNX14=(SPX14- SX14);               
               SY14=[0, 0, (-bft2(i,1)/2)];  
               SPY14=Ry2*SY14';SPY14=SPY14';SNY14=(SPY14- SY14);               
               SZ14=[0,(Dt2(i,1)), 0];  
               SPZ14=Rz2*SZ14';SPZ14=SPZ14';SNZ14=(SPZ14- SZ14);                               
               SL14=[( MemLength2(i,1)+sin(-Dt2(i,1)*EGunew_phx2(i,1))*(-bft2(i,1)/2)),0, 0];  
               SXb14=[0, (Dg2(i,1)), (-bft2(i,1)/2)]; 
               SN14=SNX14+SNY14+SNZ14+SL14+SXb14;



               % Barcing
               % Mid depth start node
               YN3=[( MemLength1(i,1)+sin(EGunew_rz1(i,1))*(Db1(i,1))), (0), (zg1(i,1)+0)];
               YN4=[( MemLength1(i,1)+sin(EGunew_rz1(i,1))*(Db1(i,1))), (0), (zg1(i,1)+xa*0.5)];
               YN6=[( MemLength1(i,1)-sin(EGunew_rz1(i,1))*(Dt1(i,1))), Dg1(i,1), (zg1(i,1)+0)];
               YN7=[( MemLength1(i,1)-sin(EGunew_rz1(i,1))*(Dt1(i,1))), Dg1(i,1), (zg1(i,1)+xa*0.5)];
               BN3 = (YN3+YN6)/2;
               BN4 = (YN4+YN7)/2;
               % Mid depth end node
               YN9=[( MemLength2(i,1)+sin(EGunew_rz2(i,1))*(Db2(i,1))), (0), (zg2(i,1)+0)];
               YN10=[( MemLength2(i,1)+sin(EGunew_rz2(i,1))*(Db2(i,1))), (0), (zg2(i,1)+xa*0.5)];
               YN13=[( MemLength2(i,1)-sin(EGunew_rz2(i,1))*(Dt2(i,1))), Dg2(i,1), (zg2(i,1)+0)];
               YN14=[( MemLength2(i,1)-sin(EGunew_rz2(i,1))*(Dt2(i,1))), Dg2(i,1), (zg2(i,1)+xa*0.5)];
               BN7 = (YN9+YN13)/2;
               BN10 = (YN10+YN14)/2;               
               
               % bottom flage start node
               BN1=[( MemLength1(i,1)+sin(Db1(i,1)*EGunew_phx1(i,1))*(bfb1(i,1)/2)+sin(EGunew_ry1(i,1))*(bfb1(i,1)/2)+sin(EGunew_rz1(i,1))*(Db1(i,1))),...
                  (0), (zg1(i,1)+bfb1(i,1)/2)];
               BN2=[( MemLength1(i,1)+sin(Db1(i,1)*EGunew_phx1(i,1))*(bfb1(i,1)/2)+sin(EGunew_ry1(i,1))*(bfb1(i,1)/2)+sin(EGunew_rz1(i,1))*(Db1(i,1))),...
                  (0), (zg1(i,1)+bfb1(i,1)/2+xa*0.5)];               
               % bottom flage end node
               BN8=[(MemLength2(i,1)+sin(Db2(i,1)*EGunew_phx2(i,1))*(bfb2(i,1)/2)+sin(EGunew_ry2(i,1))*(bfb2(i,1)/2)+sin(EGunew_rz2(i,1))*(Db2(i,1))), ...
                  (0), (zg2(i,1)+bfb2(i,1)/2)];               
               BN9=[(MemLength2(i,1)+sin(Db2(i,1)*EGunew_phx2(i,1))*(bfb2(i,1)/2)+sin(EGunew_ry2(i,1))*(bfb2(i,1)/2)+sin(EGunew_rz2(i,1))*(Db2(i,1))), ...
                  (0), (zg2(i,1)+bfb2(i,1)/2+xa*0.5)];                
               % top flage start node
%                SN2=[( MemLength1(i,1)+sin(EGunew_rz1(i,1))*(Db1(i,1))), (-Db1(i,1)), (zg1(i,1)+0)];
               BN5=[(MemLength1(i,1)+sin(-Dt1(i,1)*EGunew_phx1(i,1))*(bft1(i,1)/2)+sin(EGunew_ry1(i,1))*(bft1(i,1)/2)-sin(EGunew_rz1(i,1))*(Dt1(i,1))), ...
                  Dg1(i,1), (zg1(i,1)+bft1(i,1)/2)];               
               BN6=[(MemLength1(i,1)+sin(-Dt1(i,1)*EGunew_phx1(i,1))*(bft1(i,1)/2)+sin(EGunew_ry1(i,1))*(bft1(i,1)/2)-sin(EGunew_rz1(i,1))*(Dt1(i,1))), ...
                  Dg1(i,1), (zg1(i,1)+bft1(i,1)/2+xa*0.5)];
               % top flage end node
               BN12=[(MemLength2(i,1)+sin(-Dt2(i,1)*EGunew_phx2(i,1))*(bft2(i,1)/2)+sin(EGunew_ry2(i,1))*(bft2(i,1)/2)-sin(EGunew_rz2(i,1))*(Dt2(i,1))), ...
                  Dg2(i,1), (zg2(i,1)+bft2(i,1)/2)];
               BN13=[(MemLength2(i,1)+sin(-Dt2(i,1)*EGunew_phx2(i,1))*(bft2(i,1)/2)+sin(EGunew_ry2(i,1))*(bft2(i,1)/2)-sin(EGunew_rz2(i,1))*(Dt2(i,1))), ...
                  Dg2(i,1), (zg2(i,1)+bft2(i,1)/2+xa*0.5)]; 
 
               % ****************************************** Shear S
               if ~isempty(BNC1) && ~isempty(BNC2)
               for k=1:length(BNC1(:,1))
                  if isequal(BNC1(k,2),DUP1(i,2))
                     switch BNC1(k,9)
                        case 1
                           BN5(1,2) =BN5(1,2) -(1-cos(EGunew_rx1(i,1)))*Dt1(i,1);            
                           BN5(1,3) =BN5(1,3) + sin(EGunew_rx1(i,1))*Dt1(i,1);   
                           BN6(1,2) =BN6(1,2) -(1-cos(EGunew_rx1(i,1)))*Dt1(i,1);            
                           BN6(1,3) =BN6(1,3) + sin(EGunew_rx1(i,1))*Dt1(i,1);                         
                           
                        case 2
                           BN5(1,2) =BN3(1,2);            
                           BN5(1,3) =BN3(1,3);                      
                           BN6(1,2) =BN4(1,2);            
                           BN6(1,3) =BN4(1,3); 
                           
                        case 3
                           BN5(1,2) =BN1(1,2) +(1-cos(EGunew_rx1(i,1)))*Db1(i,1);            
                           BN5(1,3) =BN1(1,3) - sin(EGunew_rx1(i,1))*Db1(i,1);                      
                           BN6(1,2) =BN2(1,2) +(1-cos(EGunew_rx1(i,1)))*Db1(i,1);            
                           BN6(1,3) =BN2(1,3) - sin(EGunew_rx1(i,1))*Db1(i,1);                            
                     end
                  end
 
                  if isequal(BNC2(k,2),DUP2(i,2))
                     switch BNC2(k,9)
                        case 1
                           BN12(1,2) =BN12(1,2) -(1-cos(EGunew_rx2(i,1)))*Dt2(i,1);            
                           BN12(1,3) =BN12(1,3) + sin(EGunew_rx2(i,1))*Dt2(i,1); 
                           BN13(1,2) =BN13(1,2) -(1-cos(EGunew_rx2(i,1)))*Dt2(i,1);            
                           BN13(1,3) =BN13(1,3) + sin(EGunew_rx2(i,1))*Dt2(i,1);  
                           
                        case 2
                           BN12(1,2) =BN7(1,2);            
                           BN12(1,3) =BN7(1,3); 
                           BN13(1,2) =BN10(1,2);            
                           BN13(1,3) =BN10(1,3);  
                           
                        case 3
                           BN12(1,2) =BN8(1,2) +(1-cos(EGunew_rx2(i,1)))*Db2(i,1);            
                           BN12(1,3) =BN8(1,3) - sin(EGunew_rx2(i,1))*Db2(i,1); 
                           BN13(1,2) =BN9(1,2) +(1-cos(EGunew_rx2(i,1)))*Db2(i,1);            
                           BN13(1,3) =BN9(1,3) - sin(EGunew_rx2(i,1))*Db2(i,1);                            
                     end
                  end                    
               end
               end
               % ****************************************** Shear E        
                           
         end % Switch end 

         % *************************** Global Rotation
         SN1=Rz*SN1';SN1=SN1';
         SN2=Rz*SN2';SN2=SN2';
         SN3=Rz*SN3';SN3=SN3';
         SN5=Rz*SN5';SN5=SN5';
         SN6=Rz*SN6';SN6=SN6'; 
         SN7=Rz*SN7';SN7=SN7'; 
         SN8=Rz*SN8';SN8=SN8';
         SN9=Rz*SN9';SN9=SN9';
         SN10=Rz*SN10';SN10=SN10'; 
         SN12=Rz*SN12';SN12=SN12'; 
         SN13=Rz*SN13';SN13=SN13';
         SN14=Rz*SN14';SN14=SN14'; 
         BN5=Rz*BN5';BN5=BN5';
         BN6=Rz*BN6';BN6=BN6';
         BN12=Rz*BN12';BN12=BN12';
         BN13=Rz*BN13';BN13=BN13';
         % *************************** Global Translation to reference axis   
         % bottom flage start node
         SN1 = SN1+NG1(i,:);
         SN2 = SN2+NG1(i,:);
         SN3 = SN3+NG1(i,:);
         % top flage start node
         SN5 = SN5+NG1(i,:);
         SN6 = SN6+NG1(i,:);
         SN7 = SN7+NG1(i,:);
         % bottom flage end node
         SN8 = SN8+NG2(i,:);
         SN9 = SN9+NG2(i,:);
         SN10 = SN10+NG2(i,:);
         % top flage end node
         SN12 = SN12+NG2(i,:);
         SN13 = SN13+NG2(i,:);
         SN14 = SN14+NG2(i,:); 

         BN5 = BN5+NG1(i,:);
         BN6 = BN6+NG1(i,:);
         BN12 = BN12+NG2(i,:);
         BN13 = BN13+NG2(i,:);
         % *************************** Translation
         % bottom flage start node
         SM1(p,1) = SN1(1,1)+EGunew_ux1(i,1);
         SM1(p,2) = SN1(1,2)+EGunew_uy1(i,1);
         SM1(p,3) = SN1(1,3)+EGunew_uz1(i,1);      
         SM2(p,1) = SN2(1,1)+EGunew_ux1(i,1);
         SM2(p,2) = SN2(1,2)+EGunew_uy1(i,1);
         SM2(p,3) = SN2(1,3)+EGunew_uz1(i,1);    
         SM3(p,1) = SN3(1,1)+EGunew_ux1(i,1);
         SM3(p,2) = SN3(1,2)+EGunew_uy1(i,1);
         SM3(p,3) = SN3(1,3)+EGunew_uz1(i,1);  
         % top flage start node
         SM5(p,1) = SN5(1,1)+EGunew_ux1(i,1);
         SM5(p,2) = SN5(1,2)+EGunew_uy1(i,1);
         SM5(p,3) = SN5(1,3)+EGunew_uz1(i,1);      
         SM6(p,1) = SN6(1,1)+EGunew_ux1(i,1);
         SM6(p,2) = SN6(1,2)+EGunew_uy1(i,1);
         SM6(p,3) = SN6(1,3)+EGunew_uz1(i,1);     
         SM7(p,1) = SN7(1,1)+EGunew_ux1(i,1);
         SM7(p,2) = SN7(1,2)+EGunew_uy1(i,1);
         SM7(p,3) = SN7(1,3)+EGunew_uz1(i,1);       
         % bottom flage end node
         SM8(p,1) = SN8(1,1)+EGunew_ux2(i,1);
         SM8(p,2) = SN8(1,2)+EGunew_uy2(i,1);
         SM8(p,3) = SN8(1,3)+EGunew_uz2(i,1);      
         SM9(p,1) = SN9(1,1)+EGunew_ux2(i,1);
         SM9(p,2) = SN9(1,2)+EGunew_uy2(i,1);
         SM9(p,3) = SN9(1,3)+EGunew_uz2(i,1);    
         SM10(p,1) = SN10(1,1)+EGunew_ux2(i,1);
         SM10(p,2) = SN10(1,2)+EGunew_uy2(i,1);
         SM10(p,3) = SN10(1,3)+EGunew_uz2(i,1);  
         % top flage end node
         SM12(p,1) = SN12(1,1)+EGunew_ux2(i,1);
         SM12(p,2) = SN12(1,2)+EGunew_uy2(i,1);
         SM12(p,3) = SN12(1,3)+EGunew_uz2(i,1);      
         SM13(p,1) = SN13(1,1)+EGunew_ux2(i,1);
         SM13(p,2) = SN13(1,2)+EGunew_uy2(i,1);
         SM13(p,3) = SN13(1,3)+EGunew_uz2(i,1);     
         SM14(p,1) = SN14(1,1)+EGunew_ux2(i,1);
         SM14(p,2) = SN14(1,2)+EGunew_uy2(i,1);
         SM14(p,3) = SN14(1,3)+EGunew_uz2(i,1); 

         
         BM5(p,1) = BN5(1,1)+EGunew_ux1(i,1);
         BM5(p,2) = BN5(1,2)+EGunew_uy1(i,1);
         BM5(p,3) = BN5(1,3)+EGunew_uz1(i,1);
         BM6(p,1) = BN6(1,1)+EGunew_ux1(i,1);
         BM6(p,2) = BN6(1,2)+EGunew_uy1(i,1);
         BM6(p,3) = BN6(1,3)+EGunew_uz1(i,1); 
         BM12(p,1) = BN12(1,1)+EGunew_ux2(i,1);
         BM12(p,2) = BN12(1,2)+EGunew_uy2(i,1);
         BM12(p,3) = BN12(1,3)+EGunew_uz2(i,1);  
         BM13(p,1) = BN13(1,1)+EGunew_ux2(i,1);
         BM13(p,2) = BN13(1,2)+EGunew_uy2(i,1);
         BM13(p,3) = BN13(1,3)+EGunew_uz2(i,1);     

         % Bracing S
         
         % Mid-depth
         GB1(i,1)=(SM2(p,1)+SM6(p,1))/2;
         GB1(i,2)=(SM2(p,2)+SM6(p,2))/2;
         GB1(i,3)=(SM2(p,3)+SM6(p,3))/2;
         
         GB2(i,1)=(SM9(p,1)+SM13(p,1))/2;
         GB2(i,2)=(SM9(p,2)+SM13(p,2))/2;
         GB2(i,3)=(SM9(p,3)+SM13(p,3))/2;         

         % Top flange
         GB3(i,1)=SM6(p,1);
         GB3(i,2)=SM6(p,2);
         GB3(i,3)=SM6(p,3);
         
         GB4(i,1)=SM13(p,1);
         GB4(i,2)=SM13(p,2);
         GB4(i,3)=SM13(p,3);   
         
         % Bottom flange
         GB5(i,1)=SM2(p,1);
         GB5(i,2)=SM2(p,2);
         GB5(i,3)=SM2(p,3);
         
         GB6(i,1)=SM9(p,1);
         GB6(i,2)=SM9(p,2);
         GB6(i,3)=SM9(p,3);
  
         if ~isempty(BNC1)
          for r=1:(length(BNC1(:,1)))
              if isequal(BNC1(r,2),DUP1(i,2)) 
                    if ~isequal(BNC1(r,8),0) 
                        SBM6(u,1)=BM6(p,1);
                        SBM6(u,2)=BM6(p,2);
                        SBM6(u,3)=BM6(p,3);
                        u=u+1;
                      plot3(axesm,[BM5(p,1),BM6(p,1)],[BM5(p,3),BM6(p,3)],...
                         [BM5(p,2),BM6(p,2)],'HitTest','off','Color',[0.8 0.2 0],...
                         'Tag',['ShearB',num2str(i)]);
                      hold on;                          
                    end
              end
              if isequal(BNC2(r,2),DUP2(i,2)) 
                    if ~isequal(BNC1(r,8),0) 
                        SBM13(v,1)=BM13(p,1);
                        SBM13(v,2)=BM13(p,2);
                        SBM13(v,3)=BM13(p,3);
                        v=v+1;
                      plot3(axesm,[BM12(p,1),BM13(p,1)],[BM12(p,3),BM13(p,3)],...
                         [BM12(p,2),BM13(p,2)],'HitTest','off','Color',[0.8 0.2 0],...
                         'Tag',['ShearB',num2str(i)]);
                      hold on;
                    end
              end              
              
          end
         end
%           Bracing E
         
      end % for end
      a=a+max(SNodevalue(n,m,3));

      % top flange
      Xwtf1=[SM5(:,1) SM6(:,1); SM12(max(SNodevalue(n,m,3)),1) , SM13(max(SNodevalue(n,m,3)),1) ];
      Ywtf1=[SM5(:,2) SM6(:,2); SM12(max(SNodevalue(n,m,3)),2) , SM13(max(SNodevalue(n,m,3)),2) ];
      Zwtf1=[SM5(:,3) SM6(:,3); SM12(max(SNodevalue(n,m,3)),3) , SM13(max(SNodevalue(n,m,3)),3) ];
      
      Xwtf2=[SM6(:,1) SM7(:,1); SM13(max(SNodevalue(n,m,3)),1) , SM14(max(SNodevalue(n,m,3)),1) ];
      Ywtf2=[SM6(:,2) SM7(:,2); SM13(max(SNodevalue(n,m,3)),2) , SM14(max(SNodevalue(n,m,3)),2) ];
      Zwtf2=[SM6(:,3) SM7(:,3); SM13(max(SNodevalue(n,m,3)),3) , SM14(max(SNodevalue(n,m,3)),3) ];      
      
      % web
      Xwweb=[SM2(:,1) SM6(:,1); SM9(max(SNodevalue(n,m,3)),1) , SM13(max(SNodevalue(n,m,3)),1) ];
      Ywweb=[SM2(:,2) SM6(:,2); SM9(max(SNodevalue(n,m,3)),2) , SM13(max(SNodevalue(n,m,3)),2) ];
      Zwweb=[SM2(:,3) SM6(:,3); SM9(max(SNodevalue(n,m,3)),3) , SM13(max(SNodevalue(n,m,3)),3) ];
      % bottom flange
      Xwbf1=[SM1(:,1) SM2(:,1); SM8(max(SNodevalue(n,m,3)),1) , SM9(max(SNodevalue(n,m,3)),1) ];
      Ywbf1=[SM1(:,2) SM2(:,2); SM8(max(SNodevalue(n,m,3)),2) , SM9(max(SNodevalue(n,m,3)),2) ];
      Zwbf1=[SM1(:,3) SM2(:,3); SM8(max(SNodevalue(n,m,3)),3) , SM9(max(SNodevalue(n,m,3)),3) ];     
      
      Xwbf2=[SM2(:,1) SM3(:,1); SM9(max(SNodevalue(n,m,3)),1) , SM10(max(SNodevalue(n,m,3)),1) ];
      Ywbf2=[SM2(:,2) SM3(:,2); SM9(max(SNodevalue(n,m,3)),2) , SM10(max(SNodevalue(n,m,3)),2) ];
      Zwbf2=[SM2(:,3) SM3(:,3); SM9(max(SNodevalue(n,m,3)),3) , SM10(max(SNodevalue(n,m,3)),3) ];
      
      % interpolation
      ni=1:length(Xwtf1(:,1));
      nq = 1:(length(Xwtf1(:,1))-1)/(3*length(Xwtf1(:,1))):length(Xwtf1(:,1));
      
      % top flange
      Xwtf1q= interp1(ni,Xwtf1,nq,'pchip');
      Ywtf1q= interp1(ni,Ywtf1,nq,'pchip');
      Zwtf1q= interp1(ni,Zwtf1,nq,'pchip');
      Xwtf2q= interp1(ni,Xwtf2,nq,'pchip');
      Ywtf2q= interp1(ni,Ywtf2,nq,'pchip');
      Zwtf2q= interp1(ni,Zwtf2,nq,'pchip');  
      
      % web
      Xwwebq= interp1(ni,Xwweb,nq,'pchip');
      Ywwebq= interp1(ni,Ywweb,nq,'pchip');
      Zwwebq= interp1(ni,Zwweb,nq,'pchip');
     
      % bottom flange
      Xwbf1q= interp1(ni,Xwbf1,nq,'pchip');
      Ywbf1q= interp1(ni,Ywbf1,nq,'pchip');
      Zwbf1q= interp1(ni,Zwbf1,nq,'pchip');
      Xwbf2q= interp1(ni,Xwbf2,nq,'pchip');
      Ywbf2q= interp1(ni,Ywbf2,nq,'pchip');
      Zwbf2q= interp1(ni,Zwbf2,nq,'pchip');       
      
      
   tf1q = surf(axesm,Xwtf1q,Zwtf1q,Ywtf1q,'FaceColor',[0.7 0.7 0.7], ...
      'EdgeColor','none','Tag','TF'); hold on
   tf2q = surf(axesm,Xwtf2q,Zwtf2q,Ywtf2q,'FaceColor',[0.7 0.7 0.7], ...
      'EdgeColor','none','Tag','TF'); hold on   
   webq = surf(axesm,Xwwebq,Zwwebq,Ywwebq,'FaceColor',[0.97 0.97 0.97],...
      'EdgeColor','none','Tag','WEB'); hold on
   bf1q = surf(axesm,Xwbf1q,Zwbf1q,Ywbf1q,'FaceColor',[0.7 0.7 0.7],...
      'EdgeColor','none','Tag','BF'); hold on 
   bf2q = surf(axesm,Xwbf2q,Zwbf2q,Ywbf2q,'FaceColor',[0.7 0.7 0.7],...
      'EdgeColor','none','Tag','BF'); hold on 

   plot3(axesm,Xwtf1q(:,1)',Zwtf1q(:,1)',Ywtf1q(:,1)','Color',[0 0 0],'Tag','Edge');
   hold on; 
   plot3(axesm,Xwtf2q(:,2)',Zwtf2q(:,2)',Ywtf2q(:,2)','Color',[0 0 0],'Tag','Edge');
   hold on;    
   plot3(axesm,Xwbf1q(:,1)',Zwbf1q(:,1)',Ywbf1q(:,1)','Color',[0 0 0],'Tag','Edge');
   hold on; 
   plot3(axesm,Xwbf2q(:,2)',Zwbf2q(:,2)',Ywbf2q(:,2)','Color',[0 0 0],'Tag','Edge');
   hold on;    
   

   xbcr = [SM1(:,1) , SM2(:,1) , SM3(:,1); ...
      SM8(max(SNodevalue(n,m,3)),1),SM9(max(SNodevalue(n,m,3)),1),SM10(max(SNodevalue(n,m,3)),1)];
   ybcr = [SM1(:,2) , SM2(:,2) , SM3(:,2); ...
      SM8(max(SNodevalue(n,m,3)),2),SM9(max(SNodevalue(n,m,3)),2),SM10(max(SNodevalue(n,m,3)),2)];
   zbcr = [SM1(:,3) , SM2(:,3) , SM3(:,3); ...
      SM8(max(SNodevalue(n,m,3)),3),SM9(max(SNodevalue(n,m,3)),3),SM10(max(SNodevalue(n,m,3)),3)];
   for h=1:length(xbcr(:,1))
      plot3(axesm,xbcr(h,:),zbcr(h,:),ybcr(h,:),'Color',[0 0 0],'Tag','Edge');
      hold on;
   end

   xwcr = [SM2(:,1) , SM6(:,1) ; ...
      SM9(max(SNodevalue(n,m,3)),1),SM13(max(SNodevalue(n,m,3)),1)];
   ywcr = [SM2(:,2) , SM6(:,2) ; ...
      SM9(max(SNodevalue(n,m,3)),2),SM13(max(SNodevalue(n,m,3)),2)];
   zwcr = [SM2(:,3) , SM6(:,3) ; ...
      SM9(max(SNodevalue(n,m,3)),3),SM13(max(SNodevalue(n,m,3)),3)];
   for h=1:length(xwcr(:,1))
      plot3(axesm,xwcr(h,:),zwcr(h,:),ywcr(h,:),'Color',[0 0 0],'Tag','Edge');
      hold on;
   end   
   
   
   xtcr = [SM5(:,1) , SM6(:,1) , SM7(:,1); ...
      SM12(max(SNodevalue(n,m,3)),1),SM13(max(SNodevalue(n,m,3)),1),SM14(max(SNodevalue(n,m,3)),1)];
   ytcr = [SM5(:,2) , SM6(:,2) , SM7(:,2); ...
      SM12(max(SNodevalue(n,m,3)),2),SM13(max(SNodevalue(n,m,3)),2),SM14(max(SNodevalue(n,m,3)),2)];
   ztcr = [SM5(:,3) , SM6(:,3) , SM7(:,3); ...
      SM12(max(SNodevalue(n,m,3)),3),SM13(max(SNodevalue(n,m,3)),3),SM14(max(SNodevalue(n,m,3)),3)];
   for h=1:length(xtcr(:,1))
      plot3(axesm,xtcr(h,:),ztcr(h,:),ytcr(h,:),'Color',[0 0 0],'Tag','Edge');
      hold on;
   end

%    camlight('headlight'); 
   lighting phong

   alpha([tf1q,tf2q,webq,bf1q,bf2q],1)

   end
end


% ------------------------------------------------------------------------
% ---------      Reference & Shear Center Line       ---------------------
% ------------------------------------------------------------------------
% Hide title
set(pt_title_name,'Visible','off')

Evalue = [];
for i = 1:xn 
   Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
   sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
   0 0 1];

   switch val1(i,1)
      
   case 1
      % *************************** Rotation
      % bottom flage start node
      SN1=[0 (-Db1(i,1)) (zg1(i,1)+bfb1(i,1)/2)];      
      SN2=[0 (-Db1(i,1)) (zg1(i,1)+0)];     
      SN3=[0 (-Db1(i,1)) (zg1(i,1)-bfb1(i,1)/2)];
      % top flage start node
      SN5=[0 Dt1(i,1) (zg1(i,1)+bft1(i,1)/2)];
      SN6=[0 Dt1(i,1) (zg1(i,1)+0)];
      SN7=[0 Dt1(i,1) (zg1(i,1)-bft1(i,1)/2)];
      % bottom flage end node
      SN8=[0 (-Db2(i,1)) (zg2(i,1)+bfb2(i,1)/2)];
      SN9=[0 (-Db2(i,1)) (zg2(i,1)+0)];
      SN10=[0 (-Db2(i,1)) (zg2(i,1)-bfb2(i,1)/2)];
      % top flage end node
      SN12=[0 Dt2(i,1) (zg2(i,1)+bft2(i,1)/2)];
      SN13=[0 Dt2(i,1) (zg2(i,1)+0)];
      SN14=[0 Dt2(i,1) (zg2(i,1)-bft2(i,1)/2)];
      % *************************** Global Rotation
      SN1=Rz*SN1';
      SN2=Rz*SN2';
      SN3=Rz*SN3'; 
      SN5=Rz*SN5';
      SN6=Rz*SN6';
      SN7=Rz*SN7'; 
      SN8=Rz*SN8';
      SN9=Rz*SN9';
      SN10=Rz*SN10'; 
      SN12=Rz*SN12'; 
      SN13=Rz*SN13';
      SN14=Rz*SN14';  
       
     
   case 2     
      % *************************** Rotation
      % bottom flage start node
      SN1=[0 (-Dg1(i,1)) (zg1(i,1)+bfb1(i,1)/2)];  
      SN2=[0 (-Dg1(i,1)) (zg1(i,1)+0)];    
      SN3=[0 (-Dg1(i,1)) (zg1(i,1)-bfb1(i,1)/2)];
      % top flage start node
      SN5=[0 0 (zg1(i,1)+bft1(i,1)/2)];
      SN6=[0 0 (zg1(i,1)+0)]; 
      SN7=[0 0 (zg1(i,1)-bft1(i,1)/2)];
      % bottom flage end node
      SN8=[0 (-Dg2(i,1)) (zg2(i,1)+bfb2(i,1)/2)];
      SN9=[0 (-Dg2(i,1)) (zg2(i,1)+0)];
      SN10=[0 (-Dg2(i,1)) (zg2(i,1)-bfb2(i,1)/2)];
      % top flage end node
      SN12=[0 0 (zg2(i,1)+bft2(i,1)/2)];
      SN13=[0 0 (zg2(i,1)+0)];
      SN14=[0 0 (zg2(i,1)-bft2(i,1)/2)];
      % *************************** Global Rotation
      SN1=Rz*SN1';
      SN2=Rz*SN2';
      SN3=Rz*SN3'; 
      SN5=Rz*SN5';
      SN6=Rz*SN6';
      SN7=Rz*SN7'; 
      SN8=Rz*SN8';
      SN9=Rz*SN9';
      SN10=Rz*SN10'; 
      SN12=Rz*SN12'; 
      SN13=Rz*SN13';
      SN14=Rz*SN14';         
      
   case 3
      % *************************** Rotation
      % bottom flage start node
      SN1=[0 (0) (zg1(i,1)+bfb1(i,1)/2)];
      SN2=[0 (0) (zg1(i,1)+0)];    
      SN3=[0 (0) (zg1(i,1)-bfb1(i,1)/2)];
      % top flage start node
      SN5=[0 Dg1(i,1) (zg1(i,1)+bft1(i,1)/2)];
      SN6=[0 Dg1(i,1) (zg1(i,1)+0)];
      SN7=[0 Dg1(i,1) (zg1(i,1)-bft1(i,1)/2)];
      % bottom flage end node
      SN8=[0 (0) (zg2(i,1)+bfb2(i,1)/2)];
      SN9=[0 (0) (zg2(i,1)+0)];
      SN10=[0 (0) (zg2(i,1)-bfb2(i,1)/2)];
      % top flage end node
      SN12=[0 Dg2(i,1) (zg2(i,1)+bft2(i,1)/2)];
      SN13=[0 Dg2(i,1) (zg2(i,1)+0)];
      SN14=[0 Dg2(i,1) (zg2(i,1)-bft2(i,1)/2)];    
      % *************************** Global Rotation
      SN1=Rz*SN1';
      SN2=Rz*SN2';
      SN3=Rz*SN3'; 
      SN5=Rz*SN5';
      SN6=Rz*SN6';
      SN7=Rz*SN7'; 
      SN8=Rz*SN8';
      SN9=Rz*SN9';
      SN10=Rz*SN10'; 
      SN12=Rz*SN12'; 
      SN13=Rz*SN13';
      SN14=Rz*SN14';  

   end % Switch end
   % bottom flage start node
   CSN1(:,i)=SN1;
   CSN2(:,i)=SN2;
   CSN3(:,i)=SN3;
   % top flage start node
   CSN5(:,i)=SN5;
   CSN6(:,i)=SN6;
   CSN7(:,i)=SN7;
   % bottom flage end node
   CSN8(:,i)=SN8;
   CSN9(:,i)=SN9;
   CSN10(:,i)=SN10;
   % top flage end node
   CSN12(:,i)=SN12;
   CSN13(:,i)=SN13;
   CSN14(:,i)=SN14;   
   
   
end  % for end

if ~isempty(JNodevalue)

   lt=1.35; % Line thickness
   xb=7;    % Markersize Fixities
   xs=9;    % Markersize Shear Panel
   xd=7;    % Markersize Grounded Spring
   xf=6;    % Markersize Flexure
   % ---------------------------------------------------------------------
   % ----------            Plot Shear Panel           --------------------
   % --------------------------------------------------------------------- 
   if~isempty(BNC1)
      if ~isempty(SBM6)
         if isequal(LabType(1,6),0)      
           for p=1:(length(SBM6(:,1)))
             plot3(axesm,[SBM6(p,1),SBM13(p,1)],[SBM6(p,3),SBM13(p,3)],...
                [SBM6(p,2),SBM13(p,2)],'HitTest','off','Color',[0.8 0.2 0],...
                'Tag',['ShearB',num2str(p)]);
             hold on; 
             plot3(axesm, (SBM6(p,1)+SBM13(p,1))/2 ,(SBM6(p,3)+SBM13(p,3))/2,...
                (SBM6(p,2)+SBM13(p,2))/2,'MarkerFaceColor',[0.8 0.2 0],...
                'HitTest','off','Marker','diamond','Color',[0.8 0.2 0],'MarkerSize',xs,'Tag',['ShearP',num2str(p)]);
             hold on;      
           end
         else
            for p=1:(length(SBM6(:,1)))
               delete(findobj('Tag',['ShearB',num2str(i)])); 
               delete(findobj('Tag',['ShearP',num2str(i)])); 
            end                  
         end % LabType(1,6)
        
      end  
   end
    
   % ---------------------------------------------------------------------
   % ----------          Plot Discrete Grounded       --------------------
   % ---------------------------------------------------------------------         
   dgd1=xa*0.08;
   dgd2=xa*0.5;  
   dgd3=xa*0.2;
   dgd4=-xa*0.007;

   t = linspace(0,3*pi/2,10000);
   x = xa*0.4*cos(t);                  
   y = xa*0.4*sin(t);
   z = 0*sin(t);   
   
   t1 = linspace(0,4*pi/2,10000);
   x1 = xa*0.3*cos(t1);                  
   y1 = xa*0.3*sin(t1);
   z1 = 0*sin(t1);    
   
   t2 = linspace(0,4*pi/2,10000);
   x2 = xa*0.2*cos(t2);                  
   y2 = xa*0.2*sin(t2);
   z2 = 0*sin(t2); 

   % Drawing Loading Nodal points
   if isempty(RNCc) || isempty(BNC)
   else
      if isequal(LabType(1,7),0)
      for i=1:length(RNCc(:,1))       
         if ~isequal(BNC(i,5),0) % Grounded Spring x-axis
             if isequal(BNC(i,13),1) || isequal(BNC(i,13),0) % Shear center            
               for j=1:length(GB1(:,1))
                   if isequal(i,MI(j,2))
                       plot3(axesm,[(GB1(j,1)+dgd1), (GB1(j,1)+dgd2)],...
                          [GB1(j,3)+dgd4,GB1(j,3)+dgd4],[GB1(j,2),GB1(j,2)],'HitTest','off','Color',[0.7 0.3 0],...
                          'Tag',['GBNC',num2str(i)],'linewidth',lt);                        
                       hold on;                         
                       plot3(axesm,GB1(j,1)+dgd3,GB1(j,3)+dgd4,GB1(j,2),'MarkerFaceColor',[0.7 0.3 0],...
                          'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['GBNC',num2str(i)]);
                       hold on;  
                   end
                   if isequal(i,MI(j,3))
                       plot3(axesm,[(GB2(j,1)+dgd1), (GB2(j,1)+dgd2)],...
                          [GB2(j,3)+dgd4,GB2(j,3)+dgd4],[GB2(j,2),GB2(j,2)],'HitTest','off','Color',[0.7 0.3 0],...
                          'Tag',['GBNC',num2str(i)],'linewidth',lt);                        
                       hold on;                         
                       plot3(axesm,GB2(j,1)+dgd3,GB2(j,3)+dgd4,GB2(j,2),'MarkerFaceColor',[0.7 0.3 0],...
                          'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['GBNC',num2str(i)]);
                       hold on;                                               
                   end               
               end
               
             elseif isequal(BNC(i,13),2) % Top flange             
               for j=1:length(GB3(:,1))                  
                   if isequal(i,MI(j,2))
                       plot3(axesm,[(GB3(j,1)+dgd1), (GB3(j,1)+dgd2)],...
                          [GB3(j,3)+dgd4,GB3(j,3)+dgd4],[GB3(j,2),GB3(j,2)],'HitTest','off','Color',[0.7 0.3 0],...
                          'Tag',['GBNC',num2str(i)],'linewidth',lt);                        
                       hold on;                         
                       plot3(axesm,GB3(j,1)+dgd3,GB3(j,3)+dgd4,GB3(j,2),'MarkerFaceColor',[0.7 0.3 0],...
                          'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['GBNC',num2str(i)]);
                       hold on;  
                   end
                   if isequal(i,MI(j,3))
                       plot3(axesm,[(GB4(j,1)+dgd1), (GB4(j,1)+dgd2)],...
                          [GB4(j,3)+dgd4,GB4(j,3)+dgd4],[GB4(j,2),GB4(j,2)],'HitTest','off','Color',[0.7 0.3 0],...
                          'Tag',['GBNC',num2str(i)],'linewidth',lt);                        
                       hold on;                         
                       plot3(axesm,GB4(j,1)+dgd3,GB4(j,3)+dgd4,GB4(j,2),'MarkerFaceColor',[0.7 0.3 0],...
                          'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['GBNC',num2str(i)]);
                       hold on;                                               
                   end                                  
               end               
               
             elseif isequal(BNC(i,13),3) % Bottom flange            
               for j=1:length(GB5(:,1))
                   if isequal(i,MI(j,2))
                       plot3(axesm,[(GB5(j,1)+dgd1), (GB5(j,1)+dgd2)],...
                          [GB5(j,3)+dgd4,GB5(j,3)+dgd4],[GB5(j,2),GB5(j,2)],'HitTest','off','Color',[0.7 0.3 0],...
                          'Tag',['GBNC',num2str(i)],'linewidth',lt);                        
                       hold on;                         
                       plot3(axesm,GB5(j,1)+dgd3,GB5(j,3)+dgd4,GB5(j,2),'MarkerFaceColor',[0.7 0.3 0],...
                          'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['GBNC',num2str(i)]);
                       hold on;  
                   end
                   if isequal(i,MI(j,3))
                       plot3(axesm,[(GB6(j,1)+dgd1), (GB6(j,1)+dgd2)],...
                          [GB6(j,3)+dgd4,GB6(j,3)+dgd4],[GB6(j,2),GB6(j,2)],'HitTest','off','Color',[0.7 0.3 0],...
                          'Tag',['GBNC',num2str(i)],'linewidth',lt);                        
                       hold on;                         
                       plot3(axesm,GB6(j,1)+dgd3,GB6(j,3)+dgd4,GB6(j,2),'MarkerFaceColor',[0.7 0.3 0],...
                          'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['GBNC',num2str(i)]);
                       hold on;                                               
                   end                                                    
               end                              
             end                
         end              
                
         if ~isequal(BNC(i,6),0) % Grounded Spring y-axis
             if isequal(BNC(i,13),1) || isequal(BNC(i,13),0) % Shear center            
               for j=1:length(GB1(:,1))
                   if isequal(i,MI(j,2))
                        plot3(axesm,[GB1(j,1),GB1(j,1) ],[GB1(j,3)+dgd4,GB1(j,3)+dgd4],...
                           [(GB1(j,2)+dgd1),(GB1(j,2)+dgd2)],'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;     
                        plot3(axesm,GB1(j,1),GB1(j,3)+dgd4,GB1(j,2)+dgd3,'MarkerFaceColor',[0.7 0.3 0],...
                           'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['GBNC',num2str(i)]);
                        hold on;
                   end
                   if isequal(i,MI(j,3))
                        plot3(axesm,[GB2(j,1),GB2(j,1) ],[GB2(j,3)+dgd4,GB2(j,3)+dgd4],...
                           [(GB2(j,2)+dgd1),(GB2(j,2)+dgd2)],'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;     
                        plot3(axesm,GB2(j,1),GB2(j,3)+dgd4,GB2(j,2)+dgd3,'MarkerFaceColor',[0.7 0.3 0],...
                           'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['GBNC',num2str(i)]);
                        hold on;                                              
                   end               
               end            
            elseif isequal(BNC(i,13),2) % Top flange 
               for j=1:length(GB3(:,1))
                   if isequal(i,MI(j,2))
                        plot3(axesm,[GB3(j,1),GB3(j,1) ],[GB3(j,3)+dgd4,GB3(j,3)+dgd4],...
                           [(GB3(j,2)+dgd1),(GB3(j,2)+dgd2)],'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;     
                        plot3(axesm,GB3(j,1),GB3(j,3)+dgd4,GB3(j,2)+dgd3,'MarkerFaceColor',[0.7 0.3 0],...
                           'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['GBNC',num2str(i)]);
                        hold on;
                   end
                   if isequal(i,MI(j,3))
                        plot3(axesm,[GB4(j,1),GB4(j,1) ],[GB4(j,3)+dgd4,GB4(j,3)+dgd4],...
                           [(GB4(j,2)+dgd1),(GB4(j,2)+dgd2)],'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;     
                        plot3(axesm,GB4(j,1),GB4(j,3)+dgd4,GB4(j,2)+dgd3,'MarkerFaceColor',[0.7 0.3 0],...
                           'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['GBNC',num2str(i)]);
                        hold on;                                              
                   end               
               end   
            elseif isequal(BNC(i,13),3) % Bottom flange 
               for j=1:length(GB5(:,1))
                   if isequal(i,MI(j,2))
                        plot3(axesm,[GB5(j,1),GB5(j,1) ],[GB5(j,3)+dgd4,GB5(j,3)+dgd4],...
                           [(GB5(j,2)+dgd1),(GB5(j,2)+dgd2)],'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;     
                        plot3(axesm,GB5(j,1),GB5(j,3)+dgd4,GB5(j,2)+dgd3,'MarkerFaceColor',[0.7 0.3 0],...
                           'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['GBNC',num2str(i)]);
                        hold on;
                   end
                   if isequal(i,MI(j,3))
                        plot3(axesm,[GB6(j,1),GB6(j,1) ],[GB6(j,3)+dgd4,GB6(j,3)+dgd4],...
                           [(GB6(j,2)+dgd1),(GB6(j,2)+dgd2)],'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;     
                        plot3(axesm,GB6(j,1),GB6(j,3)+dgd4,GB6(j,2)+dgd3,'MarkerFaceColor',[0.7 0.3 0],...
                           'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['GBNC',num2str(i)]);
                        hold on;                                              
                   end               
               end             
            end
         end                 
         
         if ~isequal(BNC(i,7),0) % Grounded Spring z-axis
            if isequal(BNC(i,13),1) || isequal(BNC(i,13),0) % Shear center
               for j=1:length(GB1(:,1))
                   if isequal(i,MI(j,2))
                       plot3(axesm,[GB1(j,1),GB1(j,1) ],[(GB1(j,3)+dgd1),(GB1(j,3)+dgd2)],...
                          [GB1(j,2),GB1(j,2)],'HitTest','off','Color',[0.7 0.3 0],'Tag',['GBNC',num2str(i)],'linewidth',lt);
                       hold on;             

                       plot3(axesm,GB1(j,1),GB1(j,3)+dgd3,GB1(j,2),'MarkerFaceColor',[0.7 0.3 0],...
                          'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['GBNC',num2str(i)]);
                       hold on;                         
                   end
                   if isequal(i,MI(j,3))
                       plot3(axesm,[GB2(j,1),GB2(j,1) ],[(GB2(j,3)+dgd1),(GB2(j,3)+dgd2)],...
                          [GB2(j,2),GB2(j,2)],'HitTest','off','Color',[0.7 0.3 0],'Tag',['GBNC',num2str(i)],'linewidth',lt);
                       hold on;             

                       plot3(axesm,GB2(j,1),GB2(j,3)+dgd3,GB2(j,2),'MarkerFaceColor',[0.7 0.3 0],...
                          'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['GBNC',num2str(i)]);
                       hold on;                                               
                   end               
               end
            elseif isequal(BNC(i,13),2) % Top flange 
               for j=1:length(GB3(:,1))
                   if isequal(i,MI(j,2))
                       plot3(axesm,[GB3(j,1),GB3(j,1) ],[(GB3(j,3)+dgd1),(GB3(j,3)+dgd2)],...
                          [GB3(j,2),GB3(j,2)],'HitTest','off','Color',[0.7 0.3 0],'Tag',['GBNC',num2str(i)],'linewidth',lt);
                       hold on;             

                       plot3(axesm,GB3(j,1),GB3(j,3)+dgd3,GB3(j,2),'MarkerFaceColor',[0.7 0.3 0],...
                          'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['GBNC',num2str(i)]);
                       hold on;                         
                   end
                   if isequal(i,MI(j,3))
                       plot3(axesm,[GB4(j,1),GB4(j,1) ],[(GB4(j,3)+dgd1),(GB4(j,3)+dgd2)],...
                          [GB4(j,2),GB4(j,2)],'HitTest','off','Color',[0.7 0.3 0],'Tag',['GBNC',num2str(i)],'linewidth',lt);
                       hold on;             

                       plot3(axesm,GB4(j,1),GB4(j,3)+dgd3,GB4(j,2),'MarkerFaceColor',[0.7 0.3 0],...
                          'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['GBNC',num2str(i)]);
                       hold on;                                               
                   end 
               end
            elseif isequal(BNC(i,13),3) % Bottom flange 
               for j=1:length(GB5(:,1))
                   if isequal(i,MI(j,2))
                       plot3(axesm,[GB5(j,1),GB5(j,1) ],[(GB5(j,3)+dgd1),(GB5(j,3)+dgd2)],...
                          [GB5(j,2),GB5(j,2)],'HitTest','off','Color',[0.7 0.3 0],'Tag',['GBNC',num2str(i)],'linewidth',lt);
                       hold on;             

                       plot3(axesm,GB5(j,1),GB5(j,3)+dgd3,GB5(j,2),'MarkerFaceColor',[0.7 0.3 0],...
                          'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['GBNC',num2str(i)]);
                       hold on;                         
                   end
                   if isequal(i,MI(j,3))
                       plot3(axesm,[GB6(j,1),GB6(j,1) ],[(GB6(j,3)+dgd1),(GB6(j,3)+dgd2)],...
                          [GB6(j,2),GB6(j,2)],'HitTest','off','Color',[0.7 0.3 0],'Tag',['GBNC',num2str(i)],'linewidth',lt);
                       hold on;             

                       plot3(axesm,GB6(j,1),GB6(j,3)+dgd3,GB6(j,2),'MarkerFaceColor',[0.7 0.3 0],...
                          'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['GBNC',num2str(i)]);
                       hold on;                                               
                   end                     
               end           
            end
         end
         
         if ~isequal(BNC(i,8),0) % Grounded Moment Spring x-axis
             if isequal(BNC(i,13),1) || isequal(BNC(i,13),0) % Shear center            
               for j=1:length(GB1(:,1))
                   if isequal(i,MI(j,2))
                       plot3(axesm,z+GB1(j,1),x+GB1(j,3),y+GB1(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                          'Tag',['GBNC',num2str(i)],'linewidth',lt);
                       hold on;

                       plot3(axesm,z1+GB1(j,1),x1+GB1(j,3),y1+GB1(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                          'Tag',['GBNC',num2str(i)],'linewidth',lt);
                       hold on; 

                       plot3(axesm,z2+GB1(j,1),x2+GB1(j,3),y2+GB1(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                          'Tag',['GBNC',num2str(i)],'linewidth',lt);
                       hold on; 
                   end
                   if isequal(i,MI(j,3))
                       plot3(axesm,z+GB2(j,1),x+GB2(j,3),y+GB2(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                          'Tag',['GBNC',num2str(i)],'linewidth',lt);
                       hold on;

                       plot3(axesm,z1+GB2(j,1),x1+GB2(j,3),y1+GB2(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                          'Tag',['GBNC',num2str(i)],'linewidth',lt);
                       hold on; 

                       plot3(axesm,z2+GB2(j,1),x2+GB2(j,3),y2+GB2(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                          'Tag',['GBNC',num2str(i)],'linewidth',lt);
                       hold on; 
                   end               
               end
               
             elseif isequal(BNC(i,13),2) % Top flange             
               for j=1:length(SM6(:,1))
                   if isequal(i,MI(j,2))
                       plot3(axesm,z+GB3(j,1),x+GB3(j,3),y+GB3(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                          'Tag',['GBNC',num2str(i)],'linewidth',lt);
                       hold on;

                       plot3(axesm,z1+GB3(j,1),x1+GB3(j,3),y1+GB3(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                          'Tag',['GBNC',num2str(i)],'linewidth',lt);
                       hold on; 

                       plot3(axesm,z2+GB3(j,1),x2+GB3(j,3),y2+GB3(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                          'Tag',['GBNC',num2str(i)],'linewidth',lt);
                       hold on; 
                   end
                   if isequal(i,MI(j,3))
                       plot3(axesm,z+GB4(j,1),x+GB4(j,3),y+GB4(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                          'Tag',['GBNC',num2str(i)],'linewidth',lt);
                       hold on;

                       plot3(axesm,z1+GB4(j,1),x1+GB4(j,3),y1+GB4(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                          'Tag',['GBNC',num2str(i)],'linewidth',lt);
                       hold on; 

                       plot3(axesm,z2+GB4(j,1),x2+GB4(j,3),y2+GB4(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                          'Tag',['GBNC',num2str(i)],'linewidth',lt);
                       hold on; 
                   end               
               end               
               
             elseif isequal(BNC(i,13),3) % Bottom flange            
               for j=1:length(SM2(:,1))
                   if isequal(i,MI(j,2))
                       plot3(axesm,z+GB5(j,1),x+GB5(j,3),y+GB5(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                          'Tag',['GBNC',num2str(i)],'linewidth',lt);
                       hold on;

                       plot3(axesm,z1+GB5(j,1),x1+GB5(j,3),y1+GB5(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                          'Tag',['GBNC',num2str(i)],'linewidth',lt);
                       hold on; 

                       plot3(axesm,z2+GB5(j,1),x2+GB5(j,3),y2+GB5(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                          'Tag',['GBNC',num2str(i)],'linewidth',lt);
                       hold on; 
                   end
                   if isequal(i,MI(j,3))
                       plot3(axesm,z+GB6(j,1),x+GB6(j,3),y+GB6(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                          'Tag',['GBNC',num2str(i)],'linewidth',lt);
                       hold on;

                       plot3(axesm,z1+GB6(j,1),x1+GB6(j,3),y1+GB6(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                          'Tag',['GBNC',num2str(i)],'linewidth',lt);
                       hold on; 

                       plot3(axesm,z2+GB6(j,1),x2+GB6(j,3),y2+GB6(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                          'Tag',['GBNC',num2str(i)],'linewidth',lt);
                       hold on; 
                   end               
               end                              
             end                
         end
         
         if ~isequal(BNC(i,9),0) % Grounded Moment Spring y-axis
            if isequal(BNC(i,13),1) || isequal(BNC(i,13),0) % Shear center            
               for j=1:length(GB1(:,1))
                   if isequal(i,MI(j,2))
                        plot3(axesm,x+GB1(j,1),y+GB1(j,3),z+GB1(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;                      

                        plot3(axesm,x1+GB1(j,1),y1+GB1(j,3),z1+GB1(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;

                        plot3(axesm,x2+GB1(j,1),y2+GB1(j,3),z2+GB1(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;  
                   end
                   if isequal(i,MI(j,3))
                        plot3(axesm,x+GB2(j,1),y+GB2(j,3),z+GB2(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;                      

                        plot3(axesm,x1+GB2(j,1),y1+GB2(j,3),z1+GB2(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;

                        plot3(axesm,x2+GB2(j,1),y2+GB2(j,3),z2+GB2(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;  
                   end               
               end                  
            elseif isequal(BNC(i,13),2) % Top flange 
               for j=1:length(GB3(:,1))
                   if isequal(i,MI(j,2))
                        plot3(axesm,x+GB3(j,1),y+GB3(j,3),z+GB3(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;                      

                        plot3(axesm,x1+GB3(j,1),y1+GB3(j,3),z1+GB3(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;

                        plot3(axesm,x2+GB3(j,1),y2+GB3(j,3),z2+GB3(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;  
                   end
                   if isequal(i,MI(j,3))
                        plot3(axesm,x+GB4(j,1),y+GB4(j,3),z+GB4(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;                      

                        plot3(axesm,x1+GB4(j,1),y1+GB4(j,3),z1+GB4(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;

                        plot3(axesm,x2+GB4(j,1),y2+GB4(j,3),z2+GB4(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;  
                   end               
               end 
            elseif isequal(BNC(i,13),3) % Bottom flange 
               for j=1:length(GB5(:,1))
                   if isequal(i,MI(j,2))
                        plot3(axesm,x+GB5(j,1),y+GB5(j,3),z+GB5(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;                      

                        plot3(axesm,x1+GB5(j,1),y1+GB5(j,3),z1+GB5(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;

                        plot3(axesm,x2+GB5(j,1),y2+GB5(j,3),z2+GB5(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;  
                   end
                   if isequal(i,MI(j,3))
                        plot3(axesm,x+GB6(j,1),y+GB6(j,3),z+GB6(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;                      

                        plot3(axesm,x1+GB6(j,1),y1+GB6(j,3),z1+GB6(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;

                        plot3(axesm,x2+GB6(j,1),y2+GB6(j,3),z2+GB6(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;  
                   end               
               end                
            end
         end                
         
         if ~isequal(BNC(i,10),0) % Grounded Moment Spring z-axis
            if isequal(BNC(i,13),1) || isequal(BNC(i,13),0) % Shear center
               for j=1:length(GB1(:,1))
                   if isequal(i,MI(j,2))
                        plot3(axesm,x+GB1(j,1),z+GB1(j,3),y+GB1(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;

                        plot3(axesm,x1+GB1(j,1),z1+GB1(j,3),y1+GB1(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on; 

                        plot3(axesm,x2+GB1(j,1),z2+GB1(j,3),y2+GB1(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;    
                   end
                   if isequal(i,MI(j,3))
                        plot3(axesm,x+GB2(j,1),z+GB2(j,3),y+GB2(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;

                        plot3(axesm,x1+GB2(j,1),z1+GB2(j,3),y1+GB2(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on; 

                        plot3(axesm,x2+GB2(j,1),z2+GB2(j,3),y2+GB2(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on; 
                   end               
               end                
            elseif isequal(BNC(i,13),2) % Top flange
               for j=1:length(GB3(:,1))
                   if isequal(i,MI(j,2))
                        plot3(axesm,x+GB3(j,1),z+GB3(j,3),y+GB3(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;

                        plot3(axesm,x1+GB3(j,1),z1+GB3(j,3),y1+GB3(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on; 

                        plot3(axesm,x2+GB3(j,1),z2+GB3(j,3),y2+GB3(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;    
                   end
                   if isequal(i,MI(j,3))
                        plot3(axesm,x+GB4(j,1),z+GB4(j,3),y+GB4(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;

                        plot3(axesm,x1+GB4(j,1),z1+GB4(j,3),y1+GB4(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on; 

                        plot3(axesm,x2+GB4(j,1),z2+GB4(j,3),y2+GB4(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on; 
                   end               
               end  
            elseif isequal(BNC(i,13),3) % Bottom flange
               for j=1:length(GB5(:,1))
                   if isequal(i,MI(j,2))
                        plot3(axesm,x+GB5(j,1),z+GB5(j,3),y+GB5(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;

                        plot3(axesm,x1+GB5(j,1),z1+GB5(j,3),y1+GB5(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on; 

                        plot3(axesm,x2+GB5(j,1),z2+GB5(j,3),y2+GB5(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;    
                   end
                   if isequal(i,MI(j,3))
                        plot3(axesm,x+GB6(j,1),z+GB6(j,3),y+GB6(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on;

                        plot3(axesm,x1+GB6(j,1),z1+GB6(j,3),y1+GB6(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on; 

                        plot3(axesm,x2+GB6(j,1),z2+GB6(j,3),y2+GB6(j,2),'HitTest','off','Color',[0.7 0.3 0],...
                           'Tag',['GBNC',num2str(i)],'linewidth',lt);
                        hold on; 
                   end               
               end               
            end
         end          
         
      end
      else
         for i=1:length(RNCc(:,1))
            delete(findobj('Tag',['GBNC',num2str(i)])); 
         end           
      end % LabType(1,7)
   end
  

   % ---------------------------------------------------------------------
   % -------------------        Nodal global angle       -----------------
   % ---------------------------------------------------------------------    
%    NC =[nodenum,xgnum,ygnum,zgnum,bfbnum,tfbnum,bftnum,tftnum,dwnum,twnum,dnum,hnum];
   bfbg=RNCc(:,5); tfbg=RNCc(:,6); bftg=RNCc(:,7); tftg=RNCc(:,8); hg=RNCc(:,12);
   % bottom flange centroid to shear center
   hsbg = (tftg.*bftg.^3.*hg)./(tfbg.*bfbg.^3+tftg.*bftg.^3); 
   hstg = hg - hsbg;    % top flange centroid to shear center 
   Dsbg=hsbg+tfbg/2 +xa*0.01;
   Dstg=hstg+tftg/2 +xa*0.01;

    AJ=[Massemble(:,2);Massemble(:,3)];
   for i=1:length(JNodevalue(:,1))
      p=0;
      for j=1:length(AJ(:,1))
         if isequal(i,AJ(j,1))
            DJ(i,1)=i;
            DJ(i,2)=p;
            p=p+1;
         end
      end      
   end
 
   p=1;DJnode=[];
   for i=1:length(DJ(:,1))
      if ~isequal(DJ(i,2),0)
         DJnode(p,1)=p;
         DJnode(p,2)=JNodevalue(i,2);
         DJnode(p,3)=JNodevalue(i,3);
         DJnode(p,4)=JNodevalue(i,4);
         p=p+1;
      end
   end
   
   if ~isempty(DJnode)
      for j=1:length(DUP1(:,1))
         for i=1:length(DJnode(:,1))
            if isequal(DJnode(i,2),DUP1(j,3)) && isequal(DJnode(i,3),DUP1(j,4)) ...
                  && isequal(DJnode(i,4),DUP1(j,5))
               alpharef1(j,1)= j;
               alpharef1(j,2)= DUP1(j,2);
               alpharef1(j,3)= 10;
               break;
            else
               alpharef1(j,1)= j;
               alpharef1(j,2)= DUP1(j,2);
               alpharef1(j,3)= alpharef(j,2);           
            end     
         end
      end

      for j=1:length(DUP2(:,1))
         for i=1:length(DJnode(:,1))
            if isequal(DJnode(i,2),DUP2(j,3)) && isequal(DJnode(i,3),DUP2(j,4)) ...
                  && isequal(DJnode(i,4),DUP2(j,5))
               alpharef2(j,1)= j;
               alpharef2(j,2)= DUP2(j,2);
               alpharef2(j,3)= 10;
               break;
            else
               alpharef2(j,1)= j;
               alpharef2(j,2)= DUP2(j,2);
               alpharef2(j,3)= alpharef(j,2);           
            end         
         end
      end  
   
      for i=1:length(NCc(:,1))
         for j=1:length(alpharef1(:,1))
            if isequal(i,alpharef1(j,2))
               alphanode(i,1)=i;
               alphanode(i,2)=alpharef1(j,3);
               break;
            elseif isequal(i,alpharef2(j,2))
               alphanode(i,1)=i;
               alphanode(i,2)=alpharef2(j,3);            
               break;
            end

         end            
      end
   else
      
      for i=1:length(NCc(:,1))
         if isequal(i,length(NCc(:,1)))
            alphanode(i,1)=i;
            alphanode(i,2)=alpharef(length(NCc(:,1))-1,2);             
         else
            alphanode(i,1)=i;
            alphanode(i,2)=alpharef(i,2);  
         end
      end      
      
   end

   for i = 1:length(NCc(:,1)) 
      if ~isequal(alphanode(i,2),10)
         Rz=[cos(alphanode(i,2)) -sin(alphanode(i,2)) 0; ...
         sin(alphanode(i,2)) cos(alphanode(i,2)) 0; ...
         0 0 1];

         Bh=[0,-Dsbg(i,1),0]; Bh=Rz*Bh'; Bhg(i,:)=Bh';    
         Th=[0,Dstg(i,1),0]; Th=Rz*Th'; Thg(i,:)=Th'; 
      else
         Bh=[0,0,0]; Bhg(i,:)=Bh;    
         Th=[0,0,0]; Thg(i,:)=Th;          
      end
      
   end       
   
   switch get(get(rd_buttongroup,'SelectedObject'),'Tag')
      case 'undeformed3d_on'  
         
         
         
         
         
   % ---------------------------------------------------------------------
   % -------------------        Plot Point Load       --------------------
   % ---------------------------------------------------------------------   
   prd = xa*0.4;
   dp1=xa*0.01;
   dp2=xa*0.8;   
   if isequal(xa,mDg)
%       dps = 1.4;
      dps = xa*0.1;
   else
      dps = xa*0.14;   
   end

   t = linspace(0,3*pi/2,10000);
   x = xa*0.4*cos(t);                  
   y = xa*0.4*sin(t);   
   z = 0*sin(t);
   t1 = linspace(-pi/2,2*pi/2,10000);
   x1 = xa*0.4*cos(t1);                  
   y1 = xa*0.4*sin(t1);   
   % Drawing Loading Nodal points
   if isempty(RNCc) || isempty(LNC)
   else 
      if isequal(LabType(1,9),0)
      for i=1:length(RNCc(:,1))
         if ~isequal(LNC(i,5),0) % Force x-axis
            if isequal(LNC(i,13),1) || isequal(LNC(i,13),0) % Shear center
               if LNC(i,5) < 0
                  plot3(axesm,[(RNCc(i,2)+dp1), (RNCc(i,2)+dp2)],[RNCc(i,4),RNCc(i,4)],[RNCc(i,3),RNCc(i,3)],...
                     'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                  
                  Sco = [RNCc(i,2)+dp1,RNCc(i,4),RNCc(i,3); RNCc(i,2)+dp1,RNCc(i,4),RNCc(i,3); ...
                     RNCc(i,2)+dp1,RNCc(i,4),RNCc(i,3); RNCc(i,2)+dp1,RNCc(i,4),RNCc(i,3)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;
               elseif LNC(i,5) > 0
                  plot3(axesm,[(RNCc(i,2)-dp1), (RNCc(i,2)-dp2)],[RNCc(i,4),RNCc(i,4)],[RNCc(i,3),RNCc(i,3)],...
                     'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                   
                  Sco = [RNCc(i,2)-dp1,RNCc(i,4),RNCc(i,3); RNCc(i,2)-dp1,RNCc(i,4),RNCc(i,3); ...
                     RNCc(i,2)-dp1,RNCc(i,4),RNCc(i,3); RNCc(i,2)-dp1,RNCc(i,4),RNCc(i,3)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;                        
               end    
            elseif isequal(LNC(i,13),2) % Top flange
               if LNC(i,5) < 0
                  plot3(axesm,[(RNCc(i,2)+dp1+Thg(i,1)), (RNCc(i,2)+dp2+Thg(i,1))],...
                     [RNCc(i,4)+Thg(i,3),RNCc(i,4)+Thg(i,3)],[RNCc(i,3)+Thg(i,2),RNCc(i,3)+Thg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                  
                  Sco = [RNCc(i,2)+dp1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+dp1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)+dp1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+dp1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;                                    
               elseif LNC(i,5) > 0
                  plot3(axesm,[(RNCc(i,2)-dp1+Thg(i,1)), (RNCc(i,2)-dp2+Thg(i,1))],...
                     [RNCc(i,4)+Thg(i,3),RNCc(i,4)+Thg(i,3)],[RNCc(i,3)+Thg(i,2),RNCc(i,3)+Thg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                  
                  Sco = [RNCc(i,2)-dp1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-dp1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)-dp1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-dp1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;                                               
               end     
            elseif isequal(LNC(i,13),3) % bottom flange
               if LNC(i,5) < 0
                  plot3(axesm,[(RNCc(i,2)+dp1+Bhg(i,1)), (RNCc(i,2)+dp2+Bhg(i,1))],...
                     [RNCc(i,4)+Bhg(i,3),RNCc(i,4)+Bhg(i,3)],[RNCc(i,3)+Bhg(i,2),RNCc(i,3)+Bhg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                  
                  Sco = [RNCc(i,2)+dp1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+dp1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)+dp1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+dp1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;                                    
               elseif LNC(i,5) > 0
                  plot3(axesm,[(RNCc(i,2)-dp1+Bhg(i,1)), (RNCc(i,2)-dp2+Bhg(i,1))],...
                     [RNCc(i,4)+Bhg(i,3),RNCc(i,4)+Bhg(i,3)],[RNCc(i,3)+Bhg(i,2),RNCc(i,3)+Bhg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                     
                  Sco = [RNCc(i,2)-dp1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-dp1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)-dp1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-dp1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;                                               
               end   
            elseif isequal(LNC(i,13),4) % Centroid
               if LNC(i,5) < 0
                  plot3(axesm,[(RNCc(i,2)+dp1+CSg(i,1)), (RNCc(i,2)+dp2+CSg(i,1))],...
                     [RNCc(i,4)+CSg(i,3),RNCc(i,4)+CSg(i,3)],[RNCc(i,3)+CSg(i,2),RNCc(i,3)+CSg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                  
                  Sco = [RNCc(i,2)+dp1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+dp1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)+dp1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+dp1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;                                    
               elseif LNC(i,5) > 0
                  plot3(axesm,[(RNCc(i,2)-dp1+CSg(i,1)), (RNCc(i,2)-dp2+CSg(i,1))],...
                     [RNCc(i,4)+CSg(i,3),RNCc(i,4)+CSg(i,3)],[RNCc(i,3)+CSg(i,2),RNCc(i,3)+CSg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                     
                  Sco = [RNCc(i,2)-dp1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-dp1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)-dp1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-dp1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;                                               
               end                 
            end    
         end
       
         if ~isequal(LNC(i,6),0) % Force y-axis
            if isequal(LNC(i,13),1) || isequal(LNC(i,13),0) % Shear center
               if LNC(i,6) < 0
                  plot3(axesm,[RNCc(i,2),RNCc(i,2) ],[RNCc(i,4),RNCc(i,4)],[(RNCc(i,3)+dp1),(RNCc(i,3)+dp2)],...
                     'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                   
                  Sco = [RNCc(i,2),RNCc(i,4),RNCc(i,3)+dp1; RNCc(i,2),RNCc(i,4),RNCc(i,3)+dp1; ...
                     RNCc(i,2),RNCc(i,4),RNCc(i,3)+dp1; RNCc(i,2),RNCc(i,4),RNCc(i,3)+dp1];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;                  
               elseif LNC(i,6) > 0
                  plot3(axesm,[RNCc(i,2),RNCc(i,2) ],[RNCc(i,4),RNCc(i,4)],[(RNCc(i,3)-dp1),(RNCc(i,3)-dp2)],...
                     'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                   
                  Sco = [RNCc(i,2),RNCc(i,4),RNCc(i,3)-dp1; RNCc(i,2),RNCc(i,4),RNCc(i,3)-dp1; ...
                     RNCc(i,2),RNCc(i,4),RNCc(i,3)-dp1; RNCc(i,2),RNCc(i,4),RNCc(i,3)-dp1];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;            
               end 
            elseif isequal(LNC(i,13),2) % Top flange 
               if LNC(i,6) < 0
                  plot3(axesm,[RNCc(i,2)+Thg(i,1),RNCc(i,2)+Thg(i,1) ],[RNCc(i,4)+Thg(i,3),RNCc(i,4)+Thg(i,3)],...
                     [(RNCc(i,3)+dp1+Thg(i,2)),(RNCc(i,3)+dp2+Thg(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                  
                  Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+dp1+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+dp1+Thg(i,2); ...
                     RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+dp1+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+dp1+Thg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;                  
               elseif LNC(i,6) > 0
                  plot3(axesm,[RNCc(i,2)+Thg(i,1),RNCc(i,2)+Thg(i,1) ],[RNCc(i,4)+Thg(i,3),RNCc(i,4)+Thg(i,3)],...
                     [(RNCc(i,3)-dp1+Thg(i,2)),(RNCc(i,3)-dp2+Thg(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                      
                  Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-dp1+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-dp1+Thg(i,2); ...
                     RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-dp1+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-dp1+Thg(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;            
               end                  
            elseif isequal(LNC(i,13),3) % Bottom flange
               if LNC(i,6) < 0
                  plot3(axesm,[RNCc(i,2)+Bhg(i,1),RNCc(i,2)+Bhg(i,1) ],[RNCc(i,4)+Bhg(i,3),RNCc(i,4)+Bhg(i,3)],...
                     [(RNCc(i,3)+dp1+Bhg(i,2)),(RNCc(i,3)+dp2+Bhg(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                   
                  Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+dp1+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+dp1+Bhg(i,2); ...
                     RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+dp1+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+dp1+Bhg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;                  
               elseif LNC(i,6) > 0
                  plot3(axesm,[RNCc(i,2)+Bhg(i,1),RNCc(i,2)+Bhg(i,1) ],[RNCc(i,4)+Bhg(i,3),RNCc(i,4)+Bhg(i,3)],...
                     [(RNCc(i,3)-dp1+Bhg(i,2)),(RNCc(i,3)-dp2+Bhg(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                          
                  Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-dp1+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-dp1+Bhg(i,2); ...
                     RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-dp1+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-dp1+Bhg(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;            
               end 
            elseif isequal(LNC(i,13),4) % Centroid
               if LNC(i,6) < 0
                  plot3(axesm,[RNCc(i,2)+CSg(i,1),RNCc(i,2)+CSg(i,1) ],[RNCc(i,4)+CSg(i,3),RNCc(i,4)+CSg(i,3)],...
                     [(RNCc(i,3)+dp1+CSg(i,2)),(RNCc(i,3)+dp2+CSg(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                   
                  Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+dp1+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+dp1+CSg(i,2); ...
                     RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+dp1+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+dp1+CSg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;                  
               elseif LNC(i,6) > 0
                  plot3(axesm,[RNCc(i,2)+CSg(i,1),RNCc(i,2)+CSg(i,1) ],[RNCc(i,4)+CSg(i,3),RNCc(i,4)+CSg(i,3)],...
                     [(RNCc(i,3)-dp1+CSg(i,2)),(RNCc(i,3)-dp2+CSg(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                          
                  Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-dp1+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-dp1+CSg(i,2); ...
                     RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-dp1+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-dp1+CSg(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;            
               end                
            end
         end

         if ~isequal(LNC(i,7),0) % Force z-axis  
            if isequal(LNC(i,13),1) || isequal(LNC(i,13),0) % Shear center
               if LNC(i,7) > 0
                  plot3(axesm,[RNCc(i,2),RNCc(i,2) ],[(RNCc(i,4)+dp1),(RNCc(i,4)+dp2)],[RNCc(i,3),RNCc(i,3)],...
                     'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                   
                  Sco = [RNCc(i,2),RNCc(i,4)+dp1,RNCc(i,3); RNCc(i,2),RNCc(i,4)+dp1,RNCc(i,3); ...
                     RNCc(i,2),RNCc(i,4)+dp1,RNCc(i,3); RNCc(i,2),RNCc(i,4)+dp1,RNCc(i,3)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;                                   
               elseif LNC(i,7) < 0
                  plot3(axesm,[RNCc(i,2),RNCc(i,2) ],[(RNCc(i,4)-dp1),(RNCc(i,4)-dp2)],[RNCc(i,3),RNCc(i,3)],...
                     'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                   
                  Sco = [RNCc(i,2),RNCc(i,4)-dp1,RNCc(i,3); RNCc(i,2),RNCc(i,4)-dp1,RNCc(i,3); ...
                     RNCc(i,2),RNCc(i,4)-dp1,RNCc(i,3); RNCc(i,2),RNCc(i,4)-dp1,RNCc(i,3)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;            
               end 
            elseif isequal(LNC(i,13),2) % Top flange        
               if LNC(i,7) > 0
                  plot3(axesm,[RNCc(i,2)+Thg(i,1),RNCc(i,2)+Thg(i,1) ],[(RNCc(i,4)+dp1+Thg(i,3)),(RNCc(i,4)+dp2+Thg(i,3))],...
                     [RNCc(i,3)+Thg(i,2),RNCc(i,3)+Thg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on; 
                  Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)+dp1+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+dp1+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)+Thg(i,1),RNCc(i,4)+dp1+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+dp1+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;                   
               elseif LNC(i,7) < 0
                  plot3(axesm,[RNCc(i,2)+Thg(i,1),RNCc(i,2)+Thg(i,1) ],[(RNCc(i,4)-dp1+Thg(i,3)),(RNCc(i,4)-dp2+Thg(i,3))],...
                     [RNCc(i,3)+Thg(i,2),RNCc(i,3)+Thg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on; 
                  Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)-dp1+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)-dp1+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)+Thg(i,1),RNCc(i,4)-dp1+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)-dp1+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;              
               end  
            elseif isequal(LNC(i,13),3) % Bottom flange
               if LNC(i,7) > 0
                  plot3(axesm,[RNCc(i,2)+Bhg(i,1),RNCc(i,2)+Bhg(i,1) ],[(RNCc(i,4)+dp1+Bhg(i,3)),(RNCc(i,4)+dp2+Bhg(i,3))],...
                     [RNCc(i,3)+Bhg(i,2),RNCc(i,3)+Bhg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on; 
                  Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)+dp1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+dp1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)+Bhg(i,1),RNCc(i,4)+dp1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+dp1+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;                   
               elseif LNC(i,7) < 0
                  plot3(axesm,[RNCc(i,2)+Bhg(i,1),RNCc(i,2)+Bhg(i,1) ],[(RNCc(i,4)-dp1+Bhg(i,3)),(RNCc(i,4)-dp2+Bhg(i,3))],...
                     [RNCc(i,3)+Bhg(i,2),RNCc(i,3)+Bhg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on; 
                  Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)-dp1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)-dp1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)+Bhg(i,1),RNCc(i,4)-dp1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)-dp1+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;              
               end  
            elseif isequal(LNC(i,13),4) % Centroid
               if LNC(i,7) > 0
                  plot3(axesm,[RNCc(i,2)+CSg(i,1),RNCc(i,2)+CSg(i,1) ],[(RNCc(i,4)+dp1+CSg(i,3)),(RNCc(i,4)+dp2+CSg(i,3))],...
                     [RNCc(i,3)+CSg(i,2),RNCc(i,3)+CSg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on; 
                  Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)+dp1+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+dp1+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)+CSg(i,1),RNCc(i,4)+dp1+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+dp1+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;                   
               elseif LNC(i,7) < 0
                  plot3(axesm,[RNCc(i,2)+CSg(i,1),RNCc(i,2)+CSg(i,1) ],[(RNCc(i,4)-dp1+CSg(i,3)),(RNCc(i,4)-dp2+CSg(i,3))],...
                     [RNCc(i,3)+CSg(i,2),RNCc(i,3)+CSg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on; 
                  Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)-dp1+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)-dp1+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)+CSg(i,1),RNCc(i,4)-dp1+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)-dp1+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;              
               end                
            end
         end
         
         if ~isequal(LNC(i,8),0) % Torsion
            if isequal(LNC(i,13),1) || isequal(LNC(i,13),0) % Shear center
               plot3(axesm,z+RNCc(i,2),x+RNCc(i,4),y+RNCc(i,3),'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LNC',num2str(i)],'linewidth',lt);
               hold on;
               if LNC(i,8) > 0
                  Sco = [RNCc(i,2),RNCc(i,4),RNCc(i,3)-prd; RNCc(i,2),RNCc(i,4),RNCc(i,3)-prd; ...
                     RNCc(i,2),RNCc(i,4),RNCc(i,3)-prd; RNCc(i,2),RNCc(i,4),RNCc(i,3)-prd];
                  Nro = [0,-sqrt(2),-sqrt(2)/2; 0,0,0; 0,-sqrt(2),sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;                    
               elseif LNC(i,8) < 0
                  Sco = [RNCc(i,2),RNCc(i,4)+prd,RNCc(i,3); RNCc(i,2),RNCc(i,4)+prd,RNCc(i,3); ...
                     RNCc(i,2),RNCc(i,4)+prd,RNCc(i,3); RNCc(i,2),RNCc(i,4)+prd,RNCc(i,3)];
                  Nro = [0,-sqrt(2)/2,sqrt(2); 0,0,0; 0,sqrt(2)/2,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;            
               end    
            elseif isequal(LNC(i,13),2) % Top flange
                plot3(axesm,z+RNCc(i,2)+Thg(i,1),x+RNCc(i,4)+Thg(i,3),y+RNCc(i,3)+Thg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LNC',num2str(i)],'linewidth',lt);
               hold on;
               if LNC(i,8) > 0
                  Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-prd+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-prd+Thg(i,2); ...
                     RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-prd+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-prd+Thg(i,2)];
                  Nro = [0,-sqrt(2),-sqrt(2)/2; 0,0,0; 0,-sqrt(2),sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;                    
               elseif LNC(i,8) < 0
                  Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)+prd+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+prd+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)+Thg(i,1),RNCc(i,4)+prd+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+prd+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [0,-sqrt(2)/2,sqrt(2); 0,0,0; 0,sqrt(2)/2,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;                              
               end  
            elseif isequal(LNC(i,13),3) % Bottom flange
                plot3(axesm,z+RNCc(i,2)+Bhg(i,1),x+RNCc(i,4)+Bhg(i,3),y+RNCc(i,3)+Bhg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LNC',num2str(i)],'linewidth',lt);
               hold on;
               if LNC(i,8) > 0
                  Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-prd+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-prd+Bhg(i,2); ...
                     RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-prd+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-prd+Bhg(i,2)];
                  Nro = [0,-sqrt(2),-sqrt(2)/2; 0,0,0; 0,-sqrt(2),sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on; 
               elseif LNC(i,8) < 0
                  Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)+prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)+Bhg(i,1),RNCc(i,4)+prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [0,-sqrt(2)/2,sqrt(2); 0,0,0; 0,sqrt(2)/2,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;           
               end   
            elseif isequal(LNC(i,13),4) % Centroid
                plot3(axesm,z+RNCc(i,2)+CSg(i,1),x+RNCc(i,4)+CSg(i,3),y+RNCc(i,3)+CSg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LNC',num2str(i)],'linewidth',lt);
               hold on;
               if LNC(i,8) > 0
                  Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-prd+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-prd+CSg(i,2); ...
                     RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-prd+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-prd+CSg(i,2)];
                  Nro = [0,-sqrt(2),-sqrt(2)/2; 0,0,0; 0,-sqrt(2),sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on; 
               elseif LNC(i,8) < 0
                  Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)+prd+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+prd+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)+CSg(i,1),RNCc(i,4)+prd+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+prd+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [0,-sqrt(2)/2,sqrt(2); 0,0,0; 0,sqrt(2)/2,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;           
               end                
            end
         end

         if ~isequal(LNC(i,9),0) % Moment y-axis
            if isequal(LNC(i,13),1) || isequal(LNC(i,13),0) % Shear center
               if LNC(i,9) > 0
                  plot3(axesm,x+RNCc(i,2),y+RNCc(i,4),z+RNCc(i,3),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                  
                  Sco = [RNCc(i,2),RNCc(i,4)-prd,RNCc(i,3); RNCc(i,2),RNCc(i,4)-prd,RNCc(i,3); ...
                     RNCc(i,2),RNCc(i,4)-prd,RNCc(i,3); RNCc(i,2),RNCc(i,4)-prd,RNCc(i,3)];
                  Nro = [-sqrt(2),-sqrt(2)/2,0; 0,0,0; -sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;                                      
               elseif LNC(i,9) < 0
                  plot3(axesm,x1+RNCc(i,2),y1+RNCc(i,4),z+RNCc(i,3),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                  
                  Sco = [RNCc(i,2),RNCc(i,4)-prd,RNCc(i,3); RNCc(i,2),RNCc(i,4)-prd,RNCc(i,3); ...
                     RNCc(i,2),RNCc(i,4)-prd,RNCc(i,3); RNCc(i,2),RNCc(i,4)-prd,RNCc(i,3)];
                  Nro = [sqrt(2),-sqrt(2)/2,0; 0,0,0; sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;                                              
               end 
            elseif isequal(LNC(i,13),2) % Top flange
               if LNC(i,9) > 0
                  plot3(axesm,x+RNCc(i,2)+Thg(i,1),y+RNCc(i,4)+Thg(i,3),z+RNCc(i,3)+Thg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                  
                  Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)-prd+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)-prd+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)+Thg(i,1),RNCc(i,4)-prd+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)-prd+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [-sqrt(2),-sqrt(2)/2,0; 0,0,0; -sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;                     
               elseif LNC(i,9) < 0
                  plot3(axesm,x1+RNCc(i,2)+Thg(i,1),y1+RNCc(i,4)+Thg(i,3),z+RNCc(i,3)+Thg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                   
                  Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)-prd+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)-prd+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)+Thg(i,1),RNCc(i,4)-prd+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)-prd+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [sqrt(2),-sqrt(2)/2,0; 0,0,0; sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;             
               end                
            elseif isequal(LNC(i,13),3) % Bottom flange
               if LNC(i,9) > 0
                  plot3(axesm,x+RNCc(i,2)+Bhg(i,1),y+RNCc(i,4)+Bhg(i,3),z+RNCc(i,3)+Bhg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                  
                  Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)-prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)-prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)+Bhg(i,1),RNCc(i,4)-prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)-prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [-sqrt(2),-sqrt(2)/2,0; 0,0,0; -sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on; 
               elseif LNC(i,9) < 0
                  plot3(axesm,x1+RNCc(i,2)+Bhg(i,1),y1+RNCc(i,4)+Bhg(i,3),z+RNCc(i,3)+Bhg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                    
                  Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)-prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)-prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)+Bhg(i,1),RNCc(i,4)-prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)-prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [sqrt(2),-sqrt(2)/2,0; 0,0,0; sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;           
               end   
            elseif isequal(LNC(i,13),4) % Centroid
               if LNC(i,9) > 0
                  plot3(axesm,x+RNCc(i,2)+CSg(i,1),y+RNCc(i,4)+CSg(i,3),z+RNCc(i,3)+CSg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                  
                  Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)-prd+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)-prd+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)+CSg(i,1),RNCc(i,4)-prd+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)-prd+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [-sqrt(2),-sqrt(2)/2,0; 0,0,0; -sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on; 
               elseif LNC(i,9) < 0
                  plot3(axesm,x1+RNCc(i,2)+CSg(i,1),y1+RNCc(i,4)+CSg(i,3),z+RNCc(i,3)+CSg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                    
                  Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)-prd+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)-prd+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)+CSg(i,1),RNCc(i,4)-prd+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)-prd+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [sqrt(2),-sqrt(2)/2,0; 0,0,0; sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;           
               end                
            end 
         end

         if ~isequal(LNC(i,10),0) % Moment z-axis
            if isequal(LNC(i,13),1) || isequal(LNC(i,13),0) % Shear center
               if LNC(i,10) > 0
                  plot3(axesm,x1+RNCc(i,2),z+RNCc(i,4),y1+RNCc(i,3),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                    
                  Sco = [RNCc(i,2)-prd,RNCc(i,4),RNCc(i,3); RNCc(i,2)-prd,RNCc(i,4),RNCc(i,3); ...
                     RNCc(i,2)-prd,RNCc(i,4),RNCc(i,3); RNCc(i,2)-prd,RNCc(i,4),RNCc(i,3)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;                    
               elseif LNC(i,10) < 0
                  plot3(axesm,x+RNCc(i,2),z+RNCc(i,4),y+RNCc(i,3),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                  
                  Sco = [RNCc(i,2)+prd,RNCc(i,4),RNCc(i,3); RNCc(i,2)+prd,RNCc(i,4),RNCc(i,3); ...
                     RNCc(i,2)+prd,RNCc(i,4),RNCc(i,3); RNCc(i,2)+prd,RNCc(i,4),RNCc(i,3)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;             
               end              
            elseif isequal(LNC(i,13),2) % Top flange
               if LNC(i,10) > 0
                  plot3(axesm,x1+RNCc(i,2)+Thg(i,1),z+RNCc(i,4)+Thg(i,3),y1+RNCc(i,3)+Thg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                    
                  Sco = [RNCc(i,2)-prd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-prd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)-prd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-prd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on; 
               elseif LNC(i,10) < 0
                  plot3(axesm,x+RNCc(i,2)+Thg(i,1),z+RNCc(i,4)+Thg(i,3),y+RNCc(i,3)+Thg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                  
                  Sco = [RNCc(i,2)+prd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+prd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)+prd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+prd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;            
               end   
            elseif isequal(LNC(i,13),3) % Bottom flange
               if LNC(i,10) > 0
                  plot3(axesm,x1+RNCc(i,2)+Bhg(i,1),z+RNCc(i,4)+Bhg(i,3),y1+RNCc(i,3)+Bhg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                    
                  Sco = [RNCc(i,2)-prd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-prd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)-prd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-prd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on; 
               elseif LNC(i,10) < 0
                  plot3(axesm,x+RNCc(i,2)+Bhg(i,1),z+RNCc(i,4)+Bhg(i,3),y+RNCc(i,3)+Bhg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                  
                  Sco = [RNCc(i,2)+prd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+prd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)+prd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+prd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;            
               end    
            elseif isequal(LNC(i,13),4) % Centroid
               if LNC(i,10) > 0
                  plot3(axesm,x1+RNCc(i,2)+CSg(i,1),z+RNCc(i,4)+CSg(i,3),y1+RNCc(i,3)+CSg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                    
                  Sco = [RNCc(i,2)-prd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-prd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)-prd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-prd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on; 
               elseif LNC(i,10) < 0
                  plot3(axesm,x+RNCc(i,2)+CSg(i,1),z+RNCc(i,4)+CSg(i,3),y+RNCc(i,3)+CSg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt);
                  hold on;                  
                  Sco = [RNCc(i,2)+prd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+prd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)+prd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+prd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off'); 
                  hold on;            
               end                  
            end
         end               
      end
      else
         for i=1:length(RNCc(:,1))
            delete(findobj('Tag',['LNC',num2str(i)])); 
         end            
      end % LabType(1,9)
   end      

   % ---------------------------------------------------------------------
   % ----------------      Plot Distributed Load      --------------------
   % ---------------------------------------------------------------------       
   du1=xa*0.01;
   du2=xa*0.6;   
   if isequal(xa,mDg)
      dps = xa*0.1;
   else
      dps = xa*0.14;   
   end   
   % Drawing Loading Nodal points
   if isempty(DUP1) || isempty(LUEC)
   else
      if isequal(LabType(1,10),0)
      for i=1:length(DUP1(:,1))
         if ~isequal(LUEC(i,5),0) % Distributed load x-axis
            if isequal(LUEC(i,17),1) || isequal(LUEC(i,17),0) % Shear center         
               plot3(axesm,[(Nshe1(i,1)+du1),(Nshe1(i,1)+du2)],[Nshe1(i,3),Nshe1(i,3) ],[Nshe1(i,2),Nshe1(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,[(Nshe2(i,1)+du1),(Nshe2(i,1)+du2)],[Nshe2(i,3),Nshe2(i,3) ],[Nshe2(i,2),Nshe2(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;            
               plot3(axesm,[(Nshe1(i,1)+du2),(Nshe2(i,1)+du2) ],[Nshe1(i,3),Nshe2(i,3)],[Nshe1(i,2),Nshe2(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               if LUEC(i,5) < 0
                  Sco = [Nshe1(i,1)+du1,Nshe1(i,3),Nshe1(i,2); Nshe1(i,1)+du1,Nshe1(i,3),Nshe1(i,2); ...
                     Nshe1(i,1)+du1,Nshe1(i,3),Nshe1(i,2); Nshe1(i,1)+du1,Nshe1(i,3),Nshe1(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+du1,Nshe2(i,3),Nshe2(i,2); Nshe2(i,1)+du1,Nshe2(i,3),Nshe2(i,2); ...
                     Nshe2(i,1)+du1,Nshe2(i,3),Nshe2(i,2); Nshe2(i,1)+du1,Nshe2(i,3),Nshe2(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                                
               elseif LUEC(i,5) > 0
                  Sco = [Nshe1(i,1)+du2,Nshe1(i,3),Nshe1(i,2); Nshe1(i,1)+du2,Nshe1(i,3),Nshe1(i,2); ...
                     Nshe1(i,1)+du2,Nshe1(i,3),Nshe1(i,2); Nshe1(i,1)+du2,Nshe1(i,3),Nshe1(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+du2,Nshe2(i,3),Nshe2(i,2); Nshe2(i,1)+du2,Nshe2(i,3),Nshe2(i,2); ...
                     Nshe2(i,1)+du2,Nshe2(i,3),Nshe2(i,2); Nshe2(i,1)+du2,Nshe2(i,3),Nshe2(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                                   
               end 

            elseif isequal(LUEC(i,17),2) % Top flange          
               plot3(axesm,[(Nshe1(i,1)+du1+The1(i,1)),(Nshe1(i,1)+du2+The1(i,1))],...
                  [Nshe1(i,3)+The1(i,3),Nshe1(i,3)+The1(i,3) ],[Nshe1(i,2)+The1(i,2),Nshe1(i,2)+The1(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,[(Nshe2(i,1)+du1+The2(i,1)),(Nshe2(i,1)+du2+The2(i,1))],...
                  [Nshe2(i,3)+The2(i,3),Nshe2(i,3)+The2(i,3) ],[Nshe2(i,2)+The2(i,2),Nshe2(i,2)+The2(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;            
               plot3(axesm,[(Nshe1(i,1)+du2+The1(i,1)),(Nshe2(i,1)+du2+The2(i,1)) ],...
                  [Nshe1(i,3)+The1(i,3),Nshe2(i,3)+The2(i,3)],[Nshe1(i,2)+The1(i,2),Nshe2(i,2)+The2(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               if LUEC(i,5) < 0
                  Sco = [Nshe1(i,1)+du1+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+The1(i,2); Nshe1(i,1)+du1+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+The1(i,2); ...
                     Nshe1(i,1)+du1+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+The1(i,2); Nshe1(i,1)+du1+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+The1(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+du1+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+The2(i,2); Nshe2(i,1)+du1+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+The2(i,2); ...
                     Nshe2(i,1)+du1+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+The2(i,2); Nshe2(i,1)+du1+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+The2(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                                                   
               elseif LUEC(i,5) > 0
                  Sco = [Nshe1(i,1)+du2+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+The1(i,2); Nshe1(i,1)+du2+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+The1(i,2); ...
                     Nshe1(i,1)+du2+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+The1(i,2); Nshe1(i,1)+du2+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+The1(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+du2+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+The2(i,2); Nshe2(i,1)+du2+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+The2(i,2); ...
                     Nshe2(i,1)+du2+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+The2(i,2); Nshe2(i,1)+du2+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+The2(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                   
               end
               
            elseif isequal(LUEC(i,17),3) % Bottom flange              
               plot3(axesm,[(Nshe1(i,1)+du1+Bhe1(i,1)),(Nshe1(i,1)+du2+Bhe1(i,1))],...
                  [Nshe1(i,3)+Bhe1(i,3),Nshe1(i,3)+Bhe1(i,3) ],[Nshe1(i,2)+Bhe1(i,2),Nshe1(i,2)+Bhe1(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,[(Nshe2(i,1)+du1+Bhe2(i,1)),(Nshe2(i,1)+du2+Bhe2(i,1))],...
                  [Nshe2(i,3)+Bhe2(i,3),Nshe2(i,3)+Bhe2(i,3) ],[Nshe2(i,2)+Bhe2(i,2),Nshe2(i,2)+Bhe2(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;            
               plot3(axesm,[(Nshe1(i,1)+du2+Bhe1(i,1)),(Nshe2(i,1)+du2+Bhe2(i,1)) ],...
                  [Nshe1(i,3)+Bhe1(i,3),Nshe2(i,3)+Bhe2(i,3)],[Nshe1(i,2)+Bhe1(i,2),Nshe2(i,2)+Bhe2(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               if LUEC(i,5) < 0
                  Sco = [Nshe1(i,1)+du1+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2); Nshe1(i,1)+du1+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2); ...
                     Nshe1(i,1)+du1+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2); Nshe1(i,1)+du1+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+du1+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2); Nshe2(i,1)+du1+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2); ...
                     Nshe2(i,1)+du1+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2); Nshe2(i,1)+du1+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                              
               elseif LUEC(i,5) > 0
                  Sco = [Nshe1(i,1)+du2+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2); Nshe1(i,1)+du2+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2); ...
                     Nshe1(i,1)+du2+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2); Nshe1(i,1)+du2+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+du2+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2); Nshe2(i,1)+du2+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2); ...
                     Nshe2(i,1)+du2+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2); Nshe2(i,1)+du2+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                               
               end   
            elseif isequal(LUEC(i,17),4) % Centroid              
               plot3(axesm,[(Nshe1(i,1)+du1+SGhe1(i,1)),(Nshe1(i,1)+du2+SGhe1(i,1))],...
                  [Nshe1(i,3)+SGhe1(i,3),Nshe1(i,3)+SGhe1(i,3) ],[Nshe1(i,2)+SGhe1(i,2),Nshe1(i,2)+SGhe1(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,[(Nshe2(i,1)+du1+SGhe2(i,1)),(Nshe2(i,1)+du2+SGhe2(i,1))],...
                  [Nshe2(i,3)+SGhe2(i,3),Nshe2(i,3)+SGhe2(i,3) ],[Nshe2(i,2)+SGhe2(i,2),Nshe2(i,2)+SGhe2(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;            
               plot3(axesm,[(Nshe1(i,1)+du2+SGhe1(i,1)),(Nshe2(i,1)+du2+SGhe2(i,1)) ],...
                  [Nshe1(i,3)+SGhe1(i,3),Nshe2(i,3)+SGhe2(i,3)],[Nshe1(i,2)+SGhe1(i,2),Nshe2(i,2)+SGhe2(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               if LUEC(i,5) < 0
                  Sco = [Nshe1(i,1)+du1+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2); Nshe1(i,1)+du1+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2); ...
                     Nshe1(i,1)+du1+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2); Nshe1(i,1)+du1+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+du1+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2); Nshe2(i,1)+du1+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2); ...
                     Nshe2(i,1)+du1+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2); Nshe2(i,1)+du1+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                              
               elseif LUEC(i,5) > 0
                  Sco = [Nshe1(i,1)+du2+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2); Nshe1(i,1)+du2+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2); ...
                     Nshe1(i,1)+du2+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2); Nshe1(i,1)+du2+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+du2+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2); Nshe2(i,1)+du2+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2); ...
                     Nshe2(i,1)+du2+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2); Nshe2(i,1)+du2+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                               
               end     
            elseif isequal(LUEC(i,17),5) % Mid-Web              
               plot3(axesm,[(Nshe1(i,1)+du1+Mhe1(i,1)),(Nshe1(i,1)+du2+Mhe1(i,1))],...
                  [Nshe1(i,3)+Mhe1(i,3),Nshe1(i,3)+Mhe1(i,3) ],[Nshe1(i,2)+Mhe1(i,2),Nshe1(i,2)+Mhe1(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,[(Nshe2(i,1)+du1+Mhe2(i,1)),(Nshe2(i,1)+du2+Mhe2(i,1))],...
                  [Nshe2(i,3)+Mhe2(i,3),Nshe2(i,3)+Mhe2(i,3) ],[Nshe2(i,2)+Mhe2(i,2),Nshe2(i,2)+Mhe2(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;            
               plot3(axesm,[(Nshe1(i,1)+du2+Mhe1(i,1)),(Nshe2(i,1)+du2+Mhe2(i,1)) ],...
                  [Nshe1(i,3)+Mhe1(i,3),Nshe2(i,3)+Mhe2(i,3)],[Nshe1(i,2)+Mhe1(i,2),Nshe2(i,2)+Mhe2(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               if LUEC(i,5) < 0
                  Sco = [Nshe1(i,1)+du1+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2); Nshe1(i,1)+du1+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2); ...
                     Nshe1(i,1)+du1+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2); Nshe1(i,1)+du1+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+du1+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2); Nshe2(i,1)+du1+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2); ...
                     Nshe2(i,1)+du1+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2); Nshe2(i,1)+du1+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                              
               elseif LUEC(i,5) > 0
                  Sco = [Nshe1(i,1)+du2+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2); Nshe1(i,1)+du2+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2); ...
                     Nshe1(i,1)+du2+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2); Nshe1(i,1)+du2+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+du2+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2); Nshe2(i,1)+du2+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2); ...
                     Nshe2(i,1)+du2+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2); Nshe2(i,1)+du2+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                               
               end                
            end
         end
 
         if ~isequal(LUEC(i,6),0) % Distributed load y-axis
            if isequal(LUEC(i,17),1) || isequal(LUEC(i,17),0) % Shear Center
               plot3(axesm,[Nshe1(i,1),Nshe1(i,1) ],[Nshe1(i,3),Nshe1(i,3)],[(Nshe1(i,2)+du1),(Nshe1(i,2)+du2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,[Nshe2(i,1),Nshe2(i,1) ],[Nshe2(i,3),Nshe2(i,3)],[(Nshe2(i,2)+du1),(Nshe2(i,2)+du2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,[Nshe1(i,1),Nshe2(i,1) ],[Nshe1(i,3),Nshe2(i,3)],[(Nshe1(i,2)+du2),(Nshe2(i,2)+du2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               if LUEC(i,6) < 0
                  Sco = [Nshe1(i,1),Nshe1(i,3),Nshe1(i,2)+du1; Nshe1(i,1),Nshe1(i,3),Nshe1(i,2)+du1; ...
                     Nshe1(i,1),Nshe1(i,3),Nshe1(i,2)+du1; Nshe1(i,1),Nshe1(i,3),Nshe1(i,2)+du1];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1),Nshe2(i,3),Nshe2(i,2)+du1; Nshe2(i,1),Nshe2(i,3),Nshe2(i,2)+du1; ...
                     Nshe2(i,1),Nshe2(i,3),Nshe2(i,2)+du1; Nshe2(i,1),Nshe2(i,3),Nshe2(i,2)+du1];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                   
             
               elseif LUEC(i,6) > 0
                  Sco = [Nshe1(i,1),Nshe1(i,3),Nshe1(i,2)+du2; Nshe1(i,1),Nshe1(i,3),Nshe1(i,2)+du2; ...
                     Nshe1(i,1),Nshe1(i,3),Nshe1(i,2)+du2; Nshe1(i,1),Nshe1(i,3),Nshe1(i,2)+du2];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1),Nshe2(i,3),Nshe2(i,2)+du2; Nshe2(i,1),Nshe2(i,3),Nshe2(i,2)+du2; ...
                     Nshe2(i,1),Nshe2(i,3),Nshe2(i,2)+du2; Nshe2(i,1),Nshe2(i,3),Nshe2(i,2)+du2];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                
               end  
   
            elseif isequal(LUEC(i,17),2) % Top flange
               plot3(axesm,[Nshe1(i,1)+The1(i,1),Nshe1(i,1)+The1(i,1) ],[Nshe1(i,3)+The1(i,3),Nshe1(i,3)+The1(i,3)],...
                  [(Nshe1(i,2)+du1+The1(i,2)),(Nshe1(i,2)+du2+The1(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,[Nshe2(i,1)+The2(i,1),Nshe2(i,1)+The2(i,1) ],[Nshe2(i,3)+The2(i,3),Nshe2(i,3)+The2(i,3)],...
                  [(Nshe2(i,2)+du1+The2(i,2)),(Nshe2(i,2)+du2+The2(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,[Nshe1(i,1)+The1(i,1),Nshe2(i,1)+The2(i,1)],[Nshe1(i,3)+The1(i,3),Nshe2(i,3)+The2(i,3)],...
                  [(Nshe1(i,2)+du2+The1(i,2)),(Nshe2(i,2)+du2+The2(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                               
               if LUEC(i,6) < 0
                  Sco = [Nshe1(i,1)+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+du1+The1(i,2); Nshe1(i,1)+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+du1+The1(i,2); ...
                     Nshe1(i,1)+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+du1+The1(i,2); Nshe1(i,1)+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+du1+The1(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+du1+The2(i,2); Nshe2(i,1)+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+du1+The2(i,2); ...
                     Nshe2(i,1)+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+du1+The2(i,2); Nshe2(i,1)+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+du1+The2(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                
               elseif LUEC(i,6) > 0
                  Sco = [Nshe1(i,1)+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+du2+The1(i,2); Nshe1(i,1)+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+du2+The1(i,2); ...
                     Nshe1(i,1)+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+du2+The1(i,2); Nshe1(i,1)+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+du2+The1(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+du2+The2(i,2); Nshe2(i,1)+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+du2+The2(i,2); ...
                     Nshe2(i,1)+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+du2+The2(i,2); Nshe2(i,1)+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+du2+The2(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                 
               end                 
               
            elseif isequal(LUEC(i,17),3) % Bottom flange
               plot3(axesm,[Nshe1(i,1)+Bhe1(i,1),Nshe1(i,1)+Bhe1(i,1) ],[Nshe1(i,3)+Bhe1(i,3),Nshe1(i,3)+Bhe1(i,3)],...
                  [(Nshe1(i,2)+du1+Bhe1(i,2)),(Nshe1(i,2)+du2+Bhe1(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,[Nshe2(i,1)+Bhe2(i,1),Nshe2(i,1)+Bhe2(i,1) ],[Nshe2(i,3)+Bhe2(i,3),Nshe2(i,3)+Bhe2(i,3)],...
                  [(Nshe2(i,2)+du1+Bhe2(i,2)),(Nshe2(i,2)+du2+Bhe2(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,[Nshe1(i,1)+Bhe1(i,1),Nshe2(i,1)+Bhe2(i,1)],[Nshe1(i,3)+Bhe1(i,3),Nshe2(i,3)+Bhe2(i,3)],...
                  [(Nshe1(i,2)+du2+Bhe1(i,2)),(Nshe2(i,2)+du2+Bhe2(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               if LUEC(i,6) < 0
                  Sco = [Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+du1+Bhe1(i,2); Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+du1+Bhe1(i,2); ...
                     Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+du1+Bhe1(i,2); Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+du1+Bhe1(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+du1+Bhe2(i,2); Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+du1+Bhe2(i,2); ...
                     Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+du1+Bhe2(i,2); Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+du1+Bhe2(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                
               elseif LUEC(i,6) > 0
                  Sco = [Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+du2+Bhe1(i,2); Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+du2+Bhe1(i,2); ...
                     Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+du2+Bhe1(i,2); Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+du2+Bhe1(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+du2+Bhe2(i,2); Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+du2+Bhe2(i,2); ...
                     Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+du2+Bhe2(i,2); Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+du2+Bhe2(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                 
               end    
               
            elseif isequal(LUEC(i,17),4) % Centroid
               plot3(axesm,[Nshe1(i,1)+SGhe1(i,1),Nshe1(i,1)+SGhe1(i,1) ],[Nshe1(i,3)+SGhe1(i,3),Nshe1(i,3)+SGhe1(i,3)],...
                  [(Nshe1(i,2)+du1+SGhe1(i,2)),(Nshe1(i,2)+du2+SGhe1(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,[Nshe2(i,1)+SGhe2(i,1),Nshe2(i,1)+SGhe2(i,1) ],[Nshe2(i,3)+SGhe2(i,3),Nshe2(i,3)+SGhe2(i,3)],...
                  [(Nshe2(i,2)+du1+SGhe2(i,2)),(Nshe2(i,2)+du2+SGhe2(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,[Nshe1(i,1)+SGhe1(i,1),Nshe2(i,1)+SGhe2(i,1)],[Nshe1(i,3)+SGhe1(i,3),Nshe2(i,3)+SGhe2(i,3)],...
                  [(Nshe1(i,2)+du2+SGhe1(i,2)),(Nshe2(i,2)+du2+SGhe2(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               if LUEC(i,6) < 0
                  Sco = [Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+du1+SGhe1(i,2); Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+du1+SGhe1(i,2); ...
                     Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+du1+SGhe1(i,2); Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+du1+SGhe1(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+du1+SGhe2(i,2); Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+du1+SGhe2(i,2); ...
                     Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+du1+SGhe2(i,2); Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+du1+SGhe2(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                
               elseif LUEC(i,6) > 0
                  Sco = [Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+du2+SGhe1(i,2); Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+du2+SGhe1(i,2); ...
                     Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+du2+SGhe1(i,2); Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+du2+SGhe1(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+du2+SGhe2(i,2); Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+du2+SGhe2(i,2); ...
                     Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+du2+SGhe2(i,2); Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+du2+SGhe2(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                 
               end   
            elseif isequal(LUEC(i,17),5) % Mid-Web
               plot3(axesm,[Nshe1(i,1)+Mhe1(i,1),Nshe1(i,1)+Mhe1(i,1) ],[Nshe1(i,3)+Mhe1(i,3),Nshe1(i,3)+Mhe1(i,3)],...
                  [(Nshe1(i,2)+du1+Mhe1(i,2)),(Nshe1(i,2)+du2+Mhe1(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,[Nshe2(i,1)+Mhe2(i,1),Nshe2(i,1)+Mhe2(i,1) ],[Nshe2(i,3)+Mhe2(i,3),Nshe2(i,3)+Mhe2(i,3)],...
                  [(Nshe2(i,2)+du1+Mhe2(i,2)),(Nshe2(i,2)+du2+Mhe2(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,[Nshe1(i,1)+Mhe1(i,1),Nshe2(i,1)+Mhe2(i,1)],[Nshe1(i,3)+Mhe1(i,3),Nshe2(i,3)+Mhe2(i,3)],...
                  [(Nshe1(i,2)+du2+Mhe1(i,2)),(Nshe2(i,2)+du2+Mhe2(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               if LUEC(i,6) < 0
                  Sco = [Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+du1+Mhe1(i,2); Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+du1+Mhe1(i,2); ...
                     Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+du1+Mhe1(i,2); Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+du1+Mhe1(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+du1+Mhe2(i,2); Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+du1+Mhe2(i,2); ...
                     Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+du1+Mhe2(i,2); Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+du1+Mhe2(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                
               elseif LUEC(i,6) > 0
                  Sco = [Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+du2+Mhe1(i,2); Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+du2+Mhe1(i,2); ...
                     Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+du2+Mhe1(i,2); Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+du2+Mhe1(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+du2+Mhe2(i,2); Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+du2+Mhe2(i,2); ...
                     Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+du2+Mhe2(i,2); Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+du2+Mhe2(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                 
               end               
            end
         end

         if ~isequal(LUEC(i,7),0)   % Distributed load z-axis
            if isequal(LUEC(i,17),1) || isequal(LUEC(i,17),0) % Shear center
               plot3(axesm,[Nshe1(i,1),Nshe1(i,1) ],[(Nshe1(i,3)+du1),(Nshe1(i,3)+du2)],[Nshe1(i,2),Nshe1(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               plot3(axesm,[Nshe2(i,1),Nshe2(i,1) ],[(Nshe2(i,3)+du1),(Nshe2(i,3)+du2)],[Nshe2(i,2),Nshe2(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               plot3(axesm,[Nshe1(i,1),Nshe2(i,1) ],[(Nshe1(i,3)+du2),(Nshe2(i,3)+du2)],[Nshe1(i,2),Nshe2(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;  
               if LUEC(i,7) > 0
                  Sco = [Nshe1(i,1),Nshe1(i,3)+du1,Nshe1(i,2); Nshe1(i,1),Nshe1(i,3)+du1,Nshe1(i,2); ...
                     Nshe1(i,1),Nshe1(i,3)+du1,Nshe1(i,2); Nshe1(i,1),Nshe1(i,3)+du1,Nshe1(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1),Nshe2(i,3)+du1,Nshe2(i,2); Nshe2(i,1),Nshe2(i,3)+du1,Nshe2(i,2); ...
                     Nshe2(i,1),Nshe2(i,3)+du1,Nshe2(i,2); Nshe2(i,1),Nshe2(i,3)+du1,Nshe2(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                    
             
               elseif LUEC(i,7) < 0
                  Sco = [Nshe1(i,1),Nshe1(i,3)+du2,Nshe1(i,2); Nshe1(i,1),Nshe1(i,3)+du2,Nshe1(i,2); ...
                     Nshe1(i,1),Nshe1(i,3)+du2,Nshe1(i,2); Nshe1(i,1),Nshe1(i,3)+du2,Nshe1(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1),Nshe2(i,3)+du2,Nshe2(i,2); Nshe2(i,1),Nshe2(i,3)+du2,Nshe2(i,2); ...
                     Nshe2(i,1),Nshe2(i,3)+du2,Nshe2(i,2); Nshe2(i,1),Nshe2(i,3)+du2,Nshe2(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                 
               end 
 
            elseif isequal(LUEC(i,17),2) % Top flange
               plot3(axesm,[Nshe1(i,1)+The1(i,1),Nshe1(i,1)+The1(i,1) ],[(Nshe1(i,3)+du1+The1(i,3)),...
                  (Nshe1(i,3)+du2+The1(i,3))],[Nshe1(i,2)+The1(i,2),Nshe1(i,2)+The1(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               plot3(axesm,[Nshe2(i,1)+The2(i,1),Nshe2(i,1)+The2(i,1) ],[(Nshe2(i,3)+du1+The2(i,3)),...
                  (Nshe2(i,3)+du2+The2(i,3))],[Nshe2(i,2)+The2(i,2),Nshe2(i,2)+The2(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               plot3(axesm,[Nshe1(i,1)+The1(i,1),Nshe2(i,1)+The2(i,1) ],[(Nshe1(i,3)+du2+The1(i,3)),...
                  (Nshe2(i,3)+du2+The2(i,3))],[Nshe1(i,2)+The1(i,2),Nshe2(i,2)+The2(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;  
               if LUEC(i,7) > 0
                  Sco = [Nshe1(i,1)+The1(i,1),Nshe1(i,3)+du1+The1(i,3),Nshe1(i,2)+The1(i,2); Nshe1(i,1)+The1(i,1),Nshe1(i,3)+du1+The1(i,3),Nshe1(i,2)+The1(i,2); ...
                     Nshe1(i,1)+The1(i,1),Nshe1(i,3)+du1+The1(i,3),Nshe1(i,2)+The1(i,2); Nshe1(i,1)+The1(i,1),Nshe1(i,3)+du1+The1(i,3),Nshe1(i,2)+The1(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+The2(i,1),Nshe2(i,3)+du1+The2(i,3),Nshe2(i,2)+The2(i,2); Nshe2(i,1)+The2(i,1),Nshe2(i,3)+du1+The2(i,3),Nshe2(i,2)+The2(i,2); ...
                     Nshe2(i,1)+The2(i,1),Nshe2(i,3)+du1+The2(i,3),Nshe2(i,2)+The2(i,2); Nshe2(i,1)+The2(i,1),Nshe2(i,3)+du1+The2(i,3),Nshe2(i,2)+The2(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                 
               elseif LUEC(i,7) < 0
                  Sco = [Nshe1(i,1)+The1(i,1),Nshe1(i,3)+du2+The1(i,3),Nshe1(i,2)+The1(i,2); Nshe1(i,1)+The1(i,1),Nshe1(i,3)+du2+The1(i,3),Nshe1(i,2)+The1(i,2); ...
                     Nshe1(i,1)+The1(i,1),Nshe1(i,3)+du2+The1(i,3),Nshe1(i,2)+The1(i,2); Nshe1(i,1)+The1(i,1),Nshe1(i,3)+du2+The1(i,3),Nshe1(i,2)+The1(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+The2(i,1),Nshe2(i,3)+du2+The2(i,3),Nshe2(i,2)+The2(i,2); Nshe2(i,1)+The2(i,1),Nshe2(i,3)+du2+The2(i,3),Nshe2(i,2)+The2(i,2); ...
                     Nshe2(i,1)+The2(i,1),Nshe2(i,3)+du2+The2(i,3),Nshe2(i,2)+The2(i,2); Nshe2(i,1)+The2(i,1),Nshe2(i,3)+du2+The2(i,3),Nshe2(i,2)+The2(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;              
               end 
               
            elseif isequal(LUEC(i,17),3) % Bottom flange
               plot3(axesm,[Nshe1(i,1)+Bhe1(i,1),Nshe1(i,1)+Bhe1(i,1) ],[(Nshe1(i,3)+du1+Bhe1(i,3)),...
                  (Nshe1(i,3)+du2+Bhe1(i,3))],[Nshe1(i,2)+Bhe1(i,2),Nshe1(i,2)+Bhe1(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               plot3(axesm,[Nshe2(i,1)+Bhe2(i,1),Nshe2(i,1)+Bhe2(i,1) ],[(Nshe2(i,3)+du1+Bhe2(i,3)),...
                  (Nshe2(i,3)+du2+Bhe2(i,3))],[Nshe2(i,2)+Bhe2(i,2),Nshe2(i,2)+Bhe2(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               plot3(axesm,[Nshe1(i,1)+Bhe1(i,1),Nshe2(i,1)+Bhe2(i,1) ],[(Nshe1(i,3)+du2+Bhe1(i,3)),...
                  (Nshe2(i,3)+du2+Bhe2(i,3))],[Nshe1(i,2)+Bhe1(i,2),Nshe2(i,2)+Bhe2(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;  
               if LUEC(i,7) > 0
                  Sco = [Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+du1+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2); Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+du1+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2); ...
                     Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+du1+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2); Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+du1+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+du1+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2); Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+du1+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2); ...
                     Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+du1+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2); Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+du1+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                 
               elseif LUEC(i,7) < 0
                  Sco = [Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+du2+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2); Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+du2+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2); ...
                     Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+du2+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2); Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+du2+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+du2+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2); Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+du2+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2); ...
                     Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+du2+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2); Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+du2+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;              
               end                
 
            elseif isequal(LUEC(i,17),4) % Centorid
               plot3(axesm,[Nshe1(i,1)+SGhe1(i,1),Nshe1(i,1)+SGhe1(i,1) ],[(Nshe1(i,3)+du1+SGhe1(i,3)),...
                  (Nshe1(i,3)+du2+SGhe1(i,3))],[Nshe1(i,2)+SGhe1(i,2),Nshe1(i,2)+SGhe1(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               plot3(axesm,[Nshe2(i,1)+SGhe2(i,1),Nshe2(i,1)+SGhe2(i,1) ],[(Nshe2(i,3)+du1+SGhe2(i,3)),...
                  (Nshe2(i,3)+du2+SGhe2(i,3))],[Nshe2(i,2)+SGhe2(i,2),Nshe2(i,2)+SGhe2(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               plot3(axesm,[Nshe1(i,1)+SGhe1(i,1),Nshe2(i,1)+SGhe2(i,1) ],[(Nshe1(i,3)+du2+SGhe1(i,3)),...
                  (Nshe2(i,3)+du2+SGhe2(i,3))],[Nshe1(i,2)+SGhe1(i,2),Nshe2(i,2)+SGhe2(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;  
               if LUEC(i,7) > 0
                  Sco = [Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+du1+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2); Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+du1+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2); ...
                     Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+du1+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2); Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+du1+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+du1+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2); Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+du1+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2); ...
                     Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+du1+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2); Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+du1+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                 
               elseif LUEC(i,7) < 0
                  Sco = [Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+du2+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2); Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+du2+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2); ...
                     Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+du2+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2); Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+du2+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+du2+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2); Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+du2+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2); ...
                     Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+du2+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2); Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+du2+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;              
               end   
            elseif isequal(LUEC(i,17),5) % Web-Dep
               plot3(axesm,[Nshe1(i,1)+Mhe1(i,1),Nshe1(i,1)+Mhe1(i,1) ],[(Nshe1(i,3)+du1+Mhe1(i,3)),...
                  (Nshe1(i,3)+du2+Mhe1(i,3))],[Nshe1(i,2)+Mhe1(i,2),Nshe1(i,2)+Mhe1(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               plot3(axesm,[Nshe2(i,1)+Mhe2(i,1),Nshe2(i,1)+Mhe2(i,1) ],[(Nshe2(i,3)+du1+Mhe2(i,3)),...
                  (Nshe2(i,3)+du2+Mhe2(i,3))],[Nshe2(i,2)+Mhe2(i,2),Nshe2(i,2)+Mhe2(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               plot3(axesm,[Nshe1(i,1)+Mhe1(i,1),Nshe2(i,1)+Mhe2(i,1) ],[(Nshe1(i,3)+du2+Mhe1(i,3)),...
                  (Nshe2(i,3)+du2+Mhe2(i,3))],[Nshe1(i,2)+Mhe1(i,2),Nshe2(i,2)+Mhe2(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;  
               if LUEC(i,7) > 0
                  Sco = [Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+du1+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2); Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+du1+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2); ...
                     Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+du1+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2); Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+du1+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+du1+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2); Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+du1+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2); ...
                     Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+du1+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2); Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+du1+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                 
               elseif LUEC(i,7) < 0
                  Sco = [Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+du2+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2); Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+du2+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2); ...
                     Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+du2+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2); Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+du2+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+du2+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2); Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+du2+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2); ...
                     Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+du2+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2); Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+du2+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;              
               end                  
            end
         end
         
      end
      else
         for i=1:length(DUP1(:,1))
            delete(findobj('Tag',['LUEC',num2str(i)])); 
         end         
      end % LabType(1,10)
   end            
         
   % ---------------------------------------------------------------------
   % ----------        Plot Boundary Conditions       --------------------
   % ---------------------------------------------------------------------     
   frd = xa*0.4;
   df1=xa*0.01;
   df2=xa*0.8;   
   if isequal(xa,mDg)
      dfs = xa*0.09;
   else
      dfs = xa*0.13;   
   end
   t = linspace(0,3*pi/2,10000);
   x = xa*0.4*cos(t);                  
   y = xa*0.4*sin(t);   
   z = 0*sin(t);
   t1 = linspace(-pi/2,2*pi/2,10000);
   x1 = xa*0.4*cos(t1);                  
   y1 = xa*0.4*sin(t1);    
   % Drawing Loading Nodal points
   if isempty(RNCc) || isempty(PNC)
   else
      if isequal(LabType(1,5),0)
      for i=1:length(RNCc(:,1))
         if ~isequal(PNC(i,5),0) % Fixed x-axis
            if isequal(PNC(i,13),1) || isequal(PNC(i,13),0) % Shear center 
               plot3(axesm,[(RNCc(i,2)-df1), (RNCc(i,2)-df2)],[RNCc(i,4),RNCc(i,4)],[RNCc(i,3),RNCc(i,3)],...
                  'HitTest','off','Color','m','Tag',['PNC',num2str(i)],'linewidth',lt);
               hold on;                   
               Sco = [RNCc(i,2)-df1,RNCc(i,4),RNCc(i,3); RNCc(i,2)-df1,RNCc(i,4),RNCc(i,3); ...
                  RNCc(i,2)-df1,RNCc(i,4),RNCc(i,3); RNCc(i,2)-df1,RNCc(i,4),RNCc(i,3)];
               Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off'); 
               hold on;                                
            elseif isequal(PNC(i,13),2) % Top flange 
               plot3(axesm,[(RNCc(i,2)-df1+Thg(i,1)), (RNCc(i,2)-df2+Thg(i,1))],...
                  [RNCc(i,4)+Thg(i,3),RNCc(i,4)+Thg(i,3)],[RNCc(i,3)+Thg(i,2),RNCc(i,3)+Thg(i,2)],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt);
               hold on;                  
               Sco = [RNCc(i,2)-df1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-df1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                  RNCc(i,2)-df1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-df1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2)];
               Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off'); 
               hold on;                
             elseif isequal(PNC(i,13),3) % Bottom flange   
               plot3(axesm,[(RNCc(i,2)-df1+Bhg(i,1)), (RNCc(i,2)-df2+Bhg(i,1))],...
                  [RNCc(i,4)+Bhg(i,3),RNCc(i,4)+Bhg(i,3)],[RNCc(i,3)+Bhg(i,2),RNCc(i,3)+Bhg(i,2)],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt);
               hold on;                     
               Sco = [RNCc(i,2)-df1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-df1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                  RNCc(i,2)-df1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-df1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
               Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off'); 
               hold on;    
             elseif isequal(PNC(i,13),4) % Centroid   
               plot3(axesm,[(RNCc(i,2)-df1+CSg(i,1)), (RNCc(i,2)-df2+CSg(i,1))],...
                  [RNCc(i,4)+CSg(i,3),RNCc(i,4)+CSg(i,3)],[RNCc(i,3)+CSg(i,2),RNCc(i,3)+CSg(i,2)],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt);
               hold on;                     
               Sco = [RNCc(i,2)-df1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-df1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                  RNCc(i,2)-df1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-df1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2)];
               Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off'); 
               hold on;                
            end
         end

         if ~isequal(PNC(i,6),0) % Fixed y-axis
            if isequal(PNC(i,13),1) || isequal(PNC(i,13),0) % Shear center 
               plot3(axesm,[RNCc(i,2),RNCc(i,2) ],[RNCc(i,4),RNCc(i,4)],[(RNCc(i,3)-df1),(RNCc(i,3)-df2)],...
                  'HitTest','off','Color','m','Tag',['PNC',num2str(i)],'linewidth',lt);
               hold on;                   
               Sco = [RNCc(i,2),RNCc(i,4),RNCc(i,3)-df1; RNCc(i,2),RNCc(i,4),RNCc(i,3)-df1; ...
                  RNCc(i,2),RNCc(i,4),RNCc(i,3)-df1; RNCc(i,2),RNCc(i,4),RNCc(i,3)-df1];
               Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dfs; 
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off'); 
               hold on;                          
            elseif isequal(PNC(i,13),2) % Top flange    
               plot3(axesm,[RNCc(i,2)+Thg(i,1),RNCc(i,2)+Thg(i,1) ],[RNCc(i,4)+Thg(i,3),RNCc(i,4)+Thg(i,3)],...
                  [(RNCc(i,3)-df1+Thg(i,2)),(RNCc(i,3)-df2+Thg(i,2))],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt);
               hold on;                      
               Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-df1+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-df1+Thg(i,2); ...
                  RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-df1+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-df1+Thg(i,2)];
               Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dfs; 
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off'); 
               hold on;                 
            elseif isequal(PNC(i,13),3) % Bottom flange   
               plot3(axesm,[RNCc(i,2)+Bhg(i,1),RNCc(i,2)+Bhg(i,1) ],[RNCc(i,4)+Bhg(i,3),RNCc(i,4)+Bhg(i,3)],...
                  [(RNCc(i,3)-df1+Bhg(i,2)),(RNCc(i,3)-df2+Bhg(i,2))],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt);
               hold on;                          
               Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-df1+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-df1+Bhg(i,2); ...
                  RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-df1+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-df1+Bhg(i,2)];
               Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dfs; 
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off'); 
               hold on;   
            elseif isequal(PNC(i,13),4) % Centroid   
               plot3(axesm,[RNCc(i,2)+CSg(i,1),RNCc(i,2)+CSg(i,1) ],[RNCc(i,4)+CSg(i,3),RNCc(i,4)+CSg(i,3)],...
                  [(RNCc(i,3)-df1+CSg(i,2)),(RNCc(i,3)-df2+CSg(i,2))],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt);
               hold on;                          
               Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-df1+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-df1+CSg(i,2); ...
                  RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-df1+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-df1+CSg(i,2)];
               Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dfs; 
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off'); 
               hold on;                  
            end 
         end

         if ~isequal(PNC(i,7),0) % Fixed z-axis 
            if isequal(PNC(i,13),1) || isequal(PNC(i,13),0)  % Shear center 
               plot3(axesm,[RNCc(i,2),RNCc(i,2) ],[(RNCc(i,4)+df1),(RNCc(i,4)+df2)],[RNCc(i,3),RNCc(i,3)],...
                  'HitTest','off','Color','m','Tag',['PNC',num2str(i)],'linewidth',lt);
               hold on;                   
               Sco = [RNCc(i,2),RNCc(i,4)+df1,RNCc(i,3); RNCc(i,2),RNCc(i,4)+df1,RNCc(i,3); ...
                  RNCc(i,2),RNCc(i,4)+df1,RNCc(i,3); RNCc(i,2),RNCc(i,4)+df1,RNCc(i,3)];
               Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off'); 
               hold on;                   
            elseif isequal(PNC(i,13),2) % Top flange
               plot3(axesm,[RNCc(i,2)+Thg(i,1),RNCc(i,2)+Thg(i,1) ],[(RNCc(i,4)+df1+Thg(i,3)),(RNCc(i,4)+df2+Thg(i,3))],...
                  [RNCc(i,3)+Thg(i,2),RNCc(i,3)+Thg(i,2)],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt);
               hold on; 
               Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)+df1+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+df1+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                  RNCc(i,2)+Thg(i,1),RNCc(i,4)+df1+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+df1+Thg(i,3),RNCc(i,3)+Thg(i,2)];
               Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off'); 
               hold on;                 
            elseif isequal(PNC(i,13),3) % Bottom flange
               plot3(axesm,[RNCc(i,2)+Bhg(i,1),RNCc(i,2)+Bhg(i,1) ],[(RNCc(i,4)+df1+Bhg(i,3)),(RNCc(i,4)+df2+Bhg(i,3))],...
                  [RNCc(i,3)+Bhg(i,2),RNCc(i,3)+Bhg(i,2)],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt);
               hold on; 
               Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)+df1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+df1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                  RNCc(i,2)+Bhg(i,1),RNCc(i,4)+df1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+df1+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
               Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off'); 
               hold on;   
            elseif isequal(PNC(i,13),4) % Centroid
               plot3(axesm,[RNCc(i,2)+CSg(i,1),RNCc(i,2)+CSg(i,1) ],[(RNCc(i,4)+df1+CSg(i,3)),(RNCc(i,4)+df2+CSg(i,3))],...
                  [RNCc(i,3)+CSg(i,2),RNCc(i,3)+CSg(i,2)],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt);
               hold on; 
               Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)+df1+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+df1+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                  RNCc(i,2)+CSg(i,1),RNCc(i,4)+df1+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+df1+CSg(i,3),RNCc(i,3)+CSg(i,2)];
               Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off'); 
               hold on;                
            end
         end

         if ~isequal(PNC(i,8),0) % Fixed Torsion
            if isequal(PNC(i,13),1) || isequal(PNC(i,13),0) % Shear center
               plot3(axesm,z+RNCc(i,2),x+RNCc(i,4),y+RNCc(i,3),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt);
               hold on;                 
               Sco = [RNCc(i,2),RNCc(i,4),RNCc(i,3)-frd; RNCc(i,2),RNCc(i,4),RNCc(i,3)-frd; ...
                  RNCc(i,2),RNCc(i,4),RNCc(i,3)-frd; RNCc(i,2),RNCc(i,4),RNCc(i,3)-frd]; 
               Nro = [0,-sqrt(2),-sqrt(2)/2; 0,0,0; 0,-sqrt(2),sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off'); 
               hold on; 
                  
            elseif isequal(PNC(i,13),2) % Top flange
               plot3(axesm,z+RNCc(i,2)+Thg(i,1),x+RNCc(i,4)+Thg(i,3),y+RNCc(i,3)+Thg(i,2),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt);
               hold on;
               Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-frd+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-frd+Thg(i,2); ...
                  RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-frd+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-frd+Thg(i,2)];    
               Nro = [0,-sqrt(2),-sqrt(2)/2; 0,0,0; 0,-sqrt(2),sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off'); 
               hold on;   
               
            elseif isequal(PNC(i,13),3) % Bottom flange
               plot3(axesm,z+RNCc(i,2)+Bhg(i,1),x+RNCc(i,4)+Bhg(i,3),y+RNCc(i,3)+Bhg(i,2),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt);
               hold on;
               Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-frd+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-frd+Bhg(i,2); ...
                  RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-frd+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-frd+Bhg(i,2)];  
               Nro = [0,-sqrt(2),-sqrt(2)/2; 0,0,0; 0,-sqrt(2),sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off'); 
               hold on;       
               
            elseif isequal(PNC(i,13),4) % Centroid
               plot3(axesm,z+RNCc(i,2)+CSg(i,1),x+RNCc(i,4)+CSg(i,3),y+RNCc(i,3)+CSg(i,2),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt);
               hold on;
               Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-frd+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-frd+CSg(i,2); ...
                  RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-frd+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-frd+CSg(i,2)];  
               Nro = [0,-sqrt(2),-sqrt(2)/2; 0,0,0; 0,-sqrt(2),sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off'); 
               hold on;                
            end
         end

         if ~isequal(PNC(i,9),0) % Fixed Moment y-axis
            if isequal(PNC(i,13),1) || isequal(PNC(i,13),0) % Shear center
               plot3(axesm,x+RNCc(i,2),y+RNCc(i,4),z+RNCc(i,3),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt);
               hold on;                
               Sco = [RNCc(i,2),RNCc(i,4)-frd,RNCc(i,3); RNCc(i,2),RNCc(i,4)-frd,RNCc(i,3); ...
                  RNCc(i,2),RNCc(i,4)-frd,RNCc(i,3); RNCc(i,2),RNCc(i,4)-frd,RNCc(i,3)];
               Nro = [-sqrt(2),-sqrt(2)/2,0; 0,0,0; -sqrt(2),sqrt(2)/2,0; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off'); 
               hold on;  
            elseif isequal(PNC(i,13),2) % Top flange
               plot3(axesm,x+RNCc(i,2)+Thg(i,1),y+RNCc(i,4)+Thg(i,3),z+RNCc(i,3)+Thg(i,2),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt);
               hold on;                   
               Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)-frd+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)-frd+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                  RNCc(i,2)+Thg(i,1),RNCc(i,4)-frd+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)-frd+Thg(i,3),RNCc(i,3)+Thg(i,2)];
               Nro = [-sqrt(2),-sqrt(2)/2,0; 0,0,0; -sqrt(2),sqrt(2)/2,0; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off'); 
               hold on;  
            elseif isequal(PNC(i,13),3) % Bottom flange
               plot3(axesm,x+RNCc(i,2)+Bhg(i,1),y+RNCc(i,4)+Bhg(i,3),z+RNCc(i,3)+Bhg(i,2),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt);
               hold on;                    
               Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)-frd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)-frd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                  RNCc(i,2)+Bhg(i,1),RNCc(i,4)-frd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)-frd+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
               Nro = [-sqrt(2),-sqrt(2)/2,0; 0,0,0; -sqrt(2),sqrt(2)/2,0; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off'); 
               hold on;     
            elseif isequal(PNC(i,13),4) % Centroid
               plot3(axesm,x+RNCc(i,2)+CSg(i,1),y+RNCc(i,4)+CSg(i,3),z+RNCc(i,3)+CSg(i,2),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt);
               hold on;                    
               Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)-frd+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)-frd+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                  RNCc(i,2)+CSg(i,1),RNCc(i,4)-frd+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)-frd+CSg(i,3),RNCc(i,3)+CSg(i,2)];
               Nro = [-sqrt(2),-sqrt(2)/2,0; 0,0,0; -sqrt(2),sqrt(2)/2,0; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off'); 
               hold on;                
            end
         end
         
         if ~isequal(PNC(i,10),0) % Moment z-axis
            if isequal(PNC(i,13),1) || isequal(PNC(i,13),0) % Shear center
               plot3(axesm,x1+RNCc(i,2),z+RNCc(i,4),y1+RNCc(i,3),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt);
               hold on;                    
               Sco = [RNCc(i,2)-frd,RNCc(i,4),RNCc(i,3); RNCc(i,2)-frd,RNCc(i,4),RNCc(i,3); ...
                  RNCc(i,2)-frd,RNCc(i,4),RNCc(i,3); RNCc(i,2)-frd,RNCc(i,4),RNCc(i,3)];
               Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off'); 
               hold on;   
            elseif isequal(PNC(i,13),2) % Top flange
               plot3(axesm,x1+RNCc(i,2)+Thg(i,1),z+RNCc(i,4)+Thg(i,3),y1+RNCc(i,3)+Thg(i,2),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt);
               hold on;                    
               Sco = [RNCc(i,2)-frd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-frd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                  RNCc(i,2)-frd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-frd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2)];
               Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off'); 
               hold on; 
            elseif isequal(PNC(i,13),3) % Bottom flange
               plot3(axesm,x1+RNCc(i,2)+Bhg(i,1),z+RNCc(i,4)+Bhg(i,3),y1+RNCc(i,3)+Bhg(i,2),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt);
               hold on;                    
               Sco = [RNCc(i,2)-frd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-frd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                  RNCc(i,2)-frd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-frd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
               Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off'); 
               hold on;    
            elseif isequal(PNC(i,13),4) % Centroid
               plot3(axesm,x1+RNCc(i,2)+CSg(i,1),z+RNCc(i,4)+CSg(i,3),y1+RNCc(i,3)+CSg(i,2),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt);
               hold on;                    
               Sco = [RNCc(i,2)-frd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-frd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                  RNCc(i,2)-frd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-frd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2)];
               Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off'); 
               hold on;                 
            end
         end 
         if ~isequal(PNC(i,11),0)        
            plot3(axesm,RNCc(i,2),RNCc(i,4)+df1,RNCc(i,3),'MarkerFaceColor','m',...
               'HitTest','off','Marker','square','Color','m','MarkerSize',xb*1.25,'Tag',['PNC',num2str(i)]);
            hold on;            
         end             
      end
      elseif isequal(LabType(1,5),2)
      for i=1:length(RNCc(:,1))
         if ~isequal(PNC(i,5),0) % Fixed x-axis
            if isequal(PNC(i,13),1) || isequal(PNC(i,13),0) % Shear center 
               plot3(axesm,[(RNCc(i,2)-df1), (RNCc(i,2)-df2)],[RNCc(i,4),RNCc(i,4)],[RNCc(i,3),RNCc(i,3)],...
                  'HitTest','off','Color','m','Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                   
               Sco = [RNCc(i,2)-df1,RNCc(i,4),RNCc(i,3); RNCc(i,2)-df1,RNCc(i,4),RNCc(i,3); ...
                  RNCc(i,2)-df1,RNCc(i,4),RNCc(i,3); RNCc(i,2)-df1,RNCc(i,4),RNCc(i,3)];
               Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                                
            elseif isequal(PNC(i,13),2) % Top flange 
               plot3(axesm,[(RNCc(i,2)-df1+Thg(i,1)), (RNCc(i,2)-df2+Thg(i,1))],...
                  [RNCc(i,4)+Thg(i,3),RNCc(i,4)+Thg(i,3)],[RNCc(i,3)+Thg(i,2),RNCc(i,3)+Thg(i,2)],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                  
               Sco = [RNCc(i,2)-df1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-df1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                  RNCc(i,2)-df1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-df1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2)];
               Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                
             elseif isequal(PNC(i,13),3) % Bottom flange   
               plot3(axesm,[(RNCc(i,2)-df1+Bhg(i,1)), (RNCc(i,2)-df2+Bhg(i,1))],...
                  [RNCc(i,4)+Bhg(i,3),RNCc(i,4)+Bhg(i,3)],[RNCc(i,3)+Bhg(i,2),RNCc(i,3)+Bhg(i,2)],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                     
               Sco = [RNCc(i,2)-df1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-df1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                  RNCc(i,2)-df1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-df1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
               Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;    
             elseif isequal(PNC(i,13),4) % Centroid   
               plot3(axesm,[(RNCc(i,2)-df1+CSg(i,1)), (RNCc(i,2)-df2+CSg(i,1))],...
                  [RNCc(i,4)+CSg(i,3),RNCc(i,4)+CSg(i,3)],[RNCc(i,3)+CSg(i,2),RNCc(i,3)+CSg(i,2)],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                     
               Sco = [RNCc(i,2)-df1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-df1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                  RNCc(i,2)-df1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-df1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2)];
               Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                
            end
         end

         if ~isequal(PNC(i,6),0) % Fixed y-axis
            if isequal(PNC(i,13),1) || isequal(PNC(i,13),0) % Shear center 
               plot3(axesm,[RNCc(i,2),RNCc(i,2) ],[RNCc(i,4),RNCc(i,4)],[(RNCc(i,3)-df1),(RNCc(i,3)-df2)],...
                  'HitTest','off','Color','m','Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                   
               Sco = [RNCc(i,2),RNCc(i,4),RNCc(i,3)-df1; RNCc(i,2),RNCc(i,4),RNCc(i,3)-df1; ...
                  RNCc(i,2),RNCc(i,4),RNCc(i,3)-df1; RNCc(i,2),RNCc(i,4),RNCc(i,3)-df1];
               Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dfs; 
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                          
            elseif isequal(PNC(i,13),2) % Top flange    
               plot3(axesm,[RNCc(i,2)+Thg(i,1),RNCc(i,2)+Thg(i,1) ],[RNCc(i,4)+Thg(i,3),RNCc(i,4)+Thg(i,3)],...
                  [(RNCc(i,3)-df1+Thg(i,2)),(RNCc(i,3)-df2+Thg(i,2))],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                      
               Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-df1+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-df1+Thg(i,2); ...
                  RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-df1+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-df1+Thg(i,2)];
               Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dfs; 
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                 
            elseif isequal(PNC(i,13),3) % Bottom flange   
               plot3(axesm,[RNCc(i,2)+Bhg(i,1),RNCc(i,2)+Bhg(i,1) ],[RNCc(i,4)+Bhg(i,3),RNCc(i,4)+Bhg(i,3)],...
                  [(RNCc(i,3)-df1+Bhg(i,2)),(RNCc(i,3)-df2+Bhg(i,2))],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                          
               Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-df1+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-df1+Bhg(i,2); ...
                  RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-df1+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-df1+Bhg(i,2)];
               Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dfs; 
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;   
            elseif isequal(PNC(i,13),4) % Centroid   
               plot3(axesm,[RNCc(i,2)+CSg(i,1),RNCc(i,2)+CSg(i,1) ],[RNCc(i,4)+CSg(i,3),RNCc(i,4)+CSg(i,3)],...
                  [(RNCc(i,3)-df1+CSg(i,2)),(RNCc(i,3)-df2+CSg(i,2))],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                          
               Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-df1+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-df1+CSg(i,2); ...
                  RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-df1+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-df1+CSg(i,2)];
               Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dfs; 
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                  
            end 
         end
         
         if ~isequal(PNC(i,10),0) % Moment z-axis
            if isequal(PNC(i,13),1) || isequal(PNC(i,13),0) % Shear center
               plot3(axesm,x1+RNCc(i,2),z+RNCc(i,4),y1+RNCc(i,3),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                    
               Sco = [RNCc(i,2)-frd,RNCc(i,4),RNCc(i,3); RNCc(i,2)-frd,RNCc(i,4),RNCc(i,3); ...
                  RNCc(i,2)-frd,RNCc(i,4),RNCc(i,3); RNCc(i,2)-frd,RNCc(i,4),RNCc(i,3)];
               Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;   
            elseif isequal(PNC(i,13),2) % Top flange
               plot3(axesm,x1+RNCc(i,2)+Thg(i,1),z+RNCc(i,4)+Thg(i,3),y1+RNCc(i,3)+Thg(i,2),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                    
               Sco = [RNCc(i,2)-frd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-frd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                  RNCc(i,2)-frd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-frd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2)];
               Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on; 
            elseif isequal(PNC(i,13),3) % Bottom flange
               plot3(axesm,x1+RNCc(i,2)+Bhg(i,1),z+RNCc(i,4)+Bhg(i,3),y1+RNCc(i,3)+Bhg(i,2),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                    
               Sco = [RNCc(i,2)-frd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-frd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                  RNCc(i,2)-frd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-frd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
               Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;    
            elseif isequal(PNC(i,13),4) % Centroid
               plot3(axesm,x1+RNCc(i,2)+CSg(i,1),z+RNCc(i,4)+CSg(i,3),y1+RNCc(i,3)+CSg(i,2),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                    
               Sco = [RNCc(i,2)-frd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-frd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                  RNCc(i,2)-frd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-frd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2)];
               Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                 
            end
         end            
      end       
      else
         for i=1:length(RNCc(:,1))
            delete(findobj('Tag',['PNC',num2str(i)])); 
         end             
      end % LabType(1,5)
   end      
  
   
   % ---------------------------------------------------------------------
   % ----------              Plot Flexure             --------------------
   % --------------------------------------------------------------------- 
   % Nodes for each element (# ele, #node start, #node end)
   MI=[DUP1(:,1),DUP1(:,2),DUP2(:,2)];

   % Global frame coordinates at each element.
   % Start node : node(1) and end node : node(2) for each element
   xg1=Nshe1(:,1);xg2=Nshe2(:,1);  % element length : xg1(start) xg2(end)
   yg1=Nshe1(:,2);yg2=Nshe2(:,2);  % element length : xg1(start) xg2(end)
   zg1=Nshe1(:,3);zg2=Nshe2(:,3);  % element length : xg1(start) xg2(end)
   xn=length(MI(:,1));
   % Calculate Initial Element Length for longitudianl direction.
   [DX]=InitialEleLength(xn,xg1,yg1,zg1,xg2,yg2,zg2);   
   
   xl=min(max(RNCc(:,11)),min(min(DX(:,1))/10,xa*0.25));
   FPe1=zeros(xn,3);FPe2=zeros(xn,3);
   for i = 1:xn 
      Rz=[cos(alphatap(i,2)) -sin(alphatap(i,2)) 0; ...
      sin(alphatap(i,2)) cos(alphatap(i,2)) 0; ...
      0 0 1];
   
      FP1=[xl,0,0]; FP1=Rz*FP1'; FPe1(i,:)=FP1';
      FP2=[-xl,0,0]; FP2=Rz*FP2'; FPe2(i,:)=FP2';             
   end   

   % Drawing Loading Nodal points
   if isempty(Nshe1) || isempty(FEL)
   else
      if isequal(LabType(1,8),0)
      for i=1:length(MI(:,1))
         if isequal(FEL(i,2),2)
               plot3(axesm,Nshe1(i,1)+FPe1(i,1)+EGunew_ux1(i,1),Nshe1(i,3)+FPe1(i,3)+EGunew_uz1(i,1),Nshe1(i,2)+FPe1(i,2)+EGunew_uy1(i,1),...
                  'HitTest','off','Marker','d','Color',[0.7 0.5 0],'MarkerSize',xf,'Tag',['FELi',num2str(i)],'linewidth',lt);
               hold on;                
         end
         
         if isequal(FEL(i,3),2)
               plot3(axesm,Nshe2(i,1)+FPe2(i,1)+EGunew_ux2(i,1),Nshe2(i,3)+FPe2(i,3)+EGunew_uz2(i,1),Nshe2(i,2)+FPe2(i,2)+EGunew_uy2(i,1),...
                  'HitTest','off','Marker','d','Color',[0.7 0.5 0],'MarkerSize',xf,'Tag',['FELj',num2str(i)],'linewidth',lt);
               hold on;             
         end
 
         if isequal(FEL(i,4),2)
               plot3(axesm,Nshe1(i,1)+FPe1(i,1)+EGunew_ux1(i,1),Nshe1(i,3)+FPe1(i,3)+EGunew_uz1(i,1),Nshe1(i,2)+FPe1(i,2)+EGunew_uy1(i,1),...
                  'HitTest','off','Marker','o','Color',[0 0.5 0.7],'MarkerSize',xf,'Tag',['FELi',num2str(i)],'linewidth',lt);
               hold on;                
         end
         
         if isequal(FEL(i,5),2)
               plot3(axesm,Nshe2(i,1)+FPe2(i,1)+EGunew_ux2(i,1),Nshe2(i,3)+FPe2(i,3)+EGunew_uz2(i,1),Nshe2(i,2)+FPe2(i,2)+EGunew_uy2(i,1),...
                  'HitTest','off','Marker','o','Color',[0 0.5 0.7],'MarkerSize',xf,'Tag',['FELj',num2str(i)],'linewidth',lt);
               hold on;             
         end         
         
         if isequal(FEL(i,6),2)
               plot3(axesm,Nshe1(i,1)+FPe1(i,1)+EGunew_ux1(i,1),Nshe1(i,3)+FPe1(i,3)+EGunew_uz1(i,1),Nshe1(i,2)+FPe1(i,2)+EGunew_uy1(i,1),...
                  'HitTest','off','Marker','o','Color',[0.7 0.5 0],'MarkerSize',xf,'Tag',['FELi',num2str(i)],'linewidth',lt);
               hold on;                
         end
         
         if isequal(FEL(i,7),2)
               plot3(axesm,Nshe2(i,1)+FPe2(i,1)+EGunew_ux2(i,1),Nshe2(i,3)+FPe2(i,3)+EGunew_uz2(i,1),Nshe2(i,2)+FPe2(i,2)+EGunew_uy2(i,1),...
                  'HitTest','off','Marker','o','Color',[0.7 0.5 0],'MarkerSize',xf,'Tag',['FELj',num2str(i)],'linewidth',lt);
               hold on;             
         end         

         if isequal(FEL(i,8),2)
               plot3(axesm,Nshe1(i,1)+FPe1(i,1)+EGunew_ux1(i,1),Nshe1(i,3)+FPe1(i,3)+EGunew_uz1(i,1),Nshe1(i,2)+FPe1(i,2)+EGunew_uy1(i,1),...
                  'HitTest','off','Marker','square','Color',[0.7 0.5 0],'MarkerSize',xf*2,'Tag',['FELi',num2str(i)],'linewidth',lt);
               hold on;             
         end
         
         if isequal(FEL(i,9),2)
               plot3(axesm,Nshe2(i,1)+FPe2(i,1)+EGunew_ux2(i,1),Nshe2(i,3)+FPe2(i,3)+EGunew_uz2(i,1),Nshe2(i,2)+FPe2(i,2)+EGunew_uy2(i,1),...
                  'HitTest','off','Marker','square','Color',[0.7 0.5 0],'MarkerSize',xf*2,'Tag',['FELj',num2str(i)],'linewidth',lt);
               hold on;             
         end
         
      end
      else
         for i=1:length(MI(:,1))
            delete(findobj('Tag',['FELi',num2str(i)])); 
            delete(findobj('Tag',['FELj',num2str(i)])); 
         end           
      end % LabType(1,8)
   end       
%-------------------------- 


      case 'undeformed3d_off' 
         delete(findobj('Tag','PNC'));
   end   
   
end % if JNodevalue end

% 3D View
az = -37.5; el = 30; view(az, el);

axis manual;   
set(axesm,'Visible','off','Units','normalized','DataAspectRatio',[1 1 1]) 
set( gca, 'Units', 'normalized', 'Position', [0 0 0.9 1] ); 

if isequal(AR,1)
   set(pt_title_name,'String',['Deflected Shape, Scale Factor = ',num2str(Dscale)]) 
   set(pt_title_name,'Visible','on')
elseif isequal(AS,1)
   set(pt_title_name,'String',['Deflected Shape, Scale Factor = ',num2str(Dscale)]) 
   set(pt_title_name,'Visible','on')
elseif isequal(AE,1) 
   if isequal(LIAType,0)
      set(pt_title_name,'String',['Elastic Linear Buckling Analysis Results. Mode = ',num2str(IncreL),'. Applied Load Ratio = ',num2str(gammma(1,1))]) 
      set(pt_title_name,'Visible','on')     
   elseif isequal(LIAType,1)
      set(pt_title_name,'String',['Elastic Linear Buckling Analysis Results. Mode = ',num2str(IncreL),'. Applied Load Ratio = ',num2str(gammma(1,1))]) 
      set(pt_title_name,'Visible','on')         
   end         
elseif isequal(AI,2) || isequal(AI,1) || isequal(AI,3)
   if isequal(LIAType,0)
      if isequal(crLTB,1)
         set(pt_title_name,'String',['Inelastic Linear Buckling Analysis Results (Current Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1)),' (FLB)',...
            '.  Applied Load Ratio =',num2str(LGv),' (Buckling)']) 
      elseif isequal(crLTB,2)
         set(pt_title_name,'String',['Inelastic Linear Buckling Analysis Results (Current Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1)),' (TFY)',...
            '.  Applied Load Ratio =',num2str(LGv),' (Buckling)']) 
      elseif isequal(crLTB,3)
         set(pt_title_name,'String',['Inelastic Linear Buckling Analysis Results (Current Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1)),' (CFY)',...
            '.  Applied Load Ratio =',num2str(LGv),' (Buckling)']) 
      else
         set(pt_title_name,'String',['Inelastic Linear Buckling Analysis Results (Current Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1))]) 
      end
      set(pt_title_name,'Visible','on')       
   elseif isequal(LIAType,1)
      if isequal(crLTB,1)
         set(pt_title_name,'String',['Inelastic Linear Buckling Analysis Results (Modified Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1)),' (FLB)',...
            '.  Applied Load Ratio =',num2str(LGv),' (Buckling)']) 
      elseif isequal(crLTB,2)
         set(pt_title_name,'String',['Inelastic Linear Buckling Analysis Results (Modified Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1)),' (TFY)',...
            '.  Applied Load Ratio =',num2str(LGv),' (Buckling)']) 
      elseif isequal(crLTB,3)
         set(pt_title_name,'String',['Inelastic Linear Buckling Analysis Results (Modified Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1)),' (CFY)',...
            '.  Applied Load Ratio =',num2str(LGv),' (Buckling)']) 
      else
         set(pt_title_name,'String',['Inelastic Linear Buckling Analysis Results (Modified Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1))]) 
      end  
      set(pt_title_name,'Visible','on') 
   end
elseif isequal(AI,4)
   UC = round(UC*10^6)/10^6;
   [max_UCrow, indexrow]=max(UC);
   [max_UC, UCcol]=max(max_UCrow);   
   if isequal(LIAType,0)
      if max_UC >= 0.9999
         max_UC = round(max_UC*10^3)/10^3;
         set(pt_title_name,'String',['Inelastic Linear Buckling Check (Current Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),', Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Cannot Support the Specified Load.'])
         set(pt_title_name,'Visible','on')            
      else 
          set(pt_title_name,'String',['Inelastic Linear Buckling Check (Current Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),', Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Can Support the Specified Load.'])   
          set(pt_title_name,'Visible','on')
      end     
   elseif isequal(LIAType,1)
      if max_UC >= 0.9999
         max_UC = round(max_UC*10^3)/10^3;
         set(pt_title_name,'String',['Inelastic Linear Buckling Check (Modified Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),', Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Cannot Support the Specified Load.'])
         set(pt_title_name,'Visible','on')            
      else 
          set(pt_title_name,'String',['Inelastic Linear Buckling Check (Modified Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),', Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Can Support the Specified Load.'])   
          set(pt_title_name,'Visible','on')
      end        
   end

elseif isequal(ANE,1) 
   if isequal(NLIAType,0)
      set(pt_title_name,'String',['Elastic Nonlinear Buckling Analysis Results. Applied Load Ratio = ',num2str(gammma(1,1))]) 
      set(pt_title_name,'Visible','on')
   elseif isequal(NLIAType,1)
      set(pt_title_name,'String',['Elastic Nonlinear Buckling Analysis Results. Applied Load Ratio = ',num2str(gammma(1,1))]) 
      set(pt_title_name,'Visible','on')      
   end
elseif isequal(ANI,2) || isequal(ANI,1) || isequal(ANI,3)
   if isequal(NLIAType,0)
      if isequal(crLTB,1)
         set(pt_title_name,'String',['Inelastic Nonlinear Buckling Analysis Results (Current Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1)),' (FLB)',...
            '.  Applied Load Ratio =',num2str(LGv),' (Buckling)']) 
      elseif isequal(crLTB,2)
         set(pt_title_name,'String',['Inelastic Nonlinear Buckling Analysis Results (Current Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1)),' (TFY)',...
            '.  Applied Load Ratio =',num2str(LGv),' (Buckling)']) 
      elseif isequal(crLTB,3)
         set(pt_title_name,'String',['Inelastic Nonlinear Buckling Analysis Results (Current Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1)),' (CFY)',...
            '.  Applied Load Ratio =',num2str(LGv),' (Buckling)']) 
      else
         set(pt_title_name,'String',['Inelastic Nonlinear Buckling Analysis Results (Current Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1))]) 
      end
      set(pt_title_name,'Visible','on')  
   elseif isequal(NLIAType,1)
      if isequal(crLTB,1)
         set(pt_title_name,'String',['Inelastic Nonlinear Buckling Analysis Results (Modified Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1)),' (FLB)',...
            '.  Applied Load Ratio =',num2str(LGv),' (Buckling)']) 
      elseif isequal(crLTB,2)
         set(pt_title_name,'String',['Inelastic Nonlinear Buckling Analysis Results (Modified Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1)),' (TFY)',...
            '.  Applied Load Ratio =',num2str(LGv),' (Buckling)']) 
      elseif isequal(crLTB,3)
         set(pt_title_name,'String',['Inelastic Nonlinear Buckling Analysis Results (Modified Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1)),' (CFY)',...
            '.  Applied Load Ratio =',num2str(LGv),' (Buckling)']) 
      else
         set(pt_title_name,'String',['Inelastic Nonlinear Buckling Analysis Results (Modified Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1))]) 
      end
      set(pt_title_name,'Visible','on') 
   end
elseif isequal(ANI,4)
   UC = round(UC*10^6)/10^6;
   [max_UCrow, indexrow]=max(UC);
   [max_UC, UCcol]=max(max_UCrow);    
   if isequal(NLIAType,0)
      if max_UC >= 0.9999
         max_UC = round(max_UC*10^3)/10^3;
         set(pt_title_name,'String',['Inelastic Nonlinear Buckling Check (Current Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),', Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Cannot Support the Specified Load.'])
         set(pt_title_name,'Visible','on')            
      else 
          set(pt_title_name,'String',['Inelastic Nonlinear Buckling Check (Current Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),', Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Can Support the Specified Load.'])   
          set(pt_title_name,'Visible','on')
      end     
   elseif isequal(NLIAType,1)
      if max_UC >= 0.9999
         max_UC = round(max_UC*10^3)/10^3;
         set(pt_title_name,'String',['Inelastic Nonlinear Buckling Check (Modified Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),', Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Cannot Support the Specified Load.'])
         set(pt_title_name,'Visible','on')            
      else 
          set(pt_title_name,'String',['Inelastic Nonlinear Buckling Check (Modified Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),', Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Can Support the Specified Load.'])   
          set(pt_title_name,'Visible','on')
      end        
   end   
   
   
else
   set(pt_title_name,'Visible','off') 
end


