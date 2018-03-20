function [SNodevalue,RNCc,DUP1,DUP2,LNC,LNC1,LNC2,LUEC,PNC,PNC1,PNC2,BNC,...
   BNC1,BNC2,FEL]=SABRE2AssiAll(Massemble,BNodevalue,SNodevalue,RNCc,DUP1,...
   DUP2,LNC,LNC1,LNC2,LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,...
   pam_segment_edit,pamse_assign_edit,pt_title_name,pamen_assign_edit,...
   pame_assign_edit,pamg_assign_edit,pamfy_assign_edit,pamrho_assign_edit,...
   pamfyfi_assign_edit,pamfyw_assign_edit,pamfyfo_assign_edit,HomoType,punit_edit,vstm) 
% Developed by Woo Yong Jeong.
% Date : 07/01/2013.
% ************************************************************************
% *****************           ASSIGN ALL              ********************
% ************************************************************************
assign_flag=0;
dunit=get(punit_edit,'Value');
if isempty(get(pamen_assign_edit,'String')) ...
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
      set(pt_title_name,'String','All Member Matl. & Elem. Assigned')
      set(pt_title_name,'Visible','on')    
      if ~isempty(Massemble) && ~isempty(BNodevalue)     
         for i=1:length(Massemble(:,1))
            for j=1:(max(BNodevalue(i,:,2))+1)
               SNodevalue(i,j,1)=i;
               SNodevalue(i,j,2)=j;
               SNodevalue(i,j,3)=str2double(get(pamen_assign_edit,'String')); %number of elements
               SNodevalue(i,j,4)=str2double(get(pame_assign_edit,'String')); % E
               SNodevalue(i,j,5)=str2double(get(pamg_assign_edit, 'String')); % G
               SNodevalue(i,j,6)=str2double(get(pamfy_assign_edit, 'String')); % Fy
               SNodevalue(i,j,7)=str2double(get(pamrho_assign_edit, 'String')); % Density
               SNodevalue(i,j,8)=str2double(get(pamfyfi_assign_edit, 'String')); % Fy_1
               SNodevalue(i,j,9)=str2double(get(pamfyw_assign_edit, 'String')); % Fy_w
               SNodevalue(i,j,10)=str2double(get(pamfyfo_assign_edit, 'String')); % Fy_2
               SNodevalue(i,j,11)=HomoType;
            end  
         end

      end
     
   else

      if ~isempty(Massemble) && ~isempty(BNodevalue) 
         selection = questdlg('Do you want to change the number of elements ? Load and Boundary Conditions are removed.','Assign','Yes','No','Yes');    
         if strcmp(selection,'No')
            return;
         else   

            set(pt_title_name,'String','All Member Matl. & Elem. Assigned')
            set(pt_title_name,'Visible','on')    
            if ~isempty(Massemble) && ~isempty(BNodevalue)     
               for i=1:length(Massemble(:,1))
                  for j=1:(max(BNodevalue(i,:,2))+1)
                     SNodevalue(i,j,1)=i;
                     SNodevalue(i,j,2)=j;
                     SNodevalue(i,j,3)=str2double(get(pamen_assign_edit,'String'));
                     SNodevalue(i,j,4)=str2double(get(pame_assign_edit,'String'));
                     SNodevalue(i,j,5)=str2double(get(pamg_assign_edit, 'String'));
                     SNodevalue(i,j,6)=str2double(get(pamfy_assign_edit, 'String'));
                     SNodevalue(i,j,7)=str2double(get(pamrho_assign_edit, 'String'));
                     SNodevalue(i,j,8)=str2double(get(pamfyfi_assign_edit, 'String'));
                     SNodevalue(i,j,9)=str2double(get(pamfyw_assign_edit, 'String'));
                     SNodevalue(i,j,10)=str2double(get(pamfyfo_assign_edit, 'String'));
                     SNodevalue(i,j,11)=HomoType;
                  end  
               end
            end  

            RNCc =[]; DUP1=[];DUP2=[];LNC=[]; LNC1=[];LNC2=[];LUEC=[];PNC=[];PNC1=[];PNC2=[];
            BNC=[];BNC1=[];BNC2=[]; FEL=[];                
         end
      end

   end

end
         fprintf('SNodevalue in AssiAll =')
         SNodevalue
% if isequal(dunit,2)
%    % Empty Edits
%    set([pam_segment_edit,pamse_assign_edit],'string','');
%    set(pamen_assign_edit,'string','4');
%    set(pame_assign_edit,'string','20000');      
%    set(pamg_assign_edit,'string','7720');
%    set(pamfy_assign_edit,'string','34.5');
%    set(pamrho_assign_edit,'string','0.0000912');
%    set(pamfyfi_assign_edit,'string','34.5');
%    set(pamfyw_assign_edit,'string','34.5');
%    set(pamfyfo_assign_edit,'string','34.5'); 
% else
%    % Empty Edits
%    set([pam_segment_edit,pamse_assign_edit],'string','');
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
         if SNodevalue(i,j,3) > 0 && SNodevalue(i,j,4) > 0 && SNodevalue(i,j,5) > 0 && SNodevalue(i,j,7) > 0 
            set(findobj('Tag',['OTFB',num2str(q+j)]),'FaceColor',[1 0.3 0.3])
            set(findobj('Tag',['OWEBB',num2str(q+j)]),'FaceColor',[1 0.3 0.3])
            set(findobj('Tag',['OBFB',num2str(q+j)]),'FaceColor',[1 0.3 0.3])
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
