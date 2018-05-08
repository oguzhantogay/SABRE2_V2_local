function [PNC,PNC1,PNC2]=SABRE2BConApp(JNodevalue,Massemble,Rval,...
   BNodevalue,RNCc,DUP1,DUP2,PNC,PNC1,PNC2,Bhg,Thg,CSg,ptable_node,pt_title_name,axesm)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
% ************************************************************************
% *****************    Nodal Boundary Conditions      ********************
% ************************************************************************
% get geometry table data   
G_getdata=get(ptable_node,'Data');

if isempty(RNCc)
   PNC=[];
else 
   
   njnode = 1;
   
   PNC(length(RNCc(:,1)),14) =0;
   PNC1(length(DUP1(:,1)),14)=0;
   PNC2(length(DUP2(:,1)),14)=0;
   
   for i=1:length(DUP1(:,1))
      if isequal(PNC1(i,13),0)
         PNC1(i,13)=1;
      end
      if isequal(PNC2(i,13),0)
         PNC2(i,13)=1;
      end       
   end
   
   if isempty(G_getdata(12,1)) || isnan(G_getdata(12,1)) ...
        || round(G_getdata(12,1)) > 4 || round(G_getdata(12,1)) <=0 ...
        || isempty(G_getdata(12,end)) || isnan(G_getdata(12,end)) ...
        || round(G_getdata(12,end)) > 4 || round(G_getdata(12,end)) <=0 
     
      set(pt_title_name,'String','Please, use RT = 1 (Shear Center) or 2 (Flg 2) or 3 (Flg 1) or 4 (Centroid)')
      set(pt_title_name,'Visible','on')     
   else
      set(pt_title_name,'Visible','off') 
      % ---------------------------------------------- Joint Start Node S
      % start node
      Lnode = 1;   
      PNC(Lnode,1) =  Lnode;
      PNC(Lnode,2) = JNodevalue(njnode,2);
      PNC(Lnode,3) = JNodevalue(njnode,3);
      PNC(Lnode,4) = JNodevalue(njnode,4);
      PNC(Lnode,5) = 1;
      PNC(Lnode,6) = 1;
      PNC(Lnode,7) = 1;
      PNC(Lnode,8) = 1;
      PNC(Lnode,9) = 0;
      PNC(Lnode,10)= 0;
      PNC(Lnode,11)= 0; 
      PNC(Lnode,12)= 0;
      PNC(Lnode,13)= round(G_getdata(12,1)); % RT

      i=1;
      PNC1(i,1) =  i;
      PNC1(i,2) = JNodevalue(njnode,2);
      PNC1(i,3) = JNodevalue(njnode,3);
      PNC1(i,4) = JNodevalue(njnode,4);
      PNC1(i,5) = 1;
      PNC1(i,6) = 1;
      PNC1(i,7) = 1;
      PNC1(i,8) = 1;
      PNC1(i,9) = 0;
      PNC1(i,10)= 0;
      PNC1(i,11)= 0; 
      PNC1(i,12)= 0;
      PNC1(i,13)= round(G_getdata(12,1)); % RT    
      % ---------------------------------------------- Joint Start Node E

      % ------------------------------------------------ Joint End Node S
      % end node
      Lnode=length(RNCc(:,1));
      PNC(Lnode,1) =  Lnode;
      PNC(Lnode,2) = JNodevalue(njnode+1,2);
      PNC(Lnode,3) = JNodevalue(njnode+1,3);
      PNC(Lnode,4) = JNodevalue(njnode+1,4);
      PNC(Lnode,5) = 0;
      PNC(Lnode,6) = 1;
      PNC(Lnode,7) = 1;
      PNC(Lnode,8) = 1;
      PNC(Lnode,9) = 0;
      PNC(Lnode,10)= 0;
      PNC(Lnode,11)= 0; 
      PNC(Lnode,12)= 0;
      PNC(Lnode,13)= round(G_getdata(12,end)); % RT   

      i=length(DUP2(:,1));
      PNC2(i,1) =  i+1;
      PNC2(i,2) = JNodevalue(njnode+1,2);
      PNC2(i,3) = JNodevalue(njnode+1,3);
      PNC2(i,4) = JNodevalue(njnode+1,4);
      PNC2(i,5) = 0;
      PNC2(i,6) = 1;
      PNC2(i,7) = 1;
      PNC2(i,8) = 1;
      PNC2(i,9) = 0;
      PNC2(i,10)= 0;
      PNC2(i,11)= 0; 
      PNC2(i,12)= 0;
      PNC2(i,13)= round(G_getdata(12,end)); % RT
      % ------------------------------------------------ Joint End Node E
   end
      
   % -------------------------------------------------- Additional Node S 
   % bracing node 
   if length(G_getdata(1,:)) > 2
      
      for i=1:( length(G_getdata(1,:))-2 )
        if isempty(G_getdata(12,i+1)) || isnan(G_getdata(12,i+1)) ...
              || round(G_getdata(12,i+1)) > 3 || round(G_getdata(12,i+1)) <=0
            set(pt_title_name,'String','Please, use RT = 1 (None) or 2 (TFR) or 3 (LTR)')
            set(pt_title_name,'Visible','on')             
        elseif isequal( round(G_getdata(12,i+1)),1)
            set(pt_title_name,'Visible','off') 
            for j=1:length(RNCc(:,1))
               if isequal(G_getdata(1,i+1),RNCc(j,2))
                  PNC(j,1) =  j;
                  PNC(j,2) = RNCc(j,2);
                  PNC(j,3) = 0;
                  PNC(j,4) = 0;
                  PNC(j,5) = 0;
                  PNC(j,6) = 0;
                  PNC(j,7) = 0;
                  PNC(j,8) = 0;
                  PNC(j,9) = 0;
                  PNC(j,10)= 0;
                  PNC(j,11)= 0; 
                  PNC(j,12)= 0;
                  PNC(j,13)= 1;  
               end
            end

             for j=1:length(DUP1(:,1))
               if isequal(G_getdata(1,i+1),DUP1(j,3))
                  PNC1(j,1) = j;
                  PNC1(j,2) = DUP1(j,3);
                  PNC1(j,3) = 0;
                  PNC1(j,4) = 0;
                  PNC1(j,5) = 0;
                  PNC1(j,6) = 0;
                  PNC1(j,7) = 0;
                  PNC1(j,8) = 0;
                  PNC1(j,9) = 0;
                  PNC1(j,10)= 0;
                  PNC1(j,11)= 0; 
                  PNC1(j,12)= 0;
                  PNC1(j,13)= 1;  
               end
             end

             for j=1:length(DUP2(:,1))
               if isequal(G_getdata(1,i+1),DUP2(j,3))
                  PNC2(j,1) = j+1;
                  PNC2(j,2) = DUP2(j,3);
                  PNC2(j,3) = 0;
                  PNC2(j,4) = 0;
                  PNC2(j,5) = 0;
                  PNC2(j,6) = 0;
                  PNC2(j,7) = 0;
                  PNC2(j,8) = 0;
                  PNC2(j,9) = 0;
                  PNC2(j,10)= 0;
                  PNC2(j,11)= 0; 
                  PNC2(j,12)= 0;
                  PNC2(j,13)= 1;  
               end
             end    
             
        elseif isequal( round(G_getdata(12,i+1)),2)
            set(pt_title_name,'Visible','off') 
            for j=1:length(RNCc(:,1))
               if isequal(G_getdata(1,i+1),RNCc(j,2))
                  PNC(j,1) = j;
                  PNC(j,2) = RNCc(j,2);
                  PNC(j,3) = 0;
                  PNC(j,4) = 0;
                  PNC(j,5) = 0;
                  PNC(j,6) = 0;
                  PNC(j,7) = 1;
                  PNC(j,8) = 0;
                  PNC(j,9) = 0;
                  PNC(j,10)= 0;
                  PNC(j,11)= 0; 
                  PNC(j,12)= 0;
                  PNC(j,13)= 2;  
               end
            end

             for j=1:length(DUP1(:,1))
               if isequal(G_getdata(1,i+1),DUP1(j,3))
                  PNC1(j,1) = j;
                  PNC1(j,2) = DUP1(j,3);
                  PNC1(j,3) = 0;
                  PNC1(j,4) = 0;
                  PNC1(j,5) = 0;
                  PNC1(j,6) = 0;
                  PNC1(j,7) = 1;
                  PNC1(j,8) = 0;
                  PNC1(j,9) = 0;
                  PNC1(j,10)= 0;
                  PNC1(j,11)= 0; 
                  PNC1(j,12)= 0;
                  PNC1(j,13)= 2;  
               end
             end

             for j=1:length(DUP2(:,1))
               if isequal(G_getdata(1,i+1),DUP2(j,3))
                  PNC2(j,1) = j+1;
                  PNC2(j,2) = DUP2(j,3);
                  PNC2(j,3) = 0;
                  PNC2(j,4) = 0;
                  PNC2(j,5) = 0;
                  PNC2(j,6) = 0;
                  PNC2(j,7) = 1;
                  PNC2(j,8) = 0;
                  PNC2(j,9) = 0;
                  PNC2(j,10)= 0;
                  PNC2(j,11)= 0; 
                  PNC2(j,12)= 0;
                  PNC2(j,13)= 2;  
               end
             end                 

        elseif isequal( round(G_getdata(12,i+1)),3)
            set(pt_title_name,'Visible','off') 
            for j=1:length(RNCc(:,1))
               if isequal(G_getdata(1,i+1),RNCc(j,2))
                  PNC(j,1) = j;
                  PNC(j,2) = RNCc(j,2);
                  PNC(j,3) = 0;
                  PNC(j,4) = 0;
                  PNC(j,5) = 0;
                  PNC(j,6) = 0;
                  PNC(j,7) = 1;
                  PNC(j,8) = 1;
                  PNC(j,9) = 0;
                  PNC(j,10)= 0;
                  PNC(j,11)= 0; 
                  PNC(j,12)= 0;
                  PNC(j,13)= 1;  
               end
            end

             for j=1:length(DUP1(:,1))
               if isequal(G_getdata(1,i+1),DUP1(j,3))
                  PNC1(j,1) = j;
                  PNC1(j,2) = DUP1(j,3);
                  PNC1(j,3) = 0;
                  PNC1(j,4) = 0;
                  PNC1(j,5) = 0;
                  PNC1(j,6) = 0;
                  PNC1(j,7) = 1;
                  PNC1(j,8) = 1;
                  PNC1(j,9) = 0;
                  PNC1(j,10)= 0;
                  PNC1(j,11)= 0; 
                  PNC1(j,12)= 0;
                  PNC1(j,13)= 1;  
               end
             end

             for j=1:length(DUP2(:,1))
               if isequal(G_getdata(1,i+1),DUP2(j,3))
                  PNC2(j,1) =  j+1;
                  PNC2(j,2) = DUP2(j,3);
                  PNC2(j,3) = 0;
                  PNC2(j,4) = 0;
                  PNC2(j,5) = 0;
                  PNC2(j,6) = 0;
                  PNC2(j,7) = 1;
                  PNC2(j,8) = 1;
                  PNC2(j,9) = 0;
                  PNC2(j,10)= 0;
                  PNC2(j,11)= 0; 
                  PNC2(j,12)= 0;
                  PNC2(j,13)= 1;  
               end
             end       
             
        end %isempty(G_getdata(13,i+1))
      end
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
      mDg = 0;
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

   delete(findobj('color','m'))
   delete(findobj('FaceColor','m'))
   delete(findobj('EdgeColor','m'))
   % ---------------------------------------------------------------------
   % ----------        Plot Boundary Conditions       --------------------
   % --------------------------------------------------------------------- 
   lt=1.35; % Line thickness
   xb=7;    % Markersize Fixities   
   frd = xa*0.4;
   df1=xa*0.01;
   df2=xa*0.8;   
   if isequal(xa,mDg)
      dfs = 1.3;
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
   end      
   
end % if JNodevalue end

set(axesm,'Visible','off','Units','normalized','DataAspectRatio',[1 1 1]) 
set( gca, 'Units', 'normalized', 'Position', [0 0 0.8 1] ); 

