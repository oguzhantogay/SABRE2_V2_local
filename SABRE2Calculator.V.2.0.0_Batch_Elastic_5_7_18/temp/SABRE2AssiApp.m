function [SNodevalue]=SABRE2AssiApp(BNodevalue,SNodevalue,ptable_node,...
   ptable_seg,steplength,punit_edit,pt_title_name)   
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
% ************************************************************************
% *****************         ASSIGN APPLY              ********************
% ************************************************************************
% SNodevalue = [mnum snum #EL E G]
mnum = 1;
% get geometry table data   
G_getdata=get(ptable_node,'Data');
M_getdata=get(ptable_seg,'Data');
p=0;
dunit=get(punit_edit,'Value');
for snum=1:length(M_getdata(1,:))
   if isempty(M_getdata(1,snum)) || isempty(M_getdata(2,snum)) ... 
         || isempty(M_getdata(3,snum)) || isempty(M_getdata(4,snum)) ...
         || isnan(M_getdata(1,snum)) || isnan(M_getdata(2,snum)) ... 
         || isnan(M_getdata(3,snum)) || isnan(M_getdata(4,snum)) ...
         || M_getdata(1,snum) <= 0 || M_getdata(2,snum) <= 0 ...
         || M_getdata(3,snum) <= 0 || M_getdata(4,snum) <= 0 

      set(pt_title_name,'String','Member Matl. & Elem. are not Completed')
      set(pt_title_name,'Visible','on')    
   else 
      set(pt_title_name,'Visible','off')
      if isequal(length(M_getdata(1,:)),1) % no bracing
            SNodevalue(mnum,snum,1)=mnum;
            SNodevalue(mnum,snum,2)=snum;
            SNodevalue(mnum,snum,3)=M_getdata(1,snum);
            if isequal(dunit,1)
               SNodevalue(mnum,snum,4)=29000;
               SNodevalue(mnum,snum,5)=11200;
               SNodevalue(mnum,snum,7)=0.00034028;
            elseif isequal(dunit,2)
               SNodevalue(mnum,snum,4)=20000;
               SNodevalue(mnum,snum,5)=7720;
               SNodevalue(mnum,snum,7)=0.0000912;
            end
            SNodevalue(mnum,snum,6)=M_getdata(3,snum);           
            SNodevalue(mnum,snum,8)=M_getdata(2,snum);
            SNodevalue(mnum,snum,9)=M_getdata(3,snum);
            SNodevalue(mnum,snum,10)=M_getdata(4,snum);
            SNodevalue(mnum,snum,11)=0;
      else

         if isequal(snum,1) % snum = 1
       
               SNodevalue(mnum,snum,1)=mnum;
               SNodevalue(mnum,snum,2)=snum;
               SNodevalue(mnum,snum,3)=M_getdata(1,snum);
               if isequal(dunit,1)
                  SNodevalue(mnum,snum,4)=29000;
                  SNodevalue(mnum,snum,5)=11200;
                  SNodevalue(mnum,snum,7)=0.00034028;
               elseif isequal(dunit,2)
                  SNodevalue(mnum,snum,4)=20000;
                  SNodevalue(mnum,snum,5)=7720;
                  SNodevalue(mnum,snum,7)=0.0000912;
               end               
               SNodevalue(mnum,snum,6)=M_getdata(3,snum);              
               SNodevalue(mnum,snum,8)=M_getdata(2,snum);
               SNodevalue(mnum,snum,9)=M_getdata(3,snum);
               SNodevalue(mnum,snum,10)=M_getdata(4,snum);
               SNodevalue(mnum,snum,11)=0;
         else         

            if isequal(round(G_getdata(14,snum)),1)
              
               SNodevalue(mnum,snum+p,1)=mnum;
               SNodevalue(mnum,snum+p,2)=snum+p;
               SNodevalue(mnum,snum+p,3)=M_getdata(1,snum);
               if isequal(dunit,1)
                  SNodevalue(mnum,snum+p,4)=29000;
                  SNodevalue(mnum,snum+p,5)=11200;
                  SNodevalue(mnum,snum+p,7)=0.00034028;
               elseif isequal(dunit,2)
                  SNodevalue(mnum,snum+p,4)=20000;
                  SNodevalue(mnum,snum+p,5)=7720;
                  SNodevalue(mnum,snum+p,7)=0.0000912;
               end                 
               SNodevalue(mnum,snum+p,6)=M_getdata(3,snum);       
               SNodevalue(mnum,snum+p,8)=M_getdata(2,snum);
               SNodevalue(mnum,snum+p,9)=M_getdata(3,snum);
               SNodevalue(mnum,snum+p,10)=M_getdata(4,snum);
               SNodevalue(mnum,snum+p,11)=0;
            elseif isequal(round(G_getdata(14,snum)),2)
               
               if isequal(length(M_getdata(1,:))-1,length(BNodevalue(mnum,:,1)))
                  SNodevalue(mnum,snum+p,1)=mnum;
                  SNodevalue(mnum,snum+p,2)=snum+p;
                  SNodevalue(mnum,snum+p,3)=M_getdata(1,snum);
                  if isequal(dunit,1)
                     SNodevalue(mnum,snum+p,4)=29000;
                     SNodevalue(mnum,snum+p,5)=11200;
                     SNodevalue(mnum,snum+p,7)=0.00034028;
                  elseif isequal(dunit,2)
                     SNodevalue(mnum,snum+p,4)=20000;
                     SNodevalue(mnum,snum+p,5)=7720; 
                     SNodevalue(mnum,snum+p,7)=0.0000912;
                  end 
                  SNodevalue(mnum,snum+p,6)=M_getdata(3,snum);                  
                  SNodevalue(mnum,snum+p,8)=M_getdata(2,snum);
                  SNodevalue(mnum,snum+p,9)=M_getdata(3,snum);
                  SNodevalue(mnum,snum+p,10)=M_getdata(4,snum);
                  SNodevalue(mnum,snum+p,11)=0;                  
               else
                  % left first
                  if isequal(BNodevalue(mnum,snum+p-1,16),G_getdata(1,snum))

                     SNodevalue(mnum,snum+p,1)=mnum;
                     SNodevalue(mnum,snum+p,2)=snum+p;
                     SNodevalue(mnum,snum+p,3)=1;
                     if isequal(dunit,1)
                        SNodevalue(mnum,snum+p,4)=29000;
                        SNodevalue(mnum,snum+p,5)=11200;
                        SNodevalue(mnum,snum+p,7)=0.00034028;
                     elseif isequal(dunit,2)
                        SNodevalue(mnum,snum+p,4)=20000;
                        SNodevalue(mnum,snum+p,5)=7720;
                        SNodevalue(mnum,snum+p,7)=0.0000912;
                     end 
                     SNodevalue(mnum,snum+p,6)=M_getdata(3,snum);                     
                     SNodevalue(mnum,snum+p,8)=M_getdata(2,snum);
                     SNodevalue(mnum,snum+p,9)=M_getdata(3,snum);
                     SNodevalue(mnum,snum+p,10)=M_getdata(4,snum);
                     SNodevalue(mnum,snum+p,11)=0;                  

                     p=p+1;

                     SNodevalue(mnum,snum+p,1)=mnum;
                     SNodevalue(mnum,snum+p,2)=snum+p;
                     SNodevalue(mnum,snum+p,3)=M_getdata(1,snum);
                     if isequal(dunit,1)
                        SNodevalue(mnum,snum+p,4)=29000;
                        SNodevalue(mnum,snum+p,5)=11200;
                        SNodevalue(mnum,snum+p,7)=0.00034028;
                     elseif isequal(dunit,2)
                        SNodevalue(mnum,snum+p,4)=20000;
                        SNodevalue(mnum,snum+p,5)=7720;
                        SNodevalue(mnum,snum+p,7)=0.0000912;
                     end                      
                     SNodevalue(mnum,snum+p,6)=M_getdata(3,snum);                     
                     SNodevalue(mnum,snum+p,8)=M_getdata(2,snum);
                     SNodevalue(mnum,snum+p,9)=M_getdata(3,snum);
                     SNodevalue(mnum,snum+p,10)=M_getdata(4,snum);
                     SNodevalue(mnum,snum+p,11)=0;  

                  elseif isequal(round(BNodevalue(mnum,snum+p-1,16)*10^6)/10^6,round((G_getdata(1,snum)-steplength(snum-1,1))*10^6)/10^6)

                     SNodevalue(mnum,snum+p,1)=mnum;
                     SNodevalue(mnum,snum+p,2)=snum+p;
                     SNodevalue(mnum,snum+p,3)=1;
                     if isequal(dunit,1)
                        SNodevalue(mnum,snum+p,4)=29000;
                        SNodevalue(mnum,snum+p,5)=11200;
                        SNodevalue(mnum,snum+p,7)=0.00034028;
                     elseif isequal(dunit,2)
                        SNodevalue(mnum,snum+p,4)=20000;
                        SNodevalue(mnum,snum+p,5)=7720;
                        SNodevalue(mnum,snum+p,7)=0.0000912;
                     end          
                     SNodevalue(mnum,snum+p,6)=M_getdata(3,snum);                     
                     SNodevalue(mnum,snum+p,8)=M_getdata(2,snum);
                     SNodevalue(mnum,snum+p,9)=M_getdata(3,snum);
                     SNodevalue(mnum,snum+p,10)=M_getdata(4,snum);
                     SNodevalue(mnum,snum+p,11)=0;                  

                     p=p+1;

                     SNodevalue(mnum,snum+p,1)=mnum;
                     SNodevalue(mnum,snum+p,2)=snum+p;
                     SNodevalue(mnum,snum+p,3)=M_getdata(1,snum);
                     if isequal(dunit,1)
                        SNodevalue(mnum,snum+p,4)=29000;
                        SNodevalue(mnum,snum+p,5)=11200;
                        SNodevalue(mnum,snum+p,7)=0.00034028;
                     elseif isequal(dunit,2)
                        SNodevalue(mnum,snum+p,4)=20000;
                        SNodevalue(mnum,snum+p,5)=7720;
                        SNodevalue(mnum,snum+p,7)=0.0000912;
                     end                      
                     SNodevalue(mnum,snum+p,6)=M_getdata(3,snum);                     
                     SNodevalue(mnum,snum+p,8)=M_getdata(2,snum);
                     SNodevalue(mnum,snum+p,9)=M_getdata(3,snum);
                     SNodevalue(mnum,snum+p,10)=M_getdata(4,snum);
                     SNodevalue(mnum,snum+p,11)=0;                   

                  end

               end

            end % isequal(round(G_getdata(13,snum+1)),1)
         
         end % snum = 1
         
      end % no bracing
         
   end

end

if ~isempty(SNodevalue)
   for j = 1:max(SNodevalue(mnum,:,2))
      if isequal(SNodevalue(mnum,j,8),SNodevalue(mnum,j,9)) ...
            && isequal(SNodevalue(mnum,j,8),SNodevalue(mnum,j,10)) ...
            && isequal(SNodevalue(mnum,j,9),SNodevalue(mnum,j,10))

      else
         SNodevalue(mnum,j,11)=1;

      end
   end
end
         
         