function [SNodevalue,RNCc,DUP1,DUP2,LNC,LNC1,LNC2,LUEC,PNC,PNC1,PNC2,...
   BNC,BNC1,BNC2,FEL]=SABRE2AssiApp(Massemble,BNodevalue,SNodevalue,RNCc,DUP1,DUP2,LNC,...
   LNC1,LNC2,LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,pam_segment_edit,pamse_assign_edit,...
   pt_title_name,pamen_assign_edit,pame_assign_edit,pamg_assign_edit,pamfy_assign_edit,...
   pamrho_assign_edit,pamfyfi_assign_edit,pamfyw_assign_edit,pamfyfo_assign_edit,HomoType,punit_edit,vstm)   
% Developed by Woo Yong Jeong.
% Date : 07/01/2013.
% ************************************************************************
% *****************         ASSIGN APPLY              ********************
% ************************************************************************
% SNodevalue = [mnum snum #EL E G]
mnum = str2double(get(pam_segment_edit,'String'));
snum = str2double(get(pamse_assign_edit,'String'));
dunit=get(punit_edit,'Value');
if isempty(get(pam_segment_edit,'String')) ...
      || isnan(str2double(get(pam_segment_edit,'String'))) ...
      || str2double(get(pam_segment_edit,'String')) <= 0  
   set(pt_title_name,'String','No Members are Defined')
   set(pt_title_name,'Visible','on')
elseif mnum > length(Massemble(:,1))
   set(pt_title_name,'String',['Please enter smaller Member number ',num2str(length(Massemble(:,1)))])
   set(pt_title_name,'Visible','on')     
elseif isempty(get(pamse_assign_edit,'String')) ...
      || isnan(str2double(get(pamse_assign_edit,'String'))) ...
      || str2double(get(pamse_assign_edit,'String')) <= 0  
   set(pt_title_name,'String','No Segments are Defined')
   set(pt_title_name,'Visible','on') 
% elseif ~isempty(SNodevalue) && (snum > max(SNodevalue(mnum,:,2))+1)
%    set(pt_title_name,'String',['Please enter smaller Segment number ',num2str(max(SNodevalue(mnum,:,2)))])
%    set(pt_title_name,'Visible','on')    
elseif isempty(get(pamen_assign_edit,'String')) ...
      || isempty(get(pame_assign_edit,'String')) ...
      || isempty(get(pamg_assign_edit,'String')) ...
      || isempty(get(pamfy_assign_edit,'String')) ...
      || isempty(get(pamrho_assign_edit,'String')) ...
      || isempty(get(pamfyfi_assign_edit,'String')) ...  
      || isempty(get(pamfyw_assign_edit,'String')) ... 
      || isempty(get(pamfyfo_assign_edit,'String')) ...       
      || isnan(str2double(get(pamen_assign_edit,'String'))) ...
      || isnan(str2double(get(pame_assign_edit,'String'))) ...
      || isnan(str2double(get(pamg_assign_edit,'String'))) ...
      || isnan(str2double(get(pamfy_assign_edit,'String'))) ...
      || isnan(str2double(get(pamrho_assign_edit,'String'))) ...
      || str2double(get(pamen_assign_edit,'String')) <= 0 ...
      || str2double(get(pame_assign_edit,'String')) <= 0 ...
      || str2double(get(pamg_assign_edit,'String')) <= 0 ...
      || str2double(get(pamfy_assign_edit,'String')) < 0 ...
      || str2double(get(pamrho_assign_edit,'String')) < 0 ...
      || str2double(get(pamfyfi_assign_edit,'String')) < 0 ...
      || str2double(get(pamfyw_assign_edit,'String')) < 0 ...
      || str2double(get(pamfyfo_assign_edit,'String')) < 0 
   set(pt_title_name,'String','Member Matl. & Elem. are not Completed')
   set(pt_title_name,'Visible','on')    
else 
   
   if isempty(SNodevalue) 
      set(pt_title_name,'String',['Member = ',num2str(mnum), '  Segment = ',num2str(snum),'  Matl. & Elem. Assigned'])
      set(pt_title_name,'Visible','on')  
      SNodevalue(mnum,snum,1)=mnum;
      SNodevalue(mnum,snum,2)=snum;
      SNodevalue(mnum,snum,3)=str2double(get(pamen_assign_edit,'String'));
      SNodevalue(mnum,snum,4)=str2double(get(pame_assign_edit,'String'));
      SNodevalue(mnum,snum,5)=str2double(get(pamg_assign_edit, 'String'));
      SNodevalue(mnum,snum,6)=str2double(get(pamfy_assign_edit, 'String'));
      SNodevalue(mnum,snum,7)=str2double(get(pamrho_assign_edit, 'String'));
      SNodevalue(mnum,snum,8)=str2double(get(pamfyfi_assign_edit, 'String'));
      SNodevalue(mnum,snum,9)=str2double(get(pamfyw_assign_edit, 'String'));
      SNodevalue(mnum,snum,10)=str2double(get(pamfyfo_assign_edit, 'String'));
      SNodevalue(mnum,snum,11)=HomoType;
   else

      if length(SNodevalue(:,1,1)) < mnum || max(SNodevalue(mnum,:,2)) < snum
         set(pt_title_name,'String',['Member = ',num2str(mnum), '  Segment = ',num2str(snum),'  Matl. & Elem. Assigned'])
         set(pt_title_name,'Visible','on')  
         SNodevalue(mnum,snum,1)=mnum;
         SNodevalue(mnum,snum,2)=snum;
         SNodevalue(mnum,snum,3)=str2double(get(pamen_assign_edit,'String'));
         SNodevalue(mnum,snum,4)=str2double(get(pame_assign_edit,'String'));
         SNodevalue(mnum,snum,5)=str2double(get(pamg_assign_edit, 'String'));
         SNodevalue(mnum,snum,6)=str2double(get(pamfy_assign_edit, 'String'));
         SNodevalue(mnum,snum,7)=str2double(get(pamrho_assign_edit, 'String'));
         SNodevalue(mnum,snum,8)=str2double(get(pamfyfi_assign_edit, 'String'));
         SNodevalue(mnum,snum,9)=str2double(get(pamfyw_assign_edit, 'String'));
         SNodevalue(mnum,snum,10)=str2double(get(pamfyfo_assign_edit, 'String'));
         SNodevalue(mnum,snum,11)=HomoType;   
      else

         if ~isequal(SNodevalue(mnum,snum,3),str2double(get(pamen_assign_edit,'String')))
            if isempty(RNCc) && isempty(DUP1) && isempty(DUP2) && isempty(LNC) && isempty(LNC1) && isempty(LNC2) ...
                  && isempty(LUEC) && isempty(PNC) && isempty(PNC1) && isempty(PNC2) && isempty(BNC) && isempty(BNC1) ...
                  && isempty(BNC2) && isempty(FEL)
          
               set(pt_title_name,'String',['Member = ',num2str(mnum), '  Segment = ',num2str(snum),'  Matl. & Elem. Assigned'])
               set(pt_title_name,'Visible','on')  
               SNodevalue(mnum,snum,1)=mnum;
               SNodevalue(mnum,snum,2)=snum;
               SNodevalue(mnum,snum,3)=str2double(get(pamen_assign_edit,'String'));
               SNodevalue(mnum,snum,4)=str2double(get(pame_assign_edit,'String'));
               SNodevalue(mnum,snum,5)=str2double(get(pamg_assign_edit, 'String'));
               SNodevalue(mnum,snum,6)=str2double(get(pamfy_assign_edit, 'String'));
               SNodevalue(mnum,snum,7)=str2double(get(pamrho_assign_edit, 'String'));
               SNodevalue(mnum,snum,8)=str2double(get(pamfyfi_assign_edit, 'String'));
               SNodevalue(mnum,snum,9)=str2double(get(pamfyw_assign_edit, 'String'));
               SNodevalue(mnum,snum,10)=str2double(get(pamfyfo_assign_edit, 'String'));
               SNodevalue(mnum,snum,11)=HomoType;            
               RNCc =[]; DUP1=[];DUP2=[];LNC=[]; LNC1=[];LNC2=[];LUEC=[];PNC=[];PNC1=[];PNC2=[];
               BNC=[];BNC1=[];BNC2=[];  FEL=[];                 
               
            else

               selection = questdlg('Do you want to change the number of elements ? Load and Boundary Conditions are removed.','Assign','Yes','No','Yes');    
               if strcmp(selection,'No')
                  return;
               else    
                  set(pt_title_name,'String',['Member = ',num2str(mnum), '  Segment = ',num2str(snum),'  Matl. & Elem. Assigned'])
                  set(pt_title_name,'Visible','on')  
                  SNodevalue(mnum,snum,1)=mnum;
                  SNodevalue(mnum,snum,2)=snum;
                  SNodevalue(mnum,snum,3)=str2double(get(pamen_assign_edit,'String'));
                  SNodevalue(mnum,snum,4)=str2double(get(pame_assign_edit,'String'));
                  SNodevalue(mnum,snum,5)=str2double(get(pamg_assign_edit, 'String'));
                  SNodevalue(mnum,snum,6)=str2double(get(pamfy_assign_edit, 'String'));
                  SNodevalue(mnum,snum,7)=str2double(get(pamrho_assign_edit, 'String'));
                  SNodevalue(mnum,snum,8)=str2double(get(pamfyfi_assign_edit, 'String'));
                  SNodevalue(mnum,snum,9)=str2double(get(pamfyw_assign_edit, 'String'));
                  SNodevalue(mnum,snum,10)=str2double(get(pamfyfo_assign_edit, 'String'));
                  SNodevalue(mnum,snum,11)=HomoType;            
                  RNCc =[]; DUP1=[];DUP2=[];LNC=[]; LNC1=[];LNC2=[];LUEC=[];PNC=[];PNC1=[];PNC2=[];
                  BNC=[];BNC1=[];BNC2=[];  FEL=[];               
               end
            
            end

         else

            set(pt_title_name,'String',['Member = ',num2str(mnum), '  Segment = ',num2str(snum),'  Matl. & Elem. Assigned'])
            set(pt_title_name,'Visible','on')  
            SNodevalue(mnum,snum,1)=mnum;
            SNodevalue(mnum,snum,2)=snum;
            SNodevalue(mnum,snum,3)=str2double(get(pamen_assign_edit,'String'));
            SNodevalue(mnum,snum,4)=str2double(get(pame_assign_edit,'String'));
            SNodevalue(mnum,snum,5)=str2double(get(pamg_assign_edit, 'String'));
            SNodevalue(mnum,snum,6)=str2double(get(pamfy_assign_edit, 'String'));
            SNodevalue(mnum,snum,7)=str2double(get(pamrho_assign_edit, 'String'));
            SNodevalue(mnum,snum,8)=str2double(get(pamfyfi_assign_edit, 'String'));
            SNodevalue(mnum,snum,9)=str2double(get(pamfyw_assign_edit, 'String'));
            SNodevalue(mnum,snum,10)=str2double(get(pamfyfo_assign_edit, 'String'));
            SNodevalue(mnum,snum,11)=HomoType;         

         end
      end
      
      
   end
end
fprintf('SNodevalue in ASSIAPP')
SNodevalue
% if isequal(dunit,2)
%    % Empty Edits set([pam_segment_edit,pamse_assign_edit],'string','');
%    set(pamen_assign_edit,'string','4');
%    set(pame_assign_edit,'string','20000');
%    set(pamg_assign_edit,'string','7720');
%    set(pamfy_assign_edit,'string','34.5');
%    set(pamrho_assign_edit,'string','0.0000912');
%    set(pamfyfi_assign_edit,'string','34.5');
%    set(pamfyw_assign_edit,'string','34.5');
%    set(pamfyfo_assign_edit,'string','34.5');
% else
%    % Empty Edits set([pam_segment_edit,pamse_assign_edit],'string','');
%    set(pamen_assign_edit,'string','4');
%    set(pame_assign_edit,'string','29000');
%    set(pamg_assign_edit,'string','11200');
%    set(pamfy_assign_edit,'string','50');
%    set(pamrho_assign_edit,'string','0.00034028');
%    set(pamfyfi_assign_edit,'string','50');
%    set(pamfyw_assign_edit,'string','50');
%    set(pamfyfo_assign_edit,'string','50');
% end

if ~isempty(SNodevalue)
   q = 0; 
   mem=length(Massemble(:,1));         % Total number of members
   for i = 1:mem        
      for j = 1:(max(BNodevalue(i,:,2))+1)
         if isequal(i,mnum) && isequal(j,snum)
            if SNodevalue(i,j,3) > 0 && SNodevalue(i,j,4) > 0 && SNodevalue(i,j,5) > 0 && SNodevalue(i,j,7) > 0 
               set(findobj('Tag',['OTFB',num2str(q+j)]),'FaceColor',[1 0.3 0.3])
               set(findobj('Tag',['OWEBB',num2str(q+j)]),'FaceColor',[1 0.3 0.3])
               set(findobj('Tag',['OBFB',num2str(q+j)]),'FaceColor',[1 0.3 0.3])
            end
         end
      end
      q = max(BNodevalue(i,:,2))+q+1;
   end
end

if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
   set(findobj('Color','c'),'Color','k')
elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background
   set(findobj('Color','c'),'Color','w')
end

