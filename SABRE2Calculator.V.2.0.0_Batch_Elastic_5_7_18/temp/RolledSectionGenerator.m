% Developed by Woo Yong Jeong.
% Date : 12/01/2016.


% Set pre-definded database
filename1='AISCSTEEL.mat';
Sectiondata=load(fullfile(filename1));
SECTION=Sectiondata.SECTION;
TYPE=Sectiondata.TYPE

AnalP(1,1) = 0;
% *** sub panel2
AnalP(2,1)=0; % Jval
% *** sub panel3
AnalP(3,1)=1; % AISC
% % *** sub panel4
% AnalP(3,1)=get(ap_cv_on_radiobutton,'Value');
% AnalP(3,2)=get(ap_cv_off_radiobutton,'Value');
% *** sub panel7
AnalP(4,1)=1; % DM
% *** sub panel6
AnalP(5,1)=1; % 2nd 1
AnalP(6,1)=1; % 2nd 2
AnalP(7,1)=1; % units

q=2; % number of joints
s=1; % number of segments
daxis=1;
dunit=1;
Length = 600;

wnum=2;
[sizelength,b]=size(TYPE);
% sizelength=3;
for wnum=2:sizelength
bf1 = SECTION((wnum-1),1);
tf1 = SECTION((wnum-1),2);
bf2 = SECTION((wnum-1),3);          
tf2 = SECTION((wnum-1),4);  
dw = SECTION((wnum-1),5)-2*SECTION((wnum-1),2);  
tw = SECTION((wnum-1),6);

Ai=(SECTION((wnum-1),1))*(SECTION((wnum-1),2)) ...
 + (SECTION((wnum-1),3))*(SECTION((wnum-1),4)) ...
 + (SECTION((wnum-1),5)-2*SECTION((wnum-1),2))*(SECTION((wnum-1),6));

Afillets = (SECTION((wnum-1),7))- Ai;     % fillet Area
      
if (Afillets < 0 )
    Afillets = 0;
end
   
Px = zeros(1,q);


Py = zeros(1,q);


Mz = zeros(1,q);
Mz(1,1) = -1;
Mz(1,2) = 1;

elm = 32;
Fyf1= 50;
Fyw = 50;
Fyf2= 50;

   % Define a file name of I/O 
   outfile = strcat('AISCSectionINP/W_',num2str(wnum-1),'.inp');   % Output file name.
   out = fopen(outfile,'w');                       % Output file is opened.
   %--------------------------------------------------------------------------
   % POSTPROCESSOR
   %--------------------------------------------------------------------------
   %WRITING NODAL INFORMATION
   fprintf(out,'****************************************************\n');
   fprintf(out,'*         SABRE2Calculator       %s           *\n',TYPE(wnum,:));
   fprintf(out,'****************************************************\n');
%    fprintf(out,'\n');
   fprintf(out,'** Design Axis\n');

   fprintf(out,'          %d',daxis);        
   fprintf(out,'\n');
   fprintf(out,'** Units\n');
   fprintf(out,'          %d',dunit);        
   fprintf(out,'\n');   
   fprintf(out,'*Define Joint & Essential Node Geometry, Loads and Boundary Conditions\n');
   fprintf(out,'** X Coordinates\n');
   % member length
   fprintf(out,'  %9.5f',0); 
   fprintf(out,'  %9.5f',Length);
   fprintf(out,'\n');
   % bottom flange
   fprintf(out,'** bf1\n');
   for i=1:q
           fprintf(out,'  %9.5f',bf1);
   end           
   fprintf(out,'\n');
   fprintf(out,'** tf1\n');
   for i=1:q
           fprintf(out,'  %9.5f',tf1);
   end   
   fprintf(out,'\n');
   % top flange
   fprintf(out,'** bf2\n');
   for i=1:q
           fprintf(out,'  %9.5f',bf2);
   end           
   fprintf(out,'\n');
   fprintf(out,'** tf2\n');
   for i=1:q
           fprintf(out,'  %9.5f',tf2);
   end           
   fprintf(out,'\n');
   % web
   fprintf(out,'** dw\n');
   for i=1:q
           fprintf(out,'  %9.5f',dw);
   end           
   fprintf(out,'\n');
   fprintf(out,'** tw\n');
   for i=1:q
           fprintf(out,'  %9.5f',tw);
   end           
   fprintf(out,'\n');
   fprintf(out,'** Afillets\n');
   for i=1:q
           fprintf(out,'  %9.5f',Afillets);
   end           
   fprintf(out,'\n');
   
   % Loading
   fprintf(out,'** Px\n');
   for i=1:q
           fprintf(out,'  %9.5f',Px(1,i));
   end    
   fprintf(out,'\n');
   fprintf(out,'** Py\n');
   for i=1:q
           fprintf(out,'  %9.5f',Py(1,i));
   end         
   fprintf(out,'\n');
   fprintf(out,'** Mz\n');
   for i=1:q
           fprintf(out,'  %9.5f',Mz(1,i));
   end           
   fprintf(out,'\n');
   fprintf(out,'** Boundary Conditions\n');
   for i=1:q
           fprintf(out,'          %d',1);
   end 
   fprintf(out,'\n');
   fprintf(out,'** Load Height\n');
   for i=1:q
           fprintf(out,'          %d',1);
   end    
   fprintf(out,'\n');
   fprintf(out,'** Step\n'); 
   for i=1:q
           fprintf(out,'          %d',1);
   end           
   fprintf(out,'\n');
%    fprintf(out,'\n');
   fprintf(out,'* Subdivide Segment(s) and Assign Yield Stresses\n');
   fprintf(out,'** # of Elements\n');
   for i=1:s
           fprintf(out,'  %9.0f',elm);
   end  
   fprintf(out,'\n');
   fprintf(out,'** Fyf1\n');
   for i=1:s
           fprintf(out,'  %9.2f',Fyf1);
   end    
   fprintf(out,'\n');
   fprintf(out,'** Fyw\n');
   for i=1:s
           fprintf(out,'  %9.2f',Fyw);
   end   
   fprintf(out,'\n');
   fprintf(out,'** Fyf2\n');
   for i=1:s
           fprintf(out,'  %9.2f',Fyf2);
   end      
   fprintf(out,'\n');
   fprintf(out,'* Specify Analysis Parameters\n');
   fprintf(out,'** Use J = 0 for Slender Web Sections in EBA (Yes = 1, No = 0) \n');         
   for i=1:1
           fprintf(out,'       %d',AnalP(2,i));
   end     
   fprintf(out,'\n');
   fprintf(out,'** Use the AISC (2016) Provisions (Yes = 1, No = 0) \n');         
   for i=1:1
           fprintf(out,'       %d',AnalP(3,i));
   end     
   fprintf(out,'\n');
%    fprintf(out,'** Bracketing Algorithm (On/Off) \n');         
%    for i=1:1
%            fprintf(out,'       %d',AnalP(3,i));
%    end   
%    fprintf(out,'\n');
   fprintf(out,'** Use the DM SRF for GNA in INBA (Yes = 1, No = 0) \n');         
   for i=1:1
           fprintf(out,'       %d',AnalP(4,i));
   end   
   fprintf(out,'\n');
   fclose(out);
   
end
   
   
   
% set(ptable_wsection_edit,'String',num2str(TYPE))

% % Get table data
% G_getdata=get(ptable_node,'Data');
% 
% if isempty(G_getdata(2,1)) ...
%    || isempty(G_getdata(3,1)) ...
%    || isempty(G_getdata(4,1)) ...
%    || isempty(G_getdata(5,1)) ...
%    || isempty(G_getdata(6,1)) ...
%    || isempty(G_getdata(7,1))...
%    || isempty(G_getdata(2,end)) ...
%    || isempty(G_getdata(3,end)) ...
%    || isempty(G_getdata(4,end)) ...
%    || isempty(G_getdata(5,end)) ...
%    || isempty(G_getdata(6,end)) ...
%    || isempty(G_getdata(7,end))...    
%    || isnan(G_getdata(2,1)) ...
%    || isnan(G_getdata(3,1)) ...
%    || isnan(G_getdata(4,1)) ...
%    || isnan(G_getdata(5,1)) ...
%    || isnan(G_getdata(6,1)) ...
%    || isnan(G_getdata(7,1))...
%    || isnan(G_getdata(2,end)) ...
%    || isnan(G_getdata(3,end)) ...
%    || isnan(G_getdata(4,end)) ...
%    || isnan(G_getdata(5,end)) ...
%    || isnan(G_getdata(6,end)) ...
%    || isnan(G_getdata(7,end))...
%    || G_getdata(2,1) <= 0 ...
%    || G_getdata(3,1) <= 0 ...  
%    || G_getdata(4,1) <= 0 ...
%    || G_getdata(5,1) <= 0 ...     
%    || G_getdata(6,1) <= 0 ...
%    || G_getdata(7,1) <= 0 ...     
%    || G_getdata(2,end) <= 0 ...
%    || G_getdata(3,end) <= 0 ...  
%    || G_getdata(4,end) <= 0 ...
%    || G_getdata(5,end) <= 0 ...     
%    || G_getdata(6,end) <= 0 ...
%    || G_getdata(7,end) <= 0      
% set(ptable_wsname_edit,'String','');    
% else
% 
%    dunit=get(punit_edit,'Value');
%    for i=1:(length(SECTION(:,1)))
%       if isequal(dunit,1)
%          if isequal(SECTION(i,1),G_getdata(2,1)) && isequal(SECTION(i,2),G_getdata(3,1)) ... 
%                && isequal(SECTION(i,3),G_getdata(4,1)) && isequal(SECTION(i,4),G_getdata(5,1)) ...
%                && isequal(round(SECTION(i,5)*10^5)/10^5,round( ( G_getdata(6,1)  + G_getdata(3,1) + G_getdata(5,1)  )*10^5)/10^5) ...
%                && isequal(SECTION(i,6),G_getdata(7,1)) ...
%                && isequal(SECTION(i,1),G_getdata(2,end)) && isequal(SECTION(i,2),G_getdata(3,end)) ...
%                && isequal(SECTION(i,3),G_getdata(4,end)) && isequal(SECTION(i,4),G_getdata(5,end)) ...
%                && isequal(round(SECTION(i,5)*10^5)/10^5,round( ( G_getdata(6,end)  + G_getdata(3,end) + G_getdata(5,end)  )*10^5)/10^5) ...
%                && isequal(SECTION(i,6),G_getdata(7,end)) ... 
%                && isequal(round(SECTION(i,7)*10^5)/10^5,round( ( G_getdata(2,1)*G_getdata(3,1) ...
%                +G_getdata(4,1)*G_getdata(5,1)+G_getdata(6,1)*G_getdata(7,1)  +G_getdata(8,1)  )*10^5)/10^5) ...            
%                && isequal(round(SECTION(i,7)*10^5)/10^5,round( ( G_getdata(2,end)*G_getdata(3,end) ...
%                +G_getdata(4,end)*G_getdata(5,end)+G_getdata(6,end)*G_getdata(7,end)  +G_getdata(8,end)  )*10^5)/10^5) 
% 
%             set(ptable_wsname_edit,'String',num2str(TYPE((i+1),:)));
%                break;
% 
%          else
%             set(ptable_wsname_edit,'String','');
%          end 
%       elseif isequal(dunit,2)
%          if isequal(SECTION(i,1)*2.54,G_getdata(2,1)) && isequal(SECTION(i,2)*2.54,G_getdata(3,1)) ... 
%                && isequal(SECTION(i,3)*2.54,G_getdata(4,1)) && isequal(SECTION(i,4)*2.54,G_getdata(5,1)) ...
%                && isequal(round((SECTION(i,5)*2.54)*10^5)/10^5,round( ( G_getdata(6,1)  + G_getdata(3,1) + G_getdata(5,1)  )*10^5)/10^5) ...
%                && isequal(SECTION(i,6)*2.54,G_getdata(7,1)) ...
%                && isequal(SECTION(i,1)*2.54,G_getdata(2,end)) && isequal(SECTION(i,2)*2.54,G_getdata(3,end)) ...
%                && isequal(SECTION(i,3)*2.54,G_getdata(4,end)) && isequal(SECTION(i,4)*2.54,G_getdata(5,end)) ...
%                && isequal(round((SECTION(i,5)*2.54)*10^5)/10^5,round( ( G_getdata(6,end)  + G_getdata(3,end) + G_getdata(5,end)  )*10^5)/10^5) ...
%                && isequal(SECTION(i,6)*2.54,G_getdata(7,end)) ... 
%                && isequal(round((SECTION(i,7)*2.54*2.54)*10^5)/10^5,round( ( G_getdata(2,1)*G_getdata(3,1) ...
%                +G_getdata(4,1)*G_getdata(5,1)+G_getdata(6,1)*G_getdata(7,1)  +G_getdata(8,1)  )*10^5)/10^5) ...            
%                && isequal(round((SECTION(i,7)*2.54*2.54)*10^5)/10^5,round( ( G_getdata(2,end)*G_getdata(3,end) ...
%                +G_getdata(4,end)*G_getdata(5,end)+G_getdata(6,end)*G_getdata(7,end)  +G_getdata(8,end)  )*10^5)/10^5) 
% 
%             set(ptable_wsname_edit,'String',num2str(TYPE((i+1),:)));
%                break;
% 
%          else
%             set(ptable_wsname_edit,'String','');
%          end          
%       else
%       end
%    end
% 
% end
% set( gca, 'Units', 'normalized', 'Position', [0 0 0.8 1] );  
% 
% end
