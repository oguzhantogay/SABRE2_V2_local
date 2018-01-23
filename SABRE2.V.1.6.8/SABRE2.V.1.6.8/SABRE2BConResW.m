function [PNC,PNC1,PNC2]=SABRE2BConResW(JNodevalue,JNodevalue_i,JNodevalue_j,...
   Massemble,Rval,RNCc,DUP1,DUP2,PNC,PNC1,PNC2,Bhg,Thg,CSg,bfm_type_name,...
   bfm_coordx_edit,bfm_coordy_edit,bfm_coordz_edit,bfm_ux_edit,...
   bfm_uy_edit,bfm_uz_edit,bfm_rx_edit,bfm_ry_edit,bfm_rz_edit,...
   bfm_phix_edit,bfm_height_edit,bfm_ux_buttongroup,...
   bfm_uy_buttongroup,bfm_uz_buttongroup,bfm_rx_buttongroup,...
   bfm_ry_buttongroup,bfm_rz_buttongroup,bfm_phix_buttongroup,LabType,axesm,vstm)
% Developed by Woo Yong Jeong.
% Date : 07/01/2013.
% ************************************************************************
% *****************    Nodal Boundary Conditions      ********************
% ************************************************************************
PNC=[]; PNC1=[]; PNC2=[];


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

   delete(findobj('color',[0.5,0.5,0.5]))
   delete(findobj('FaceColor',[0.5,0.5,0.5]))
   delete(findobj('EdgeColor',[0.5,0.5,0.5]))
   % ---------------------------------------------------------------------
   % ----------        Plot Boundary Conditions       --------------------
   % --------------------------------------------------------------------- 
   lt=1.35; % Line thickness
   xb=7;    % Markersize Fixities
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
                  'HitTest','off','Color',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,[(RNCc(i,2))-df2*2/5, (RNCc(i,2)-df2/2-df2/5)],[RNCc(i,4),RNCc(i,4)],[RNCc(i,3)+df2/8,RNCc(i,3)-df2/8],...
                  'HitTest','off','Color',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                
               Sco = [RNCc(i,2)-df1,RNCc(i,4),RNCc(i,3); RNCc(i,2)-df1,RNCc(i,4),RNCc(i,3); ...
                  RNCc(i,2)-df1,RNCc(i,4),RNCc(i,3); RNCc(i,2)-df1,RNCc(i,4),RNCc(i,3)];
               Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor',[0.5,0.5,0.5],'EdgeColor',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                                
            elseif isequal(PNC(i,13),2) % Top flange 
               plot3(axesm,[(RNCc(i,2)-df1+Thg(i,1)), (RNCc(i,2)-df2+Thg(i,1))],...
                  [RNCc(i,4)+Thg(i,3),RNCc(i,4)+Thg(i,3)],[RNCc(i,3)+Thg(i,2),RNCc(i,3)+Thg(i,2)],'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;          
               plot3(axesm,[(RNCc(i,2)-df2*2/5+Thg(i,1)), (RNCc(i,2)-df2/2-df2/5+Thg(i,1))],...
                  [RNCc(i,4)+Thg(i,3),RNCc(i,4)+Thg(i,3)],[RNCc(i,3)+Thg(i,2)+df2/8,RNCc(i,3)+Thg(i,2)-df2/8],'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               Sco = [RNCc(i,2)-df1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-df1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                  RNCc(i,2)-df1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-df1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2)];
               Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor',[0.5,0.5,0.5],'EdgeColor',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                
             elseif isequal(PNC(i,13),3) % Bottom flange   
               plot3(axesm,[(RNCc(i,2)-df1+Bhg(i,1)), (RNCc(i,2)-df2+Bhg(i,1))],...
                  [RNCc(i,4)+Bhg(i,3),RNCc(i,4)+Bhg(i,3)],[RNCc(i,3)+Bhg(i,2),RNCc(i,3)+Bhg(i,2)],'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                
               plot3(axesm,[(RNCc(i,2)-df2*2/5+Bhg(i,1)), (RNCc(i,2)-df2/2-df2/5+Bhg(i,1))],...
                  [RNCc(i,4)+Bhg(i,3),RNCc(i,4)+Bhg(i,3)],[RNCc(i,3)+Bhg(i,2)+df2/8,RNCc(i,3)+Bhg(i,2)-df2/8],'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                
               Sco = [RNCc(i,2)-df1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-df1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                  RNCc(i,2)-df1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-df1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
               Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor',[0.5,0.5,0.5],'EdgeColor',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;    
             elseif isequal(PNC(i,13),4) % Centroid   
               plot3(axesm,[(RNCc(i,2)-df1+CSg(i,1)), (RNCc(i,2)-df2+CSg(i,1))],...
                  [RNCc(i,4)+CSg(i,3),RNCc(i,4)+CSg(i,3)],[RNCc(i,3)+CSg(i,2),RNCc(i,3)+CSg(i,2)],'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                
               plot3(axesm,[(RNCc(i,2)-df2*2/5+CSg(i,1)), (RNCc(i,2)-df2/2-df2/5+CSg(i,1))],...
                  [RNCc(i,4)+CSg(i,3),RNCc(i,4)+CSg(i,3)],[RNCc(i,3)+CSg(i,2)+df2/8,RNCc(i,3)+CSg(i,2)-df2/8],'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;              
               Sco = [RNCc(i,2)-df1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-df1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                  RNCc(i,2)-df1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-df1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2)];
               Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor',[0.5,0.5,0.5],'EdgeColor',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                
            end
         end

         if ~isequal(PNC(i,6),0) % Fixed y-axis
            if isequal(PNC(i,13),1) || isequal(PNC(i,13),0) % Shear center 
               plot3(axesm,[RNCc(i,2),RNCc(i,2) ],[RNCc(i,4),RNCc(i,4)],[(RNCc(i,3)-df1),(RNCc(i,3)-df2)],...
                  'HitTest','off','Color',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;  
               plot3(axesm,[RNCc(i,2)-df2/8,RNCc(i,2)+df2/8 ],[RNCc(i,4),RNCc(i,4)],[(RNCc(i,3)-df2*2/5),(RNCc(i,3)-df2/2-df2/5)],...
                  'HitTest','off','Color',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;               
               Sco = [RNCc(i,2),RNCc(i,4),RNCc(i,3)-df1; RNCc(i,2),RNCc(i,4),RNCc(i,3)-df1; ...
                  RNCc(i,2),RNCc(i,4),RNCc(i,3)-df1; RNCc(i,2),RNCc(i,4),RNCc(i,3)-df1];
               Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dfs; 
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor',[0.5,0.5,0.5],'EdgeColor',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                          
            elseif isequal(PNC(i,13),2) % Top flange    
               plot3(axesm,[RNCc(i,2)+Thg(i,1),RNCc(i,2)+Thg(i,1) ],[RNCc(i,4)+Thg(i,3),RNCc(i,4)+Thg(i,3)],...
                  [(RNCc(i,3)-df1+Thg(i,2)),(RNCc(i,3)-df2+Thg(i,2))],'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;              
               plot3(axesm,[RNCc(i,2)+Thg(i,1)-df2/8,RNCc(i,2)+Thg(i,1)+df2/8 ],[RNCc(i,4)+Thg(i,3),RNCc(i,4)+Thg(i,3)],...
                  [(RNCc(i,3)-df2*2/5+Thg(i,2)),(RNCc(i,3)-df2/2-df2/5+Thg(i,2))],'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;         
               Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-df1+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-df1+Thg(i,2); ...
                  RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-df1+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-df1+Thg(i,2)];
               Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dfs; 
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor',[0.5,0.5,0.5],'EdgeColor',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                 
            elseif isequal(PNC(i,13),3) % Bottom flange   
               plot3(axesm,[RNCc(i,2)+Bhg(i,1),RNCc(i,2)+Bhg(i,1) ],[RNCc(i,4)+Bhg(i,3),RNCc(i,4)+Bhg(i,3)],...
                  [(RNCc(i,3)-df1+Bhg(i,2)),(RNCc(i,3)-df2+Bhg(i,2))],'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                 
               plot3(axesm,[RNCc(i,2)+Bhg(i,1)-df2/8,RNCc(i,2)+Bhg(i,1)+df2/8 ],[RNCc(i,4)+Bhg(i,3),RNCc(i,4)+Bhg(i,3)],...
                  [(RNCc(i,3)-df2*2/5+Bhg(i,2)),(RNCc(i,3)-df2/2-df2/5+Bhg(i,2))],'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;               
               Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-df1+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-df1+Bhg(i,2); ...
                  RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-df1+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-df1+Bhg(i,2)];
               Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dfs; 
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor',[0.5,0.5,0.5],'EdgeColor',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;   
            elseif isequal(PNC(i,13),4) % Centroid   
               plot3(axesm,[RNCc(i,2)+CSg(i,1),RNCc(i,2)+CSg(i,1) ],[RNCc(i,4)+CSg(i,3),RNCc(i,4)+CSg(i,3)],...
                  [(RNCc(i,3)-df1+CSg(i,2)),(RNCc(i,3)-df2+CSg(i,2))],'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;               
               plot3(axesm,[RNCc(i,2)+CSg(i,1)-df2/8,RNCc(i,2)+CSg(i,1)+df2/8 ],[RNCc(i,4)+CSg(i,3),RNCc(i,4)+CSg(i,3)],...
                  [(RNCc(i,3)-df2*2/5+CSg(i,2)),(RNCc(i,3)-df2/2-df2/5+CSg(i,2))],'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;              
               Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-df1+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-df1+CSg(i,2); ...
                  RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-df1+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-df1+CSg(i,2)];
               Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dfs; 
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor',[0.5,0.5,0.5],'EdgeColor',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                  
            end 
         end

         if ~isequal(PNC(i,7),0) % Fixed z-axis 
            if isequal(PNC(i,13),1) || isequal(PNC(i,13),0)  % Shear center 
               plot3(axesm,[RNCc(i,2),RNCc(i,2) ],[(RNCc(i,4)+df1),(RNCc(i,4)+df2)],[RNCc(i,3),RNCc(i,3)],...
                  'HitTest','off','Color',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,[RNCc(i,2),RNCc(i,2) ],[(RNCc(i,4)+df2*2/5),(RNCc(i,4)+df2/2+df2/5)],[RNCc(i,3)+df2/8,RNCc(i,3)-df2/8],...
                  'HitTest','off','Color',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;               
               Sco = [RNCc(i,2),RNCc(i,4)+df1,RNCc(i,3); RNCc(i,2),RNCc(i,4)+df1,RNCc(i,3); ...
                  RNCc(i,2),RNCc(i,4)+df1,RNCc(i,3); RNCc(i,2),RNCc(i,4)+df1,RNCc(i,3)];
               Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor',[0.5,0.5,0.5],'EdgeColor',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                   
            elseif isequal(PNC(i,13),2) % Top flange
               plot3(axesm,[RNCc(i,2)+Thg(i,1),RNCc(i,2)+Thg(i,1) ],[(RNCc(i,4)+df1+Thg(i,3)),(RNCc(i,4)+df2+Thg(i,3))],...
                  [RNCc(i,3)+Thg(i,2),RNCc(i,3)+Thg(i,2)],'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;               
               plot3(axesm,[RNCc(i,2)+Thg(i,1),RNCc(i,2)+Thg(i,1) ],[(RNCc(i,4)+df2*2/5+Thg(i,3)),(RNCc(i,4)++df2/2+df2/5+Thg(i,3))],...
                  [RNCc(i,3)+Thg(i,2)+df2/8,RNCc(i,3)+Thg(i,2)-df2/8],'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;               
               Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)+df1+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+df1+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                  RNCc(i,2)+Thg(i,1),RNCc(i,4)+df1+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+df1+Thg(i,3),RNCc(i,3)+Thg(i,2)];
               Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor',[0.5,0.5,0.5],'EdgeColor',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                 
            elseif isequal(PNC(i,13),3) % Bottom flange
               plot3(axesm,[RNCc(i,2)+Bhg(i,1),RNCc(i,2)+Bhg(i,1) ],[(RNCc(i,4)+df1+Bhg(i,3)),(RNCc(i,4)+df2+Bhg(i,3))],...
                  [RNCc(i,3)+Bhg(i,2),RNCc(i,3)+Bhg(i,2)],'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;               
               plot3(axesm,[RNCc(i,2)+Bhg(i,1),RNCc(i,2)+Bhg(i,1) ],[(RNCc(i,4)+df2*2/5+Bhg(i,3)),(RNCc(i,4)+df2/2+df2/5+Bhg(i,3))],...
                  [RNCc(i,3)+Bhg(i,2)+df2/8,RNCc(i,3)+Bhg(i,2)-df2/8],'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;              
               Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)+df1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+df1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                  RNCc(i,2)+Bhg(i,1),RNCc(i,4)+df1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+df1+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
               Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor',[0.5,0.5,0.5],'EdgeColor',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;   
            elseif isequal(PNC(i,13),4) % Centroid
               plot3(axesm,[RNCc(i,2)+CSg(i,1),RNCc(i,2)+CSg(i,1) ],[(RNCc(i,4)+df1+CSg(i,3)),(RNCc(i,4)+df2+CSg(i,3))],...
                  [RNCc(i,3)+CSg(i,2),RNCc(i,3)+CSg(i,2)],'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                
               plot3(axesm,[RNCc(i,2)+CSg(i,1),RNCc(i,2)+CSg(i,1) ],[(RNCc(i,4)+df2*2/5+CSg(i,3)),(RNCc(i,4)+df2/2+df2/5+CSg(i,3))],...
                  [RNCc(i,3)+CSg(i,2)+df2/8,RNCc(i,3)+CSg(i,2)-df2/8],'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                
               Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)+df1+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+df1+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                  RNCc(i,2)+CSg(i,1),RNCc(i,4)+df1+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+df1+CSg(i,3),RNCc(i,3)+CSg(i,2)];
               Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor',[0.5,0.5,0.5],'EdgeColor',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                
            end
         end

         if ~isequal(PNC(i,8),0) % Fixed Torsion
            if isequal(PNC(i,13),1) || isequal(PNC(i,13),0) % Shear center
               plot3(axesm,z+RNCc(i,2),x+RNCc(i,4),y+RNCc(i,3),'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,[RNCc(i,2),RNCc(i,2) ],[(RNCc(i,4)+df2*2/5-xa*cos(pi/4)),(RNCc(i,4)+df2/2+df2/5)-xa*cos(pi/4)],[RNCc(i,3)+df2/8+xa*0.4*sin(pi/4),RNCc(i,3)-df2/8+xa*0.4*sin(pi/4)],...
                  'HitTest','off','Color',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;               
               Sco = [RNCc(i,2),RNCc(i,4),RNCc(i,3)-frd; RNCc(i,2),RNCc(i,4),RNCc(i,3)-frd; ...
                  RNCc(i,2),RNCc(i,4),RNCc(i,3)-frd; RNCc(i,2),RNCc(i,4),RNCc(i,3)-frd]; 
               Nro = [0,-sqrt(2),-sqrt(2)/2; 0,0,0; 0,-sqrt(2),sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor',[0.5,0.5,0.5],'EdgeColor',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on; 
                  
            elseif isequal(PNC(i,13),2) % Top flange
               plot3(axesm,z+RNCc(i,2)+Thg(i,1),x+RNCc(i,4)+Thg(i,3),y+RNCc(i,3)+Thg(i,2),'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;          
               plot3(axesm,[RNCc(i,2)+Thg(i,1),RNCc(i,2)+Thg(i,1) ],[(RNCc(i,4)+df2*2/5-xa*cos(pi/4))+Thg(i,3),(RNCc(i,4)+df2/2+df2/5)-xa*cos(pi/4)+Thg(i,3)],[RNCc(i,3)+df2/8+xa*0.4*sin(pi/4)+Thg(i,2),RNCc(i,3)-df2/8+xa*0.4*sin(pi/4)+Thg(i,2)],...
                  'HitTest','off','Color',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                
               Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-frd+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-frd+Thg(i,2); ...
                  RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-frd+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-frd+Thg(i,2)];    
               Nro = [0,-sqrt(2),-sqrt(2)/2; 0,0,0; 0,-sqrt(2),sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor',[0.5,0.5,0.5],'EdgeColor',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;   
               
            elseif isequal(PNC(i,13),3) % Bottom flange
               plot3(axesm,z+RNCc(i,2)+Bhg(i,1),x+RNCc(i,4)+Bhg(i,3),y+RNCc(i,3)+Bhg(i,2),'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,[RNCc(i,2)+Bhg(i,1),RNCc(i,2)+Bhg(i,1) ],[(RNCc(i,4)+df2*2/5-xa*cos(pi/4))+Bhg(i,3),(RNCc(i,4)+df2/2+df2/5)-xa*cos(pi/4)+Bhg(i,3)],[RNCc(i,3)+df2/8+xa*0.4*sin(pi/4)+Bhg(i,2),RNCc(i,3)-df2/8+xa*0.4*sin(pi/4)+Bhg(i,2)],...
                  'HitTest','off','Color',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                 
               Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-frd+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-frd+Bhg(i,2); ...
                  RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-frd+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-frd+Bhg(i,2)];  
               Nro = [0,-sqrt(2),-sqrt(2)/2; 0,0,0; 0,-sqrt(2),sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor',[0.5,0.5,0.5],'EdgeColor',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;       
               
            elseif isequal(PNC(i,13),4) % Centroid
               plot3(axesm,z+RNCc(i,2)+CSg(i,1),x+RNCc(i,4)+CSg(i,3),y+RNCc(i,3)+CSg(i,2),'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,[RNCc(i,2)+CSg(i,1),RNCc(i,2)+CSg(i,1) ],[(RNCc(i,4)+df2*2/5-xa*cos(pi/4))+CSg(i,3),(RNCc(i,4)+df2/2+df2/5)-xa*cos(pi/4)+CSg(i,3)],[RNCc(i,3)+df2/8+xa*0.4*sin(pi/4)+CSg(i,2),RNCc(i,3)-df2/8+xa*0.4*sin(pi/4)+CSg(i,2)],...
                  'HitTest','off','Color',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;               
               Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-frd+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-frd+CSg(i,2); ...
                  RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-frd+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-frd+CSg(i,2)];  
               Nro = [0,-sqrt(2),-sqrt(2)/2; 0,0,0; 0,-sqrt(2),sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor',[0.5,0.5,0.5],'EdgeColor',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                
            end
         end

         if ~isequal(PNC(i,9),0) % Fixed Moment y-axis
            if isequal(PNC(i,13),1) || isequal(PNC(i,13),0) % Shear center
               plot3(axesm,x+RNCc(i,2),y+RNCc(i,4),z+RNCc(i,3),'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,[RNCc(i,2)+df2*2/5-xa*cos(pi/4),RNCc(i,2)+df2/2+df2/5-xa*cos(pi/4) ],[(RNCc(i,4)+df2/8+xa*0.4*sin(pi/4)),(RNCc(i,4)-df2/8+xa*0.4*sin(pi/4))],[RNCc(i,3),RNCc(i,3)],...
                  'HitTest','off','Color',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                
               Sco = [RNCc(i,2),RNCc(i,4)-frd,RNCc(i,3); RNCc(i,2),RNCc(i,4)-frd,RNCc(i,3); ...
                  RNCc(i,2),RNCc(i,4)-frd,RNCc(i,3); RNCc(i,2),RNCc(i,4)-frd,RNCc(i,3)];
               Nro = [-sqrt(2),-sqrt(2)/2,0; 0,0,0; -sqrt(2),sqrt(2)/2,0; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor',[0.5,0.5,0.5],'EdgeColor',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;  
            elseif isequal(PNC(i,13),2) % Top flange
               plot3(axesm,x+RNCc(i,2)+Thg(i,1),y+RNCc(i,4)+Thg(i,3),z+RNCc(i,3)+Thg(i,2),'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,[RNCc(i,2)+df2*2/5-xa*cos(pi/4)+Thg(i,1),RNCc(i,2)+df2/2+df2/5-xa*cos(pi/4)+Thg(i,1) ],[(RNCc(i,4)+df2/8+xa*0.4*sin(pi/4))+Thg(i,3),(RNCc(i,4)-df2/8+xa*0.4*sin(pi/4))+Thg(i,3)],[RNCc(i,3)+Thg(i,2),RNCc(i,3)+Thg(i,2)],...
                  'HitTest','off','Color',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                
               Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)-frd+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)-frd+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                  RNCc(i,2)+Thg(i,1),RNCc(i,4)-frd+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)-frd+Thg(i,3),RNCc(i,3)+Thg(i,2)];
               Nro = [-sqrt(2),-sqrt(2)/2,0; 0,0,0; -sqrt(2),sqrt(2)/2,0; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor',[0.5,0.5,0.5],'EdgeColor',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;  
            elseif isequal(PNC(i,13),3) % Bottom flange
               plot3(axesm,x+RNCc(i,2)+Bhg(i,1),y+RNCc(i,4)+Bhg(i,3),z+RNCc(i,3)+Bhg(i,2),'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,[RNCc(i,2)+df2*2/5-xa*cos(pi/4)+Bhg(i,1),RNCc(i,2)+df2/2+df2/5-xa*cos(pi/4)+Bhg(i,1) ],[(RNCc(i,4)+df2/8+xa*0.4*sin(pi/4))+Bhg(i,3),(RNCc(i,4)-df2/8+xa*0.4*sin(pi/4))+Bhg(i,3)],[RNCc(i,3)+Bhg(i,2),RNCc(i,3)+Bhg(i,2)],...
                  'HitTest','off','Color',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                 
               Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)-frd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)-frd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                  RNCc(i,2)+Bhg(i,1),RNCc(i,4)-frd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)-frd+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
               Nro = [-sqrt(2),-sqrt(2)/2,0; 0,0,0; -sqrt(2),sqrt(2)/2,0; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor',[0.5,0.5,0.5],'EdgeColor',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;     
            elseif isequal(PNC(i,13),4) % Centroid
               plot3(axesm,x+RNCc(i,2)+CSg(i,1),y+RNCc(i,4)+CSg(i,3),z+RNCc(i,3)+CSg(i,2),'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,[RNCc(i,2)+df2*2/5-xa*cos(pi/4)+CSg(i,1),RNCc(i,2)+df2/2+df2/5-xa*cos(pi/4)+CSg(i,1) ],[(RNCc(i,4)+df2/8+xa*0.4*sin(pi/4))+CSg(i,3),(RNCc(i,4)-df2/8+xa*0.4*sin(pi/4))+CSg(i,3)],[RNCc(i,3)+CSg(i,2),RNCc(i,3)+CSg(i,2)],...
                  'HitTest','off','Color',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;               
               Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)-frd+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)-frd+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                  RNCc(i,2)+CSg(i,1),RNCc(i,4)-frd+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)-frd+CSg(i,3),RNCc(i,3)+CSg(i,2)];
               Nro = [-sqrt(2),-sqrt(2)/2,0; 0,0,0; -sqrt(2),sqrt(2)/2,0; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor',[0.5,0.5,0.5],'EdgeColor',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                
            end
         end
         
         if ~isequal(PNC(i,10),0) % Moment z-axis
            if isequal(PNC(i,13),1) || isequal(PNC(i,13),0) % Shear center
               plot3(axesm,x1+RNCc(i,2),z+RNCc(i,4),y1+RNCc(i,3),'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;  
               plot3(axesm,[(RNCc(i,2))-df2*2/5+xa*cos(pi/4), (RNCc(i,2)-df2/2-df2/5+xa*cos(pi/4))],[RNCc(i,4),RNCc(i,4)],[RNCc(i,3)+df2/8+xa*0.4*sin(pi/4),RNCc(i,3)-df2/8+xa*0.4*sin(pi/4)],...
                  'HitTest','off','Color',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;               
               Sco = [RNCc(i,2)-frd,RNCc(i,4),RNCc(i,3); RNCc(i,2)-frd,RNCc(i,4),RNCc(i,3); ...
                  RNCc(i,2)-frd,RNCc(i,4),RNCc(i,3); RNCc(i,2)-frd,RNCc(i,4),RNCc(i,3)];
               Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor',[0.5,0.5,0.5],'EdgeColor',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;   
            elseif isequal(PNC(i,13),2) % Top flange
               plot3(axesm,x1+RNCc(i,2)+Thg(i,1),z+RNCc(i,4)+Thg(i,3),y1+RNCc(i,3)+Thg(i,2),'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;  
               plot3(axesm,[(RNCc(i,2))-df2*2/5+xa*cos(pi/4)+Thg(i,1), (RNCc(i,2)-df2/2-df2/5+xa*cos(pi/4))+Thg(i,1)],[RNCc(i,4)+Thg(i,3),RNCc(i,4)+Thg(i,3)],[RNCc(i,3)+df2/8+xa*0.4*sin(pi/4)+Thg(i,2),RNCc(i,3)-df2/8+xa*0.4*sin(pi/4)+Thg(i,2)],...
                  'HitTest','off','Color',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;               
               Sco = [RNCc(i,2)-frd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-frd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                  RNCc(i,2)-frd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-frd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2)];
               Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor',[0.5,0.5,0.5],'EdgeColor',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on; 
            elseif isequal(PNC(i,13),3) % Bottom flange
               plot3(axesm,x1+RNCc(i,2)+Bhg(i,1),z+RNCc(i,4)+Bhg(i,3),y1+RNCc(i,3)+Bhg(i,2),'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,[(RNCc(i,2))-df2*2/5+xa*cos(pi/4)+Bhg(i,1), (RNCc(i,2)-df2/2-df2/5+xa*cos(pi/4))+Bhg(i,1)],[RNCc(i,4)+Bhg(i,3),RNCc(i,4)+Bhg(i,3)],[RNCc(i,3)+df2/8+xa*0.4*sin(pi/4)+Bhg(i,2),RNCc(i,3)-df2/8+xa*0.4*sin(pi/4)+Bhg(i,2)],...
                  'HitTest','off','Color',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                
               Sco = [RNCc(i,2)-frd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-frd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                  RNCc(i,2)-frd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-frd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
               Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor',[0.5,0.5,0.5],'EdgeColor',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;    
            elseif isequal(PNC(i,13),4) % Centroid
               plot3(axesm,x1+RNCc(i,2)+CSg(i,1),z+RNCc(i,4)+CSg(i,3),y1+RNCc(i,3)+CSg(i,2),'HitTest','off','Color',[0.5,0.5,0.5],...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,[(RNCc(i,2))-df2*2/5+xa*cos(pi/4)+CSg(i,1), (RNCc(i,2)-df2/2-df2/5+xa*cos(pi/4))+CSg(i,1)],[RNCc(i,4)+CSg(i,3),RNCc(i,4)+CSg(i,3)],[RNCc(i,3)+df2/8+xa*0.4*sin(pi/4)+CSg(i,2),RNCc(i,3)-df2/8+xa*0.4*sin(pi/4)+CSg(i,2)],...
                  'HitTest','off','Color',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;               
               Sco = [RNCc(i,2)-frd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-frd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                  RNCc(i,2)-frd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-frd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2)];
               Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor',[0.5,0.5,0.5],'EdgeColor',[0.5,0.5,0.5],'Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                 
            end
         end 
         if ~isequal(PNC(i,11),0)        
            plot3(axesm,RNCc(i,2),RNCc(i,4)+df1,RNCc(i,3),'MarkerFaceColor',[0.5,0.5,0.5],...
               'HitTest','off','Marker','square','Color',[0.5,0.5,0.5],'MarkerSize',xb*1.25,'Tag',['PNC',num2str(i)],'PickableParts','none');
            hold on;            
         end             
      end
      else
         for i=1:length(RNCc(:,1))
            delete(findobj('Tag',['PNC',num2str(i)])); 
         end          
      end % LabType(1,5)
   end    
   
end % if JNodevalue end

set(axesm,'Visible','off','Units','normalized','DataAspectRatio',[1 1 1]) 
set( gca, 'Units', 'normalized', 'Position', [0 0 0.9 1] ); 


% set initial data automatically.
set(bfm_type_name,'String','')
set(bfm_coordx_edit,'String','')
set(bfm_coordy_edit,'String','')
set(bfm_coordz_edit,'String','')
set(bfm_ux_edit,'String','0')
set(bfm_uy_edit,'String','0')
set(bfm_uz_edit,'String','0') 
set(bfm_rx_edit,'String','0')
set(bfm_ry_edit,'String','0')
set(bfm_rz_edit,'String','0')
set(bfm_phix_edit,'String','0')
if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
   set(findobj('Color','c'),'Color',[0 0.5 1])
elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background
   set(findobj('Color','c'),'Color','w')
end  