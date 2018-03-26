function [BNC1,BNC2]=SABRE2SheaApp(JNodevalue,Massemble,Rval,SNodevalue,...
   RNCc,DUP1,DUP2,BNC1,BNC2,Nshe1,Nshe2,Bhe1,Bhe2,The1,The2,bsm_jointi_radiobutton,bsm_jointj_radiobutton,...
   bsm_jointi_edit,bsm_jointj_edit,bsm_member_name,bsm_type_name,...
   bsm_height_edit,bsm_kv_edit,pt_title_name,axesm,vstm)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
% ************************************************************************
% *****************    Nodal Boundary Conditions      ********************
% ************************************************************************
mem=length(Massemble(:,1));         % Total number of members  
% Automatic Member numbering
if isempty(BNC1)
   nextshnode = 1;
else
   nextshnode = length(BNC1(:,1))+1;
end
% Shear panel number
mnum = round(str2double(get(bsm_member_name,'String')));
sbcnum = round(str2double(get(bsm_type_name,'String')));

SPn=[];
if isempty(mnum) 
elseif isnan(mnum)
elseif mnum > mem
else
   if ~isempty(SNodevalue)
      q=0;
      for i=1:max(SNodevalue(:,1,1))
         p=0;
            if isequal(mnum,i) 
               for k=1:sum(SNodevalue(i,:,3))
                  SPn1(k,1)=DUP1(k+p+q,2);
                  SPn1(k,2)=DUP2(k+p+q,2);
               end
            end
            p=p+sum(SNodevalue(i,:,3));
         q=q+p;
      end
      SPn=unique(SPn1);
   end
end

SPi=0;SPj=0;
if isempty(get(bsm_jointi_edit,'String')) || isempty(get(bsm_jointj_edit,'String')) ...
      || isnan(str2double(get(bsm_jointi_edit,'String'))) ...
      || isnan(str2double(get(bsm_jointj_edit,'String'))) ...
      || str2double(get(bsm_jointi_edit,'String')) <= 0 ...
      || str2double(get(bsm_jointj_edit,'String')) <= 0 ...
      || isempty(SPn)
else
   for i=1:length(SPn(:,1))
      if isequal(SPn(i,1),str2double(get(bsm_jointi_edit,'String')))
         SPi=1;
      elseif isequal(SPn(i,1),str2double(get(bsm_jointj_edit,'String'))) 
         SPj=1;
      end
   end
end

if isempty(RNCc)
   BNC1=[];
   BNC2=[];
else
   if isempty(get(bsm_member_name,'String')) ...
         || isnan(str2double(get(bsm_member_name,'String'))) ...
         || str2double(get(bsm_member_name,'String')) <= 0 ...
         || mnum > mem
      set(pt_title_name,'String','No Members are defined')
      set(pt_title_name,'Visible','on')
   elseif isempty(get(bsm_type_name,'String')) ...
         || isnan(str2double(get(bsm_type_name,'String'))) ...
         || str2double(get(bsm_type_name,'String')) <= 0
      set(pt_title_name,'String','No Shear Panels are defined')
      set(pt_title_name,'Visible','on')      
   elseif sbcnum > nextshnode
      set(pt_title_name,'String',['Please enter Shear Panel number ',num2str(nextshnode)])
      set(pt_title_name,'Visible','on')   
   elseif isempty(get(bsm_jointi_edit,'String')) || isempty(get(bsm_jointj_edit,'String')) ...
         || isnan(str2double(get(bsm_jointi_edit,'String'))) ...
         || isnan(str2double(get(bsm_jointj_edit,'String'))) ...
         || str2double(get(bsm_jointi_edit,'String')) <= 0 ...
         || str2double(get(bsm_jointj_edit,'String')) <= 0
      set(pt_title_name,'String',...
         ['Please select Joints for Shear Panel ',num2str(sbcnum)])
      set(pt_title_name,'Visible','on') 
   elseif isempty(get(bsm_kv_edit,'String')) ...
         || isnan(str2double(get(bsm_kv_edit,'String'))) ...
         || str2double(get(bsm_kv_edit,'String')) < 0 
      set(pt_title_name,'String','Please define Stiffness')
      set(pt_title_name,'Visible','on')   
   elseif ~isequal(SPi,1) || ~isequal(SPj,1) 
      set(pt_title_name,'String','Please define Joints within the Member')
      set(pt_title_name,'Visible','on')        
   else
      set(pt_title_name,'Visible','off')
      inode = round(str2double(get(bsm_jointi_edit,'String')));
      jnode = round(str2double(get(bsm_jointj_edit,'String')));
      pcon = 0;
      
      if ~isempty(BNC1)
        for i=1:length(BNC1(:,1))
           if isequal(BNC1(i,2),inode) && isequal(BNC2(i,2),jnode) ... 
                 && ~isequal(BNC1(i,1),sbcnum)
              pcon = pcon+1;
           else   
           end
        end
      end     
     
      if isequal(pcon,0)
         set(pt_title_name,'Visible','off')
         BNC1(sbcnum,1) =  sbcnum;
         BNC1(sbcnum,2) = inode;
         BNC1(sbcnum,3) = RNCc(inode,2);
         BNC1(sbcnum,4) = RNCc(inode,3);
         BNC1(sbcnum,5) = RNCc(inode,4);
         BNC1(sbcnum,6)=0;
         BNC1(sbcnum,7)=0;
         BNC1(sbcnum,8)=str2double(get(bsm_kv_edit,'String'));
         BNC1(sbcnum,9)=get(bsm_height_edit,'Value');
         BNC1(sbcnum,10)=mnum;        

         BNC2(sbcnum,1) =  sbcnum;
         BNC2(sbcnum,2) = jnode;
         BNC2(sbcnum,3) = RNCc(jnode,2);
         BNC2(sbcnum,4) = RNCc(jnode,3);
         BNC2(sbcnum,5) = RNCc(jnode,4);  
         BNC2(sbcnum,6)=0;
         BNC2(sbcnum,7)=0;
         BNC2(sbcnum,8)=str2double(get(bsm_kv_edit,'String'));
         BNC2(sbcnum,9)=get(bsm_height_edit,'Value');
         BNC2(sbcnum,10)=mnum;
         
      else
         set(pt_title_name,'String','The Shear Panels are already employed')
         set(pt_title_name,'Visible','on')         
      end
  
      if isequal(str2double(get(bsm_kv_edit,'String')),0)
         BNC1(sbcnum,:) =[];  
         BNC2(sbcnum,:) =[];       
      end
    
      for i=1:length(BNC1(:,1))
         BNC1(i,1) =  i; 
         BNC2(i,1) =  i; 
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

   delete(findobj('color',[0.8 0.2 0]))
   delete(findobj('MarkerFaceColor',[0.8 0.2 0]))
      
   % ---------------------------------------------------------------------
   % ----------            Plot Shear Panel           --------------------
   % --------------------------------------------------------------------- 
   xs=9;    % Markersize Shear Panel
   % Drawing Loading Nodal points
   if isempty(RNCc) || isempty(BNC1)
   else 
      % Reset coordinate
      for i=1:length(BNC1(:,1))
         BNC1(i,3) = RNCc(BNC1(i,2),2);
         BNC1(i,4) = RNCc(BNC1(i,2),3);
         BNC1(i,5) = RNCc(BNC1(i,2),4);    
         
         BNC2(i,3) = RNCc(BNC2(i,2),2);
         BNC2(i,4) = RNCc(BNC2(i,2),3);
         BNC2(i,5) = RNCc(BNC2(i,2),4);          
      end

      for i=1:length(BNC1(:,1))
        for j=1:length(DUP1(:,1))
            if isequal(BNC1(i,2),DUP1(j,2)) && isequal(round(BNC1(i,3)*10^6)/10^6,round(Nshe1(j,1)*10^6)/10^6) ...
                  && isequal(round(BNC1(i,4)*10^6)/10^6,round(Nshe1(j,2)*10^6)/10^6) && isequal(round(BNC1(i,5)*10^6)/10^6,round(Nshe1(j,3)*10^6)/10^6)
               BNC1(i,11)=j;
            end
            if isequal(BNC2(i,2),DUP2(j,2)) && isequal(round(BNC2(i,3)*10^6)/10^6,round(Nshe2(j,1)*10^6)/10^6) ...
                  && isequal(round(BNC2(i,4)*10^6)/10^6,round(Nshe2(j,2)*10^6)/10^6) && isequal(round(BNC2(i,5)*10^6)/10^6,round(Nshe2(j,3)*10^6)/10^6)
               BNC2(i,11)=j;                             
            end
        end              
      end     
      
      for i=1:(length(BNC1(:,1)))

         if isequal(abs(BNC1(i,2)-BNC2(i,2)),1)
            if ~isequal(BNC1(i,8),0) 
               if isequal(BNC1(i,9),1) || isequal(BNC1(i,9),0) % Top flange
                  plot3(axesm,[BNC1(i,3)+The1(BNC1(i,11),1),BNC1(i,3)+The1(BNC1(i,11),1) ],[BNC1(i,5)+The1(BNC1(i,11),3),BNC1(i,5)+xa*0.5+The1(BNC1(i,11),3)],...
                     [BNC1(i,4)+The1(BNC1(i,11),2),BNC1(i,4)+The1(BNC1(i,11),2)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;
                  plot3(axesm,[BNC2(i,3)+The2(BNC2(i,11),1),BNC2(i,3)+The2(BNC2(i,11),1) ],[BNC2(i,5)+The2(BNC2(i,11),3),BNC2(i,5)+xa*0.5+The2(BNC2(i,11),3)],...
                     [BNC2(i,4)+The2(BNC2(i,11),2),BNC2(i,4)+The2(BNC2(i,11),2)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;               
                  plot3(axesm,[BNC1(i,3)+The1(BNC1(i,11),1),BNC2(i,3)+The2(BNC2(i,11),1) ],[BNC1(i,5)+xa*0.5+The1(BNC1(i,11),3),BNC2(i,5)+xa*0.5+The2(BNC2(i,11),3) ],...
                     [BNC1(i,4)+The1(BNC1(i,11),2),BNC2(i,4)+The2(BNC2(i,11),2)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;                   
                  plot3(axesm,( (BNC1(i,3)+The1(BNC1(i,11),1)+BNC2(i,3)+The2(BNC2(i,11),1))/2 ),( (BNC1(i,5)+The1(BNC1(i,11),3)+BNC2(i,5)+The2(BNC2(i,11),3))/2 + xa*0.5),...
                     ( (BNC1(i,4)+The1(BNC1(i,11),2)+BNC2(i,4)+The2(BNC2(i,11),2))/2 ),'MarkerFaceColor',[0.8 0.2 0],...
                     'HitTest','on','Marker','diamond','Color',[0.8 0.2 0],'MarkerSize',xs,'Tag',['ShearP',num2str(i)]);
                  hold on; 

               elseif isequal(BNC1(i,9),2) 
                  plot3(axesm,[BNC1(i,3),BNC1(i,3) ],[BNC1(i,5),BNC1(i,5)+xa*0.5],...
                     [BNC1(i,4),BNC1(i,4)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;
                  plot3(axesm,[BNC2(i,3),BNC2(i,3) ],[BNC2(i,5),BNC2(i,5)+xa*0.5],...
                     [BNC2(i,4),BNC2(i,4)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;               
                  plot3(axesm,[BNC1(i,3),BNC2(i,3) ],[BNC1(i,5)+xa*0.5,BNC2(i,5)+xa*0.5 ],...
                     [BNC1(i,4),BNC2(i,4)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;                   
                  plot3(axesm,( (BNC1(i,3)+BNC2(i,3))/2 ),( (BNC1(i,5)+BNC2(i,5))/2 + xa*0.5),...
                     ( (BNC1(i,4)+BNC2(i,4))/2 ),'MarkerFaceColor',[0.8 0.2 0],...
                     'HitTest','on','Marker','diamond','Color',[0.8 0.2 0],'MarkerSize',xs,'Tag',['ShearP',num2str(i)]);
                  hold on;            
                  
               elseif isequal(BNC1(i,9),3) % Bottom flange
                  plot3(axesm,[BNC1(i,3)+Bhe1(BNC1(i,11),1),BNC1(i,3)+Bhe1(BNC1(i,11),1) ],[BNC1(i,5)+Bhe1(BNC1(i,11),3),BNC1(i,5)+xa*0.5+Bhe1(BNC1(i,11),3)],...
                     [BNC1(i,4)+Bhe1(BNC1(i,11),2),BNC1(i,4)+Bhe1(BNC1(i,11),2)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;
                  plot3(axesm,[BNC2(i,3)+Bhe2(BNC2(i,11),1),BNC2(i,3)+Bhe2(BNC2(i,11),1) ],[BNC2(i,5)+Bhe2(BNC2(i,11),3),BNC2(i,5)+xa*0.5+Bhe2(BNC2(i,11),3)],...
                     [BNC2(i,4)+Bhe2(BNC2(i,11),2),BNC2(i,4)+Bhe2(BNC2(i,11),2)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;               
                  plot3(axesm,[BNC1(i,3)+Bhe1(BNC1(i,11),1),BNC2(i,3)+Bhe1(BNC1(i,11),1) ],[BNC1(i,5)+xa*0.5+Bhe1(BNC1(i,11),3),BNC2(i,5)+xa*0.5+Bhe1(BNC1(i,11),3) ],...
                     [BNC1(i,4)+Bhe1(BNC1(i,11),2),BNC2(i,4)+Bhe1(BNC1(i,11),2)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;                   
                  plot3(axesm,( (BNC1(i,3)+Bhe1(BNC1(i,11),1)+BNC2(i,3)+Bhe2(BNC2(i,11),1))/2 ),( (BNC1(i,5)+Bhe1(BNC1(i,11),3)+BNC2(i,5)+Bhe2(BNC2(i,11),3))/2 + xa*0.5),...
                     ( (BNC1(i,4)+Bhe1(BNC1(i,11),2)+BNC2(i,4)+Bhe2(BNC2(i,11),2))/2 ),'MarkerFaceColor',[0.8 0.2 0],...
                     'HitTest','on','Marker','diamond','Color',[0.8 0.2 0],'MarkerSize',xs,'Tag',['ShearP',num2str(i)]);
                  hold on;                   
               end
            end
    
         elseif abs(BNC1(i,2)-BNC2(i,2)) > 1

            if ~isequal(BNC1(i,8),0) 
                
               if isequal(BNC1(i,9),1) || isequal(BNC1(i,9),0) % Top flange
                  plot3(axesm,[BNC1(i,3)+The1(BNC1(i,11),1),BNC1(i,3)+The1(BNC1(i,11),1) ],[BNC1(i,5)+The1(BNC1(i,11),3),BNC1(i,5)+xa+The1(BNC1(i,11),3)],...
                     [BNC1(i,4)+The1(BNC1(i,11),2),BNC1(i,4)+The1(BNC1(i,11),2)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;
                  plot3(axesm,[BNC2(i,3)+The2(BNC2(i,11),1),BNC2(i,3)+The2(BNC2(i,11),1) ],[BNC2(i,5)+The2(BNC2(i,11),3),BNC2(i,5)+xa+The2(BNC2(i,11),3)],...
                     [BNC2(i,4)+The2(BNC2(i,11),2),BNC2(i,4)+The2(BNC2(i,11),2)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;               
                  plot3(axesm,[BNC1(i,3)+The1(BNC1(i,11),1),BNC2(i,3)+The2(BNC2(i,11),1) ],[BNC1(i,5)+xa+The1(BNC1(i,11),3),BNC2(i,5)+xa+The2(BNC2(i,11),3)],...
                     [BNC1(i,4)+The1(BNC1(i,11),2),BNC2(i,4)+The2(BNC2(i,11),2)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;                   
                  plot3(axesm,( (BNC1(i,3)+The1(BNC1(i,11),1)+BNC2(i,3)+The2(BNC2(i,11),1))/2 ),( (BNC1(i,5)+The1(BNC1(i,11),3)+BNC2(i,5)+The2(BNC2(i,11),3))/2 + xa),...
                     ( (BNC1(i,4)+The1(BNC1(i,11),2)+BNC2(i,4)+The2(BNC2(i,11),2))/2 ),'MarkerFaceColor',[0.8 0.2 0],...
                     'HitTest','off','Marker','diamond','Color',[0.8 0.2 0],'MarkerSize',xs,'Tag',['ShearP',num2str(i)]);
                  hold on; 
     
                elseif isequal(BNC1(i,9),2) 
                  plot3(axesm,[BNC1(i,3),BNC1(i,3) ],[BNC1(i,5),BNC1(i,5)+xa],...
                     [BNC1(i,4),BNC1(i,4)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;
                  plot3(axesm,[BNC2(i,3),BNC2(i,3) ],[BNC2(i,5),BNC2(i,5)+xa],...
                     [BNC2(i,4),BNC2(i,4)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;               
                  plot3(axesm,[BNC1(i,3),BNC2(i,3) ],[BNC1(i,5)+xa,BNC2(i,5)+xa],...
                     [BNC1(i,4),BNC2(i,4)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;                   
                  plot3(axesm,( (BNC1(i,3)+BNC2(i,3))/2 ),( (BNC1(i,5)+BNC2(i,5))/2 + xa),...
                     ( (BNC1(i,4)+BNC2(i,4))/2 ),'MarkerFaceColor',[0.8 0.2 0],...
                     'HitTest','off','Marker','diamond','Color',[0.8 0.2 0],'MarkerSize',xs,'Tag',['ShearP',num2str(i)]);
                  hold on; 
               
                elseif isequal(BNC1(i,9),3) % Bottom flange
                  plot3(axesm,[BNC1(i,3)+Bhe1(BNC1(i,11),1),BNC1(i,3)+Bhe1(BNC1(i,11),1) ],[BNC1(i,5)+Bhe1(BNC1(i,11),3),BNC1(i,5)+xa+Bhe1(BNC1(i,11),3)],...
                     [BNC1(i,4)+Bhe1(BNC1(i,11),2),BNC1(i,4)+Bhe1(BNC1(i,11),2)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;
                  plot3(axesm,[BNC2(i,3)+Bhe2(BNC2(i,11),1),BNC2(i,3)+Bhe2(BNC2(i,11),1) ],[BNC2(i,5)+Bhe2(BNC2(i,11),3),BNC2(i,5)+xa+Bhe2(BNC2(i,11),3)],...
                     [BNC2(i,4)+Bhe2(BNC2(i,11),2),BNC2(i,4)+Bhe2(BNC2(i,11),2)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;               
                  plot3(axesm,[BNC1(i,3)+Bhe1(BNC1(i,11),1),BNC2(i,3)+Bhe2(BNC2(i,11),1) ],[BNC1(i,5)+xa+Bhe1(BNC1(i,11),3),BNC2(i,5)+xa+Bhe2(BNC2(i,11),3)],...
                     [BNC1(i,4)+Bhe1(BNC1(i,11),2),BNC2(i,4)+Bhe2(BNC2(i,11),2)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;                   
                  plot3(axesm,( (BNC1(i,3)+Bhe1(BNC1(i,11),1)+BNC2(i,3)+Bhe2(BNC2(i,11),1))/2 ),( (BNC1(i,5)+Bhe1(BNC1(i,11),3)+BNC2(i,5)+Bhe2(BNC2(i,11),3))/2 + xa),...
                     ( (BNC1(i,4)+Bhe1(BNC1(i,11),2)+BNC2(i,4)+Bhe2(BNC2(i,11),2))/2 ),'MarkerFaceColor',[0.8 0.2 0],...
                     'HitTest','off','Marker','diamond','Color',[0.8 0.2 0],'MarkerSize',xs,'Tag',['ShearP',num2str(i)]);
                  hold on;                  

               end
   
            end
         
         end

      end
   end 
   
end % if JNodevalue end

set(axesm,'Visible','off','Units','normalized','DataAspectRatio',[1 1 1]) 
set( gca, 'Units', 'normalized', 'Position', [0 0 0.9 1] ); 

% ************************************************************************
% **************             Initial Setting              ****************
% ************************************************************************ 
% Automatic Member numbering
if isempty(BNC1)
   nextshnode = 1;
else
   nextshnode = length(BNC1(:,1))+1;
end
% Empty Edits
set(bsm_member_name,'string','');
set(bsm_type_name,'string',num2str(nextshnode));
set([bsm_jointi_edit,bsm_jointj_edit,bsm_kv_edit],'String','');
set(bsm_jointi_radiobutton,'value',1)
set(bsm_jointj_radiobutton,'value',0) 
if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
   set(findobj('Tag','M'),'Color','k')
   if ~isempty(RNCc)
      for i = 1:length(RNCc(:,1))
         set(findobj('Tag',['RNCc',num2str(i)]),'Color',[0 0.5 1]);
      end
   end 
elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background
   set(findobj('Tag','M'),'Color','w')
   if ~isempty(RNCc)
      for i = 1:length(RNCc(:,1))
         set(findobj('Tag',['RNCc',num2str(i)]),'Color','w');
      end
   end 
end  
set(findobj('Marker','diamond'),'MarkerFaceColor',[0.8 0.2 0])