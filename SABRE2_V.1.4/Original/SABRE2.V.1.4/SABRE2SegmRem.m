function [BNodevalue,SNodevalue]=SABRE2SegmRem(JNodevalue,Massemble,...
   JNodevalue_i,JNodevalue_j,Rval,BNodevalue,SNodevalue,pt_title_name,...
   pdb_member_name,pdb_type_name,pdb_coordx_edit,pdb_coordy_edit,...
   pdb_coordz_edit,pdb_length_edit,pdb_bfb_edit,pdb_tfb_edit,...
   pdb_bft_edit,pdb_tft_edit,pdb_dw_edit,pdb_tw_edit,pdb_fil_edit,pdb_step_edit,axesm,vstm)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
% ************************************************************************
% **********               Additional Node             *******************
% ************************************************************************
% Get Member number and Bracing node number
mnum = round(str2double(get(pdb_member_name,'String')));
nbnode = round(str2double(get(pdb_type_name,'String')));
seglength = str2double(get(pdb_length_edit,'String'));
% BNodevalue=[mnum nbnode jcoordx jcoordy jcoordz jbfb jbft jtfb jtft jd jtw dw h)
if isempty(get(pdb_member_name,'String')) ...
      || isnan(str2double(get(pdb_member_name,'String'))) ...
      || str2double(get(pdb_member_name,'String')) <= 0 ...     
      || isempty(get(pdb_type_name,'String'))    
   set(pt_title_name,'String','No Members are defined')
   set(pt_title_name,'Visible','on')
elseif str2double(get(pdb_type_name,'String')) <= 0 ...     
      || isnan(str2double(get(pdb_type_name,'String')))
   set(pt_title_name,'String',['Please enter addtional nodal number for Member ',num2str(mnum)'])
   set(pt_title_name,'Visible','on') 
   BNodevalue(mnum,1,1)=mnum;
   BNodevalue(mnum,1,2)=nbnode; % 0 No bracing 
else   
   set(pt_title_name,'Visible','off') % Hide BACKGROUNG TEXT
   if ~isempty(BNodevalue)
      BNodevalue(mnum,nbnode,:) = 0;       % Remove BNodevalue
      BNodev=[];
      for i=1:length(BNodevalue(mnum,:,1))
            BNodev(mnum,i,1)=0;
            BNodev(mnum,i,2)=0;
            BNodev(mnum,i,3)=0;
            BNodev(mnum,i,4)=0;
            BNodev(mnum,i,5)=0;
            BNodev(mnum,i,6)=0;
            BNodev(mnum,i,7)=0;
            BNodev(mnum,i,8)=0;
            BNodev(mnum,i,9)=0;
            BNodev(mnum,i,10)=0;
            BNodev(mnum,i,11)=0;
            BNodev(mnum,i,12)=0; 
            BNodev(mnum,i,13)=0;
            BNodev(mnum,i,14)=0;   
            BNodev(mnum,i,15)=0; 
            BNodev(mnum,i,16)=0; 
      end   

      p=0;
      for i=1:length(BNodevalue(mnum,:,1))
         if ~isequal(BNodevalue(mnum,i,1),0)
            BNodevalue(mnum,i,2)=p+1;

            BNodev(mnum,p+1,1)=BNodevalue(mnum,i,1);
            BNodev(mnum,p+1,2)=BNodevalue(mnum,i,2);
            BNodev(mnum,p+1,3)=BNodevalue(mnum,i,3);
            BNodev(mnum,p+1,4)=BNodevalue(mnum,i,4);
            BNodev(mnum,p+1,5)=BNodevalue(mnum,i,5);
            BNodev(mnum,p+1,6)=BNodevalue(mnum,i,6);
            BNodev(mnum,p+1,7)=BNodevalue(mnum,i,7);
            BNodev(mnum,p+1,8)=BNodevalue(mnum,i,8);
            BNodev(mnum,p+1,9)=BNodevalue(mnum,i,9);
            BNodev(mnum,p+1,10)=BNodevalue(mnum,i,10);
            BNodev(mnum,p+1,11)=BNodevalue(mnum,i,11);
            BNodev(mnum,p+1,12)=BNodevalue(mnum,i,12); 
            BNodev(mnum,p+1,13)=BNodevalue(mnum,i,13);
            BNodev(mnum,p+1,14)=BNodevalue(mnum,i,14);  
            BNodev(mnum,p+1,15)=BNodevalue(mnum,i,15);
            BNodev(mnum,p+1,16)=BNodevalue(mnum,i,16);
            
            p=p+1;
         end
      end

      BNodevalue(mnum,:,:)=BNodev(mnum,:,:);
      
      if ~isempty(SNodevalue)
         SNodevalue(mnum,nbnode+1,:) = 0;     % Remove SNodevalue

         SNodev=[];
         for i=1:length(SNodevalue(mnum,:,1))
               SNodev(mnum,i,1)=0;
               SNodev(mnum,i,2)=0;
               SNodev(mnum,i,3)=0;
               SNodev(mnum,i,4)=0;
               SNodev(mnum,i,5)=0;
               SNodev(mnum,i,6)=0;
               SNodev(mnum,i,7)=0;
               SNodev(mnum,i,8)=0;
               SNodev(mnum,i,9)=0;
               SNodev(mnum,i,10)=0;
               SNodev(mnum,i,11)=0;
         end   

         p=0;
         for i=1:length(SNodevalue(mnum,:,1))
            if ~isequal(SNodevalue(mnum,i,1),0)
               SNodevalue(mnum,i,2)=p+1;

               SNodev(mnum,p+1,1)=SNodevalue(mnum,i,1);
               SNodev(mnum,p+1,2)=SNodevalue(mnum,i,2);
               SNodev(mnum,p+1,3)=SNodevalue(mnum,i,3);
               SNodev(mnum,p+1,4)=SNodevalue(mnum,i,4);
               SNodev(mnum,p+1,5)=SNodevalue(mnum,i,5);
               SNodev(mnum,p+1,6)=SNodevalue(mnum,i,6);
               SNodev(mnum,p+1,7)=SNodevalue(mnum,i,7);
               SNodev(mnum,p+1,8)=SNodevalue(mnum,i,8);
               SNodev(mnum,p+1,9)=SNodevalue(mnum,i,9);
               SNodev(mnum,p+1,10)=SNodevalue(mnum,i,10);
               SNodev(mnum,p+1,11)=SNodevalue(mnum,i,11);
               

               p=p+1;
            end
         end

         SNodevalue(mnum,:,:)=SNodev(mnum,:,:);
      end
      
   end
end % if end

% Automatic Segment numbering or Step member.
[BNodevalue]=SABRE2SegmCODE(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,BNodevalue,...
   pdb_coordx_edit,pdb_coordy_edit,pdb_coordz_edit,pdb_step_edit,seglength);


% Initially Auto Genetate BNodevalue for No Bracing Cases
if ~isempty(Massemble)
   mem = length(Massemble(:,1));
   for i = 1:mem
      if isequal(0,BNodevalue(i,1,1))       
         BNodevalue(i,1,1)=i;
         BNodevalue(i,1,2)=0; % 0 No bracing
      end
   end 
end

% ************************************************************************
% **************             Initial Setting              ****************
% ************************************************************************ 
% Empty Edits
set(pdb_member_name,'string','');
set(pdb_type_name,'string','0');
set([pdb_coordx_edit,pdb_coordy_edit,pdb_coordz_edit,...
   pdb_length_edit],'string','');
set([pdb_bfb_edit,pdb_tfb_edit,pdb_bft_edit],'string','');
set([pdb_tft_edit,pdb_dw_edit,pdb_tw_edit],'string','');
set(pdb_fil_edit,'string','0');
set(pdb_step_edit,'Value',1)
% ************************************************************************
% *********************             Plot              ********************
% ************************************************************************ 

SABRE2SegmModel(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,...
   Rval,BNodevalue,axesm,vstm);
SNodevalue=[];
end
