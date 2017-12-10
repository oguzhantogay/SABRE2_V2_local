function [JNodevalue,JNodevalue_i,JNodevalue_j,BNodevalue,SNodevalue]=SABRE2JointApp(JNodevalue,...
   Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,SNodevalue,pdn_type_name,...
   pdn_coordx_edit,pdn_coordy_edit,pdn_coordz_edit,pt_title_name,axesm,vstm)
% Developed by Woo Yong Jeong.
% Date : 07/01/2013.
% ************************************************************************
% *****************       Add Joint Node              ********************
% ************************************************************************ 
% Automatic Joint numbering
fprintf('\n before')
BNodevalue
SNodevalue
if isempty(JNodevalue)
   nextnjnode = 1;
else
   nextnjnode = length(JNodevalue(:,1))+1;
end
% Get Joint number : pdn_type_name (Joint number)
njnode = round(str2double(get(pdn_type_name,'String')));
% ************************************************************************
% ********     JNodevalue=[njnode jcoordx jcoordy jcoordz]          ******
% ************************************************************************
% Empty; NaN; Not positive, 
if isempty(get(pdn_type_name,'String')) ...
      || isnan(str2double(get(pdn_type_name,'String'))) ...
      || str2double(get(pdn_type_name,'String')) <= 0     
   set(pt_title_name,'String','No Joints are defined')
   set(pt_title_name,'Visible','on') 
elseif njnode > nextnjnode
   set(pt_title_name,'String',['Please enter Joint number ',num2str(nextnjnode)])
   set(pt_title_name,'Visible','on')   
elseif isempty(get(pdn_coordx_edit,'String')) ...
      || isempty(get(pdn_coordy_edit,'String')) ...
      || isempty(get(pdn_coordz_edit,'String')) ...
      || isnan(str2double(get(pdn_coordx_edit,'String'))) ...
      || isnan(str2double(get(pdn_coordy_edit,'String'))) ...
      || isnan(str2double(get(pdn_coordz_edit,'String'))) 
   set(pt_title_name,'String',['Please enter coordinates of Joint ',num2str(njnode)])
   set(pt_title_name,'Visible','on')
elseif ~isequal(str2double(get(pdn_coordz_edit,'String')),0) 
   set(pt_title_name,'String','Please enter Z coordinates = 0 ')
   set(pt_title_name,'Visible','on')   
else
   set(pt_title_name,'Visible','off') % Hide BACKGROUNG TEXT 
   if ~isempty(JNodevalue)
      if max(JNodevalue(:,1)) < njnode
         SNodevalue=[];
      end    
   end
   JNodevalue(njnode,1)=njnode;
   JNodevalue(njnode,2)=str2double(get(pdn_coordx_edit,'String'));
   JNodevalue(njnode,3)=str2double(get(pdn_coordy_edit,'String'));
   JNodevalue(njnode,4)=str2double(get(pdn_coordz_edit, 'String'));          
end % if end

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
% ***    Updated JNodevalue_i & JNodevalue_j & BNodevalue by Moving   ****
% ************************************************************************ 
if ~isempty(Massemble)
   % Preprocessing to update JNodevalue_i & JNodevalue_j coordinates 
   for i = 1:max(Massemble(:,1))
      JNodevalue_i(i,1)=Massemble(i,1);
      JNodevalue_i(i,2)=Massemble(i,2);
      JNodevalue_i(i,3)=JNodevalue(Massemble(i,2),2);
      JNodevalue_i(i,4)=JNodevalue(Massemble(i,2),3);
      JNodevalue_i(i,5)=JNodevalue(Massemble(i,2),4);     

      JNodevalue_j(i,1)=Massemble(i,1);
      JNodevalue_j(i,2)=Massemble(i,3);
      JNodevalue_j(i,3)=JNodevalue(Massemble(i,3),2);
      JNodevalue_j(i,4)=JNodevalue(Massemble(i,3),3);
      JNodevalue_j(i,5)=JNodevalue(Massemble(i,3),4);   
     
   end 

   % Preprocessing to update BNodevalue coordinates 
   % Distance from i node
   for i = 1:max(Massemble(:,1))
      if ~isequal(max(BNodevalue(i,:,2)),0) % ~ No Bracing
         
         for j = 1:max(BNodevalue(i,:,2))
            seglength = BNodevalue(i,j,16);
            alpharef = zeros(i,2);    
            opp = JNodevalue_j(i,4)-JNodevalue_i(i,4);  % element depth in y-dir
            adj = JNodevalue_j(i,3)-JNodevalue_i(i,3);  % element length in x-dir         
            alpharef(i,1)=i; % Member number
            alpharef(i,2)=atan2(opp,adj); % Only global frame angle
            % Rotation
            Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
               sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
               0 0 1];
            Lb =[seglength;0;0];
            Lb = Rz*Lb+[JNodevalue_i(i,3);JNodevalue_i(i,4);JNodevalue_i(i,5)];
            Lb=round(Lb*10^11)/10^11;

            BNodevalue(i,j,3)=Lb(1,1);
            BNodevalue(i,j,4)=Lb(2,1);
            BNodevalue(i,j,5)=Lb(3,1);
         end
      end
   end
   
end
fprintf('after')
BNodevalue
SNodevalue
% ************************************************************************
% *******                   Plot Model                            ********
% ************************************************************************
SABRE2JointModel(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,...
   Rval,BNodevalue,axesm,vstm);

end



