function [Geometry_data,Member_data,Loading_data,DistLoading_data,...
   BC_data,ShearPanel_data,Spring_data,Material_data,Analysis_data]...
   =SABRE2InpOpen(pathname,filename)            
fileID = fopen([pathname,filename],'r');
tmp_input=textscan(fileID,'%s','HeaderLines',3,'Delimiter','\n');
fclose(fileID);

%reset model data
Geometry_data=[];Member_data=[];Loading_data=[];DistLoading_data=[];
BC_data=[];ShearPanel_data=[];Spring_data=[];Material_data=[];
Analysis_data=[];

daxis=str2num(tmp_input{1}{2});                                             %design axis  [1 = mid-web, 2 = Fig2 ,3 = Fig1]
dunit=str2num(tmp_input{1}{4});                                             %design units [1 = kip,in, 2 = KN,cm]

Geometry_data(1,:) = str2num(tmp_input{1}{7});                              %x-coordinate
Geometry_data(2,:) = str2num(tmp_input{1}{9});                              %y-coordinate
Geometry_data(3,:) = str2num(tmp_input{1}{11});                             %z-coordinate   
Geometry_data(4,:) = str2num(tmp_input{1}{13});                             %bf1
Geometry_data(5,:) = str2num(tmp_input{1}{15});                             %tf1 
Geometry_data(6,:) = str2num(tmp_input{1}{17});                             %bf2
Geometry_data(7,:) = str2num(tmp_input{1}{19});                             %tf2
Geometry_data(8,:) = str2num(tmp_input{1}{21});                             %dw
Geometry_data(9,:) = str2num(tmp_input{1}{23});                             %tw
Geometry_data(10,:) = str2num(tmp_input{1}{25});                            %Afillets   
% Geometry_data(11,:) = str2num(tmp_input{1}{33});                         %Step [1 = No, 2 = Yes]
% Geometry_data(12,:) = str2num(tmp_input{1}{33});                         %Step x-coordinate
% Geometry_data(13,:) = str2num(tmp_input{1}{33});                         %Step y-coordinate
% Geometry_data(14,:) = str2num(tmp_input{1}{33});                         %Step z-coordinate
% Geometry_data(15,:) = str2num(tmp_input{1}{33});                         %Step from bf1
% Geometry_data(16,:) = str2num(tmp_input{1}{33});                         %Step from tf1
% Geometry_data(17,:) = str2num(tmp_input{1}{33});                         %Step from bf2
% Geometry_data(18,:) = str2num(tmp_input{1}{33});                         %Step from tf2
% Geometry_data(19,:) = str2num(tmp_input{1}{33});                         %Step from dw
% Geometry_data(20,:) = str2num(tmp_input{1}{33});                         %Step from tw
% Geometry_data(21,:) = str2num(tmp_input{1}{33});                         %Step from Afillet
% Geometry_data(22,:) = str2num(tmp_input{1}{33});                         %Step to bf1
% Geometry_data(23,:) = str2num(tmp_input{1}{33});                         %Step to tf1
% Geometry_data(24,:) = str2num(tmp_input{1}{33});                         %Step to bf2
% Geometry_data(25,:) = str2num(tmp_input{1}{33});                         %Step to tf2
% Geometry_data(26,:) = str2num(tmp_input{1}{33});                         %Step to dw
% Geometry_data(27,:) = str2num(tmp_input{1}{33});                         %Step to tw
% Geometry_data(28,:) = str2num(tmp_input{1}{33});                         %Step to Afillet

Member_data(1,:) = str2num(tmp_input{1}{27});                               %Member #
Member_data(2,:) = str2num(tmp_input{1}{29});                               %joint i
Member_data(3,:) = str2num(tmp_input{1}{31});                               %joint j

Loading_data(1,:) = str2num(tmp_input{1}{33});                              %Px
Loading_data(2,:) = str2num(tmp_input{1}{35});                              %Py
Loading_data(3,:) = str2num(tmp_input{1}{37});                              %Pz
Loading_data(4,:) = str2num(tmp_input{1}{39});                              %Mx
Loading_data(5,:) = str2num(tmp_input{1}{41});                              %My   
Loading_data(6,:) = str2num(tmp_input{1}{43});                              %Mz
Loading_data(7,:) = str2num(tmp_input{1}{45});                              %Load Height [1 = SC, 2 = Fig2, 3 = Fig1, 4 = Cent, 5 = Mid-web]   
Loading_data(8,:) = str2num(tmp_input{1}{47});                              %alpha

DistLoading_data(1,:) = str2num(tmp_input{1}{49});                          %member
DistLoading_data(2,:) = str2num(tmp_input{1}{51});                          %Load Height [1 = SC, 2 = Fig2, 3 = Fig1, 4 = Cent, 5 = Mid-web]
DistLoading_data(3,:) = str2num(tmp_input{1}{53});                          %wx
DistLoading_data(4,:) = str2num(tmp_input{1}{55});                          %wy
DistLoading_data(5,:) = str2num(tmp_input{1}{57});                          %wz

BC_data(1,:) = str2num(tmp_input{1}{59});                                   %Location [1 = SC, 2 = Fig2, 3 = Fig1, 4 = Cent, 5 = Mid-web]
BC_data(2,:) = str2num(tmp_input{1}{61});                                   %x-disp
BC_data(3,:) = str2num(tmp_input{1}{63});                                   %y-disp
BC_data(4,:) = str2num(tmp_input{1}{65});                                   %z-disp
BC_data(5,:) = str2num(tmp_input{1}{67});                                   %x-rot
BC_data(6,:) = str2num(tmp_input{1}{69});                                   %y-rot
BC_data(7,:) = str2num(tmp_input{1}{71});                                   %z-rot
BC_data(8,:) = str2num(tmp_input{1}{73});                                   %warping

% ShearPanel_data(1,:) = str2num(tmp_input{1}{29});                        %joint i
% ShearPanel_data(2,:) = str2num(tmp_input{1}{29});                        %joint j
% ShearPanel_data(3,:) = str2num(tmp_input{1}{29});                        %panel location [1 = Fig2, 2 = SC, 3 = Fig1]
% ShearPanel_data(4,:) = str2num(tmp_input{1}{29});                        %stiffness

% Spring_data(1,:) = str2num(tmp_input{1}{29});                            %location [1 = SC, 2 = Fig2, 3 = Fig1]
% Spring_data(1,:) = str2num(tmp_input{1}{29});                            %x-disp
% Spring_data(1,:) = str2num(tmp_input{1}{29});                            %y-disp
% Spring_data(1,:) = str2num(tmp_input{1}{29});                            %z-disp
% Spring_data(1,:) = str2num(tmp_input{1}{29});                            %x-rot
% Spring_data(1,:) = str2num(tmp_input{1}{29});                            %y-rot
% Spring_data(1,:) = str2num(tmp_input{1}{29});                            %z-rot
% Spring_data(1,:) = str2num(tmp_input{1}{29});                            %warping

%need to fill in element releases

Material_data(1,:) = str2num(tmp_input{1}{75});                             %Number of elements
Material_data(2,:) = str2num(tmp_input{1}{77});                             %E
Material_data(3,:) = str2num(tmp_input{1}{79});                             %G
Material_data(4,:) = str2num(tmp_input{1}{81});                             %Density
Material_data(5,:) = str2num(tmp_input{1}{83});                             %fy1
Material_data(6,:) = str2num(tmp_input{1}{85});                             %fyw
Material_data(7,:) = str2num(tmp_input{1}{87});                             %fy2; 

%need to finish analysis data
% Analysis_data(1,1) = 0;                                                     %Self-weight?
% Analysis_data(2,1) = str2num(tmp_input{1}{45});                          %J=0
% Analysis_data(3,1) = str2num(tmp_input{1}{47});                          %AISC Version   
% Analysis_data(4,1) = str2num(tmp_input{1}{49});                          %Direct Analysis Method strength reduction  
% Analysis_data(5,1) =1;                                                      %2nd 1???
% Analysis_data(6,1) =1;                                                      %2nd 2??? 
% Analysis_data(7,1) =dunit;                                                  %unit
 

%% 
%JNode is joint info
%Bnode is bracing info
%Massemble is cross section properties
%Rval is design axis
%steplength is the difference in shear center at the step
%Snode is segment info
%RNCc is
%Nshe is
%DUP is
%NCc is
%Bhe is
%The is
%SGhe is
%Bhg is
%Thg is
%CSg is
%BNC is
%FEL is
%PNC is
%LNC is 

%% [JNodevalue]=SABRE2JointApp(Geometry_data); %don't need any more

% JNodevalue(njnode,1)=njnode;                                              %node #  
% JNodevalue(njnode,2)=Geometry_data(1,1);                                  %x-coord
% JNodevalue(njnode,3)=0;                                                   %y-coord
% JNodevalue(njnode,4)=0;                                                   %z-coord

%% [Massemble,JNodevalue_i,JNodevalue_j,Rval,...
%     BNodevalue]=SABRE2MembApp(JNodevalue);     

% Massemble(mnum,1) = mnum;                                                 %member #
% Massemble(mnum,2) = str2num(get(pde_jointi_edit,'String'));            %joint i
% Massemble(mnum,3) = str2num(get(pde_jointj_edit,'String'));            %joint j        
% Massemble(mnum,4) = 0;                                                    %AISC section flag
% Massemble(mnum,5) = SECTION(i,7);                                         %A
% Massemble(mnum,6) = SECTION(i,8);                                         %W
% Massemble(mnum,7) = SECTION(i,9);                                         %Ix
% Massemble(mnum,8) = SECTION(i,10);                                        %Zx
% Massemble(mnum,9) = SECTION(i,11);                                        %Sx
% Massemble(mnum,10) = SECTION(i,12);                                       %rx
% Massemble(mnum,11) = SECTION(i,13);                                       %Iy
% Massemble(mnum,12) = SECTION(i,14);                                       %Zy
% Massemble(mnum,13) = SECTION(i,15);                                       %Sy
% Massemble(mnum,14) = SECTION(i,16);                                       %ry
% Massemble(mnum,15) = SECTION(i,17);                                       %J
% Massemble(mnum,16) = SECTION(i,18);                                       %Cw

% JNodevalue_i(mnum,1)=Massemble(mnum,1);                                   %member #  
% JNodevalue_i(mnum,2)=Massemble(mnum,2);                                   %joint i
% JNodevalue_i(mnum,3)=JNodevalue(Massemble(mnum,2),2);                     %x-coord
% JNodevalue_i(mnum,4)=JNodevalue(Massemble(mnum,2),3);                     %y-coord
% JNodevalue_i(mnum,5)=JNodevalue(Massemble(mnum,2),4);                     %z-coord
% JNodevalue_i(mnum,6)=str2num(get(pde_bfbi_edit, 'String'));            %bfb
% JNodevalue_i(mnum,7)=str2num(get(pde_tfbi_edit, 'String'));            %tfb
% JNodevalue_i(mnum,8)=str2num(get(pde_bfti_edit, 'String'));            %bft
% JNodevalue_i(mnum,9)=str2num(get(pde_tfti_edit, 'String'));            %tft
% JNodevalue_i(mnum,10)=str2num(get(pde_dwi_edit, 'String'));            %dw  
% JNodevalue_i(mnum,11)=str2num(get(pde_twi_edit, 'String'));            %tw    
% JNodevalue_i(mnum,12)=JNodevalue_i(mnum,10) ...
%   +JNodevalue_i(mnum,7)+JNodevalue_i(mnum,9);                             %total depth
% JNodevalue_i(mnum,13)=JNodevalue_i(mnum,10) ...
%   +(JNodevalue_i(mnum,7)+JNodevalue_i(mnum,9))/2;                         %flange centroid 
% JNodevalue_i(mnum,14)=str2num(get(pde_fili_edit, 'String'));           %Afillet

% Rval(mnum,1)=mnum;                                                        %member #
% Rval(mnum,2)=get(pdesign_edit,'Value');                                   %design axis

% BNodevalue(i,1,1)=i;                                                      %member #
% BNodevalue(i,1,2)=0;                                                      %Added Node Number 
% BNodevalue(i,j,3)=Lb(1,1);                                                %x-coord
% BNodevalue(i,j,4)=Lb(2,1);                                                %y-coord
% BNodevalue(i,j,5)=Lb(3,1);                                                %z-coord

%% [BNodevalue,steplength]=SABRE2SegmApp(JNodevalue,...
%     Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue);                 

% BNodevalue(i,p,1)=BNodeval(i,j,1);                                        % Member number
% BNodevalue(i,p,2)=p;                                                      % Added Node Number
% BNodevalue(i,p,3)=Lb2(1,1);                                               % x coordinate of added node number 
% BNodevalue(i,p,4)=Lb2(2,1);                                               % y coordinate of added node number 
% BNodevalue(i,p,5)=Lb2(3,1);                                               % z coordinate of added node number                 
% BNodevalue(i,p,6)=BNodeval(i,j,6);                                        % bf1
% BNodevalue(i,p,7)=BNodeval(i,j,7);                                        % tf1
% BNodevalue(i,p,8)=BNodeval(i,j,8);                                        % bf2
% BNodevalue(i,p,9)=BNodeval(i,j,9);                                        % tf2
% BNodevalue(i,p,10)=Dgsb(1,2);                                             % dw
% BNodevalue(i,p,11)=BNodeval(i,j,11);                                      % tw
% BNodevalue(i,p,12)=dtsb(1,2);                                             % d
% BNodevalue(i,p,13)=hgsb(1,2);                                             % ho
% BNodevalue(i,p,14)=Afillsb(1,2);                                          % Afill
% BNodevalue(i,p,15)=2;                                                     % Step or Not 
% BNodevalue(i,p,16)=BNodeval(i,j,16)-s;                                    % Distance from i joint

% steplength = abs(ys1-ys2);                                                %Difference in shear center  

%% [SNodevalue]=SABRE2AssiApp(BNodevalue,SNodevaluesteplength);

% SNodevalue(mnum,snum,1)=mnum;                                             %member #  
% SNodevalue(mnum,snum,2)=snum;                                             %segment # 
% SNodevalue(mnum,snum,3)=M_getdata(1,snum);                                %# of elements per segment
% SNodevalue(mnum,snum,4)=29000;                                            %E 
% SNodevalue(mnum,snum,5)=11200;                                            %G 
% SNodevalue(mnum,snum,7)=0.00034028;                                       %density 
% SNodevalue(mnum,snum,6)=M_getdata(3,snum);                                %Fy (Homogenous)         
% SNodevalue(mnum,snum,8)=M_getdata(2,snum);                                %Fy1
% SNodevalue(mnum,snum,9)=M_getdata(3,snum);                                %fw?
% SNodevalue(mnum,snum,10)=M_getdata(4,snum);                               %FY2
% SNodevalue(mnum,snum,11)=0;                                               % %Hybrid Flag

%% [RNCc,Nshe1,Nshe2,DUP1,DUP2,NCc,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,BNC1,BNC2,FEL,error]=SABRE2LBCODE(JNodevalue,...
%      Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,SNodevalue);    



%% [PNC,PNC1,PNC2]=SABRE2BConApp(JNodevalue,Massemble,Rval,...
%      BNodevalue,RNCc,DUP1,DUP2,PNC,PNC1,PNC2,Bhg,Thg,CSg); 


%% [LNC,LNC1,LNC2]=SABRE2ForcApp(JNodevalue,Massemble,Rval,...
%      RNCc,DUP1,DUP2,LNC,LNC1,LNC2,LUEC,Nshe1,Nshe2,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg);

end
