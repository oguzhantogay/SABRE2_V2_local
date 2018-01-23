function [BNC]=SABRE2GroundRes(JNodevalue,JNodevalue_i,JNodevalue_j,Massemble,Rval,...
   RNCc,DUP1,DUP2,BNC,Bhg,Thg,bgm_type_name,bgm_coordx_edit,bgm_coordy_edit,...
   bgm_coordz_edit,bgm_ux_edit,bgm_uy_edit,bgm_uz_edit,bgm_rx_edit,...
   bgm_ry_edit,bgm_rz_edit,bgm_phix_edit,bgm_height_edit,pt_title_name,axesm,vstm)
% Developed by Woo Yong Jeong.
% Date : 07/01/2013.
% ************************************************************************
% *****************    Nodal Boundary Conditions      ********************
% ************************************************************************
BNC=[];

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

   delete(findobj('color',[0.7 0.3 0]))
   delete(findobj('MarkerFaceColor',[0.7 0.3 0]))
   % ---------------------------------------------------------------------
   % ----------          Plot Discrete Grounded       --------------------
   % ---------------------------------------------------------------------  
   lt=1.35; % Line thickness
   xd=7;    % Markersize Grounded Spring      
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
      for i=1:length(RNCc(:,1))
         if ~isequal(BNC(i,5),0) % Grounded Spring x-axis
            if isequal(BNC(i,13),1) || isequal(BNC(i,13),0) 
               plot3(axesm,[(RNCc(i,2)+dgd1), (RNCc(i,2)+dgd2)],...
                  [RNCc(i,4)+dgd4,RNCc(i,4)+dgd4],[RNCc(i,3),RNCc(i,3)],'HitTest','off','Color',[0.7 0.3 0],...
                  'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');                        
               hold on;            
               plot3(axesm,RNCc(i,2)+dgd3,RNCc(i,4)+dgd4,RNCc(i,3),'MarkerFaceColor',[0.7 0.3 0],...
                  'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['BNC',num2str(i)],'PickableParts','none');
               hold on;  
            elseif isequal(BNC(i,13),2) % Top flange 
               plot3(axesm,[(RNCc(i,2)+dgd1+Thg(i,1)), (RNCc(i,2)+dgd2+Thg(i,1))],...
                  [RNCc(i,4)+dgd4+Thg(i,3),RNCc(i,4)+dgd4+Thg(i,3)],[RNCc(i,3)+Thg(i,2),RNCc(i,3)+Thg(i,2)],'HitTest','off','Color',[0.7 0.3 0],...
                  'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');                        
               hold on;            
               plot3(axesm,RNCc(i,2)+dgd3+Thg(i,1),RNCc(i,4)+dgd4+Thg(i,3),RNCc(i,3)+Thg(i,2),'MarkerFaceColor',[0.7 0.3 0],...
                  'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['BNC',num2str(i)],'PickableParts','none');
               hold on; 
            elseif isequal(BNC(i,13),3) % Bottom flange 
               plot3(axesm,[(RNCc(i,2)+dgd1+Bhg(i,1)), (RNCc(i,2)+dgd2+Bhg(i,1))],...
                  [RNCc(i,4)+dgd4+Bhg(i,3),RNCc(i,4)+dgd4+Bhg(i,3)],[RNCc(i,3)+Bhg(i,2),RNCc(i,3)+Bhg(i,2)],'HitTest','off','Color',[0.7 0.3 0],...
                  'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');                        
               hold on;            

               plot3(axesm,RNCc(i,2)+dgd3+Bhg(i,1),RNCc(i,4)+dgd4+Bhg(i,3),RNCc(i,3)+Bhg(i,2),'MarkerFaceColor',[0.7 0.3 0],...
                  'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['BNC',num2str(i)],'PickableParts','none');
               hold on;                
            end
         end
  
         if ~isequal(BNC(i,6),0) 
            if isequal(BNC(i,13),1) || isequal(BNC(i,13),0) 
               plot3(axesm,[RNCc(i,2),RNCc(i,2) ],[RNCc(i,4)+dgd4,RNCc(i,4)+dgd4],...
                  [(RNCc(i,3)+dgd1),(RNCc(i,3)+dgd2)],'HitTest','off','Color',[0.7 0.3 0],...
                  'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;            
               plot3(axesm,RNCc(i,2),RNCc(i,4)+dgd4,RNCc(i,3)+dgd3,'MarkerFaceColor',[0.7 0.3 0],...
                  'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['BNC',num2str(i)],'PickableParts','none');
               hold on;
            elseif isequal(BNC(i,13),2) % Top flange 
               plot3(axesm,[RNCc(i,2)+Thg(i,1),RNCc(i,2)+Thg(i,1) ],[RNCc(i,4)+dgd4+Thg(i,3),RNCc(i,4)+dgd4+Thg(i,3)],...
                  [(RNCc(i,3)+dgd1+Thg(i,2)),(RNCc(i,3)+dgd2+Thg(i,2))],'HitTest','off','Color',[0.7 0.3 0],...
                  'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;            
               plot3(axesm,RNCc(i,2)+Thg(i,1),RNCc(i,4)+dgd4+Thg(i,3),RNCc(i,3)+dgd3+Thg(i,2),'MarkerFaceColor',[0.7 0.3 0],...
                  'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['BNC',num2str(i)],'PickableParts','none');
               hold on;
            elseif isequal(BNC(i,13),3) % Bottom flange 
               plot3(axesm,[RNCc(i,2)+Bhg(i,1),RNCc(i,2)+Bhg(i,1) ],[RNCc(i,4)+dgd4+Bhg(i,3),RNCc(i,4)+dgd4+Bhg(i,3)],...
                  [(RNCc(i,3)+dgd1+Bhg(i,2)),(RNCc(i,3)+dgd2+Bhg(i,2))],'HitTest','off','Color',[0.7 0.3 0],...
                  'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;            
               plot3(axesm,RNCc(i,2)+Bhg(i,1),RNCc(i,4)+dgd4+Bhg(i,3),RNCc(i,3)+dgd3+Bhg(i,2),'MarkerFaceColor',[0.7 0.3 0],...
                  'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['BNC',num2str(i)],'PickableParts','none');
               hold on;               
            end
         end

         if ~isequal(BNC(i,7),0) 
            if isequal(BNC(i,13),1) || isequal(BNC(i,13),0) 
               plot3(axesm,[RNCc(i,2),RNCc(i,2) ],[(RNCc(i,4)+dgd1),(RNCc(i,4)+dgd2)],...
                  [RNCc(i,3),RNCc(i,3)],'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             

               plot3(axesm,RNCc(i,2),RNCc(i,4)+dgd3,RNCc(i,3),'MarkerFaceColor',[0.7 0.3 0],...
                  'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['BNC',num2str(i)],'PickableParts','none');
               hold on;  
            elseif isequal(BNC(i,13),2) % Top flange 
               plot3(axesm,[RNCc(i,2)+Thg(i,1),RNCc(i,2)+Thg(i,1) ],[(RNCc(i,4)+dgd1+Thg(i,3)),(RNCc(i,4)+dgd2+Thg(i,3))],...
                  [RNCc(i,3)+Thg(i,2),RNCc(i,3)+Thg(i,2)],'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               plot3(axesm,RNCc(i,2)+Thg(i,1),RNCc(i,4)+dgd3+Thg(i,3),RNCc(i,3)+Thg(i,2),'MarkerFaceColor',[0.7 0.3 0],...
                  'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['BNC',num2str(i)],'PickableParts','none');
               hold on; 
            elseif isequal(BNC(i,13),3) % Bottom flange 
               plot3(axesm,[RNCc(i,2)+Bhg(i,1),RNCc(i,2)+Bhg(i,1) ],[(RNCc(i,4)+dgd1+Bhg(i,3)),(RNCc(i,4)+dgd2+Bhg(i,3))],...
                  [RNCc(i,3)+Bhg(i,2),RNCc(i,3)+Bhg(i,2)],'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               plot3(axesm,RNCc(i,2)+Bhg(i,1),RNCc(i,4)+dgd3+Bhg(i,3),RNCc(i,3)+Bhg(i,2),'MarkerFaceColor',[0.7 0.3 0],...
                  'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['BNC',num2str(i)],'PickableParts','none');
               hold on;                
            end
         end
       
         if ~isequal(BNC(i,8),0)
            if isequal(BNC(i,13),1) || isequal(BNC(i,13),0) 
               plot3(axesm,z+RNCc(i,2),x+RNCc(i,4),y+RNCc(i,3),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,z1+RNCc(i,2),x1+RNCc(i,4),y1+RNCc(i,3),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,z2+RNCc(i,2),x2+RNCc(i,4),y2+RNCc(i,3),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
            elseif isequal(BNC(i,13),2) % Top flange 
               plot3(axesm,z+RNCc(i,2)+Thg(i,1),x+RNCc(i,4)+Thg(i,3),y+RNCc(i,3)+Thg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,z1+RNCc(i,2)+Thg(i,1),x1+RNCc(i,4)+Thg(i,3),y1+RNCc(i,3)+Thg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,z2+RNCc(i,2)+Thg(i,1),x2+RNCc(i,4)+Thg(i,3),y2+RNCc(i,3)+Thg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
            elseif isequal(BNC(i,13),3) % Bottom flange 
               plot3(axesm,z+RNCc(i,2)+Bhg(i,1),x+RNCc(i,4)+Bhg(i,3),y+RNCc(i,3)+Bhg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,z1+RNCc(i,2)+Bhg(i,1),x1+RNCc(i,4)+Bhg(i,3),y1+RNCc(i,3)+Bhg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,z2+RNCc(i,2)+Bhg(i,1),x2+RNCc(i,4)+Bhg(i,3),y2+RNCc(i,3)+Bhg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                
            end
         end
         
         if ~isequal(BNC(i,9),0) 
            if isequal(BNC(i,13),1) || isequal(BNC(i,13),0) 
               plot3(axesm,x+RNCc(i,2),y+RNCc(i,4),z+RNCc(i,3),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,x1+RNCc(i,2),y1+RNCc(i,4),z1+RNCc(i,3),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,x2+RNCc(i,2),y2+RNCc(i,4),z2+RNCc(i,3),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;   
            elseif isequal(BNC(i,13),2) % Top flange 
               plot3(axesm,x+RNCc(i,2)+Thg(i,1),y+RNCc(i,4)+Thg(i,3),z+RNCc(i,3)+Thg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,x1+RNCc(i,2)+Thg(i,1),y1+RNCc(i,4)+Thg(i,3),z1+RNCc(i,3)+Thg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,x2+RNCc(i,2)+Thg(i,1),y2+RNCc(i,4)+Thg(i,3),z2+RNCc(i,3)+Thg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
            elseif isequal(BNC(i,13),3) % Bottom flange 
               plot3(axesm,x+RNCc(i,2)+Bhg(i,1),y+RNCc(i,4)+Bhg(i,3),z+RNCc(i,3)+Bhg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,x1+RNCc(i,2)+Bhg(i,1),y1+RNCc(i,4)+Bhg(i,3),z1+RNCc(i,3)+Bhg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,x2+RNCc(i,2)+Bhg(i,1),y2+RNCc(i,4)+Bhg(i,3),z2+RNCc(i,3)+Bhg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;               
            end
         end
         
         if ~isequal(BNC(i,10),0)
            if isequal(BNC(i,13),1) || isequal(BNC(i,13),0) 
               plot3(axesm,x+RNCc(i,2),z+RNCc(i,4),y+RNCc(i,3),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,x1+RNCc(i,2),z1+RNCc(i,4),y1+RNCc(i,3),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,x2+RNCc(i,2),z2+RNCc(i,4),y2+RNCc(i,3),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;  
            elseif isequal(BNC(i,13),2) % Top flange
               plot3(axesm,x+RNCc(i,2)+Thg(i,1),z+RNCc(i,4)+Thg(i,3),y+RNCc(i,3)+Thg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,x1+RNCc(i,2)+Thg(i,1),z1+RNCc(i,4)+Thg(i,3),y1+RNCc(i,3)+Thg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,x2+RNCc(i,2)+Thg(i,1),z2+RNCc(i,4)+Thg(i,3),y2+RNCc(i,3)+Thg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
            elseif isequal(BNC(i,13),3) % Bottom flange
               plot3(axesm,x+RNCc(i,2)+Bhg(i,1),z+RNCc(i,4)+Bhg(i,3),y+RNCc(i,3)+Bhg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,x1+RNCc(i,2)+Bhg(i,1),z1+RNCc(i,4)+Bhg(i,3),y1+RNCc(i,3)+Bhg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,x2+RNCc(i,2)+Bhg(i,1),z2+RNCc(i,4)+Bhg(i,3),y2+RNCc(i,3)+Bhg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                
            end
         end         
      end
   end         
    
end % if JNodevalue end

set(axesm,'Visible','off','Units','normalized','DataAspectRatio',[1 1 1]) 
set( gca, 'Units', 'normalized', 'Position', [0 0 0.9 1] ); 

% set initial data automatically.
set([bgm_type_name,bgm_coordx_edit,bgm_coordy_edit,bgm_coordz_edit],'String','')
set([bgm_ux_edit,bgm_uy_edit,bgm_uz_edit,bgm_rx_edit,bgm_ry_edit,bgm_rz_edit,bgm_phix_edit],'String','0')
if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
   set(findobj('Color','c'),'Color',[0 0.5 1])
elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background
   set(findobj('Color','c'),'Color','w')
end 