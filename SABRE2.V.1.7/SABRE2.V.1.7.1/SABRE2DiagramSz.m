function SABRE2DiagramSz(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,...
   SNodevalue,RNCc,NCc,Nshe1,Nshe2,DUP1,DUP2,Funew,Rval,Fscale,recba_buttongroup,...
   pt_title_name,Qintf,LabType,axesm,vstm)

% Developed by Woo Yong Jeong.
% Date : 07/01/2013.
% reset axesm
cla (axesm,'reset'); 
% ************************************************************************
% **************       3D Rendering Model Generation       ***************
% ************************************************************************
xn = sum(sum(SNodevalue(:,:,3)));   % Total number of Elements
mem=length(Massemble(:,1));         % Total number of members
njnode=length(JNodevalue(:,1));     % Total number of joints

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


% ------------------------------------------------------------------------
% ---------      Reference & Shear Center Line       ---------------------
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

% ------------------------------------- Update intersection S
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
% ------------------------------------- Update intersection E

xrmax=max(max(max(abs(CSN2(1,:))),max(abs(CSN6(1,:)))),max(max(abs(CSN9(1,:))),max(abs(CSN13(1,:)))));
yrmax=max(max(max(abs(CSN2(2,:))),max(abs(CSN6(2,:)))),max(max(abs(CSN9(2,:))),max(abs(CSN13(2,:)))));
if ~isempty(JNodevalue)
   % ********************************************** Plot Coordnate Axes S
   if ~isempty(RNCc)  

      xabs = abs(min(RNCc(:,2))-max(RNCc(:,2)));
      yabs = abs(min(RNCc(:,3))-max(RNCc(:,3)));
      zabs = abs(min(-RNCc(:,4))-max(-RNCc(:,4))); 
      
      xabs = max(max(abs(min(RNCc(:,2))), abs(max(RNCc(:,2)))),xabs);
      yabs = max(max(abs(min(RNCc(:,3))), abs(max(RNCc(:,3)))),yabs);
      zabs = max(max(abs(min(-RNCc(:,4))), abs(max(-RNCc(:,4)))),zabs);
      
      xmin = min(min(RNCc(:,2)),0)-1-0.1*xabs;
      xmax = max(max(RNCc(:,2)),0)+1+0.1*xabs;

      ymin = min(min(RNCc(:,3)),0)-1-0.1*yabs;
      ymax = max(max(RNCc(:,3)),0)+1+0.1*yabs;
      
      zmin = min(min(-RNCc(:,4)),0)-1-0.1*zabs;
      zmax = max(max(-RNCc(:,4)),0)+1+0.1*zabs;
      
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

   xa=max( max(max(abs(xmax-xmin),abs(ymax-ymin)),abs(zmax-zmin))/18,mDg); 
   
%    xmax=max(xmax+0.5*xa,xa)+xrmax;
%    ymax=max(ymax+0.5*xa,xa)+yrmax;
%    zmax=max(zmax+0.5*xa,xa);
% 
%    xmin=min(xmin-xa*0.4,-xa*0.8)-xrmax;
%    ymin=min(ymin-xa*0.4,-xa*0.8)-yrmax;
%    zmin=min(zmin-xa*0.4,-xa*0.8);

   xmax=max(xmax+0.5*xa,xa);
   ymax=max(ymax+0.5*xa,xa);
   zmax=max(zmax+0.5*xa,xa);

   xmin=min(xmin-xa*0.5,-xa);
   ymin=min(ymin-xa*0.5,-xa);
   zmin=min(zmin-xa*0.5,-xa);
   
   delete(findobj('Tag','axis'));
   if isequal(LabType(1,3),0)
   if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background   
      plot3(axesm,[0 xa*0.8],[0,0],[0,0],'Color','k','linewidth',1,'Tag','axis','HitTest','off','PickableParts','none');
      hold on;
      plot3(axesm,[0 0],[0,-xa*0.8],[0,0],'Color','k','linewidth',1,'Tag','axis','HitTest','off','PickableParts','none');
      hold on; 
      plot3(axesm,[0 0],[0,0],[0,xa*0.8],'Color','k','linewidth',1,'Tag','axis','HitTest','off','PickableParts','none');
      hold on;      
      text(xa*0.9,0,0,'X','FontSize',11,'Tag','axis','HitTest','off','Color','k','PickableParts','none');
      text(0,-xa*0.9,0,'Z','FontSize',11,'Tag','axis','HitTest','off','Color','k','PickableParts','none');
      text(0,0,xa*0.9,'Y','FontSize',11,'Tag','axis','HitTest','off','Color','k','PickableParts','none');     
   elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background 
      plot3(axesm,[0 xa*0.8],[0,0],[0,0],'Color','w','linewidth',1,'Tag','axis','HitTest','off','PickableParts','none');
      hold on;
      plot3(axesm,[0 0],[0,-xa*0.8],[0,0],'Color','w','linewidth',1,'Tag','axis','HitTest','off','PickableParts','none');
      hold on; 
      plot3(axesm,[0 0],[0,0],[0,xa*0.8],'Color','w','linewidth',1,'Tag','axis','HitTest','off','PickableParts','none');
      hold on;      
      text(xa*0.9,0,0,'X','FontSize',11,'Tag','axis','HitTest','off','Color','w','PickableParts','none');
      text(0,-xa*0.9,0,'Z','FontSize',11,'Tag','axis','HitTest','off','Color','w','PickableParts','none');
      text(0,0,xa*0.9,'Y','FontSize',11,'Tag','axis','HitTest','off','Color','w','PickableParts','none');  
   end 
   end

   set(axesm,'xlim',[xmin xmax],'ylim',[zmin*1.2 zmax*1.2],'zlim',[ymin*1.2 ymax*1.2])    
   % ********************************************** Plot Coordnate Axes E
   
end % if JNodevalue end 

Qintf=round(Qintf*10^3)/10^3;
Qa=max(max(abs(Qintf(:,3))),max(abs(Qintf(:,10))));
% ------------------------------------------------------------------------
% ----------------       Moment Diagram for z       ----------------------
% ------------------------------------------------------------------------
Evalue = [];
for i = 1:xn 
   Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
   sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
   0 0 1];

   
   switch val1(i,1)
      
   case 1
      if isequal(Qa,0)
         % *************************** Rotation
         % bottom flage start node
         SN2=[MemLength1(i,1) (0) (zg1(i,1)+0)];
         % top flage start node
         SN6=[MemLength1(i,1) (0) (zg1(i,1)+0)];
         % bottom flage end node
         SN9=[MemLength2(i,1) (0) (zg2(i,1)+0)];
         % top flage end node
         SN13=[MemLength2(i,1) (0) (zg2(i,1)+0)];
      else      
         % *************************** Rotation
         % bottom flage start node
         SN2=[MemLength1(i,1) (0) (zg1(i,1)+0)];
         % top flage start node
         SN6=[MemLength1(i,1) (0) (zg1(i,1)-Qintf(i,3)*xa*0.8/Qa)];
         % bottom flage end node
         SN9=[MemLength2(i,1) (0) (zg2(i,1)+0)];
         % top flage end node
         SN13=[MemLength2(i,1) (0) (zg2(i,1)+Qintf(i,10)*xa*0.8/Qa)];
      end
      % *************************** Global Rotation
      SN2=Rz*SN2';SN2=SN2';
      SN6=Rz*SN6';SN6=SN6'; 
      SN9=Rz*SN9';SN9=SN9';
      SN13=Rz*SN13';SN13=SN13';
      % *************************** Global Translation to reference axis   
      % bottom flage start node
      SN2 = SN2+NG1(i,:);
      % top flage start node
      SN6 = SN6+NG1(i,:);
      % bottom flage end node
      SN9 = SN9+NG2(i,:);
      % top flage end node
      SN13 = SN13+NG2(i,:);       
     
   case 2     
      if isequal(Qa,0)
         % *************************** Rotation
         % bottom flage start node
         SN2=[MemLength1(i,1) (0) (zg1(i,1)+0)];
         % top flage start node
         SN6=[MemLength1(i,1) (0) (zg1(i,1)+0)];
         % bottom flage end node
         SN9=[MemLength2(i,1) (0) (zg2(i,1)+0)];
         % top flage end node
         SN13=[MemLength2(i,1) (0) (zg2(i,1)+0)];
      else      
         % *************************** Rotation
         % bottom flage start node
         SN2=[MemLength1(i,1) (0) (zg1(i,1)+0)];
         % top flage start node
         SN6=[MemLength1(i,1) (0) (zg1(i,1)-Qintf(i,3)*xa*0.8/Qa)];
         % bottom flage end node
         SN9=[MemLength2(i,1) (0) (zg2(i,1)+0)];
         % top flage end node
         SN13=[MemLength2(i,1) (0) (zg2(i,1)+Qintf(i,10)*xa*0.8/Qa)];
      end
      % *************************** Global Rotation
      SN2=Rz*SN2';SN2=SN2';
      SN6=Rz*SN6';SN6=SN6'; 
      SN9=Rz*SN9';SN9=SN9';
      SN13=Rz*SN13';SN13=SN13';
      % *************************** Global Translation to reference axis   
      % bottom flage start node
      SN2 = SN2+NG1(i,:);
      % top flage start node
      SN6 = SN6+NG1(i,:);
      % bottom flage end node
      SN9 = SN9+NG2(i,:);
      % top flage end node
      SN13 = SN13+NG2(i,:);              
      
   case 3
      if isequal(Qa,0)
         % *************************** Rotation
         % bottom flage start node
         SN2=[MemLength1(i,1) (0) (zg1(i,1)+0)];
         % top flage start node
         SN6=[MemLength1(i,1) (0) (zg1(i,1)+0)];
         % bottom flage end node
         SN9=[MemLength2(i,1) (0) (zg2(i,1)+0)];
         % top flage end node
         SN13=[MemLength2(i,1) (0) (zg2(i,1)+0)];
      else      
         % *************************** Rotation
         % bottom flage start node
         SN2=[MemLength1(i,1) (0) (zg1(i,1)+0)];
         % top flage start node
         SN6=[MemLength1(i,1) (0) (zg1(i,1)-Qintf(i,3)*xa*0.8/Qa)];
         % bottom flage end node
         SN9=[MemLength2(i,1) (0) (zg2(i,1)+0)];
         % top flage end node
         SN13=[MemLength2(i,1) (0) (zg2(i,1)+Qintf(i,10)*xa*0.8/Qa)];
      end
      % *************************** Global Rotation
      SN2=Rz*SN2';SN2=SN2';
      SN6=Rz*SN6';SN6=SN6'; 
      SN9=Rz*SN9';SN9=SN9';
      SN13=Rz*SN13';SN13=SN13';
      % *************************** Global Translation to reference axis   
      % bottom flage start node
      SN2 = SN2+NG1(i,:);
      % top flage start node
      SN6 = SN6+NG1(i,:);
      % bottom flage end node
      SN9 = SN9+NG2(i,:);
      % top flage end node
      SN13 = SN13+NG2(i,:);      

   end % Switch end
   
   eLweb=[SN2;SN6;SN9;SN13]; % web surface.
   Xwweb = zeros(2,2); Ywweb = zeros(2,2); Zwweb = zeros(2,2);
   for k=1:2
      for j=1:2   
         % web
         Xwweb(k,j) = eLweb((k-1)*2+j,1);
         Ywweb(k,j) = eLweb((k-1)*2+j,2);
         Zwweb(k,j) = eLweb((k-1)*2+j,3);             
      end
   end

   if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background 
   oweb = surf(axesm,Xwweb,Zwweb,Ywweb,'FaceColor',[0.8 0.8 0.8],...
      'EdgeColor',[0 0 0.8],'Tag','DSz'); hold on 
   elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background 
   oweb = surf(axesm,Xwweb,Zwweb,Ywweb,'FaceColor',[0.8 0.8 0.8],...
      'EdgeColor','c','Tag','DSz'); hold on 
   end
      
   Qintf=round(Qintf*10^1)/10^1;           
   % Level of transparency.
   alpha(oweb,0)
   if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
      if isequal(mod(i,2),0)
         text(SN6(1,1),SN6(1,3),SN6(1,2),num2str(-Qintf(i,3)),'FontSize',9,...
            'Fontweight','bold','Tag','DiagramSz','VerticalAlignment','top','HorizontalAlignment','right','Color','k','PickableParts','none');
         text(SN13(1,1),SN13(1,3),SN13(1,2),num2str(Qintf(i,10)),'FontSize',9,...
            'Fontweight','bold','Tag','DiagramSz','VerticalAlignment','bottom','HorizontalAlignment','left','Color','k','PickableParts','none'); 
      else
         text(SN6(1,1),SN6(1,3),SN6(1,2),num2str(-Qintf(i,3)),'FontSize',9,...
            'Fontweight','bold','Tag','DiagramSz','VerticalAlignment','top','HorizontalAlignment','right','Color','k','PickableParts','none');
         text(SN13(1,1),SN13(1,3),SN13(1,2),num2str(Qintf(i,10)),'FontSize',9,...
            'Fontweight','bold','Tag','DiagramSz','VerticalAlignment','bottom','HorizontalAlignment','left','Color','k','PickableParts','none');       
      end
   elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background
      if isequal(mod(i,2),0)
         text(SN6(1,1),SN6(1,3),SN6(1,2),num2str(-Qintf(i,3)),'FontSize',9,...
            'Fontweight','bold','Tag','DiagramSz','VerticalAlignment','top','HorizontalAlignment','right','Color','w','PickableParts','none');
         text(SN13(1,1),SN13(1,3),SN13(1,2),num2str(Qintf(i,10)),'FontSize',9,...
            'Fontweight','bold','Tag','DiagramSz','VerticalAlignment','bottom','HorizontalAlignment','left','Color','w','PickableParts','none'); 
      else
         text(SN6(1,1),SN6(1,3),SN6(1,2),num2str(-Qintf(i,3)),'FontSize',9,...
            'Fontweight','bold','Tag','DiagramSz','VerticalAlignment','top','HorizontalAlignment','right','Color','w','PickableParts','none');
         text(SN13(1,1),SN13(1,3),SN13(1,2),num2str(Qintf(i,10)),'FontSize',9,...
            'Fontweight','bold','Tag','DiagramSz','VerticalAlignment','bottom','HorizontalAlignment','left','Color','w','PickableParts','none');       
      end
   end
   
   Evalue(1,1) = DUP1(i,3);
   Evalue(2,1) = DUP2(i,3);
   Evalue(1,2) = DUP1(i,4);
   Evalue(2,2) = DUP2(i,4);
   Evalue(1,3) = DUP1(i,5);
   Evalue(2,3) = DUP2(i,5);
   % plot shear center line
   if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
   plot3(axesm,Evalue(:,1),-Evalue(:,3),Evalue(:,2),'Color',[0.4 0.4 0.4],'Tag',['Sz',num2str(i)]);
   hold on;
   elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background
   plot3(axesm,Evalue(:,1),-Evalue(:,3),Evalue(:,2),'Color','y','Tag',['Sz',num2str(i)]);
   hold on;       
   end
   Evalue = [];
   
   
end  % for end

% ------------------------------------------------------------------------
% ---------      Reference & Shear Center Line       ---------------------
% ------------------------------------------------------------------------
% Hide title
set(pt_title_name,'Visible','off')
   
if ~isempty(JNodevalue)
   % ********************************************** Plot Coordnate Axes S
   if ~isempty(NCc)  
      % Drawing Nodal Points
      for i = 1:length(NCc(:,1))
         if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
            plot3(axesm,NCc(i,2),-NCc(i,4),NCc(i,3),...
               'Marker','.','Color',[0 0.5 1],'MarkerSize',10,'Tag','DiagramFrame','HitTest','off');
            hold on;
         elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background
            plot3(axesm,NCc(i,2),-NCc(i,4),NCc(i,3),...
               'Marker','.','Color','w','MarkerSize',10,'Tag','DiagramFrame','HitTest','off');
            hold on;
         end
      end 
   end
   
end % if JNodevalue end 

% X-Z View
az = 0; el = 90; view(az, el);
axis manual;   
set(axesm,'Visible','off','Units','normalized','DataAspectRatio',[1 1 1]) 