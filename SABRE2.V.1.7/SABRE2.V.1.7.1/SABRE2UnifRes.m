function [LUEC]=SABRE2UnifRes(JNodevalue,Massemble,Rval,...
   RNCc,DUP1,DUP2,NCc,LNC,LUEC,ULoad,SNodevalue,Nshe1,Nshe2,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Mhe1,Mhe2,Bhg,Thg,CSg,Mhg,lum_type_mem,lum_type_seg,...
   lum_height_edit,lum_wx_edit,lum_wy_edit,lum_wz_edit,t,pt_title_name,axesm,vstm)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
% ************************************************************************
% *****************         Uniform Loading           ********************
% ************************************************************************
xn = sum(sum(SNodevalue(:,:,3)));   % Total number of Elements
LUEC=zeros(xn,20); % zeros matrix length(NC(:,1)) x 11
   
   

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

   delete(findobj('color',[0.5 0.8 0.2]))
   delete(findobj('FaceColor',[0.5 0.8 0.2]))
   delete(findobj('EdgeColor',[0.5 0.8 0.2]))
   % ---------------------------------------------------------------------
   % -------------------        Plot Point Load       --------------------
   % ---------------------------------------------------------------------    
   lt=1.35; % Line thickness
   prd = xa*0.4;
   dp1=xa*0.01;
   dp2=xa*0.8;   
   if isequal(xa,mDg)
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
      for i=1:length(RNCc(:,1))
         if ~isequal(LNC(i,5),0) % Force x-axis
            if isequal(LNC(i,13),1) || isequal(LNC(i,13),0) % Shear center
               if LNC(i,5) < 0
                  plot3(axesm,[(RNCc(i,2)+dp1), (RNCc(i,2)+dp2)],[RNCc(i,4),RNCc(i,4)],[RNCc(i,3),RNCc(i,3)],...
                     'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+dp1,RNCc(i,4),RNCc(i,3); RNCc(i,2)+dp1,RNCc(i,4),RNCc(i,3); ...
                     RNCc(i,2)+dp1,RNCc(i,4),RNCc(i,3); RNCc(i,2)+dp1,RNCc(i,4),RNCc(i,3)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;
               elseif LNC(i,5) > 0
                  plot3(axesm,[(RNCc(i,2)-dp1), (RNCc(i,2)-dp2)],[RNCc(i,4),RNCc(i,4)],[RNCc(i,3),RNCc(i,3)],...
                     'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                   
                  Sco = [RNCc(i,2)-dp1,RNCc(i,4),RNCc(i,3); RNCc(i,2)-dp1,RNCc(i,4),RNCc(i,3); ...
                     RNCc(i,2)-dp1,RNCc(i,4),RNCc(i,3); RNCc(i,2)-dp1,RNCc(i,4),RNCc(i,3)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                        
               end    
            elseif isequal(LNC(i,13),2) % Top flange
               if LNC(i,5) < 0
                  plot3(axesm,[(RNCc(i,2)+dp1+Thg(i,1)), (RNCc(i,2)+dp2+Thg(i,1))],...
                     [RNCc(i,4)+Thg(i,3),RNCc(i,4)+Thg(i,3)],[RNCc(i,3)+Thg(i,2),RNCc(i,3)+Thg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+dp1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+dp1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)+dp1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+dp1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                    
               elseif LNC(i,5) > 0
                  plot3(axesm,[(RNCc(i,2)-dp1+Thg(i,1)), (RNCc(i,2)-dp2+Thg(i,1))],...
                     [RNCc(i,4)+Thg(i,3),RNCc(i,4)+Thg(i,3)],[RNCc(i,3)+Thg(i,2),RNCc(i,3)+Thg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)-dp1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-dp1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)-dp1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-dp1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                               
               end     
            elseif isequal(LNC(i,13),3) % bottom flange
               if LNC(i,5) < 0
                  plot3(axesm,[(RNCc(i,2)+dp1+Bhg(i,1)), (RNCc(i,2)+dp2+Bhg(i,1))],...
                     [RNCc(i,4)+Bhg(i,3),RNCc(i,4)+Bhg(i,3)],[RNCc(i,3)+Bhg(i,2),RNCc(i,3)+Bhg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+dp1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+dp1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)+dp1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+dp1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                    
               elseif LNC(i,5) > 0
                  plot3(axesm,[(RNCc(i,2)-dp1+Bhg(i,1)), (RNCc(i,2)-dp2+Bhg(i,1))],...
                     [RNCc(i,4)+Bhg(i,3),RNCc(i,4)+Bhg(i,3)],[RNCc(i,3)+Bhg(i,2),RNCc(i,3)+Bhg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                     
                  Sco = [RNCc(i,2)-dp1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-dp1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)-dp1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-dp1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                               
               end   
            elseif isequal(LNC(i,13),4) % Centroid
               if LNC(i,5) < 0
                  plot3(axesm,[(RNCc(i,2)+dp1+CSg(i,1)), (RNCc(i,2)+dp2+CSg(i,1))],...
                     [RNCc(i,4)+CSg(i,3),RNCc(i,4)+CSg(i,3)],[RNCc(i,3)+CSg(i,2),RNCc(i,3)+CSg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+dp1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+dp1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)+dp1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+dp1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                    
               elseif LNC(i,5) > 0
                  plot3(axesm,[(RNCc(i,2)-dp1+CSg(i,1)), (RNCc(i,2)-dp2+CSg(i,1))],...
                     [RNCc(i,4)+CSg(i,3),RNCc(i,4)+CSg(i,3)],[RNCc(i,3)+CSg(i,2),RNCc(i,3)+CSg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                     
                  Sco = [RNCc(i,2)-dp1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-dp1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)-dp1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-dp1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                               
               end
            elseif isequal(LNC(i,13),5) % Mid-Web
               if LNC(i,5) < 0
                  plot3(axesm,[(RNCc(i,2)+dp1+Mhg(i,1)), (RNCc(i,2)+dp2+Mhg(i,1))],...
                     [RNCc(i,4)+Mhg(i,3),RNCc(i,4)+Mhg(i,3)],[RNCc(i,3)+Mhg(i,2),RNCc(i,3)+Mhg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+dp1+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+dp1+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2); ...
                     RNCc(i,2)+dp1+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+dp1+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                    
               elseif LNC(i,5) > 0
                  plot3(axesm,[(RNCc(i,2)-dp1+Mhg(i,1)), (RNCc(i,2)-dp2+Mhg(i,1))],...
                     [RNCc(i,4)+Mhg(i,3),RNCc(i,4)+Mhg(i,3)],[RNCc(i,3)+Mhg(i,2),RNCc(i,3)+Mhg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)-dp1+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)-dp1+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2); ...
                     RNCc(i,2)-dp1+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)-dp1+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                               
               end                                  
            end    
         end
       
         if ~isequal(LNC(i,6),0) % Force y-axis
            if isequal(LNC(i,13),1) || isequal(LNC(i,13),0) % Shear center
               if LNC(i,6) < 0
                  plot3(axesm,[RNCc(i,2),RNCc(i,2) ],[RNCc(i,4),RNCc(i,4)],[(RNCc(i,3)+dp1),(RNCc(i,3)+dp2)],...
                     'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                   
                  Sco = [RNCc(i,2),RNCc(i,4),RNCc(i,3)+dp1; RNCc(i,2),RNCc(i,4),RNCc(i,3)+dp1; ...
                     RNCc(i,2),RNCc(i,4),RNCc(i,3)+dp1; RNCc(i,2),RNCc(i,4),RNCc(i,3)+dp1];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                  
               elseif LNC(i,6) > 0
                  plot3(axesm,[RNCc(i,2),RNCc(i,2) ],[RNCc(i,4),RNCc(i,4)],[(RNCc(i,3)-dp1),(RNCc(i,3)-dp2)],...
                     'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                   
                  Sco = [RNCc(i,2),RNCc(i,4),RNCc(i,3)-dp1; RNCc(i,2),RNCc(i,4),RNCc(i,3)-dp1; ...
                     RNCc(i,2),RNCc(i,4),RNCc(i,3)-dp1; RNCc(i,2),RNCc(i,4),RNCc(i,3)-dp1];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;            
               end 
            elseif isequal(LNC(i,13),2) % Top flange 
               if LNC(i,6) < 0
                  plot3(axesm,[RNCc(i,2)+Thg(i,1),RNCc(i,2)+Thg(i,1) ],[RNCc(i,4)+Thg(i,3),RNCc(i,4)+Thg(i,3)],...
                     [(RNCc(i,3)+dp1+Thg(i,2)),(RNCc(i,3)+dp2+Thg(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+dp1+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+dp1+Thg(i,2); ...
                     RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+dp1+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+dp1+Thg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                  
               elseif LNC(i,6) > 0
                  plot3(axesm,[RNCc(i,2)+Thg(i,1),RNCc(i,2)+Thg(i,1) ],[RNCc(i,4)+Thg(i,3),RNCc(i,4)+Thg(i,3)],...
                     [(RNCc(i,3)-dp1+Thg(i,2)),(RNCc(i,3)-dp2+Thg(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                      
                  Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-dp1+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-dp1+Thg(i,2); ...
                     RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-dp1+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-dp1+Thg(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;            
               end                  
            elseif isequal(LNC(i,13),3) % Bottom flange
               if LNC(i,6) < 0
                  plot3(axesm,[RNCc(i,2)+Bhg(i,1),RNCc(i,2)+Bhg(i,1) ],[RNCc(i,4)+Bhg(i,3),RNCc(i,4)+Bhg(i,3)],...
                     [(RNCc(i,3)+dp1+Bhg(i,2)),(RNCc(i,3)+dp2+Bhg(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                   
                  Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+dp1+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+dp1+Bhg(i,2); ...
                     RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+dp1+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+dp1+Bhg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                  
               elseif LNC(i,6) > 0
                  plot3(axesm,[RNCc(i,2)+Bhg(i,1),RNCc(i,2)+Bhg(i,1) ],[RNCc(i,4)+Bhg(i,3),RNCc(i,4)+Bhg(i,3)],...
                     [(RNCc(i,3)-dp1+Bhg(i,2)),(RNCc(i,3)-dp2+Bhg(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                          
                  Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-dp1+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-dp1+Bhg(i,2); ...
                     RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-dp1+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-dp1+Bhg(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;            
               end 
            elseif isequal(LNC(i,13),4) % Centroid
               if LNC(i,6) < 0
                  plot3(axesm,[RNCc(i,2)+CSg(i,1),RNCc(i,2)+CSg(i,1) ],[RNCc(i,4)+CSg(i,3),RNCc(i,4)+CSg(i,3)],...
                     [(RNCc(i,3)+dp1+CSg(i,2)),(RNCc(i,3)+dp2+CSg(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                   
                  Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+dp1+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+dp1+CSg(i,2); ...
                     RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+dp1+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+dp1+CSg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                  
               elseif LNC(i,6) > 0
                  plot3(axesm,[RNCc(i,2)+CSg(i,1),RNCc(i,2)+CSg(i,1) ],[RNCc(i,4)+CSg(i,3),RNCc(i,4)+CSg(i,3)],...
                     [(RNCc(i,3)-dp1+CSg(i,2)),(RNCc(i,3)-dp2+CSg(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                          
                  Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-dp1+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-dp1+CSg(i,2); ...
                     RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-dp1+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-dp1+CSg(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;            
               end
            elseif isequal(LNC(i,13),5) % Mid-Web 
               if LNC(i,6) < 0
                  plot3(axesm,[RNCc(i,2)+Mhg(i,1),RNCc(i,2)+Mhg(i,1) ],[RNCc(i,4)+Mhg(i,3),RNCc(i,4)+Mhg(i,3)],...
                     [(RNCc(i,3)+dp1+Mhg(i,2)),(RNCc(i,3)+dp2+Mhg(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+dp1+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+dp1+Mhg(i,2); ...
                     RNCc(i,2)+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+dp1+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+dp1+Mhg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                  
               elseif LNC(i,6) > 0
                  plot3(axesm,[RNCc(i,2)+Mhg(i,1),RNCc(i,2)+Mhg(i,1) ],[RNCc(i,4)+Mhg(i,3),RNCc(i,4)+Mhg(i,3)],...
                     [(RNCc(i,3)-dp1+Mhg(i,2)),(RNCc(i,3)-dp2+Mhg(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                      
                  Sco = [RNCc(i,2)+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)-dp1+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)-dp1+Mhg(i,2); ...
                     RNCc(i,2)+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)-dp1+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)-dp1+Mhg(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;            
               end                                
            end
         end

         if ~isequal(LNC(i,7),0) % Force z-axis  
            if isequal(LNC(i,13),1) || isequal(LNC(i,13),0) % Shear center
               if LNC(i,7) > 0
                  plot3(axesm,[RNCc(i,2),RNCc(i,2) ],[(RNCc(i,4)+dp1),(RNCc(i,4)+dp2)],[RNCc(i,3),RNCc(i,3)],...
                     'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                   
                  Sco = [RNCc(i,2),RNCc(i,4)+dp1,RNCc(i,3); RNCc(i,2),RNCc(i,4)+dp1,RNCc(i,3); ...
                     RNCc(i,2),RNCc(i,4)+dp1,RNCc(i,3); RNCc(i,2),RNCc(i,4)+dp1,RNCc(i,3)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                   
               elseif LNC(i,7) < 0
                  plot3(axesm,[RNCc(i,2),RNCc(i,2) ],[(RNCc(i,4)-dp1),(RNCc(i,4)-dp2)],[RNCc(i,3),RNCc(i,3)],...
                     'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                   
                  Sco = [RNCc(i,2),RNCc(i,4)-dp1,RNCc(i,3); RNCc(i,2),RNCc(i,4)-dp1,RNCc(i,3); ...
                     RNCc(i,2),RNCc(i,4)-dp1,RNCc(i,3); RNCc(i,2),RNCc(i,4)-dp1,RNCc(i,3)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;            
               end 
            elseif isequal(LNC(i,13),2) % Top flange        
               if LNC(i,7) > 0
                  plot3(axesm,[RNCc(i,2)+Thg(i,1),RNCc(i,2)+Thg(i,1) ],[(RNCc(i,4)+dp1+Thg(i,3)),(RNCc(i,4)+dp2+Thg(i,3))],...
                     [RNCc(i,3)+Thg(i,2),RNCc(i,3)+Thg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on; 
                  Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)+dp1+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+dp1+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)+Thg(i,1),RNCc(i,4)+dp1+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+dp1+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                   
               elseif LNC(i,7) < 0
                  plot3(axesm,[RNCc(i,2)+Thg(i,1),RNCc(i,2)+Thg(i,1) ],[(RNCc(i,4)-dp1+Thg(i,3)),(RNCc(i,4)-dp2+Thg(i,3))],...
                     [RNCc(i,3)+Thg(i,2),RNCc(i,3)+Thg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on; 
                  Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)-dp1+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)-dp1+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)+Thg(i,1),RNCc(i,4)-dp1+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)-dp1+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;              
               end  
            elseif isequal(LNC(i,13),3) % Bottom flange
               if LNC(i,7) > 0
                  plot3(axesm,[RNCc(i,2)+Bhg(i,1),RNCc(i,2)+Bhg(i,1) ],[(RNCc(i,4)+dp1+Bhg(i,3)),(RNCc(i,4)+dp2+Bhg(i,3))],...
                     [RNCc(i,3)+Bhg(i,2),RNCc(i,3)+Bhg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on; 
                  Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)+dp1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+dp1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)+Bhg(i,1),RNCc(i,4)+dp1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+dp1+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                   
               elseif LNC(i,7) < 0
                  plot3(axesm,[RNCc(i,2)+Bhg(i,1),RNCc(i,2)+Bhg(i,1) ],[(RNCc(i,4)-dp1+Bhg(i,3)),(RNCc(i,4)-dp2+Bhg(i,3))],...
                     [RNCc(i,3)+Bhg(i,2),RNCc(i,3)+Bhg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on; 
                  Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)-dp1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)-dp1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)+Bhg(i,1),RNCc(i,4)-dp1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)-dp1+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;              
               end  
            elseif isequal(LNC(i,13),4) % Centroid
               if LNC(i,7) > 0
                  plot3(axesm,[RNCc(i,2)+CSg(i,1),RNCc(i,2)+CSg(i,1) ],[(RNCc(i,4)+dp1+CSg(i,3)),(RNCc(i,4)+dp2+CSg(i,3))],...
                     [RNCc(i,3)+CSg(i,2),RNCc(i,3)+CSg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on; 
                  Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)+dp1+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+dp1+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)+CSg(i,1),RNCc(i,4)+dp1+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+dp1+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                   
               elseif LNC(i,7) < 0
                  plot3(axesm,[RNCc(i,2)+CSg(i,1),RNCc(i,2)+CSg(i,1) ],[(RNCc(i,4)-dp1+CSg(i,3)),(RNCc(i,4)-dp2+CSg(i,3))],...
                     [RNCc(i,3)+CSg(i,2),RNCc(i,3)+CSg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on; 
                  Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)-dp1+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)-dp1+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)+CSg(i,1),RNCc(i,4)-dp1+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)-dp1+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;              
               end 
            elseif isequal(LNC(i,13),5) % Mid-Web        
               if LNC(i,7) > 0
                  plot3(axesm,[RNCc(i,2)+Mhg(i,1),RNCc(i,2)+Mhg(i,1) ],[(RNCc(i,4)+dp1+Mhg(i,3)),(RNCc(i,4)+dp2+Mhg(i,3))],...
                     [RNCc(i,3)+Mhg(i,2),RNCc(i,3)+Mhg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on; 
                  Sco = [RNCc(i,2)+Mhg(i,1),RNCc(i,4)+dp1+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)+dp1+Mhg(i,3),RNCc(i,3)+Mhg(i,2); ...
                     RNCc(i,2)+Mhg(i,1),RNCc(i,4)+dp1+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)+dp1+Mhg(i,3),RNCc(i,3)+Mhg(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                   
               elseif LNC(i,7) < 0
                  plot3(axesm,[RNCc(i,2)+Mhg(i,1),RNCc(i,2)+Mhg(i,1) ],[(RNCc(i,4)-dp1+Mhg(i,3)),(RNCc(i,4)-dp2+Mhg(i,3))],...
                     [RNCc(i,3)+Mhg(i,2),RNCc(i,3)+Mhg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on; 
                  Sco = [RNCc(i,2)+Mhg(i,1),RNCc(i,4)-dp1+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)-dp1+Mhg(i,3),RNCc(i,3)+Mhg(i,2); ...
                     RNCc(i,2)+Mhg(i,1),RNCc(i,4)-dp1+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)-dp1+Mhg(i,3),RNCc(i,3)+Mhg(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;              
               end                               
            end
         end
         
         if ~isequal(LNC(i,8),0) % Torsion
            if isequal(LNC(i,13),1) || isequal(LNC(i,13),0) % Shear center
               plot3(axesm,z+RNCc(i,2),x+RNCc(i,4),y+RNCc(i,3),'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               if LNC(i,8) > 0
                  Sco = [RNCc(i,2),RNCc(i,4),RNCc(i,3)-prd; RNCc(i,2),RNCc(i,4),RNCc(i,3)-prd; ...
                     RNCc(i,2),RNCc(i,4),RNCc(i,3)-prd; RNCc(i,2),RNCc(i,4),RNCc(i,3)-prd];
                  Nro = [0,-sqrt(2),-sqrt(2)/2; 0,0,0; 0,-sqrt(2),sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                    
               elseif LNC(i,8) < 0
                  Sco = [RNCc(i,2),RNCc(i,4)+prd,RNCc(i,3); RNCc(i,2),RNCc(i,4)+prd,RNCc(i,3); ...
                     RNCc(i,2),RNCc(i,4)+prd,RNCc(i,3); RNCc(i,2),RNCc(i,4)+prd,RNCc(i,3)];
                  Nro = [0,-sqrt(2)/2,sqrt(2); 0,0,0; 0,sqrt(2)/2,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;            
               end    
            elseif isequal(LNC(i,13),2) % Top flange
                plot3(axesm,z+RNCc(i,2)+Thg(i,1),x+RNCc(i,4)+Thg(i,3),y+RNCc(i,3)+Thg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               if LNC(i,8) > 0
                  Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-prd+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-prd+Thg(i,2); ...
                     RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-prd+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-prd+Thg(i,2)];
                  Nro = [0,-sqrt(2),-sqrt(2)/2; 0,0,0; 0,-sqrt(2),sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                    
               elseif LNC(i,8) < 0
                  Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)+prd+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+prd+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)+Thg(i,1),RNCc(i,4)+prd+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+prd+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [0,-sqrt(2)/2,sqrt(2); 0,0,0; 0,sqrt(2)/2,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                              
               end  
            elseif isequal(LNC(i,13),3) % Bottom flange
                plot3(axesm,z+RNCc(i,2)+Bhg(i,1),x+RNCc(i,4)+Bhg(i,3),y+RNCc(i,3)+Bhg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               if LNC(i,8) > 0
                  Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-prd+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-prd+Bhg(i,2); ...
                     RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-prd+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-prd+Bhg(i,2)];
                  Nro = [0,-sqrt(2),-sqrt(2)/2; 0,0,0; 0,-sqrt(2),sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
               elseif LNC(i,8) < 0
                  Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)+prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)+Bhg(i,1),RNCc(i,4)+prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [0,-sqrt(2)/2,sqrt(2); 0,0,0; 0,sqrt(2)/2,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;           
               end   
            elseif isequal(LNC(i,13),4) % Centroid
                plot3(axesm,z+RNCc(i,2)+CSg(i,1),x+RNCc(i,4)+CSg(i,3),y+RNCc(i,3)+CSg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               if LNC(i,8) > 0
                  Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-prd+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-prd+CSg(i,2); ...
                     RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-prd+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-prd+CSg(i,2)];
                  Nro = [0,-sqrt(2),-sqrt(2)/2; 0,0,0; 0,-sqrt(2),sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
               elseif LNC(i,8) < 0
                  Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)+prd+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+prd+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)+CSg(i,1),RNCc(i,4)+prd+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+prd+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [0,-sqrt(2)/2,sqrt(2); 0,0,0; 0,sqrt(2)/2,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;           
               end 
            elseif isequal(LNC(i,13),5) % Mid-Web
                plot3(axesm,z+RNCc(i,2)+Mhg(i,1),x+RNCc(i,4)+Mhg(i,3),y+RNCc(i,3)+Mhg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               if LNC(i,8) > 0
                  Sco = [RNCc(i,2)+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)-prd+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)-prd+Mhg(i,2); ...
                     RNCc(i,2)+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)-prd+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)-prd+Mhg(i,2)];
                  Nro = [0,-sqrt(2),-sqrt(2)/2; 0,0,0; 0,-sqrt(2),sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                    
               elseif LNC(i,8) < 0
                  Sco = [RNCc(i,2)+Mhg(i,1),RNCc(i,4)+prd+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)+prd+Mhg(i,3),RNCc(i,3)+Mhg(i,2); ...
                     RNCc(i,2)+Mhg(i,1),RNCc(i,4)+prd+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)+prd+Mhg(i,3),RNCc(i,3)+Mhg(i,2)];
                  Nro = [0,-sqrt(2)/2,sqrt(2); 0,0,0; 0,sqrt(2)/2,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                              
               end                               
            end
         end

         if ~isequal(LNC(i,9),0) % Moment y-axis
            if isequal(LNC(i,13),1) || isequal(LNC(i,13),0) % Shear center
               if LNC(i,9) > 0
                  plot3(axesm,x+RNCc(i,2),y+RNCc(i,4),z+RNCc(i,3),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2),RNCc(i,4)-prd,RNCc(i,3); RNCc(i,2),RNCc(i,4)-prd,RNCc(i,3); ...
                     RNCc(i,2),RNCc(i,4)-prd,RNCc(i,3); RNCc(i,2),RNCc(i,4)-prd,RNCc(i,3)];
                  Nro = [-sqrt(2),-sqrt(2)/2,0; 0,0,0; -sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                      
               elseif LNC(i,9) < 0
                  plot3(axesm,x1+RNCc(i,2),y1+RNCc(i,4),z+RNCc(i,3),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2),RNCc(i,4)-prd,RNCc(i,3); RNCc(i,2),RNCc(i,4)-prd,RNCc(i,3); ...
                     RNCc(i,2),RNCc(i,4)-prd,RNCc(i,3); RNCc(i,2),RNCc(i,4)-prd,RNCc(i,3)];
                  Nro = [sqrt(2),-sqrt(2)/2,0; 0,0,0; sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                              
               end 
            elseif isequal(LNC(i,13),2) % Top flange
               if LNC(i,9) > 0
                  plot3(axesm,x+RNCc(i,2)+Thg(i,1),y+RNCc(i,4)+Thg(i,3),z+RNCc(i,3)+Thg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)-prd+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)-prd+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)+Thg(i,1),RNCc(i,4)-prd+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)-prd+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [-sqrt(2),-sqrt(2)/2,0; 0,0,0; -sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                     
               elseif LNC(i,9) < 0
                  plot3(axesm,x1+RNCc(i,2)+Thg(i,1),y1+RNCc(i,4)+Thg(i,3),z+RNCc(i,3)+Thg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                   
                  Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)-prd+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)-prd+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)+Thg(i,1),RNCc(i,4)-prd+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)-prd+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [sqrt(2),-sqrt(2)/2,0; 0,0,0; sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;             
               end                
            elseif isequal(LNC(i,13),3) % Bottom flange
               if LNC(i,9) > 0
                  plot3(axesm,x+RNCc(i,2)+Bhg(i,1),y+RNCc(i,4)+Bhg(i,3),z+RNCc(i,3)+Bhg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)-prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)-prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)+Bhg(i,1),RNCc(i,4)-prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)-prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [-sqrt(2),-sqrt(2)/2,0; 0,0,0; -sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
               elseif LNC(i,9) < 0
                  plot3(axesm,x1+RNCc(i,2)+Bhg(i,1),y1+RNCc(i,4)+Bhg(i,3),z+RNCc(i,3)+Bhg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                    
                  Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)-prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)-prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)+Bhg(i,1),RNCc(i,4)-prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)-prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [sqrt(2),-sqrt(2)/2,0; 0,0,0; sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;           
               end   
            elseif isequal(LNC(i,13),4) % Centroid
               if LNC(i,9) > 0
                  plot3(axesm,x+RNCc(i,2)+CSg(i,1),y+RNCc(i,4)+CSg(i,3),z+RNCc(i,3)+CSg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)-prd+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)-prd+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)+CSg(i,1),RNCc(i,4)-prd+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)-prd+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [-sqrt(2),-sqrt(2)/2,0; 0,0,0; -sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
               elseif LNC(i,9) < 0
                  plot3(axesm,x1+RNCc(i,2)+CSg(i,1),y1+RNCc(i,4)+CSg(i,3),z+RNCc(i,3)+CSg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                    
                  Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)-prd+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)-prd+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)+CSg(i,1),RNCc(i,4)-prd+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)-prd+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [sqrt(2),-sqrt(2)/2,0; 0,0,0; sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;           
               end 
            elseif isequal(LNC(i,13),5) % Mid-Web
               if LNC(i,9) > 0
                  plot3(axesm,x+RNCc(i,2)+Mhg(i,1),y+RNCc(i,4)+Mhg(i,3),z+RNCc(i,3)+Mhg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+Mhg(i,1),RNCc(i,4)-prd+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)-prd+Mhg(i,3),RNCc(i,3)+Mhg(i,2); ...
                     RNCc(i,2)+Mhg(i,1),RNCc(i,4)-prd+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)-prd+Mhg(i,3),RNCc(i,3)+Mhg(i,2)];
                  Nro = [-sqrt(2),-sqrt(2)/2,0; 0,0,0; -sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                     
               elseif LNC(i,9) < 0
                  plot3(axesm,x1+RNCc(i,2)+Mhg(i,1),y1+RNCc(i,4)+Mhg(i,3),z+RNCc(i,3)+Mhg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                   
                  Sco = [RNCc(i,2)+Mhg(i,1),RNCc(i,4)-prd+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)-prd+Mhg(i,3),RNCc(i,3)+Mhg(i,2); ...
                     RNCc(i,2)+Mhg(i,1),RNCc(i,4)-prd+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)-prd+Mhg(i,3),RNCc(i,3)+Mhg(i,2)];
                  Nro = [sqrt(2),-sqrt(2)/2,0; 0,0,0; sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;             
               end                              
            end 
         end

         if ~isequal(LNC(i,10),0) % Moment z-axis
            if isequal(LNC(i,13),1) || isequal(LNC(i,13),0) % Shear center
               if LNC(i,10) > 0
                  plot3(axesm,x1+RNCc(i,2),z+RNCc(i,4),y1+RNCc(i,3),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                    
                  Sco = [RNCc(i,2)-prd,RNCc(i,4),RNCc(i,3); RNCc(i,2)-prd,RNCc(i,4),RNCc(i,3); ...
                     RNCc(i,2)-prd,RNCc(i,4),RNCc(i,3); RNCc(i,2)-prd,RNCc(i,4),RNCc(i,3)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                    
               elseif LNC(i,10) < 0
                  plot3(axesm,x+RNCc(i,2),z+RNCc(i,4),y+RNCc(i,3),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+prd,RNCc(i,4),RNCc(i,3); RNCc(i,2)+prd,RNCc(i,4),RNCc(i,3); ...
                     RNCc(i,2)+prd,RNCc(i,4),RNCc(i,3); RNCc(i,2)+prd,RNCc(i,4),RNCc(i,3)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;             
               end              
            elseif isequal(LNC(i,13),2) % Top flange
               if LNC(i,10) > 0
                  plot3(axesm,x1+RNCc(i,2)+Thg(i,1),z+RNCc(i,4)+Thg(i,3),y1+RNCc(i,3)+Thg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                    
                  Sco = [RNCc(i,2)-prd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-prd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)-prd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-prd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
               elseif LNC(i,10) < 0
                  plot3(axesm,x+RNCc(i,2)+Thg(i,1),z+RNCc(i,4)+Thg(i,3),y+RNCc(i,3)+Thg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+prd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+prd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)+prd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+prd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;            
               end   
            elseif isequal(LNC(i,13),3) % Bottom flange
               if LNC(i,10) > 0
                  plot3(axesm,x1+RNCc(i,2)+Bhg(i,1),z+RNCc(i,4)+Bhg(i,3),y1+RNCc(i,3)+Bhg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                    
                  Sco = [RNCc(i,2)-prd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-prd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)-prd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-prd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
               elseif LNC(i,10) < 0
                  plot3(axesm,x+RNCc(i,2)+Bhg(i,1),z+RNCc(i,4)+Bhg(i,3),y+RNCc(i,3)+Bhg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+prd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+prd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)+prd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+prd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;            
               end    
            elseif isequal(LNC(i,13),4) % Centroid
               if LNC(i,10) > 0
                  plot3(axesm,x1+RNCc(i,2)+CSg(i,1),z+RNCc(i,4)+CSg(i,3),y1+RNCc(i,3)+CSg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                    
                  Sco = [RNCc(i,2)-prd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-prd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)-prd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-prd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
               elseif LNC(i,10) < 0
                  plot3(axesm,x+RNCc(i,2)+CSg(i,1),z+RNCc(i,4)+CSg(i,3),y+RNCc(i,3)+CSg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+prd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+prd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)+prd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+prd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;            
               end 
            elseif isequal(LNC(i,13),5) % Mid-Web
               if LNC(i,10) > 0
                  plot3(axesm,x1+RNCc(i,2)+Mhg(i,1),z+RNCc(i,4)+Mhg(i,3),y1+RNCc(i,3)+Mhg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                    
                  Sco = [RNCc(i,2)-prd+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)-prd+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2); ...
                     RNCc(i,2)-prd+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)-prd+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
               elseif LNC(i,10) < 0
                  plot3(axesm,x+RNCc(i,2)+Mhg(i,1),z+RNCc(i,4)+Mhg(i,3),y+RNCc(i,3)+Mhg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+prd+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+prd+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2); ...
                     RNCc(i,2)+prd+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+prd+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;            
               end                                   
            end
         end               
      end
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
            elseif isequal(LUEC(i,17),5) % Mid-Depth
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
   end                   
      
end % if JNodevalue end

set(axesm,'Visible','off','Units','normalized','DataAspectRatio',[1 1 1]) 
set( gca, 'Units', 'normalized', 'Position', [0 0 0.9 1] ); 

% set initial data automatically.
set(lum_type_mem,'String','')
set(lum_type_seg,'String','')
set(lum_wx_edit,'String','0')
set(lum_wy_edit,'String','0')
set(lum_wz_edit,'String','0') 
if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
   set(findobj('Color','c'),'Color','k')
elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background
   set(findobj('Color','c'),'Color','w')
end 
