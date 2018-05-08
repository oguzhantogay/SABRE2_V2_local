function [BNodevalue,steplength]=SABRE2SegmApp(JNodevalue,...
   Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue)

% ************************************************************************
% **********               Additional Node             *******************
% ************************************************************************
% Get Member number and Bracing node number
mnum = round(str2double(get(pdb_member_name,'String')));
nbnode = round(str2double(get(pdb_type_name,'String')));
seglength = str2double(get(pdb_length_edit,'String'));

if nbnode > 1
     nbnode=length(BNodevalue(1,:,2))+1;
end
% *** Global frame angle for each element 
   alpharef = zeros(mnum,2);    
   opp = JNodevalue_j(mnum,4)-JNodevalue_i(mnum,4);  % element depth in y-dir
   adj = JNodevalue_j(mnum,3)-JNodevalue_i(mnum,3);  % element length in x-dir         
   alpharef(mnum,1)=mnum; % Member number
   alpharef(mnum,2)=atan2(opp,adj); % Only global frame angle
   
   memlength = sqrt( (JNodevalue_i(mnum,3)-JNodevalue_j(mnum,3))^2  + ...
      (JNodevalue_i(mnum,4)-JNodevalue_j(mnum,4))^2 + (JNodevalue_i(mnum,5)-JNodevalue_j(mnum,5))^2);
   
   % Rotation
   Rz=[cos(alpharef(mnum,2)) -sin(alpharef(mnum,2)) 0; ...
      sin(alpharef(mnum,2)) cos(alpharef(mnum,2)) 0; ...
      0 0 1];
   Lb =[seglength;0;0];
   Lb = Rz*Lb+[JNodevalue_i(mnum,3);JNodevalue_i(mnum,4);JNodevalue_i(mnum,5)];
   Lb=round(Lb*10^11)/10^11;
   if seglength >= memlength     
   else
      set(pdb_coordx_edit,'String',num2str(Lb(1,1)));
      set(pdb_coordy_edit,'String',num2str(Lb(2,1)));
      set(pdb_coordz_edit,'String',num2str(Lb(3,1))); 
   end
end

% Automatic Member numbering
if isempty(get(pdb_member_name,'String')) ...
      || isnan(str2double(get(pdb_member_name,'String'))) ...
      || str2double(get(pdb_member_name,'String')) <= 0   
else
    if isempty(BNodevalue(mnum,:,2))
      nextBnum = 0;
   else
      nextBnum = max(BNodevalue(mnum,:,2))+1;
    end  
end
% BNodevalue=[mnum nbnode jcoordx jcoordy jcoordz jbfb jbft jtfb jtft jd jtw dw h)
if isempty(get(pdb_member_name,'String')) ...

elseif str2double(get(pdb_type_name,'String')) <= 0 ...     
      || isnan(str2double(get(pdb_type_name,'String')))

   BNodevalue(mnum,1,1)=mnum;
   BNodevalue(mnum,1,2)=nbnode; % 0 No bracing
elseif nbnode > nextBnum

else
   BNodevalue(mnum,nbnode,1)=mnum;
   BNodevalue(mnum,nbnode,2)=nbnode; % 0 No bracing
   BNodevalue(mnum,nbnode,3)=str2double(get(pdb_coordx_edit,'String'));
   BNodevalue(mnum,nbnode,4)=str2double(get(pdb_coordy_edit,'String'));
   BNodevalue(mnum,nbnode,5)=str2double(get(pdb_coordz_edit, 'String'));  
   BNodevalue(mnum,nbnode,6)=str2double(get(pdb_bfb_edit, 'String'));
   BNodevalue(mnum,nbnode,7)=str2double(get(pdb_tfb_edit, 'String'));
   BNodevalue(mnum,nbnode,8)=str2double(get(pdb_bft_edit, 'String'));
   BNodevalue(mnum,nbnode,9)=str2double(get(pdb_tft_edit, 'String'));
   BNodevalue(mnum,nbnode,10)=str2double(get(pdb_dw_edit, 'String'));
   BNodevalue(mnum,nbnode,11)=str2double(get(pdb_tw_edit, 'String'));  
   BNodevalue(mnum,nbnode,12)=BNodevalue(mnum,nbnode,10) ...
      +BNodevalue(mnum,nbnode,7)+BNodevalue(mnum,nbnode,9);                 % total depth
   BNodevalue(mnum,nbnode,13)=BNodevalue(mnum,nbnode,10) ...
      +( BNodevalue(mnum,nbnode,7)+BNodevalue(mnum,nbnode,9) )/2;           % flange centroid 
   BNodevalue(mnum,nbnode,14)=str2double(get(pdb_fil_edit, 'String'));
end

% Automatic Segment numbering or Step member.
[BNodevalue,steplength]=SABRE2SegmCODE(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,BNodevalue,...
   pdb_coordx_edit,pdb_coordy_edit,pdb_coordz_edit,pdb_step_edit,seglength);

