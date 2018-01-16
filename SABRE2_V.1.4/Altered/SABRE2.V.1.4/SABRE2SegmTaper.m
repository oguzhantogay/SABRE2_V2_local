function SABRE2SegmTaper(Massemble,JNodevalue_i,...
   JNodevalue_j,BNodevalue,pdb_member_name,pdb_type_name,pdb_length_edit,pdb_bfb_edit,...
   pdb_tfb_edit,pdb_bft_edit,pdb_tft_edit,pdb_dw_edit,pdb_tw_edit,pdb_fil_edit)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
% ************************************************************************
% **********               Additional Node             *******************
% ************************************************************************
% Get Member number and Bracing node number
if isempty(get(pdb_member_name,'String')) ...
      || isnan(str2double(get(pdb_member_name,'String'))) ...
      || str2double(get(pdb_member_name,'String')) <= 0 ...     
      || isempty(get(pdb_type_name,'String'))  
elseif isempty(Massemble) || isempty(get(pdb_length_edit,'String')) ...
      || isnan(str2double(get(pdb_length_edit,'String'))) ...
      || str2double(get(pdb_length_edit,'String')) <= 0  
else
      
   mnum = round(str2double(get(pdb_member_name,'String')));
   seglength = str2double(get(pdb_length_edit,'String'));
   if isempty(BNodevalue) || isequal(BNodevalue(mnum,1,2),0)
      seL = sqrt( (JNodevalue_i(mnum,3)-JNodevalue_j(mnum,3))^2 + ...
         (JNodevalue_i(mnum,4)-JNodevalue_j(mnum,4))^2+(JNodevalue_i(mnum,5)-JNodevalue_j(mnum,5))^2    );
      segLoc = [0, seL];
      segLocstep = [0, seglength ,seL]; 
      
%       segLoc 
%       segLocstep
      bfbs=[JNodevalue_i(mnum,6),JNodevalue_j(mnum,6)];
      tfbs=[JNodevalue_i(mnum,7),JNodevalue_j(mnum,7)];
      bfts=[JNodevalue_i(mnum,8),JNodevalue_j(mnum,8)];
      tfts=[JNodevalue_i(mnum,9),JNodevalue_j(mnum,9)];
      dws=[JNodevalue_i(mnum,10),JNodevalue_j(mnum,10)];
      tws=[JNodevalue_i(mnum,11),JNodevalue_j(mnum,11)];
      Afills=[JNodevalue_i(mnum,14),JNodevalue_j(mnum,14)];
   else
         
         ntap=0; 
         for i=1:max(BNodevalue(mnum,:,2))
            if str2double(get(pdb_length_edit,'String')) > BNodevalue(mnum,i,16)
               ntap = i;
            else
            end

         end

         if isequal(max(BNodevalue(mnum,:,2)),1)
            if isequal(ntap,0)
               seL = sqrt( (JNodevalue_i(mnum,3)-BNodevalue(mnum,ntap+1,3))^2 + ...
                  (JNodevalue_i(mnum,4)-BNodevalue(mnum,ntap+1,4))^2+(JNodevalue_i(mnum,5)-BNodevalue(mnum,ntap+1,5))^2    );
               segLoc = [0, seL];
               segLocstep = [0, seglength ,seL]; 
               bfbs=[JNodevalue_i(mnum,6),BNodevalue(mnum,ntap+1,6)];
               tfbs=[JNodevalue_i(mnum,7),BNodevalue(mnum,ntap+1,7)];
               bfts=[JNodevalue_i(mnum,8),BNodevalue(mnum,ntap+1,8)];
               tfts=[JNodevalue_i(mnum,9),BNodevalue(mnum,ntap+1,9)];
               dws=[JNodevalue_i(mnum,10),BNodevalue(mnum,ntap+1,10)];
               tws=[JNodevalue_i(mnum,11),BNodevalue(mnum,ntap+1,11)]; 
               Afills=[JNodevalue_i(mnum,14),BNodevalue(mnum,ntap+1,14)];


            else

               seL = sqrt( (BNodevalue(mnum,ntap,3)-JNodevalue_j(mnum,3))^2 + ...
                  (BNodevalue(mnum,ntap,4)-JNodevalue_j(mnum,4))^2+(BNodevalue(mnum,ntap,5)-JNodevalue_j(mnum,5))^2    );
               segLoc = [0, seL];
               segLocstep = [0, (seglength-(BNodevalue(mnum,ntap,16))) ,seL]; 
               bfbs=[BNodevalue(mnum,ntap,6),JNodevalue_j(mnum,6)];
               tfbs=[BNodevalue(mnum,ntap,7),JNodevalue_j(mnum,7)];
               bfts=[BNodevalue(mnum,ntap,8),JNodevalue_j(mnum,8)];
               tfts=[BNodevalue(mnum,ntap,9),JNodevalue_j(mnum,9)];
               dws=[BNodevalue(mnum,ntap,10),JNodevalue_j(mnum,10)];
               tws=[BNodevalue(mnum,ntap,11),JNodevalue_j(mnum,11)];            
               Afills=[BNodevalue(mnum,ntap,14),JNodevalue_j(mnum,14)];
            end

         else
            
            if isequal(ntap,0)
               seL = sqrt( (JNodevalue_i(mnum,3)-BNodevalue(mnum,ntap+1,3))^2 + ...
                  (JNodevalue_i(mnum,4)-BNodevalue(mnum,ntap+1,4))^2+(JNodevalue_i(mnum,5)-BNodevalue(mnum,ntap+1,5))^2    );
               segLoc = [0, seL];
               segLocstep = [0, seglength ,seL]; 
               bfbs=[JNodevalue_i(mnum,6),BNodevalue(mnum,ntap+1,6)];
               tfbs=[JNodevalue_i(mnum,7),BNodevalue(mnum,ntap+1,7)];
               bfts=[JNodevalue_i(mnum,8),BNodevalue(mnum,ntap+1,8)];
               tfts=[JNodevalue_i(mnum,9),BNodevalue(mnum,ntap+1,9)];
               dws=[JNodevalue_i(mnum,10),BNodevalue(mnum,ntap+1,10)];
               tws=[JNodevalue_i(mnum,11),BNodevalue(mnum,ntap+1,11)]; 
               Afills=[JNodevalue_i(mnum,14),BNodevalue(mnum,ntap+1,14)];


            elseif isequal(ntap,max(BNodevalue(mnum,:,2)))

               seL = sqrt( (BNodevalue(mnum,ntap,3)-JNodevalue_j(mnum,3))^2 + ...
                  (BNodevalue(mnum,ntap,4)-JNodevalue_j(mnum,4))^2+(BNodevalue(mnum,ntap,5)-JNodevalue_j(mnum,5))^2    );
               segLoc = [0, seL];
               segLocstep = [0, (seglength-(BNodevalue(mnum,ntap,16))) ,seL]; 
               bfbs=[BNodevalue(mnum,ntap,6),JNodevalue_j(mnum,6)];
               tfbs=[BNodevalue(mnum,ntap,7),JNodevalue_j(mnum,7)];
               bfts=[BNodevalue(mnum,ntap,8),JNodevalue_j(mnum,8)];
               tfts=[BNodevalue(mnum,ntap,9),JNodevalue_j(mnum,9)];
               dws=[BNodevalue(mnum,ntap,10),JNodevalue_j(mnum,10)];
               tws=[BNodevalue(mnum,ntap,11),JNodevalue_j(mnum,11)];            
               Afills=[BNodevalue(mnum,ntap,14),JNodevalue_j(mnum,14)];
               
            else
               
               seL = sqrt( (BNodevalue(mnum,ntap,3)-BNodevalue(mnum,ntap+1,3))^2 + ...
                  (BNodevalue(mnum,ntap,4)-BNodevalue(mnum,ntap+1,4))^2+(BNodevalue(mnum,ntap,5)-BNodevalue(mnum,ntap+1,5))^2    );
               segLoc = [0, seL];
               segLocstep = [0, (seglength-(BNodevalue(mnum,ntap,16))) ,seL]; 
               bfbs=[BNodevalue(mnum,ntap,6),BNodevalue(mnum,ntap+1,6)];
               tfbs=[BNodevalue(mnum,ntap,7),BNodevalue(mnum,ntap+1,7)];
               bfts=[BNodevalue(mnum,ntap,8),BNodevalue(mnum,ntap+1,8)];
               tfts=[BNodevalue(mnum,ntap,9),BNodevalue(mnum,ntap+1,9)];
               dws=[BNodevalue(mnum,ntap,10),BNodevalue(mnum,ntap+1,10)];
               tws=[BNodevalue(mnum,ntap,11),BNodevalue(mnum,ntap+1,11)];            
               Afills=[BNodevalue(mnum,ntap,14),BNodevalue(mnum,ntap+1,14)];               
      
            end            

         end
   end 
      bfbs
      tfbs
      bfts
      tfts
      dws
      tws
	  Afills
      segLoc
      segLocstep
      bfbsb=interp1(segLoc,bfbs,segLocstep);
      tfbsb=interp1(segLoc,tfbs,segLocstep);
      bftsb=interp1(segLoc,bfts,segLocstep);
      tftsb=interp1(segLoc,tfts,segLocstep);
      dwsb=interp1(segLoc,dws,segLocstep);
      twsb=interp1(segLoc,tws,segLocstep);
      Afillsb=interp1(segLoc,Afills,segLocstep); 
      
      set(pdb_bfb_edit,'String',num2str(bfbsb(1,2))); 
      set(pdb_tfb_edit,'String',num2str(tfbsb(1,2))); 
      set(pdb_bft_edit,'String',num2str(bftsb(1,2)));           
      set(pdb_tft_edit,'String',num2str(tftsb(1,2)));   
      set(pdb_dw_edit,'String',num2str(dwsb(1,2)));   
      set(pdb_tw_edit,'String',num2str(twsb(1,2))); 
      set(pdb_fil_edit,'String',num2str(Afillsb(1,2))); 
  
end