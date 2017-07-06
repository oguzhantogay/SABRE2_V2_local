function [FEL]=SABRE2FlexureApp(JNodevalue,JNodevalue_i,JNodevalue_j,Massemble,Rval,...
   RNCc,DUP1,DUP2,Nshe1,Nshe2,FEL,Bhg,Thg,bpm_type_name,bpm_ni_edit,bpm_nj_edit,...
   bpm_myni_edit,bpm_mynj_edit,bpm_mzni_edit,bpm_mznj_edit,bpm_wni_edit,bpm_wnj_edit,pt_title_name,axesm,vstm)
% Developed by Woo Yong Jeong.
% Date : 07/01/2013.
% ************************************************************************
% *****************    Nodal Boundary Conditions      ********************
% ************************************************************************
if isempty(DUP1)
   FEL=[];
else   
   EL = round(str2double(get(bpm_type_name,'String')));
   if isempty(get(bpm_type_name,'String'))|| isequal(get(bpm_type_name,'String'),'0')        
      FEL(length(DUP1(:,1)),9)=0;
   else
 
%        ###################################################################
%       set(pt_title_name,'Visible','off')
      FEL(length(DUP1(:,1)),9)=0;
      FEL(EL,1) =  EL;
      FEL(EL,2) = get(bpm_ni_edit,'Value');
      FEL(EL,3) = get(bpm_nj_edit,'Value');
      FEL(EL,4) = get(bpm_myni_edit,'Value');
      FEL(EL,5) = get(bpm_mynj_edit,'Value');      
      FEL(EL,6) = get(bpm_mzni_edit,'Value');
      FEL(EL,7) = get(bpm_mznj_edit,'Value');       
      FEL(EL,8) = get(bpm_wni_edit,'Value');
      FEL(EL,9) = get(bpm_wnj_edit,'Value');  
      
   end
end

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
   % ********************************************** Plot Coordnate Axes E

   delete(findobj('color',[0.7 0.5 0]))   
   delete(findobj('color',[0 0.5 0.7]))
   lt=1.35; % Line thickness
   xf=6;    % Markersize Flexure   
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
 
   % ********** Global frame angle for each element considering shear center
   alphatap = zeros(xn,2);
   for i=1:xn
       opp = yg2(i,1)-yg1(i,1);  % element depth in y-dir
       adj = xg2(i,1)-xg1(i,1);  % element length in x-dir         
       alphatap(i,1)=MI(i,1);
       alphatap(i,2)=atan2(opp,adj);     % Global frame angle + Tapered Angle
   end 

   xl=min(max(RNCc(:,11)),min(min(DX(:,1))/10,xa*0.25));
   FPe1=zeros(xn,3);FPe2=zeros(xn,3);
   for i = 1:xn; 
      Rz=[cos(alphatap(i,2)) -sin(alphatap(i,2)) 0; ...
      sin(alphatap(i,2)) cos(alphatap(i,2)) 0; ...
      0 0 1];
   
      FP1=[xl,0,0]; FP1=Rz*FP1'; FPe1(i,:)=FP1';
      FP2=[-xl,0,0]; FP2=Rz*FP2'; FPe2(i,:)=FP2';             
   end   

   % Drawing Loading Nodal points
   if isempty(Nshe1) || isempty(FEL)
   else 
      for i=1:length(MI(:,1))
         
         if isequal(FEL(i,2),2)
               plot3(axesm,Nshe1(i,1)+FPe1(i,1),Nshe1(i,3)+FPe1(i,3),Nshe1(i,2)+FPe1(i,2),...
                  'HitTest','off','Marker','d','Color',[0.7 0.5 0],'MarkerSize',xf,'Tag',['FELi',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
         end
         
         if isequal(FEL(i,3),2)
               plot3(axesm,Nshe2(i,1)+FPe2(i,1),Nshe2(i,3)+FPe2(i,3),Nshe2(i,2)+FPe2(i,2),...
                  'HitTest','off','Marker','d','Color',[0.7 0.5 0],'MarkerSize',xf,'Tag',['FELj',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
         end
             
         if isequal(FEL(i,4),2)
               plot3(axesm,Nshe1(i,1)+FPe1(i,1),Nshe1(i,3)+FPe1(i,3),Nshe1(i,2)+FPe1(i,2),...
                  'HitTest','off','Marker','o','Color',[0 0.5 0.7],'MarkerSize',xf,'Tag',['FELi',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
         end
         
         if isequal(FEL(i,5),2)
               plot3(axesm,Nshe2(i,1)+FPe2(i,1),Nshe2(i,3)+FPe2(i,3),Nshe2(i,2)+FPe2(i,2),...
                  'HitTest','off','Marker','o','Color',[0 0.5 0.7],'MarkerSize',xf,'Tag',['FELj',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
         end

         if isequal(FEL(i,6),2)
               plot3(axesm,Nshe1(i,1)+FPe1(i,1),Nshe1(i,3)+FPe1(i,3),Nshe1(i,2)+FPe1(i,2),...
                  'HitTest','off','Marker','o','Color',[0.7 0.5 0],'MarkerSize',xf,'Tag',['FELi',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
         end
         
         if isequal(FEL(i,7),2)
               plot3(axesm,Nshe2(i,1)+FPe2(i,1),Nshe2(i,3)+FPe2(i,3),Nshe2(i,2)+FPe2(i,2),...
                  'HitTest','off','Marker','o','Color',[0.7 0.5 0],'MarkerSize',xf,'Tag',['FELj',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
         end

         if isequal(FEL(i,8),2)
               plot3(axesm,Nshe1(i,1)+FPe1(i,1),Nshe1(i,3)+FPe1(i,3),Nshe1(i,2)+FPe1(i,2),...
                  'HitTest','off','Marker','square','Color',[0.7 0.5 0],'MarkerSize',xf*2,'Tag',['FELi',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
         end
         
         if isequal(FEL(i,9),2)
               plot3(axesm,Nshe2(i,1)+FPe2(i,1),Nshe2(i,3)+FPe2(i,3),Nshe2(i,2)+FPe2(i,2),...
                  'HitTest','off','Marker','square','Color',[0.7 0.5 0],'MarkerSize',xf*2,'Tag',['FELj',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
         end
         
      end
   end   
  
   
end % if JNodevalue end

set(axesm,'Visible','off','Units','normalized','DataAspectRatio',[1 1 1]) 
set( gca, 'Units', 'normalized', 'Position', [0 0 0.9 1] ); 

% % set initial data automatically.
set(bpm_type_name,'String','')
% set([bgm_ux_edit,bgm_uy_edit,bgm_uz_edit,bgm_rx_edit,bgm_ry_edit,bgm_rz_edit],'String','0')
if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
   set(findobj('Color','c'),'Color','k')
elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background
   set(findobj('Color','c'),'Color','w')
end 