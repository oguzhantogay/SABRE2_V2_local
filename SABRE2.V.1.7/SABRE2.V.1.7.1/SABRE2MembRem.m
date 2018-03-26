function [Massemble,JNodevalue_i,JNodevalue_j,Rval,...
   BNodevalue,SNodevalue]=SABRE2MembRem(JNodevalue,Massemble,JNodevalue_i,...
   JNodevalue_j,Rval,BNodevalue,SNodevalue,pde_type_name,pt_title_name,...
   pde_jointi_edit,pde_jointj_edit,pde_bfbi_edit,pde_tfbi_edit,...
   pde_bfti_edit,pde_tfti_edit,pde_dwi_edit,pde_twi_edit,pde_bfbj_edit,...
   pde_tfbj_edit,pde_bftj_edit,pde_tftj_edit,pde_dwj_edit,pde_twj_edit,pde_fili_edit,pde_filj_edit,...
   pde_reference_edit,pde_jointi_radiobutton,pde_jointj_radiobutton,axesm,pde_wsname_edit,LabType,vstm)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
% ************************************************************************
% *****************        Remove Memeber             ********************
% ************************************************************************
% Get Member number
mnum = round(str2double(get(pde_type_name,'String')));
if isempty(get(pde_type_name,'String')) ...
      || isnan(str2double(get(pde_type_name,'String'))) ...
      || str2double(get(pde_type_name,'String')) <= 0
   set(pt_title_name,'String','No Members are defined')
   set(pt_title_name,'Visible','on')   
elseif ~isempty(Massemble) && mnum > length(Massemble(:,1)) 
   set(pt_title_name,'String','The Member are not defined')
   set(pt_title_name,'Visible','on')    
else
   set(pt_title_name,'Visible','off')  % Hide BACKGROUNG TEXT
   if ~isempty(Massemble)
      Massemble(mnum,:) = [];             % Remove Massemble
      JNodevalue_i(mnum,:) = [];          % Remove JNodevalue_i
      JNodevalue_j(mnum,:) = [];          % Remove JNodevalue_j
      Rval(mnum,:) = [];                  % Remove Rval
 
      BNodevalue(mnum,:,:) = 0;       % Remove BNodevalue
      nBNodevalue=BNodevalue(any(any(BNodevalue,3),2),:,:);
      BNodevalue =nBNodevalue;

      SNodevalue(mnum,:,:) = 0;         % Remove SNodevalue      
      nSNodevalue=SNodevalue(any(any(SNodevalue,3),2),:,:);    
      SNodevalue =nSNodevalue; 
      
      if ~isempty(Massemble)
         for i=1:length(Massemble(:,1))
            Massemble(i,1)=i;
            JNodevalue_i(i,1) = i;     
            JNodevalue_j(i,1) = i;         
            Rval(i,1) = i;                       
         end    

         for i = 1:length(Massemble(:,1))
            if ~isempty(BNodevalue)
               if isequal(max(BNodevalue(i,:,2)),0)
                  BNodevalue(i,1,1)=i;
               else
                  for j=1:max(BNodevalue(i,:,2))
                     BNodevalue(i,j,1)=i;
                  end
               end
            end
            
            if ~isempty(SNodevalue)
               SNodevalue(i,1,1)=i;
               for j=1:max(SNodevalue(i,:,2))
                  SNodevalue(i,j,1)=i;
               end
            end            
         end
         
      end
   end 
 
end % if end

% ************************************************************************
% **************             Initial Setting              ****************
% ************************************************************************ 
if isempty(Massemble)
   nextmnum = 1;
else
   nextmnum = length(Massemble(:,1))+1;
end
% Empty Edits
set(pde_type_name,'string',num2str(nextmnum));
set([pde_jointi_edit,pde_jointj_edit],'String','');
set(pde_jointi_radiobutton,'value',1)
set(pde_jointj_radiobutton,'value',0)  
set([pde_bfbi_edit,pde_tfbi_edit,pde_bfti_edit],'string','');
set([pde_tfti_edit,pde_dwi_edit,pde_twi_edit],'string','');
set([pde_bfbj_edit,pde_tfbj_edit,pde_bftj_edit],'string','');
set([pde_tftj_edit,pde_dwj_edit,pde_twj_edit],'string','');
set([pde_fili_edit,pde_filj_edit],'string','0');
set(pde_wsname_edit,'String','');

% Initially Auto Genetate BNodevalue for No Bracing Cases
if ~isempty(Massemble)
   if isempty(BNodevalue)
      mem = length(Massemble(:,1));
      for i = 1:mem
         BNodevalue(i,1,1)=i;
         BNodevalue(i,1,2)=0; % 0 No bracing
      end
   elseif ~isequal(length(Massemble(:,1)),length(BNodevalue(:,1,1)))
      mem = length(Massemble(:,1));
      bn = length(BNodevalue(:,1,1));
      for i = (bn+1):mem
         BNodevalue(i,1,1)=i;
         BNodevalue(i,1,2)=0; % 0 No bracing
      end
   end 
end
 
% ************************************************************************
% *******                   Plot Model                            ********
% ************************************************************************
SABRE2MembModel(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,...
   Rval,BNodevalue,LabType,axesm,vstm);
SNodevalue=[];
end

