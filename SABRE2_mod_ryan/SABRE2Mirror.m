function [JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,Rval,...
   BNodevalue,SNodevalue]=SABRE2Mirror(JNodevalue,Massemble,JNodevalue_i,...
   JNodevalue_j,Rval,BNodevalue,SNodevalue,pdmi_name,pt_title_name,axesm,vstm)
% Developed by Woo Yong Jeong.
% Date : 11/01/2015.
% ************************************************************************
% **********               Mirror Geometries           *******************
% ************************************************************************
% Empty; NaN; Not positive, 
if isempty(get(pdmi_name,'String')) ...
      || isnan(str2double(get(pdmi_name,'String'))) ...
      || str2double(get(pdmi_name,'String')) <= 0     
   set(pt_title_name,'String','No Joints are defined')
   set(pt_title_name,'Visible','on') 
elseif isempty(SNodevalue)
   set(pt_title_name,'String','Please, complete "Subdivide segment(s) & Assign Materials"')
   set(pt_title_name,'Visible','on')      
else
mir =str2double(get(pdmi_name,'String'));
% ************************************************************************
% **********               Initial setting             *******************
% ************************************************************************
numnode =length(JNodevalue(:,1));
if ~isempty(Massemble)
   mssnum = length(Massemble(:,1));
   for j=1:mssnum
      mnum = j+mssnum;
      % Incidence
      Massemble(mnum,1) = mnum;
      Massemble(mnum,2) = Massemble(j,2); 
      Massemble(mnum,3) = Massemble(j,3); 
      Massemble(mnum,4) = Massemble(j,4);     
      Massemble(mnum,5) = Massemble(j,5); % A
      Massemble(mnum,6) = Massemble(j,6); % W
      Massemble(mnum,7) = Massemble(j,7); % Ix
      Massemble(mnum,8) = Massemble(j,8); % Zx
      Massemble(mnum,9) = Massemble(j,9); % Sx
      Massemble(mnum,10) = Massemble(j,10); % rx
      Massemble(mnum,11) = Massemble(j,11); % Iy
      Massemble(mnum,12) = Massemble(j,12); % Zy
      Massemble(mnum,13) = Massemble(j,13); % Sy
      Massemble(mnum,14) = Massemble(j,14); % ry
      Massemble(mnum,15) = Massemble(j,15); % J
      Massemble(mnum,16) = Massemble(j,16); % Cw      
 
      % i node
      JNodevalue_i(mnum,1)=mnum;
      JNodevalue_i(mnum,2)=JNodevalue_i(j,2);
      JNodevalue_i(mnum,3)=JNodevalue_i(j,3);
      JNodevalue_i(mnum,4)=JNodevalue_i(j,4);
      JNodevalue_i(mnum,5)=JNodevalue_i(j,5);
      JNodevalue_i(mnum,6)=JNodevalue_i(j,8); 
      JNodevalue_i(mnum,7)=JNodevalue_i(j,9); 
      JNodevalue_i(mnum,8)=JNodevalue_i(j,6); 
      JNodevalue_i(mnum,9)=JNodevalue_i(j,7); 
      JNodevalue_i(mnum,10)=JNodevalue_i(j,10);
      JNodevalue_i(mnum,11)=JNodevalue_i(j,11);          
      JNodevalue_i(mnum,12)=JNodevalue_i(j,12);     % total depth
      JNodevalue_i(mnum,13)=JNodevalue_i(j,13); % flange centroid 
      JNodevalue_i(mnum,14)=JNodevalue_i(j,14); 
      % j node
      JNodevalue_j(mnum,1)=mnum;
      JNodevalue_j(mnum,2)=JNodevalue_j(j,2);
      JNodevalue_j(mnum,3)=JNodevalue_j(j,3);
      JNodevalue_j(mnum,4)=JNodevalue_j(j,4);
      JNodevalue_j(mnum,5)=JNodevalue_j(j,5); 
      JNodevalue_j(mnum,6)=JNodevalue_j(j,8); 
      JNodevalue_j(mnum,7)=JNodevalue_j(j,9); 
      JNodevalue_j(mnum,8)=JNodevalue_j(j,6); 
      JNodevalue_j(mnum,9)=JNodevalue_j(j,7); 
      JNodevalue_j(mnum,10)=JNodevalue_j(j,10);
      JNodevalue_j(mnum,11)=JNodevalue_j(j,11);        
      JNodevalue_j(mnum,12)=JNodevalue_j(j,12);     % total depth
      JNodevalue_j(mnum,13)=JNodevalue_j(j,13); % flange centroid 
      JNodevalue_j(mnum,14)=JNodevalue_j(j,14);   
      
      % Reference axis.
      Rval(mnum,1)=mnum;
%       Rval(mnum,2)=Rval(j,2);  
      if isequal(Rval(j,2),2)
         Rval(mnum,2)=3; 
      elseif isequal(Rval(j,2),3)
         Rval(mnum,2)=2; 
      else
         Rval(mnum,2)=1; 
      end      
          
      if isequal(BNodevalue(j,:,2),0)
         BNodevalue(mnum,:,1)=mnum;
         BNodevalue(mnum,:,2)=BNodevalue(j,:,2); % 0 No bracing         
      else
         BNodevalue(mnum,:,1)=mnum;
         BNodevalue(mnum,:,2)=BNodevalue(j,:,2); % 0 No bracing
         BNodevalue(mnum,:,3)=BNodevalue(j,:,3);
         BNodevalue(mnum,:,4)=BNodevalue(j,:,4);
         BNodevalue(mnum,:,5)=BNodevalue(j,:,5);  
         BNodevalue(mnum,:,6)=BNodevalue(j,:,8);
         BNodevalue(mnum,:,7)=BNodevalue(j,:,9);
         BNodevalue(mnum,:,8)=BNodevalue(j,:,6);
         BNodevalue(mnum,:,9)=BNodevalue(j,:,7);
         BNodevalue(mnum,:,10)=BNodevalue(j,:,10);
         BNodevalue(mnum,:,11)=BNodevalue(j,:,11);  
         BNodevalue(mnum,:,12)=BNodevalue(j,:,12);       % total depth
         BNodevalue(mnum,:,13)=BNodevalue(j,:,13); % flange centroid 
         BNodevalue(mnum,:,14)=BNodevalue(j,:,14);  
         BNodevalue(mnum,:,15)=BNodevalue(j,:,15);
         BNodevalue(mnum,:,16)=BNodevalue(j,:,16);
      end

      SNodevalue(mnum,:,1)=mnum;
      SNodevalue(mnum,:,2)=SNodevalue(j,:,2);
      SNodevalue(mnum,:,3)=SNodevalue(j,:,3);
      SNodevalue(mnum,:,4)=SNodevalue(j,:,4);
      SNodevalue(mnum,:,5)=SNodevalue(j,:,5);
      SNodevalue(mnum,:,6)=SNodevalue(j,:,6);
      SNodevalue(mnum,:,7)=SNodevalue(j,:,7);
      SNodevalue(mnum,:,8)=SNodevalue(j,:,8);
      SNodevalue(mnum,:,9)=SNodevalue(j,:,9);
      SNodevalue(mnum,:,10)=SNodevalue(j,:,10);
      SNodevalue(mnum,:,11)=SNodevalue(j,:,11);        
 
   end
end

BNode=BNodevalue;

mir_num=zeros(numnode,1);
for i=1:numnode
   if isequal(JNodevalue(i,2),JNodevalue(mir,2))
      mir_num(i,1)=1;
   end
end
% ************************************************************************
% **********                Update Mirror              *******************
% ************************************************************************
p=1;
for i=1:numnode
   if ~isequal(mir_num(i,1),1)
      njnode = p+numnode;
      JNodevalue(njnode,1)=njnode;
      JNodevalue(njnode,2)=(JNodevalue(mir,2)-JNodevalue(i,2))+JNodevalue(mir,2);
      JNodevalue(njnode,3)=JNodevalue(i,3);
      JNodevalue(njnode,4)=JNodevalue(i,4);
      p=p+1;

      if ~isempty(Massemble)
         for j=1:mssnum
            mnum = j+mssnum;
            % Incidence
            Massemble(mnum,1) = mnum;
             
            if isequal(i,Massemble(j,2)) 
               Massemble(mnum,2) = njnode; 
            end
            if isequal(i,Massemble(j,3)) 
               Massemble(mnum,3) = njnode; 
            end
            % i node
            JNodevalue_i(mnum,1) = Massemble(mnum,1);
            JNodevalue_i(mnum,2) = Massemble(mnum,2);
            JNodevalue_i(mnum,3) = JNodevalue(Massemble(mnum,2),2);
            JNodevalue_i(mnum,4) = JNodevalue(Massemble(mnum,2),3);
            JNodevalue_i(mnum,5) = JNodevalue(Massemble(mnum,2),4);            
            % j node
            JNodevalue_j(mnum,1) = Massemble(mnum,1);
            JNodevalue_j(mnum,2) = Massemble(mnum,3);  
            JNodevalue_j(mnum,3) = JNodevalue(Massemble(mnum,3),2);
            JNodevalue_j(mnum,4) = JNodevalue(Massemble(mnum,3),3);
            JNodevalue_j(mnum,5) = JNodevalue(Massemble(mnum,3),4);    
            
            
            if ~isequal(BNodevalue(j,:,2),0)           
               for k=1:length(BNodevalue(j,:,16))

                  seglength = BNodevalue(j,k,16);
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
                     BNodevalue(mnum,k,3)=Lb(1,1);
                     BNodevalue(mnum,k,4)=Lb(2,1);
                     BNodevalue(mnum,k,5)=Lb(3,1); 
                  end   

                   
               end % for end
            
            end % if end
            
            
         end
      end
   end

end

if ~isempty(SNodevalue)
   bp=0;
   for i=1:length(BNode(:,1,1))
      for j=1:max(BNode(i,:,2))
         if ~isequal(BNode(i,j,16),BNodevalue(i,j,16))
            bp = 1;
         end
      end
      if ~isequal(bp,0)
         for j=1:max(SNodevalue(i,:,2))
               SNodevalue(i,j,1)=i;
               SNodevalue(i,j,2)=j;
               SNodevalue(i,j,3)=SNodevalue(i,(end+1-j),3);
               SNodevalue(i,j,4)=SNodevalue(i,(end+1-j),4);
               SNodevalue(i,j,5)=SNodevalue(i,(end+1-j),5);
               SNodevalue(i,j,6)=SNodevalue(i,(end+1-j),6);
               SNodevalue(i,j,7)=SNodevalue(i,(end+1-j),7);
               SNodevalue(i,j,8)=SNodevalue(i,(end+1-j),8);
               SNodevalue(i,j,9)=SNodevalue(i,(end+1-j),9);
               SNodevalue(i,j,10)=SNodevalue(i,(end+1-j),10);
               SNodevalue(i,j,11)=SNodevalue(i,(end+1-j),11);        
         end
      end
   end
end
% ************************************************************************
% **********             Remove Duplication            *******************
% ************************************************************************
if ~isempty(Massemble)
   for i=1:mssnum
      inode = Massemble(i,2);
      jnode = Massemble(i,3);
      if isequal(JNodevalue(inode,2),JNodevalue(mir,2)) && ...
            isequal(JNodevalue(jnode,2),JNodevalue(mir,2))
         mnum = i+mssnum;
         
         Massemble(mnum,:) = 0;              % Remove Massemble

         JNodevalue_i(mnum,:) = 0;           % Remove JNodevalue_i      
 
         JNodevalue_j(mnum,:) = 0;           % Remove JNodevalue_j

         Rval(mnum,:) = 0;                   % Remove Rval   

         BNodevalue(mnum,:,:) = 0;       % Remove BNodevalue       
         
         SNodevalue(mnum,:,:) = 0;         % Remove SNodevalue                   
      end
   end
   

   % Remove Massemble
   nMassemble=Massemble(any(Massemble,2),:);
   Massemble =nMassemble;

   % Remove JNodevalue_i
   nJNodevalue_i=JNodevalue_i(any(JNodevalue_i,2),:);
   JNodevalue_i =nJNodevalue_i;         

   % Remove JNodevalue_j
   nJNodevalue_j=JNodevalue_j(any(JNodevalue_j,2),:);
   JNodevalue_j =nJNodevalue_j;   

   % Remove Rval
   nRval=Rval(any(Rval,2),:);
   Rval =nRval;         

   % Remove BNodevalue
   nBNodevalue=BNodevalue(any(any(BNodevalue,3),2),:,:);
   BNodevalue =nBNodevalue;         

   % Remove SNodevalue      
   nSNodevalue=SNodevalue(any(any(SNodevalue,3),2),:,:);    
   SNodevalue =nSNodevalue;     
   
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


% ************************************************************************
% *********************             Plot              ********************
% ************************************************************************ 

SABRE2SegmModelP(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,...
   Rval,BNodevalue,axesm,vstm);

end

end