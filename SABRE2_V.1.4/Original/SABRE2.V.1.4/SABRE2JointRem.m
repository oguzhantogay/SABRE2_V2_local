function [JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,...
   SNodevalue]=SABRE2JointRem(JNodevalue,Massemble,JNodevalue_i,...
   JNodevalue_j,Rval,BNodevalue,SNodevalue,pdn_type_name,...
   pdn_coordx_edit,pdn_coordy_edit,pdn_coordz_edit,pt_title_name,axesm,vstm)
% Developed by Woo Yong Jeong.
% Date : 07/01/2013.
% ************************************************************************
% *****************         Remove Joint Node              ***************
% ************************************************************************ 
% Get Joint number : pdn_type_name (Joint number)
njnode = round(str2double(get(pdn_type_name,'String')));
% Empty; NaN; Not positive, 
if isempty(get(pdn_type_name,'String')) ...
      || isnan(str2double(get(pdn_type_name,'String'))) ...
      || str2double(get(pdn_type_name,'String')) <= 0     
   set(pt_title_name,'String','No Joints are defined')
   set(pt_title_name,'Visible','on') 
elseif ~isempty(JNodevalue) && njnode > length(JNodevalue(:,1)) 
   set(pt_title_name,'String','The Joints are not defined')
   set(pt_title_name,'Visible','on')    
else
   set(pt_title_name,'Visible','off')  % Hide BACKGROUNG TEXT
   if ~isempty(JNodevalue)    
      JNodevalue(njnode,:)=[];            % Remove JNodevalue 
      TJNodevalue=JNodevalue;
      if ~isempty(JNodevalue)
         for i=1:length(JNodevalue(:,1))
            JNodevalue(i,1)=i;
         end
      end

      if ~isempty(Massemble) % Old Massemble,JNodevalue_i,JNodevalue_j
         for i = 1:length(Massemble(:,1));
            if isequal(Massemble(i,2),njnode) || isequal(Massemble(i,3),njnode)
               Massemble(i,:) = 0;          % Remove Massemble
               JNodevalue_i(i,:) = 0;       % Remove JNodevalue_i
               JNodevalue_j(i,:) = 0;       % Remove JNodevalue_j  
               Rval(i,:) = 0;               % Remove Rval
               BNodevalue(i,:,:) = 0;       % Remove BNodevalue
               SNodevalue(i,:,:) = 0;         % Remove SNodevalue
            end    
         end

         % Remove all zero row.
         nMassemble=Massemble(any(Massemble,2),:);
         nJNodevalue_i=JNodevalue_i(any(JNodevalue_i,2),:);
         nJNodevalue_j=JNodevalue_j(any(JNodevalue_j,2),:);
         nRval=Rval(any(Rval,2),:);
         nBNodevalue=BNodevalue(any(any(BNodevalue,3),2),:,:);
         nSNodevalue=SNodevalue(any(any(SNodevalue,3),2),:,:);

         Massemble=nMassemble;
         JNodevalue_i=nJNodevalue_i;
         JNodevalue_j=nJNodevalue_j;
         Rval=nRval;
         BNodevalue =nBNodevalue;
         SNodevalue =nSNodevalue;

         if ~isempty(Massemble)  % Updated Massemble,JNodevalue_i,JNodevalue_j
            for i = 1:length(Massemble(:,1))
               Massemble(i,1)=i;
               JNodevalue_i(i,1)=i;
               JNodevalue_j(i,1)=i;
               Rval(i,1)=1;
               
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

            for i=1:length(Massemble(:,1))
               for j=1:length(JNodevalue(:,1))

                  if isequal(TJNodevalue(j,1),Massemble(i,2))
                     Massemble(i,2) = JNodevalue(j,1);
                  end
                  if isequal(TJNodevalue(j,1),Massemble(i,3))
                     Massemble(i,3) = JNodevalue(j,1);
                  end

                  if isequal(TJNodevalue(j,1),JNodevalue_i(i,2))
                     JNodevalue_i(i,2) = JNodevalue(j,1);
                  end
                  if isequal(TJNodevalue(j,1),JNodevalue_j(i,2))
                     JNodevalue_j(i,2) = JNodevalue(j,1);
                  end         

               end       
            end
         end

      end 
         
   end
end

% ************************************************************************
% **************             Initial Setting              ****************
% ************************************************************************ 
% Updated automatic Joint numbering
if isempty(JNodevalue)
   nextnjnode = 1;
else
   nextnjnode = length(JNodevalue(:,1))+1;
end
% Empty Edits
set(pdn_type_name,'string',num2str(nextnjnode));
set([pdn_coordx_edit,pdn_coordy_edit,pdn_coordz_edit],'string',''); 


% ************************************************************************
% *******                   Plot Model                            ********
% ************************************************************************
SABRE2JointModel(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,...
   Rval,BNodevalue,axesm,vstm);
SNodevalue=[];
end


