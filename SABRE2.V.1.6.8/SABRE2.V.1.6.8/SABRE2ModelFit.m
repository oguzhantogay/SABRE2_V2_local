function SABRE2ModelFit(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,...
   Rval,BNodevalue,vrum_az_slider,vrum_el_slider,vrum_az_edit,vrum_el_edit,LabType,axesm,vstm)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
% ------------------------------------------------------------------------
% ---   3D Model generator for Jonits, Members, and Additional Nodes   ---
% ------------------------------------------------------------------------
azf=get(gca,'view');                  % Get current view
cangle=get(gca,'CameraViewAngle');    % Get current view angle
cposition=get(gca,'CameraPosition');  % Get current position
ctarget=get(gca,'CameraTarget');      % Get current target
flagmode=0;
if strcmp(get(gca,'CameraViewAngleMode'),'auto')
  flagmode=1;
end

if ~isempty(JNodevalue) 
   njnode=length(JNodevalue(:,1)); % # of joints
   
if isempty(Massemble) % Only Joints
   % reset axesm
   cla (axesm,'reset');
   % ********************************************** Plot Joint Node S
   % Drawing Nodal Points
   for i = 1:njnode
      plot3(axesm,JNodevalue(i,2),-JNodevalue(i,4),JNodevalue(i,3),...
         'Marker','.','Color','r','MarkerSize',14,'Tag',['jn',num2str(i)],'HitTest','off');
      hold on;
   end
   if isequal(LabType(1,1),0)
   if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
      % Texting Nodal Points
      for i = 1:njnode
         text(JNodevalue(i,2),-JNodevalue(i,4),JNodevalue(i,3),['jn',num2str(i)],...
            'VerticalAlignment','bottom','HorizontalAlignment','right',...
            'FontSize',9,'HitTest','off','Color','k','Tag','Text','PickableParts','none');
         hold on ;
      end  
   else isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background
      % Texting Nodal Points
      for i = 1:njnode
         text(JNodevalue(i,2),-JNodevalue(i,4),JNodevalue(i,3),['jn',num2str(i)],...
            'VerticalAlignment','bottom','HorizontalAlignment','right',...
            'FontSize',9,'HitTest','off','Color','w','Tag','Text','PickableParts','none');
         hold on ;
      end 
   end
   end
   
   
   % ********************************************** Plot Joint Node E    
   % ********************************************** Plot Coordnate Axes S
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

   xa=max( max(max(abs(xmax-xmin),abs(ymax-ymin)),abs(zmax-zmin))/18); 
   
   xmax=max(xmax+0.5*xa,xa);
   ymax=max(ymax+0.5*xa,xa);
   zmax=max(zmax+0.5*xa,xa);

   xmin=min(xmin-xa*0.4,-xa*0.8);
   ymin=min(ymin-xa*0.4,-xa*0.8);
   zmin=min(zmin-xa*0.4,-xa*0.8);

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
   set(axesm,'xlim',[xmin xmax],'ylim',[zmin zmax],'zlim',[ymin ymax])   
   % ********************************************** Plot Coordnate Axes E   
   if isequal(flagmode,1)
      if abs(xmax-xmin) > abs(ymax-ymin)
         cangle = 6.6086;
      end
   end   
   
else % ~isempty(Massemble)
   % reset axesm
   cla (axesm,'reset');
   
   mem=length(Massemble(:,1));         % Total number of members
   Ta=max(max(max(JNodevalue_i(:,6)),max(JNodevalue_i(:,8))));
   % ***************************************** Assemble Member & Bracing S     
   % SASSEM : Assemble including Member & Bracing
   for k = 1:13
      for i = 1:mem
         SASSEM(i,1,k) =JNodevalue_i(i,k);
         if isequal(max(BNodevalue(i,:,2)),0) % No Bracing
         else
            for j = 1:max(BNodevalue(i,:,2))
               SASSEM(i,j+1,k) = BNodevalue(i,j,k);
            end
         end
         SASSEM(i,max(BNodevalue(i,:,2))+2,k) =JNodevalue_j(i,k);
      end
   end

   % NJ_i : Start Node ; NJ_j : End Node for SASSEM
   NJ_i=[]; NJ_j=[];
   % *********************************************** Njbode
   q = 1; 
   for i = 1:mem   
      NJ_i(q,1)=q;
      NJ_i(q,2)=q;      
      NJ_i(q,3)=SASSEM(i,1,3);
      NJ_i(q,4)=SASSEM(i,1,4);
      NJ_i(q,5)=SASSEM(i,1,5);
      NJ_i(q,6)=SASSEM(i,1,6);
      NJ_i(q,7)=SASSEM(i,1,7);
      NJ_i(q,8)=SASSEM(i,1,8);
      NJ_i(q,9)=SASSEM(i,1,9);
      NJ_i(q,10)=SASSEM(i,1,10);
      NJ_i(q,11)=SASSEM(i,1,11);
      NJ_i(q,12)=SASSEM(i,1,12);
      NJ_i(q,13)=SASSEM(i,1,13); 
      
      for j = 1:max(BNodevalue(i,:,2))   
         NJ_i(q+j,1)=q+j;
         NJ_i(q+j,2)=q+j;         
         NJ_i(q+j,3)=SASSEM(i,j+1,3);
         NJ_i(q+j,4)=SASSEM(i,j+1,4);
         NJ_i(q+j,5)=SASSEM(i,j+1,5);
         NJ_i(q+j,6)=SASSEM(i,j+1,6);
         NJ_i(q+j,7)=SASSEM(i,j+1,7);
         NJ_i(q+j,8)=SASSEM(i,j+1,8);
         NJ_i(q+j,9)=SASSEM(i,j+1,9);
         NJ_i(q+j,10)=SASSEM(i,j+1,10);
         NJ_i(q+j,11)=SASSEM(i,j+1,11);
         NJ_i(q+j,12)=SASSEM(i,j+1,12);
         NJ_i(q+j,13)=SASSEM(i,j+1,13);
 
      end
      q = max(BNodevalue(i,:,2))+q+1;  
   end
   
   q = 1; 
   for i = 1:mem        
      for j = 1:max(BNodevalue(i,:,2))   
         NJ_j(q+j-1,1)=q+j-1;
         NJ_j(q+j-1,2)=q+j;         
         NJ_j(q+j-1,3)=SASSEM(i,j+1,3);
         NJ_j(q+j-1,4)=SASSEM(i,j+1,4);
         NJ_j(q+j-1,5)=SASSEM(i,j+1,5);
         NJ_j(q+j-1,6)=SASSEM(i,j+1,6);
         NJ_j(q+j-1,7)=SASSEM(i,j+1,7);
         NJ_j(q+j-1,8)=SASSEM(i,j+1,8);
         NJ_j(q+j-1,9)=SASSEM(i,j+1,9);
         NJ_j(q+j-1,10)=SASSEM(i,j+1,10);
         NJ_j(q+j-1,11)=SASSEM(i,j+1,11);
         NJ_j(q+j-1,12)=SASSEM(i,j+1,12);
         NJ_j(q+j-1,13)=SASSEM(i,j+1,13);
      end
      q = max(BNodevalue(i,:,2))+q+1; 
      NJ_j(q-1,1)=q-1;
      NJ_j(q-1,2)=q;      
      NJ_j(q-1,3)=SASSEM(i,max(BNodevalue(i,:,2))+2,3);
      NJ_j(q-1,4)=SASSEM(i,max(BNodevalue(i,:,2))+2,4);
      NJ_j(q-1,5)=SASSEM(i,max(BNodevalue(i,:,2))+2,5);
      NJ_j(q-1,6)=SASSEM(i,max(BNodevalue(i,:,2))+2,6);
      NJ_j(q-1,7)=SASSEM(i,max(BNodevalue(i,:,2))+2,7);
      NJ_j(q-1,8)=SASSEM(i,max(BNodevalue(i,:,2))+2,8);
      NJ_j(q-1,9)=SASSEM(i,max(BNodevalue(i,:,2))+2,9);
      NJ_j(q-1,10)=SASSEM(i,max(BNodevalue(i,:,2))+2,10);
      NJ_j(q-1,11)=SASSEM(i,max(BNodevalue(i,:,2))+2,11);
      NJ_j(q-1,12)=SASSEM(i,max(BNodevalue(i,:,2))+2,12);
      NJ_j(q-1,13)=SASSEM(i,max(BNodevalue(i,:,2))+2,13);            
   end

   sn = max(NJ_i(:,1)); % Total segment number.
   
   % ***************************************** Assemble Member & Bracing E
   % ---------------------------------------------------------------------
   % ----------------------      Model generation       ------------------
   % ---------------------------------------------------------------------

   % Nodes for each element (# ele, #node start, #node end)  
   MI=[NJ_i(:,1),NJ_i(:,2),NJ_j(:,2)];
   % Global frame coordinates at each element.
   % Start node : node(1) and end node : node(2) for each element
   xg1=NJ_i(:,3);xg2=NJ_j(:,3);  % element length : xg1(start) xg2(end)
   yg1=NJ_i(:,4);yg2=NJ_j(:,4);  % element length : xg1(start) xg2(end)
   zg1=NJ_i(:,5);zg2=NJ_j(:,5);  % element length : xg1(start) xg2(end)

   % Section properties at each element under natural frame
   bfb1=NJ_i(:,6);bfb2=NJ_j(:,6);  % Bottom flange width
   tfb1=NJ_i(:,7);tfb2=NJ_j(:,7);  % Bottom flange thickness
   bft1=NJ_i(:,8);bft2=NJ_j(:,8);  % Top flange width
   tft1=NJ_i(:,9);tft2=NJ_j(:,9);  % Top flange thickness
   Dg1=NJ_i(:,10);Dg2=NJ_j(:,10);  % dw:Web depth (y-dir)
   hg1=NJ_i(:,13);hg2=NJ_j(:,13);  % h : Distance between flange centroids

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
   % -------------------------- Geometric dimension of Cross-section : P299 E

   % *** Global frame angle for each element without considering shear center
   alpharef = zeros(sn,2);    
   for i=1:sn
       opp = yg2(i,1)-yg1(i,1);  % element depth in y-dir
       adj = xg2(i,1)-xg1(i,1);  % element length in x-dir         
       alpharef(i,1)=MI(i,1);
       alpharef(i,2)=atan2(opp,adj); % Only global frame angle
   end 

   % -- Calculate Initial Member x-dir Nodal Coordinates for Each Member S
   % Preallocationg
   dX0 = zeros(sn,1); dY0 = zeros(sn,1); dZ0 = zeros(sn,1);
   L0 = zeros(sn,1);

   for i=1:sn
       dX0(i,1) = (xg2(i,1)) - (xg1(i,1));
       dY0(i,1) = (yg2(i,1)) - (yg1(i,1));
       dZ0(i,1) = (zg2(i,1)) - (zg1(i,1));
       L0(i,1) = sqrt( ( dX0(i,1) )^2 +( dY0(i,1) )^2+( dZ0(i,1) )^2  ); 
   end

   % ************** Initial Member x-dir Nodal Coordinates for Each Member
   % Preallocationg
   MemLength = zeros(sn,1);
   segnum(1,1)=0; % (Start node number - 1) for each member
   for i = 1:mem
      for k = 1:(max(BNodevalue(i,:,2))+1)
         if isequal(k+segnum(i,1),segnum(i,1)+1)
            MemLength(k+segnum(i,1),1)=L0(k+segnum(i,1),1);
         else
            MemLength(k+segnum(i,1),1)=MemLength(k+segnum(i,1)-1,1)+L0(k+segnum(i,1),1);
         end
      end
      segnum(i+1,1) = segnum(i,1) + (max(BNodevalue(i,:,2))+1);
   end   
   % -- Calculate Initial Member x-dir Nodal Coordinates for Each Member E

   % Set up reference axis for each segments
   q = 0; val1=zeros(sn,1);
   for i = 1:mem
      for j=1:(max(BNodevalue(i,:,2))+1)
         val1(q+j,1) = Rval(i,2);
      end
    q = (max(BNodevalue(i,:,2))+1)+q;
   end  

   NTshe1=zeros(sn,4);NTshe2=zeros(sn,4);
   segnum(1,1)=0;          % (Start node number - 1) for each member
   ys1=zeros(sn,1);ys2=zeros(sn,1);
   for i = 1:mem
      switch Rval(i,2) 

         case 1                                    % mid-web depth ; val = 1
            
            for k = 1:(max(BNodevalue(i,:,2))+1)
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
            
            for k = 1:(max(BNodevalue(i,:,2))+1)
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
            
            for k = 1:(max(BNodevalue(i,:,2))+1)
               ys1(k+segnum(i,1),1)=Dsb1(k+segnum(i,1),1);
               ys2(k+segnum(i,1),1)=Dsb2(k+segnum(i,1),1);                 % Shear center                 
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
      segnum(i+1,1) = segnum(i,1) + (max(BNodevalue(i,:,2))+1);
   end   

   % Preallocationg
   taper1 = zeros(sn,3); taper2 = zeros(sn,3);
   for n = 1:sn
   [tap1,tap2]=TapedEleLength(NTshe1(n,2),NTshe1(n,3),NTshe1(n,4), ...
      NTshe2(n,2),NTshe2(n,3),NTshe2(n,4),alpharef(n,2));
   taper1(n,:)=tap1; % Which is the same as xg.
   taper2(n,:)=tap2; % Which is the same as yg.
   end   

   % Starting Node for each member
   segnum(1,1)=0;    % (Start node number - 1) for each member
   for i = 1:mem
      for k = 1:(max(BNodevalue(i,:,2))+1)            
         NG1(k+segnum(i,1),1)=NJ_i(segnum(i,1)+1,3);
         NG2(k+segnum(i,1),1)=NJ_i(segnum(i,1)+1,3);
         NG1(k+segnum(i,1),2)=NJ_i(segnum(i,1)+1,4);
         NG2(k+segnum(i,1),2)=NJ_i(segnum(i,1)+1,4);
         NG1(k+segnum(i,1),3)=NJ_i(segnum(i,1)+1,5);
         NG2(k+segnum(i,1),3)=NJ_i(segnum(i,1)+1,5);
      end
      segnum(i+1,1) = segnum(i,1) + (max(BNodevalue(i,:,2))+1);
   end

   MemLength1=NTshe1(:,2);MemLength2=NTshe2(:,2);

   % ******************************************************
   % Global frame nodal coordinates w.r.t Shear center
   Nshe1(:,1)=taper1(:,1)+NG1(:,1);
   Nshe2(:,1)=taper2(:,1)+NG2(:,1);
   Nshe1(:,2)=taper1(:,2)+NG1(:,2);
   Nshe2(:,2)=taper2(:,2)+NG2(:,2);
   Nshe1(:,3)=taper1(:,3)+NG1(:,3);
   Nshe2(:,3)=taper2(:,3)+NG2(:,3);

   % ---------------------------------------------------------------------
   % ----------------    Undeformed 3D rendering       -------------------
   % ---------------------------------------------------------------------
%    Evalue = [];
   for i = 1:sn 
      Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
      sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
      0 0 1];
%       Evalue(1,1) = Nshe1(i,1);
%       Evalue(2,1) = Nshe2(i,1);
%       Evalue(1,2) = Nshe1(i,2);
%       Evalue(2,2) = Nshe2(i,2);
%       Evalue(1,3) = Nshe1(i,3);
%       Evalue(2,3) = Nshe2(i,3);   
%       % plot shear center line
%       plot3(axesm,Evalue(:,1),Evalue(:,3),Evalue(:,2),'Color','y','Tag',...
%          'NsheB');
%       hold on;

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

      end % Switch end

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

      if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background  
         otf = surf(axesm,Xwtf,Zwtf,Ywtf,'FaceColor',[0.6 0.6 0.6],'Clipping','off', ...
            'EdgeColor',[0.6 0.6 0.6],'HitTest','off','Tag',['OTFB',num2str(i)],'PickableParts','none'); hold on
         oweb = surf(axesm,Xwweb,Zwweb,Ywweb,'FaceColor',[0.7 0.7 0.7],'Clipping','off',...
            'EdgeColor',[0.6 0.6 0.6],'HitTest','off','Tag',['OWEBB',num2str(i)],'PickableParts','none'); hold on
         obf = surf(axesm,Xwbf,Zwbf,Ywbf,'FaceColor',[0.6 0.6 0.6],'Clipping','off',...
            'EdgeColor',[0.6 0.6 0.6],'HitTest','off','Tag',['OBFB',num2str(i)],'PickableParts','none'); hold on         
         % Level of transparency.
         alpha([otf,oweb,obf],0.5)
       elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background   
         otf = surf(axesm,Xwtf,Zwtf,Ywtf,'FaceColor',[0.7 0.7 0.7],'Clipping','off', ...
            'EdgeColor',[0.3 0.3 0.3],'HitTest','off','Tag',['OTFB',num2str(i)],'PickableParts','none'); hold on
         oweb = surf(axesm,Xwweb,Zwweb,Ywweb,'FaceColor',[0.8 0.8 0.8],'Clipping','off',...
            'EdgeColor',[0.3 0.3 0.3],'HitTest','off','Tag',['OWEBB',num2str(i)],'PickableParts','none'); hold on
         obf = surf(axesm,Xwbf,Zwbf,Ywbf,'FaceColor',[0.7 0.7 0.7],'Clipping','off',...
            'EdgeColor',[0.3 0.3 0.3],'HitTest','off','Tag',['OBFB',num2str(i)],'PickableParts','none'); hold on       
         % Level of transparency.
         alpha([otf,oweb,obf],0.5) 
      end
   end  % for end  
   
% ----------------------------------------------------------------------
% ----------------     Joint Nodes & Members        --------------------
% ----------------------------------------------------------------------
   % ********************************************** Plot Joint Node S
   % Drawing Nodal Points
   for i = 1:njnode
      plot3(axesm,JNodevalue(i,2),-JNodevalue(i,4),JNodevalue(i,3),...
         'Marker','.','Color','r','MarkerSize',14,'Tag',['jn',num2str(i)],'HitTest','off');
      hold on;
   end
   if isequal(LabType(1,1),0)
   if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
      % Texting Nodal Points
      for i = 1:njnode
         text(JNodevalue(i,2),-JNodevalue(i,4),JNodevalue(i,3),['jn',num2str(i)],...
            'VerticalAlignment','bottom','HorizontalAlignment','right',...
            'FontSize',9,'HitTest','off','Color','k','Tag','JN','PickableParts','none');
         hold on ;
      end 
   elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background
      % Texting Nodal Points
      for i = 1:njnode
         text(JNodevalue(i,2),-JNodevalue(i,4),JNodevalue(i,3),['jn',num2str(i)],...
            'VerticalAlignment','bottom','HorizontalAlignment','right',...
            'FontSize',9,'HitTest','off','Color','w','Tag','JN','PickableParts','none');
         hold on ;
      end 
   end
   end
   % ********************************************** Plot Joint Node E 
  
   % ********************************************** Plot Member Define S
   MJvalue = [];
   if ~isempty(Massemble)  
      mem=length(Massemble(:,1));     % # of members
      for i = 1:mem   
         % Member Incident
         MJvalue(1,2) = JNodevalue(Massemble(i,2),2);
         MJvalue(2,2) = JNodevalue(Massemble(i,3),2);
         MJvalue(1,3) = JNodevalue(Massemble(i,2),3);
         MJvalue(2,3) = JNodevalue(Massemble(i,3),3);
         MJvalue(1,4) = JNodevalue(Massemble(i,2),4);
         MJvalue(2,4) = JNodevalue(Massemble(i,3),4);
         % Drawing Member Design Reference Axis
         plot3(axesm,MJvalue(:,2),-MJvalue(:,4),MJvalue(:,3),'Color','b','Tag',...
            ['M',num2str(i)],'HitTest','off','PickableParts','none');
         if isequal(LabType(1,2),0)
         if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
            % Texting Member
            text(sum(MJvalue(:,2))/2,-sum(MJvalue(:,4))/2-Ta,sum(MJvalue(:,3))/2+Ta/2,['M',num2str(i)],...
               'VerticalAlignment','bottom','Tag','M','FontSize',9,'HitTest','off','Color','k');
            hold on;
         elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background
            % Texting Member
            text(sum(MJvalue(:,2))/2,-sum(MJvalue(:,4))/2-Ta,sum(MJvalue(:,3))/2+Ta/2,['M',num2str(i)],...
               'VerticalAlignment','bottom','Tag','M','FontSize',9,'HitTest','off','Color','w');
            hold on;  
         end
         end
         %---------------------------- Text top & bottom S
          opp = MJvalue(2,3)-MJvalue(1,3);  % element depth in y-dir
          adj = MJvalue(2,2)-MJvalue(1,2);  % element length in x-dir
          angle=atan2(opp,adj); % Only global frame angle         
         Rz=[cos(angle) -sin(angle) 0; sin(angle) cos(angle) 0;0 0 1]; 
         Fhsb1 = (JNodevalue_i(i,9)*JNodevalue_i(i,8)^3*JNodevalue_i(i,13)) ...
            /(JNodevalue_i(i,7)*JNodevalue_i(i,6)^3+JNodevalue_i(i,9)*JNodevalue_i(i,8)^3); 
         Fhst1 = JNodevalue_i(i,13) - Fhsb1; 
         Fhsb2 = (JNodevalue_j(i,9)*JNodevalue_j(i,8)^3*JNodevalue_j(i,13)) ...
            /(JNodevalue_j(i,7)*JNodevalue_j(i,6)^3+JNodevalue_j(i,9)*JNodevalue_j(i,8)^3); 
         Fhst2 = JNodevalue_j(i,13) - Fhsb2;            

         switch Rval(i,2) 
            case 1
               j1=[(Fhsb1+Fhst1);-(Fhsb1+Fhst1)*1.1/2;0];j1 = Rz*j1;
               j2=[(Fhsb1+Fhst1)*2;+(Fhsb1+Fhst1)*1.1/2;0];j2 = Rz*j2;

%                j3=[0;-(Fhsb2+Fhst2)*1.1/2;0];j3 = Rz*j3;
%                j4=[0;+(Fhsb2+Fhst2)*1.1/2;0];j4 = Rz*j4;   
               
            case 3
               j1=[(Fhsb1+Fhst1);0;0];j1 = Rz*j1;
               j2=[(Fhsb1+Fhst1)*2;+(Fhsb1+Fhst1)*1.1;0];j2 = Rz*j2;

%                j3=[0;0;0];j3 = Rz*j3;
%                j4=[0;+(Fhsb2+Fhst2)*1.1;0];j4 = Rz*j4;                  
            case 2
               j1=[(Fhsb1+Fhst1);-(Fhsb1+Fhst1)*1.1;0];j1 = Rz*j1;
               j2=[(Fhsb1+Fhst1)*2;+0;0];j2 = Rz*j2;

%                j3=[0;-(Fhsb2+Fhst2)*1.1;0];j3 = Rz*j3;
%                j4=[0;0;0];j4 = Rz*j4;                  
         end
         if isequal(LabType(1,4),0)
         text(MJvalue(1,2)+j1(1,1),MJvalue(1,4)+j1(3,1),MJvalue(1,3)+j1(2,1),['M',num2str(i),'Flg1'],...
            'VerticalAlignment','bottom','Tag','H','FontSize',9,'HitTest','off','Color',[0 0.9 0],'PickableParts','none');  
         text(MJvalue(1,2)+j2(1,1),MJvalue(1,4)+j2(3,1),MJvalue(1,3)+j2(2,1),['M',num2str(i),'Flg2'],...
            'VerticalAlignment','bottom','Tag','H','FontSize',9,'HitTest','off','Color',[0 0.9 0],'PickableParts','none');     
         end
%          text(MJvalue(2,2)+j3(1,1),MJvalue(2,4)+j3(3,1),MJvalue(2,3)+j3(2,1),['M',num2str(i),'Flg1'],...
%             'VerticalAlignment','bottom','Tag','H','FontSize',9,'HitTest','off','Color',[0 0.9 0]);  
%          text(MJvalue(2,2)+j4(1,1),MJvalue(2,4)+j4(3,1),MJvalue(2,3)+j4(2,1),['M',num2str(i),'Flg2'],...
%             'VerticalAlignment','bottom','Tag','H','FontSize',9,'HitTest','off','Color',[0 0.9 0]);             
         hold on;
         % --------------------------- Text top & bottom E           
         MJvalue = [];
      end      
   end % if Mssemble end
   % ********************************************** Plot Member Define E
 
   % ********************************************** Plot Additional Node S
   mnum = length(BNodevalue(:,1,1));
   % Drawing Nodal Points
   for j = 1:mnum
      if ~isequal(BNodevalue(j,1,2),0)
         for i = 1:max(BNodevalue(j,:,2))
            if isequal(BNodevalue(j,i,15),1)
               plot3(axesm,BNodevalue(j,i,3),-BNodevalue(j,i,5),...
                  BNodevalue(j,i,4),'Marker','x','Color','r',...
                  'MarkerSize',8,'Tag',['M',num2str(j),'b',num2str(i)],'HitTest','off');
               hold on;
            else
               plot3(axesm,BNodevalue(j,i,3),-BNodevalue(j,i,5)-Ta,...
                  BNodevalue(j,i,4),'Marker','*','Color','r',...
                  'MarkerSize',8,'Tag',['M',num2str(j),'b',num2str(i)],'HitTest','off');
               hold on;              
            end
%             text(BNodevalue(j,i,3),BNodevalue(j,i,5),BNodevalue(j,i,4),...
%                ['M',num2str(j),'b',num2str(i)],'VerticalAlignment','top',...
%                'Color','k','HorizontalAlignment','right','FontSize',9,'HitTest','off'); 
%             hold on ;               
         end           
      end
   end    
   % ********************************************** Plot Additional Node E     
    
   % ********************************************** Plot Coordnate Axes S
   if ~isempty(JNodevalue_i) && ~isempty(JNodevalue_j) ...
         && ~isempty(Massemble) && ~isempty(Rval) 
      
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

      mbfb = max( max(JNodevalue_i(:,6)),max(JNodevalue_j(:,6)) );
      mtfb = max( max(JNodevalue_i(:,7)),max(JNodevalue_j(:,7)));
      mbft = max( max(JNodevalue_i(:,8)),max(JNodevalue_j(:,8)) );
      mtft = max( max(JNodevalue_i(:,9)),max(JNodevalue_j(:,9)));
      mDg = max( max(JNodevalue_i(:,10)),max(JNodevalue_j(:,10)));
     
      if ~ isempty(BNodevalue)
         if ~isequal(max(max(BNodevalue(:,:,2))),0)
            mbfb = max( max( max(JNodevalue_i(:,6)),max(JNodevalue_j(:,6))), ...
               max(max(BNodevalue(:,:,6))) );
            mtfb = max( max( max(JNodevalue_i(:,7)),max(JNodevalue_j(:,7))), ...
               max(max(BNodevalue(:,:,7))) );
            mbft = max( max( max(JNodevalue_i(:,8)),max(JNodevalue_j(:,8))), ...
               max(max(BNodevalue(:,:,8))) );
            mtft = max( max( max(JNodevalue_i(:,9)),max(JNodevalue_j(:,9))), ...
               max(max(BNodevalue(:,:,9))) );
            mDg = max( max( max(JNodevalue_i(:,10)),max(JNodevalue_j(:,10))), ...
               max(max(BNodevalue(:,:,10))) );
         end
      end
      
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
   
   xmax=max(xmax+0.5*xa,xa);
   ymax=max(ymax+0.5*xa,xa);
   zmax=max(zmax+0.5*xa,xa);

   xmin=min(xmin-xa*0.4,-xa*0.8);
   ymin=min(ymin-xa*0.4,-xa*0.8);
   zmin=min(zmin-xa*0.4,-xa*0.8);

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

   set(axesm,'xlim',[xmin xmax],'ylim',[zmin zmax],'zlim',[ymin ymax])   
   % ********************************************** Plot Coordnate Axes E
   if isequal(flagmode,1)
      if abs(xmax-xmin) > abs(ymax-ymin)
         cangle = 6.6086;
      end
   end
   
end % if Massemble end   
end % if JNodevalue end

% XY-View
set(vrum_az_slider,'Value',0);
set(vrum_el_slider,'Value',0);
set(vrum_az_edit,'string','0'); 
set(vrum_el_edit,'string','0'); 
view(azf(1,1), azf(1,2));


% set(gca,'CameraViewAngle',cangle,'CameraViewAngleMode','manual');
set(gca,'CameraPosition',cposition,'CameraPositionMode','manual');
set(gca,'CameraTarget',ctarget,'CameraTargetMode','manual');

axis manual;   
set(axesm,'Visible','off','Units','normalized','DataAspectRatio',[1 1 1]) 
set( gca, 'Units', 'normalized', 'Position', [0 0 0.9 1] );


