function [Massemble,JNodevalue_i,JNodevalue_j,Rval,...
   BNodevalue]=SABRE2MembApp(JNodevalue)

% ************************************************************************
% *****************               Memeber             ********************
% ************************************************************************
% Automatic Member numbering
nextmnum = 1;
% Member number
mnum = round(str2double(get(pde_type_name,'String')));

% Incidence
Massemble(mnum,1) = mnum;
Massemble(mnum,2) = str2double(get(pde_jointi_edit,'String'));
Massemble(mnum,3) = str2double(get(pde_jointj_edit,'String'));  

% i node
JNodevalue_i(mnum,1)=Massemble(mnum,1);
JNodevalue_i(mnum,2)=Massemble(mnum,2);
JNodevalue_i(mnum,3)=JNodevalue(Massemble(mnum,2),2);
JNodevalue_i(mnum,4)=JNodevalue(Massemble(mnum,2),3);
JNodevalue_i(mnum,5)=JNodevalue(Massemble(mnum,2),4);
JNodevalue_i(mnum,6)=str2double(get(pde_bfbi_edit, 'String')); 
JNodevalue_i(mnum,7)=str2double(get(pde_tfbi_edit, 'String')); 
JNodevalue_i(mnum,8)=str2double(get(pde_bfti_edit, 'String')); 
JNodevalue_i(mnum,9)=str2double(get(pde_tfti_edit, 'String')); 
JNodevalue_i(mnum,10)=str2double(get(pde_dwi_edit, 'String'));
JNodevalue_i(mnum,11)=str2double(get(pde_twi_edit, 'String'));          
JNodevalue_i(mnum,12)=JNodevalue_i(mnum,10) ...
  +JNodevalue_i(mnum,7)+JNodevalue_i(mnum,9);                               % total depth
JNodevalue_i(mnum,13)=JNodevalue_i(mnum,10) ...
  +(JNodevalue_i(mnum,7)+JNodevalue_i(mnum,9))/2;                           % flange centroid 
JNodevalue_i(mnum,14)=str2double(get(pde_fili_edit, 'String')); 
% j node
JNodevalue_j(mnum,1)=Massemble(mnum,1);
JNodevalue_j(mnum,2)=Massemble(mnum,3);
JNodevalue_j(mnum,3)=JNodevalue(Massemble(mnum,3),2);
JNodevalue_j(mnum,4)=JNodevalue(Massemble(mnum,3),3);
JNodevalue_j(mnum,5)=JNodevalue(Massemble(mnum,3),4); 
JNodevalue_j(mnum,6)=str2double(get(pde_bfbj_edit, 'String')); 
JNodevalue_j(mnum,7)=str2double(get(pde_tfbj_edit, 'String')); 
JNodevalue_j(mnum,8)=str2double(get(pde_bftj_edit, 'String')); 
JNodevalue_j(mnum,9)=str2double(get(pde_tftj_edit, 'String')); 
JNodevalue_j(mnum,10)=str2double(get(pde_dwj_edit, 'String'));
JNodevalue_j(mnum,11)=str2double(get(pde_twj_edit, 'String'));        
JNodevalue_j(mnum,12)=JNodevalue_j(mnum,10) ...
  +JNodevalue_j(mnum,7)+JNodevalue_j(mnum,9);                               % total depth
JNodevalue_j(mnum,13)=JNodevalue_j(mnum,10) ...
  +(JNodevalue_j(mnum,7)+JNodevalue_j(mnum,9))/2;                           % flange centroid 
JNodevalue_j(mnum,14)=str2double(get(pde_filj_edit, 'String'));
   % Reference axis.
   if isempty(Rval)
      for i=1:length(Massemble(:,1))
         Rval(i,1)=i;
         Rval(i,2)=1;    
      end   
   end
   Rval(mnum,1)=mnum;
   Rval(mnum,2)=get(pdesign_edit,'Value');   


   for i=1:(length(SECTION(:,1)))
 
               Massemble(mnum,1) = mnum;
               Massemble(mnum,2) = str2double(get(pde_jointi_edit,'String'));
               Massemble(mnum,3) = str2double(get(pde_jointj_edit,'String'));           
               Massemble(mnum,4) = 0;
               Massemble(mnum,5) = SECTION(i,7); % A
               Massemble(mnum,6) = SECTION(i,8); % W
               Massemble(mnum,7) = SECTION(i,9); % Ix
               Massemble(mnum,8) = SECTION(i,10); % Zx
               Massemble(mnum,9) = SECTION(i,11); % Sx
               Massemble(mnum,10) = SECTION(i,12); % rx
               Massemble(mnum,11) = SECTION(i,13); % Iy
               Massemble(mnum,12) = SECTION(i,14); % Zy
               Massemble(mnum,13) = SECTION(i,15); % Sy
               Massemble(mnum,14) = SECTION(i,16); % ry
               Massemble(mnum,15) = SECTION(i,17); % J
               Massemble(mnum,16) = SECTION(i,18); % Cw
      end   


% ************************************************************************
% **************             Initial Setting              ****************
% ************************************************************************ 
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
% ***    Updated JNodevalue_i & JNodevalue_j & BNodevalue by Moving   ****
% ************************************************************************ 
if ~isempty(Massemble)
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

end
