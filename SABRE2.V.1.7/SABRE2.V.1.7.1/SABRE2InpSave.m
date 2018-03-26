function SABRE2InpSave(File,xdata,ydata,zdata,Title,Nodenum,dofree)  
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
% ************************************************************************
% *****************     SABRE2 Plot Results           ********************
% ************************************************************************

   % Define a file name of I/O 
   outfile =strcat(File);   % Output file name.
   out = fopen(outfile,'w');                       % Output file is opened.
   %--------------------------------------------------------------------------
   % POSTPROCESSOR
   %--------------------------------------------------------------------------
   %WRITING NODAL INFORMATION
   fprintf(out,'****************************************************\n');
   fprintf(out,'*               SABRE2 Plot Report                 *\n');
   fprintf(out,'****************************************************\n');
   fprintf(out,'\n');
   fprintf(out,'** Data Title\n'); 
   CTitle = cellstr(Title);
   UTitle = char(CTitle);
   for i=1:length(CTitle(:,1))
           fprintf(out,'%s\n',UTitle(i,:));
   end      
   fprintf(out,'\n'); 
   fprintf(out,'** X-axis Description\n');
   for i = 1:length(xdata(1,:))
      if isequal(dofree(1,i),0)
         fprintf(out,'Column %d      \n',i);
      elseif isequal(dofree(1,i),1)
         fprintf(out,'Column %d      Node # :  %d     displacement-x\n',i,Nodenum(1,i));
      elseif isequal(dofree(1,i),2)
         fprintf(out,'Column %d      Node # :  %d     displacement-y\n',i,Nodenum(1,i));
      elseif isequal(dofree(1,i),3)
         fprintf(out,'Column %d      Node # :  %d     displacement-z\n',i,Nodenum(1,i));
      elseif isequal(dofree(1,i),4)
         fprintf(out,'Column %d      Node # :  %d     rotation-x\n',i,Nodenum(1,i));
      elseif isequal(dofree(1,i),5)
         fprintf(out,'Column %d      Node # :  %d     rotation-y\n',i,Nodenum(1,i));        
      elseif isequal(dofree(1,i),6)
         fprintf(out,'Column %d      Node # :  %d     rotation-z\n',i,Nodenum(1,i));
      elseif isequal(dofree(1,i),7)
         fprintf(out,'Column %d      Node # :  %d     warping\n',i,Nodenum(1,i));
      end         
   end
   fprintf(out,'\n'); 
   fprintf(out,'** X-axis DATA\n');  
   for i=1:length(xdata(:,1))
      for j=1:length(xdata(1,:))
              fprintf(out,'  %9.5f',xdata(i,j));
      end             
      fprintf(out,'\n');
   end
   fprintf(out,'\n');
   fprintf(out,'** Y-axis Description\n');
   for i = 1:length(ydata(1,:))
      if isequal(dofree(2,i),0)
         fprintf(out,'Column %d      \n',i);
      elseif isequal(dofree(2,i),1)
         fprintf(out,'Column %d      Node # :  %d     displacement-x\n',i,Nodenum(2,i));
      elseif isequal(dofree(2,i),2)
         fprintf(out,'Column %d      Node # :  %d     displacement-y\n',i,Nodenum(2,i));
      elseif isequal(dofree(2,i),3)
         fprintf(out,'Column %d      Node # :  %d     displacement-z\n',i,Nodenum(2,i));
      elseif isequal(dofree(2,i),4)
         fprintf(out,'Column %d      Node # :  %d     rotation-x\n',i,Nodenum(2,i));
      elseif isequal(dofree(2,i),5)
         fprintf(out,'Column %d      Node # :  %d     rotation-y\n',i,Nodenum(2,i));        
      elseif isequal(dofree(2,i),6)
         fprintf(out,'Column %d      Node # :  %d     rotation-z\n',i,Nodenum(2,i));
      elseif isequal(dofree(2,i),7)
         fprintf(out,'Column %d      Node # :  %d     warping\n',i,Nodenum(2,i));
      end         
   end   
   fprintf(out,'\n');
   fprintf(out,'** Y-axis DATA\n');
   for i=1:length(ydata(:,1))
      for j=1:length(ydata(1,:))
              fprintf(out,'  %9.5f',ydata(i,j));
      end             
      fprintf(out,'\n');
   end
   fprintf(out,'\n');
   fprintf(out,'** Z-axis Description\n');
   for i = 1:length(zdata(1,:))
      if isequal(dofree(3,i),0)
         fprintf(out,'Column %d      \n',i);
      elseif isequal(dofree(3,i),1)
         fprintf(out,'Column %d      Node # :  %d     displacement-x\n',i,Nodenum(3,i));
      elseif isequal(dofree(3,i),2)
         fprintf(out,'Column %d      Node # :  %d     displacement-y\n',i,Nodenum(3,i));
      elseif isequal(dofree(3,i),3)
         fprintf(out,'Column %d      Node # :  %d     displacement-z\n',i,Nodenum(3,i));
      elseif isequal(dofree(3,i),4)
         fprintf(out,'Column %d      Node # :  %d     rotation-x\n',i,Nodenum(3,i));
      elseif isequal(dofree(3,i),5)
         fprintf(out,'Column %d      Node # :  %d     rotation-y\n',i,Nodenum(3,i));        
      elseif isequal(dofree(3,i),6)
         fprintf(out,'Column %d      Node # :  %d     rotation-z\n',i,Nodenum(3,i));
      elseif isequal(dofree(3,i),7)
         fprintf(out,'Column %d      Node # :  %d     warping\n',i,Nodenum(3,i));
      end         
   end     
   fprintf(out,'\n');
   fprintf(out,'** Z-axis DATA\n');
   for i=1:length(zdata(:,1))
      for j=1:length(zdata(1,:))
              fprintf(out,'  %9.5f',zdata(i,j));
      end             
      fprintf(out,'\n');
   end
   fprintf(out,'\n');
  
%    Title
%    CTitle = cellstr(Title);
% CTitle(1,1)
% %     Title=char(CTitle);
   
   fclose(out);
end % function end
