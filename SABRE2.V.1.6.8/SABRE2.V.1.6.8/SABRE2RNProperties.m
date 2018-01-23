function [a]=SABRE2RNProperties(JNodevalue,Massemble,SNodevalue,RNCc,...
   Nshe1,Nshe2,DUP1,DUP2,Rval,pt_title_name,axesm)
a=1;
% Developed by Woo Yong Jeong.
% Date : 07/01/2013.
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

% reset axesm
cla (axesm,'reset'); 
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

% q = 0; val1=zeros(xn,1);
% for i = 1:mem
%    for j=1:sum(SNodevalue(i,:,3))+1
%       val1(q+j,1) = Rval(i,2);
%    end
%  q = sum(SNodevalue(i,:,3))+q;
% end

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



if ~isempty(JNodevalue)
   % ---------------------------------------------------------------------
   % ----------------    Plot Loading Nodal Points       -----------------
   % ---------------------------------------------------------------------    
   Evalue = [];
   for i = 1:xn 
      Evalue(1,1) = Nshe1(i,1);
      Evalue(2,1) = Nshe2(i,1);
      Evalue(1,2) = Nshe1(i,2);
      Evalue(2,2) = Nshe2(i,2);
      Evalue(1,3) = Nshe1(i,3);
      Evalue(2,3) = Nshe2(i,3);   
      % plot shear center line
      plot3(axesm,Evalue(:,1),Evalue(:,3),Evalue(:,2),'Color','y','Tag',...
         'RNodal');
      hold on;
   end

   % ********************************************** Plot Coordnate Axes S
   if ~isempty(RNCc)  
      
      xabs = abs(min(RNCc(:,2))-max(RNCc(:,2))); 
      yabs = abs(min(RNCc(:,3))-max(RNCc(:,3)));
      zabs = abs(min(RNCc(:,4))-max(RNCc(:,4))); 
      
      
      xmin = min(RNCc(:,2))-1-0.1*xabs;
      xmax = max(RNCc(:,2))+1+0.1*xabs;

      ymin = min(RNCc(:,3))-1-0.1*yabs;
      ymax = max(RNCc(:,3))+1+0.1*yabs;
      
      zmin = min(RNCc(:,4))-1-0.1*zabs;
      zmax = max(RNCc(:,4))+1+0.1*zabs;
      
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

      xabs = abs(min(JNodevalue(:,2))-max(JNodevalue(:,2)));
      yabs = abs(min(JNodevalue(:,3))-max(JNodevalue(:,3)));
      zabs = abs(min(JNodevalue(:,4))-max(JNodevalue(:,4)));

      xmin = min(JNodevalue(:,2))-1-0.1*xabs;
      xmax = max(JNodevalue(:,2))+1+0.1*xabs;

      ymin = min(JNodevalue(:,3))-1-0.1*yabs;
      ymax = max(JNodevalue(:,3))+1+0.1*yabs; 

      zmin = min(JNodevalue(:,4))-1-0.1*zabs;
      zmax = max(JNodevalue(:,4))+1+0.1*zabs;

   end
   
   xa=max(max(abs(xmax-xmin),abs(ymax-ymin)),abs(zmax-zmin))/20; 

   xmax=max(xmax+0.5*xa,xa);
   ymax=max(ymax+0.5*xa,xa);
   zmax=max(zmax+0.5*xa,xa);

   xmin=min(xmin-xa*0.4,-xa*0.8);
   ymin=min(ymin-xa*0.4,-xa*0.8);
   zmin=min(zmin-xa*0.4,-xa*0.8);

   delete(findobj('Tag','axis'));
   plot3(axesm,[0 xa*0.8],[0,0],[0,0],'Color','r','linewidth',1.5,'Tag','axis','PickableParts','none');
   hold on;
   plot3(axesm,[0 0],[0,xa*0.8],[0,0],'Color','r','linewidth',1.5,'Tag','axis','PickableParts','none');
   hold on; 
   plot3(axesm,[0 0],[0,0],[0,xa*0.8],'Color','r','linewidth',1.5,'Tag','axis','PickableParts','none');
   hold on;      
   text(xa*0.9,0,0,'X','FontSize',11,'Fontweight','bold','Tag','axis','PickableParts','none');
   text(0,xa*0.9,0,'Z','FontSize',11,'Fontweight','bold','Tag','axis','PickableParts','none');
   text(0,0,xa*0.9,'Y','FontSize',11,'Fontweight','bold','Tag','axis','PickableParts','none');     

   set(axesm,'xlim',[xmin xmax],'zlim',[ymin ymax],'ylim',[zmin zmax])   
   % ********************************************** Plot Coordnate Axes E
   
   % Drawing Nodal Points
   for i = 1:length(RNCc(:,1))
      plot3(axesm,RNCc(i,2),RNCc(i,4),RNCc(i,3),...
         'Marker','.','Color','w','MarkerSize',10,'Tag',['RNCc',num2str(i)]);
      hold on;
   end    
   
end % if JNodevalue end 

% ------------------------------------------------------------------------
% ---------      Reference & Shear Center Line       ---------------------
% ------------------------------------------------------------------------
% Hide title
set(pt_title_name,'Visible','off')

% XY-View
az = 0; el = 0; view(az, el);
axis manual;   
set(axesm,'Visible','off','Units','normalized','DataAspectRatio',[1 1 1]) 