function SABRE2AssiDATA(pam_segment_edit,pamse_assign_edit,pamen_assign_edit,pame_assign_edit,pamg_assign_edit,...
   pamfy_assign_edit,pamrho_assign_edit,pamfyfi_assign_edit,pamfyw_assign_edit,pamfyfo_assign_edit,SNodevalue,punit_edit,vstm)

% Developed by Woo Yong Jeong.
% Date : 07/01/2013.
% ************************************************************************
% *****************           Homo material           ********************
% ************************************************************************

% ------------------------------------------------------------------------
% -----------------------        EDIT INUPT       ------------------------
% ------------------------------------------------------------------------
% set(findobj('Tag','S'),'Visible','on');
dunit=get(punit_edit,'Value');
% If click a M*S*, set the data automatically.
if strcmp(get(gco,'type'),'text') 
   if strcmp(get(gco,'Tag'),'S')            
      t=sscanf(get(gco,'String'),'M%uS%u');
      mnum = t(1,1);
      snum = t(2,1);
      if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
         set(findobj('Color','c'),'Color','k')
      elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background
         set(findobj('Color','c'),'Color','w')
      end
      set(gco,'Color','c')      
      
      set(pam_segment_edit,'String',num2str(mnum));
      set(pamse_assign_edit,'String',num2str(snum));    
      if ~isempty(SNodevalue) 
         if mnum <= max(max(SNodevalue(:,:,1)))
            if snum <= max(SNodevalue(mnum,:,2))
               if isequal(SNodevalue(mnum,snum,2),0)
%                   set(pamen_assign_edit,'string','4');
%                   if isequal(dunit,2)
%                      set(pame_assign_edit,'string','20000');      
%                      set(pamg_assign_edit,'string','7720'); 
%                      set(pamfy_assign_edit,'string','34.5');
%                      set(pamrho_assign_edit,'string','0.0000912');
%                      set(pamfyfi_assign_edit,'string','0');
%                      set(pamfyw_assign_edit,'string','0');
%                      set(pamfyfo_assign_edit,'string','0');
%                   else
%                      set(pame_assign_edit,'string','29000');      
%                      set(pamg_assign_edit,'string','11200'); 
%                      set(pamfy_assign_edit,'string','50');
%                      set(pamrho_assign_edit,'string','0.00034028');
%                      set(pamfyfi_assign_edit,'string','0');
%                      set(pamfyw_assign_edit,'string','0');
%                      set(pamfyfo_assign_edit,'string','0');
%                   end
  
               else
                  set(pamen_assign_edit,'String',SNodevalue(mnum,snum,3));
                  set(pame_assign_edit,'String',SNodevalue(mnum,snum,4));        
                  set(pamg_assign_edit,'String',SNodevalue(mnum,snum,5));
                  set(pamfy_assign_edit,'String',SNodevalue(mnum,snum,6));
                  set(pamrho_assign_edit,'String',SNodevalue(mnum,snum,7));
                  set(pamfyfi_assign_edit,'String',SNodevalue(mnum,snum,8));  
                  set(pamfyw_assign_edit,'String',SNodevalue(mnum,snum,9)); 
                  set(pamfyfo_assign_edit,'String',SNodevalue(mnum,snum,10));                   
               end
            else
%                if isequal(dunit,2)
%                   set(pamen_assign_edit,'string','4');
%                   set(pame_assign_edit,'string','20000');      
%                   set(pamg_assign_edit,'string','7720'); 
%                   set(pamfy_assign_edit,'string','34.5');
%                   set(pamrho_assign_edit,'string','0.0000912');
%                   set(pamfyfi_assign_edit,'string','0');
%                   set(pamfyw_assign_edit,'string','0');
%                   set(pamfyfo_assign_edit,'string','0');     
%                else
%                   set(pamen_assign_edit,'string','4');
%                   set(pame_assign_edit,'string','29000');      
%                   set(pamg_assign_edit,'string','11200'); 
%                   set(pamfy_assign_edit,'string','50');
%                   set(pamrho_assign_edit,'string','0.00034028');
%                   set(pamfyfi_assign_edit,'string','0');
%                   set(pamfyw_assign_edit,'string','0');
%                   set(pamfyfo_assign_edit,'string','0');                   
%                end
            end
         else
%             if isequal(dunit,2)
%                set(pamen_assign_edit,'string','4');
%                set(pame_assign_edit,'string','20000');      
%                set(pamg_assign_edit,'string','7720'); 
%                set(pamfy_assign_edit,'string','34.5');
%                set(pamrho_assign_edit,'string','0.0000912');
%                set(pamfyfi_assign_edit,'string','0');
%                set(pamfyw_assign_edit,'string','0');
%                set(pamfyfo_assign_edit,'string','0');    
%             else
%                set(pamen_assign_edit,'string','4');
%                set(pame_assign_edit,'string','29000');      
%                set(pamg_assign_edit,'string','11200'); 
%                set(pamfy_assign_edit,'string','50');
%                set(pamrho_assign_edit,'string','0.00034028');
%                set(pamfyfi_assign_edit,'string','0');
%                set(pamfyw_assign_edit,'string','0');
%                set(pamfyfo_assign_edit,'string','0');                 
%             end
         end
      else
%          if isequal(dunit,2)
%             set(pamen_assign_edit,'string','4');
%             set(pame_assign_edit,'string','20000');      
%             set(pamg_assign_edit,'string','7720');
%             set(pamfy_assign_edit,'string','34.5');
%             set(pamrho_assign_edit,'string','0.0000912');
%             set(pamfyfi_assign_edit,'string','0');
%             set(pamfyw_assign_edit,'string','0');
%             set(pamfyfo_assign_edit,'string','0');  
%          else
%             set(pamen_assign_edit,'string','4');
%             set(pame_assign_edit,'string','29000');      
%             set(pamg_assign_edit,'string','11200');
%             set(pamfy_assign_edit,'string','50');
%             set(pamrho_assign_edit,'string','0.00034028');
%             set(pamfyfi_assign_edit,'string','0');
%             set(pamfyw_assign_edit,'string','0');
%             set(pamfyfo_assign_edit,'string','0');            
%          end
      end

   end
end

set( gca, 'Units', 'normalized', 'Position', [0 0 0.9 1] );

end