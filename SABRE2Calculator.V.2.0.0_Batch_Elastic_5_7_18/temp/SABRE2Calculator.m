function SABRE2Calculator
% Developed by Woo Yong Jeong.
% Date : 07/01/2013.
% ************************************************************************
% *****      Graphical User Interface for General beam FEA           *****
% *****      General Nonprismatic I & T & Box & Circular Section     *****
% *****      General Loading & Boundary Conditions & Bracing         *****
% *****      Linear/Nonlinear Elastic & Linear/Nonlinear Inelastic   *****
% *****      3D Rendering                                            *****
% ************************************************************************

scrsz = get(groot,'ScreenSize'); Sw=scrsz(3); Sd=scrsz(4);% Get ScreenSize
% Create and then hide the GUI(Master figure) as it is being constructed.
masterf = figure('Position',[Sw/10,Sd/10,round(Sw*8/10),round(Sd*8/10)],'Units','normalized',...
   'MenuBar','none','NumberTitle','off','Visible','off','Name','SABRE2Calculator','Color','k');
if scrsz(3) > 2050
   Fs=1;
else
   Fs = Sw/2050;
end
% Global Variables
global filename; filename = []; 
global pathname; pathname = [];
global JNodevalue; JNodevalue = [];       % Joint Nodes Information
global Massemble;  Massemble = [];        % Member assemble Information
global JNodevalue_i; JNodevalue_i = [];   % Joint Nodes i Information
global JNodevalue_j; JNodevalue_j = [];   % Joint Nodes j Information
global Rval; Rval=[];                     % Reference axis
global BNodevalue; BNodevalue = [];       % Additional Nodes Information
global SNodevalue; SNodevalue =[];        % Material Properties & # of ele.
global RNCc;  RNCc = [];   % Total Nodes Information without duplication
global NCc;  NCc = [];     % Total Nodes Information without duplication
global Nshe1;  Nshe1 = []; % Total Nodes SC Information for start nodes
global Nshe2;  Nshe2 = []; % Total Nodes SC Information for end nodes
global DUP1; DUP1 = [];    % Total Nodes RA Information for start nodes
global DUP2; DUP2 = [];    % Total Nodes RA Information for end nodes
global LNC; LNC = [];      % Point Loading Nodal Information
global LNC1; LNC1 = [];    % Point Loading Information for start nodes
global LNC2; LNC2 = [];    % Point Loading Information for end nodes
global LUEC; LUEC = [];    % Distributed Loading Information 
global PNC; PNC = [];      % Fixed Boundary Condition Information
global PNC1; PNC1 = [];    % Fixed Boundary Condition Information for start nodes
global PNC2; PNC2 = [];    % Fixed Boundary Condition Information for end nodes
global BNC; BNC = [];      % Ground Spring Information
global FEL; FEL = [];      % Flexure Information
global BNC1; BNC1 = [];    % Shear Panel Information for start nodes
global BNC2; BNC2 = [];    % Shear Panel Information for end nodes
global OBJ;                % Fitting Objective
global t; t=[]; global ULoad; ULoad=[]; 

global gammma; global Funew; global EGunew; global Qintf; global Qintg;
global AR; global AS; global AE; global AI; global Sincre; global error;
global ANE; global ANI; global Buc; global Rtype; global crLTB; global LGv;
global Bhe1; Bhe1=[]; global Bhe2; Bhe2=[]; global The1; The1=[];
global The2; The2=[]; global Bhg; Bhg=[]; global Thg; Thg=[]; global CSg; CSg=[];
global SGhe1; SGhe1=[]; global SGhe2; SGhe2=[]; 
global tau; tau=[]; global Rpg; Rpg=[]; global Rpc; Rpc=[]; global Rpt; Rpt=[];
global Rh; Rh=[]; global Myc; Myc=[]; global Jval; Jval=[]; global My; My=[]; global Phi_Py; Phi_Py=[];
global Myt; Myt=[]; global Phi_Mmax; Phi_Mmax=[]; global UC; UC=[];
global LTYPE; LTYPE=[]; global cflag; cflag=0; global LNCpv; LNCpv=[];
global LIAType; LIAType=0; global NLIAType; NLIAType=0; global HomoType; HomoType=0; global AnalP; AnalP=[];
AR=0; AS=0; AE=0; AI=0; ANE=0; ANI=0; Buc=0; Rtype=0; crLTB = 0; LGv=0;
gammma=[]; Funew=[]; EGunew=[]; Qintf=[];Qintg=[];
global NONType; NONType=0; global LIA; LIA=0; global NLIA; NLIA=0;
global tdata_node; tdata_node=[];global tdata_seg;tdata_seg=[];
global cnames_node; cnames_node=[]; global cnames_seg;cnames_seg=[];
global Gnode;Gnode=[]; global Mseg;Mseg=[];
% ************************************************************************
% *****************               MENUS              *********************
% ************************************************************************
fm = uimenu(masterf,'Label','File');   % File memu
   fim = uimenu(fm,'Label','About','Callback',{@file_info_menu_Callback});
   fnm = uimenu(fm,'Label','New','Callback',{@file_new_menu_Callback});
   fom = uimenu(fm,'Label','Open','Callback',{@file_open_menu_Callback});
   fsm = uimenu(fm,'Label','Save','Callback',{@file_save_menu_Callback});
   fsam= uimenu(fm,'Label','Save As','Callback',{@file_saveas_menu_Callback});
   fprm= uimenu(fm,'Label','Preview','Callback',{@file_preview_menu_Callback});
   fpm = uimenu(fm,'Label','Print','Callback',{@file_print_menu_Callback});
   fppm= uimenu(fm,'Label','Print Photo','Callback',{@file_printphoto_menu_Callback});
   fqm = uimenu(fm,'Label','Quit','Callback',{@file_quit_menu_Callback});   
vm = uimenu(masterf,'Label','View');
   vzm = uimenu(vm,'Label','Zoom','Callback',{@view_zoom_menu_Callback});
   vrm = uimenu(vm,'Label','Rotate','Callback',{@view_rotate_menu_Callback});
   vpm = uimenu(vm,'Label','Pan','Callback',{@view_pan_menu_Callback});
   vctm = uimenu(vm,'Label','Camera Toolbar','Callback',{@view_camera_toolbar_menu_Callback});
   vdm = uimenu(vm,'Label','Defined Views');   
      vrom = uimenu(vdm,'Label','Isometric(X-Y-Z) View','Callback',{@view_defined_xyz_menu_Callback});
      vrxym = uimenu(vdm,'Label','Front(X-Y) View','Callback',{@view_defined_xy_menu_Callback});
      vrxzm = uimenu(vdm,'Label','Top(X-Z) View','Callback',{@view_defined_xz_menu_Callback});
      vryzm = uimenu(vdm,'Label','Side(Y-Z) View','Callback',{@view_defined_yz_menu_Callback});
      vrum = uimenu(vdm,'Label','User Defined View','Callback',{@view_defined_user_menu_Callback});      
   vfm = uimenu(vm,'Label','Fit','Callback',{@view_fit_menu_Callback});
   vcm = uimenu(vm,'Label','Screen Center','Callback',{@view_center_menu_Callback});  
   vdum = uimenu(vm,'enable','off','Label','Diagram Data View','Callback',{@view_diagram_menu_Callback});
   vtum = uimenu(vm,'enable','off','Label','Data Labels','Callback',{@view_text_menu_Callback});
   vstm = uimenu(vm,'Label','White Background','Callback',{@view_screenshot_menu_Callback}); 
tm = uimenu(masterf,'Label','Modeling','Tag','Anal','Callback',{@gtable_menu_Callback});    
ap = uimenu(masterf,'Label','Analysis Parameters','Tag','Anal','Callback',{@analysis_para_Callback}); 
   aps = uimenu(ap,'Label','Analysis Parameters','Callback',{@analysis_parasub_menu_Callback});
am = uimenu(masterf,'Label','Analysis','Tag','Anal','Callback',{@analysis_menu_Callback});
   a3m = uimenu(am,'Label','Elastic Linear Buckling Analysis','Callback',{@analysis_ecba_menu_Callback});    
   a4m = uimenu(am,'Label','Inelastic Linear Buckling Analysis','Callback',{@analysis_icba_menu_Callback});
   a6m = uimenu(am,'Label','Inelastic Nonlinear Buckling Analysis','Callback',{@analysis_nonicba_menu_Callback});  
rm = uimenu(masterf,'Label','Results','Callback',{@results_menu_Callback},'Tag','res');
  rim = uimenu(rm,'Label','Internal Force Diagram & Deflected Shape','Callback',{@results_diagram_menu_Callback});     
autom = uimenu(masterf,'Label','Multiple Analysis & Results','Tag','MAnal','Callback',{@analysis_batch_Callback});   
   autom4 = uimenu(autom,'Label','Inelastic Linear Buckling Analysis','Callback',{@analysis_icba_batch_menu_Callback});
   autom6 = uimenu(autom,'Label','Inelastic Nonlinear Buckling Analysis','Callback',{@analysis_nonicba_batch_menu_Callback});
% *************************************************************** set menu
% submenu accelerator : shortcut
set(fnm,'Accelerator','N'); set(fom,'Accelerator','O');
set(fsm,'Accelerator','S'); set(fpm,'Accelerator','P');
set(fqm,'Accelerator','Q')
% submenu sepatation & Checked
set([fim,fnm,fom,fsm,fprm,fqm],'Separator','on')
set([vzm,vdm,vfm,vdum,vtum,vstm],'Separator','on')
set(vctm,'Checked','off') ;set(vdum,'Checked','on') ; 
set([a3m,a4m],'Separator','on')
% ************************************************************************
% *****************                AXES              *********************
% ************************************************************************  
axesm = axes('Position',[0,0,round(Sw*(8/10)*(8/10)),round(Sd*(8/10))],...
   'Visible','off','Units','Pixels');
% Initial View : X-Y View
az = 0; el = 0; view(az, el);
% ************************************************************************
% *****************            COMPONENTS            *********************
% ************************************************************************
Pw=round(Sw*(8/10)*(1/10));Pd=round(Sd*(8/10));
% ***************************************************** INFORMATION panel
% INPUT BACKGROUNG using panel.
inf_panel = uipanel('Visible','off','Title','','Units','Pixels','Tag','IPanel',...
   'BackgroundColor',[0.9412 0.9412 0.9412],'Position',...
   [round(Sw*(1/10)*(8.5/10)),round(Sd*(1.9/10)),round(Sw*(5/10)*(9.4/10)),round(Sd*(4/10))]);
% Post-setting
set(inf_panel,'Units','normalized')
% INPUT BACKGROUNG TEXT 
inf_title_name = uicontrol('Style','text','String','SABRE2 Calculator v1.4','Tag','ITitle',...  
   'Position',[round(Sw*(1/10)*(9/10)),round(Sd*(5/10)),round(Sw*(5/10)*(9/10)),round(Sd*(0.5/10))],...
   'ForegroundColor','b','BackgroundColor',[0.9412 0.9412 0.9412],'FontSize',Fs*22,'FontWeight','bold','FontUnits','normalized');
inf_name = uicontrol('Style','text','String','Developed by ','Tag','IText',...  
   'Position',[round(Sw*(1/10)*(9/10)),round(Sd*(4/10)),round(Sw*(5/10)*(9/10)),round(Sd*(0.5/10))],...
   'ForegroundColor','k','BackgroundColor',[0.9412 0.9412 0.9412],'FontSize',Fs*17,'FontWeight','bold','FontUnits','normalized');
inf_wj_name = uicontrol('Style','text','String','Woo Yong Jeong,','Tag','IText',...  
   'Position',[round(Sw*(1/10)*(9/10)),round(Sd*(3.5/10)),round(Sw*(5/10)*(9/10)),round(Sd*(0.5/10))],...
   'ForegroundColor','k','BackgroundColor',[0.9412 0.9412 0.9412],'FontSize',Fs*17,'FontWeight','bold','FontUnits','normalized');
inf_and_name = uicontrol('Style','text','String','Oguzhan Togay,','Tag','IText',...  
   'Position',[round(Sw*(1/10)*(9/10)),round(Sd*(3/10)),round(Sw*(5/10)*(9/10)),round(Sd*(0.5/10))],...
   'ForegroundColor','k','BackgroundColor',[0.9412 0.9412 0.9412],'FontSize',Fs*17,'FontWeight','bold','FontUnits','normalized');
inf_dw_name = uicontrol('Style','text','String','Donald W. White.','Tag','IText',...  
   'Position',[round(Sw*(1/10)*(9/10)),round(Sd*(2.5/10)),round(Sw*(5/10)*(9/10)),round(Sd*(0.5/10))],...
   'ForegroundColor','k','BackgroundColor',[0.9412 0.9412 0.9412],'FontSize',Fs*17,'FontWeight','bold','FontUnits','normalized');
inf_cp_name = uicontrol('Style','text','String','(Copyright 2017 All rights reserved)','Tag','IText',...  
   'Position',[round(Sw*(1/10)*(9/10)),round(Sd*(2/10)),round(Sw*(5/10)*(9/10)),round(Sd*(0.5/10))],...
   'ForegroundColor','k','BackgroundColor',[0.9412 0.9412 0.9412],'FontSize',Fs*17,'FontWeight','bold','FontUnits','normalized');
% Post-setting
set([inf_title_name,inf_name,inf_wj_name,inf_and_name,inf_dw_name,inf_cp_name],'Visible','off','Units','normalized') 
% ******************************************************** Main Side panel
pn_panel = uipanel('Visible','off','Title','','Units','Pixels','BackgroundColor',[0.5 0.5 0.5],...
   'Position',[round(Sw*(8/10)*(8/10)),0,round(Sw*(8/10)*(2/10)),round(Sd*(8/10))]);
% Post-setting
set(pn_panel,'Units','normalized')
% ******************************************************* Top Center title
pt_title_name = uicontrol('Style','text','String','','BackgroundColor','k',...
   'Position',[0,round(Sd*(8/10)*(9.55/10)),round(Sw*(8/10)*(8/10)),round(Sd*(8/10)*(0.35/10))],...
   'ForegroundColor','r','FontSize',Fs*10,'FontWeight','bold','FontUnits','normalized');
% Post-setting
set(pt_title_name,'Visible','off','Units','normalized') 
% ****************************************************************** ABOUT
fim_infor_name = uicontrol('Style','text','String','','BackgroundColor',[0 0 0],...
   'Position',[0,round(Sd*(8/10)*(9.55/10)),round(Sw*(8/10)*(9/10)),round(Sd*(8/10)*(0.35/10))],...
   'ForegroundColor','yellow','FontSize',Fs*10,'FontWeight','bold','FontUnits','normalized');
% Post-setting
set(fim_infor_name,'Visible','off','Units','normalized') 
% ****************************************************** USER DEFINED VIEW
% INPUT BACKGROUNG using panel.
vrum_panel = uipanel('Visible','on','Title','','Units','Pixels','BackgroundColor',[0.5 0.5 0.5],...
   'Position',[round(Sw*(7/10)*(7.9/10)),0,round(Sw*(8/10)*(1/10)),round(Sd*(1.4/10))]);
vrum_type_subpanel = uipanel(vrum_panel,'Title','','Units','Pixels','BackgroundColor','black',...
   'Position',[round(Pw*(1/20)),round(Pd*(0.5/40)),round(Pw*(17.5/20)),round(Pd*(5.5/40))]);
% Post-setting
set([vrum_panel,vrum_type_subpanel],'Units','normalized')
% INPUT BACKGROUNG using slider.
vrum_el_slider = uicontrol(vrum_type_subpanel,'Style','slider','BackgroundColor',[0.7 0.7 0.7],...
   'Max',180,'Min',-180,'Value',0,'SliderStep',[0.01 0.1],'Callback',{@vrum_el_slider_callback},...
   'Position',[round(Pw*(1.5/20)),round(Pd*(3/40)),round(Pw*(14.5/20)),round(Pd*(0.65/40))]);
vrum_az_slider = uicontrol(vrum_type_subpanel,'Style','slider','BackgroundColor',[0.7 0.7 0.7],...
   'Max',180,'Min',-180,'Value',0,'SliderStep',[0.01 0.1],'Callback',{@vrum_az_slider_callback},...
   'Position',[round(Pw*(1.5/20)),round(Pd*(0.5/40)),round(Pw*(14.5/20)),round(Pd*(0.65/40))]);
% Post-setting
set([vrum_az_slider,vrum_el_slider],'Units','normalized');
% INPUT BACKGROUNG TEXT 
vrum_vi_name = uicontrol(vrum_panel,'Style','text','String','Define View','BackgroundColor',[0 0 0],...
   'Position',[round(Pw*(2/20)),round(Pd*(5.7/40)),round(Pw*(13/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*10,'FontWeight','bold','FontUnits','normalized');
vrum_el_name = uicontrol(vrum_type_subpanel,'Style','text','String','Elevation','BackgroundColor',[0 0 0],...
   'Position',[round(Pw*(1/20)),round(Pd*(3.8/40)),round(Pw*(8/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*10,'FontWeight','bold','FontUnits','normalized');
vrum_az_name = uicontrol(vrum_type_subpanel,'Style','text','String','Azimuth','BackgroundColor',[0 0 0],...
   'Position',[round(Pw*(1/20)),round(Pd*(1.3/40)),round(Pw*(8/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*10,'FontWeight','bold','FontUnits','normalized');
% Post-setting
set([vrum_vi_name,vrum_az_name,vrum_el_name],'Units','normalized') 
% INPUT BOX using edit
vrum_el_edit = uicontrol(vrum_type_subpanel,'Style','edit','String','0.00','FontSize',Fs*9,'FontWeight','bold',...
   'BackgroundColor','black','ForegroundColor','white','FontUnits','normalized',...
   'Position',[round(Pw*(10.5/20)),round(Pd*(3.8/40)),round(Pw*(5/20)),round(Pd*(0.65/40))]); 
vrum_az_edit = uicontrol(vrum_type_subpanel,'Style','edit','String','0.00','FontSize',Fs*9,'FontWeight','bold',...
   'BackgroundColor','black','ForegroundColor','white','FontUnits','normalized',...
   'Position',[round(Pw*(10.5/20)),round(Pd*(1.3/40)),round(Pw*(5/20)),round(Pd*(0.65/40))]); 
% Post-setting
set([vrum_az_edit,vrum_el_edit],'Units','normalized');
% *************** Visible off for USER DEFINED VIEW S
set([vrum_panel,vrum_type_subpanel,vrum_az_slider,vrum_el_slider],'Visible','off')
set([vrum_vi_name,vrum_az_name,vrum_el_name,vrum_az_edit,vrum_el_edit],'Visible','off');
% *************** Visible off for USER DEFINED VIEW E
% ****************************************************** DIAGRAM DATA VIEW
% INPUT BACKGROUNG using panel.
vdum_panel = uipanel('Visible','on','Title','','Units','Pixels','BackgroundColor',[0.5 0.5 0.5],...
   'Position',[round(Sw*(1/10)*(1/10)),round(Pd*(1/100)),round(Sw*(8/10)*(1/10)),round(Sd*(1.4/10))]);
vdum_type_subpanel = uipanel(vdum_panel,'Title','','Units','Pixels','BackgroundColor','black',...
   'Position',[round(Pw*(1/20)),round(Pd*(0.5/40)),round(Pw*(17.5/20)),round(Pd*(5.5/40))]);
% Post-setting
set([vdum_panel,vdum_type_subpanel],'Units','normalized')
% INPUT BACKGROUNG TEXT 
vdum_type_name = uicontrol(vdum_panel,'Style','text','String','Diagram Data','BackgroundColor',[0 0 0],...
   'Position',[round(Pw*(2/20)),round(Pd*(5.7/40)),round(Pw*(15/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*10,'FontWeight','bold','FontUnits','normalized');
v1um_p1_text = uicontrol(vdum_type_subpanel,'Style','text','String','P1 =','BackgroundColor',[0 0 0],...
   'Position',[round(Pw*(1/20)),round(Pd*(4.1/40)),round(Pw*(5/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*10,'FontWeight','bold','FontUnits','normalized');
v1um_p2_text = uicontrol(vdum_type_subpanel,'Style','text','String','P2 =','BackgroundColor',[0 0 0],...
   'Position',[round(Pw*(1/20)),round(Pd*(3.2/40)),round(Pw*(5/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*10,'FontWeight','bold','FontUnits','normalized');
v1um_p3_text = uicontrol(vdum_type_subpanel,'Style','text','String','P3 =','BackgroundColor',[0 0 0],...
   'Position',[round(Pw*(1/20)),round(Pd*(2.3/40)),round(Pw*(5/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*10,'FontWeight','bold','FontUnits','normalized');
v1um_p4_text = uicontrol(vdum_type_subpanel,'Style','text','String','P4 =','BackgroundColor',[0 0 0],...
   'Position',[round(Pw*(1/20)),round(Pd*(1.4/40)),round(Pw*(5/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*10,'FontWeight','bold','FontUnits','normalized');
v1um_p5_text = uicontrol(vdum_type_subpanel,'Style','text','String','P5 =','BackgroundColor',[0 0 0],...
   'Position',[round(Pw*(1/20)),round(Pd*(0.5/40)),round(Pw*(5/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*10,'FontWeight','bold','FontUnits','normalized');
% Post-setting
set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,...
   v1um_p5_text],'Units','normalized') 
% INPUT BOX using edit
v1um_p1_edit = uicontrol(vdum_type_subpanel,'Style','edit','String','','FontSize',Fs*11,'FontWeight','bold',...
   'BackgroundColor','white','ForegroundColor','black','FontUnits','normalized',...
   'Position',[round(Pw*(6.5/20)),round(Pd*(4.1/40)),round(Pw*(9.5/20)),round(Pd*(0.65/40))]); 
v1um_p2_edit = uicontrol(vdum_type_subpanel,'Style','edit','String','','FontSize',Fs*11,'FontWeight','bold',...
   'BackgroundColor','white','ForegroundColor','black','FontUnits','normalized',...
   'Position',[round(Pw*(6.5/20)),round(Pd*(3.2/40)),round(Pw*(9.5/20)),round(Pd*(0.65/40))]); 
v1um_p3_edit = uicontrol(vdum_type_subpanel,'Style','edit','String','','FontSize',Fs*11,'FontWeight','bold',...
   'BackgroundColor','white','ForegroundColor','black','FontUnits','normalized',...
   'Position',[round(Pw*(6.5/20)),round(Pd*(2.3/40)),round(Pw*(9.5/20)),round(Pd*(0.65/40))]); 
v1um_p4_edit = uicontrol(vdum_type_subpanel,'Style','edit','String','','FontSize',Fs*11,'FontWeight','bold',...
   'BackgroundColor','white','ForegroundColor','black','FontUnits','normalized',...
   'Position',[round(Pw*(6.5/20)),round(Pd*(1.4/40)),round(Pw*(9.5/20)),round(Pd*(0.65/40))]); 
v1um_p5_edit = uicontrol(vdum_type_subpanel,'Style','edit','String','','FontSize',Fs*11,'FontWeight','bold',...
   'BackgroundColor','white','ForegroundColor','black','FontUnits','normalized',...
   'Position',[round(Pw*(6.5/20)),round(Pd*(0.5/40)),round(Pw*(9.5/20)),round(Pd*(0.65/40))]); 
% Post-setting
set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Units','normalized') 
% *************** Visible off for DIAGRAM DATA VIEW S
set([vdum_panel,vdum_type_subpanel],'Visible','off')
set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','off') 
set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','off')
% *************** Visible off for DIAGRAM DATA VIEW E
% ************************************************************** MODELING
% ************************************************ sub panel1
% INPUT BACKGROUNG using panel
ptable_type_subpanel = uipanel(pn_panel,'Title','','Units','Pixels','BackgroundColor','black',...
   'Position',[round(Pw*(1/20)),round(Pd*(38.4/40)),round(Pw*(38/20)),round(Pd*(1.1/40))]);
% Post-setting
set(ptable_type_subpanel,'Units','normalized')
% INPUT DESCRIPTION using text
ptable_type_text = uicontrol(pn_panel,'Style','text','String','Modeling','BackgroundColor','black',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(38.6/40)),round(Pw*(37/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','yellow','FontSize',Fs*10,'FontWeight','bold','FontUnits','normalized');
% Post-setting
set(ptable_type_text,'Units','normalized');
% ************************************************ sub panel2
% INPUT BACKGROUNG using panel
ptable_node_subpanel = uipanel(pn_panel,'Title','','Units','Pixels','BackgroundColor','black',...
   'Position',[round(Pw*(1/20)),round(Pd*(16/40)),round(Pw*(38/20)),round(Pd*(21.5/40))]);   
% Post-setting
set(ptable_node_subpanel,'Units','normalized');
% INPUT DESCRIPTION using text
ptable_node_text = uicontrol(pn_panel,'Style','text','String','Geometriy, Loads & Boundary Conditions',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(37.2/40)),round(Pw*(35/20)),round(Pd*(0.65/40))],...
   'BackgroundColor','black','ForegroundColor','white','FontSize',Fs*9,'FontWeight','bold',...
   'FontUnits','normalized');
% Post-setting
set(ptable_node_text,'Units','normalized');
pdesign_text = uicontrol(pn_panel,'Style','text','String','Design Axis',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(36.2/40)),round(Pw*(15/20)),round(Pd*(0.65/40))],...
   'BackgroundColor','black','ForegroundColor','white','FontSize',Fs*9,'FontWeight','bold',...
   'FontUnits','normalized');
% INPUT BOX using edit
pdesign_edit = uicontrol(pn_panel,'Style','popupmenu','String',' Mid-web| Flg2| Flg1',...
   'Position',[round(Pw*(17/20)),round(Pd*(36.2/40)),round(Pw*(20/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized');
% Post-setting
set([pdesign_text,pdesign_edit],'Units','normalized');
punit_text = uicontrol(pn_panel,'Style','text','String','Units',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(34.9/40)),round(Pw*(15/20)),round(Pd*(0.65/40))],...
   'BackgroundColor','black','ForegroundColor','white','FontSize',Fs*9,'FontWeight','bold',...
   'FontUnits','normalized');
% INPUT BOX using edit
punit_edit = uicontrol(pn_panel,'Style','popupmenu','String',' US (kip,in)| SI (kN,cm)',...
   'Position',[round(Pw*(17/20)),round(Pd*(34.9/40)),round(Pw*(20/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized');
% Post-setting
set([punit_text,punit_edit],'Units','normalized');
% Table-Nodes
tdata_node = zeros(14,2);
tdata_node(12,:) = 1; tdata_node(13,:) = 1;tdata_node(14,:) = 1;
cnames_node = {'Joint 1','Joint 2'};
rnames_node = {'X Coord','bf1','tf1','bf2','tf2','dw',...
   'tw','Afillets','Px','Py','Mz','BC','LH','Step'};
ptable_node = uitable(pn_panel,'Position',[round(Pw*(2.5/20)),round(Pd*(19.5/40)),round(Pw*(35/20)),round(Pd*(14.5/40))],...
   'Data',tdata_node,'ColumnWidth',{50},'ColumnName',cnames_node,'RowName',rnames_node,'ColumnEditable',true,...
   'FontSize',Fs*10);
% Post-setting
set(ptable_node,'Units','normalized')
% INPUT AISC data using text
ptable_wsection_text = uicontrol(pn_panel,'Style','text','String','AISC DB','BackgroundColor','black',...
   'Position',[round(Pw*(2.5/20)),round(Pd*(16.3/40)),round(Pw*(6/20)),round(Pd*(2.5/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
% INPUT BOX using edit
ptable_wsection_edit = uicontrol(pn_panel,'Style','popupmenu','String','NONE',...
   'Position',[round(Pw*(9.5/20)),round(Pd*(18/40)),round(Pw*(12/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized');
% INPUT BOX using edit
ptable_wsname_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(23.5/20)),round(Pd*(18/40)),round(Pw*(14/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized');
ptable_set = uicontrol(pn_panel,'Style','pushbutton','String','Select',...
   'Position',[round(Pw*(23.5/20)),round(Pd*(16.5/40)),round(Pw*(14/20)),round(Pd*(1/40))],...
   'FontSize',Fs*9,'FontUnits','normalized','Callback',{@ptable_aisc_pushbutton_Callback}); 
% Post-setting
set([ptable_wsection_text,ptable_wsection_edit,ptable_set,ptable_wsname_edit],'Units','normalized');
% ************************************************ sub panel3
% INPUT BACKGROUNG using panel
ptable_seg_subpanel = uipanel(pn_panel,'Title','','Units','Pixels','BackgroundColor','black',...
   'Position',[round(Pw*(1/20)),round(Pd*(9/40)),round(Pw*(38/20)),round(Pd*(6/40))]);   
% Post-setting
set(ptable_seg_subpanel,'Units','normalized');
% INPUT DESCRIPTION using text
ptable_seg_text = uicontrol(pn_panel,'Style','text','String','Subdivide Segment(s) & Assign Material',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(14.7/40)),round(Pw*(35/20)),round(Pd*(0.65/40))],...
   'BackgroundColor','black','ForegroundColor','white','FontSize',Fs*9,'FontWeight','bold',...
   'FontUnits','normalized');
% Post-setting
set(ptable_seg_text,'Units','normalized');
% Table-Nodes
tdata_seg = [10;50;50;50];
cnames_seg = {'Segment 1'};
rnames_seg = {'# of Ele.','Fyf1','Fyw','Fyf2'};
ptable_seg = uitable(pn_panel,'Position',[round(Pw*(2.5/20)),round(Pd*(9.5/40)),round(Pw*(35/20)),round(Pd*(5/40))],...
   'Data',tdata_seg,'ColumnWidth',{80},'ColumnName',cnames_seg,'RowName',rnames_seg,'ColumnEditable',true,...
   'FontSize',Fs*10);
% Post-setting
set(ptable_seg,'Units','normalized')
% ************************************************ sub panel4
% INPUT BACKGROUNG using panel
ptable_brac_subpanel = uipanel(pn_panel,'Title','','Units','Pixels','BackgroundColor','black',...
   'Position',[round(Pw*(1/20)),round(Pd*(4/40)),round(Pw*(38/20)),round(Pd*(4/40))]);   
% Post-setting
set(ptable_brac_subpanel,'Units','normalized');
% INPUT DESCRIPTION using text
ptable_brac_text = uicontrol(pn_panel,'Style','text','String','Nodes for Step, Taper, Bracing',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(7.7/40)),round(Pw*(33/20)),round(Pd*(0.65/40))],...
   'BackgroundColor','black','ForegroundColor','white','FontSize',Fs*9,'FontWeight','bold',...
   'FontUnits','normalized');
% Post-setting
set(ptable_brac_text,'Units','normalized');
ptable_addbracing = uicontrol(pn_panel,'Style','pushbutton','String','Add Node',...
   'Position',[round(Pw*(2.5/20)),round(Pd*(6.5/40)),round(Pw*(35/20)),round(Pd*(1/40))],...
   'FontSize',Fs*9,'FontUnits','normalized','Callback',{@ptable_add_pushbutton_Callback}); 
% Post-setting
set(ptable_addbracing,'Units','normalized');
% INPUT BOX using edit
ptable_remove_edit = uicontrol(pn_panel,'Style','popupmenu','String','NONE',...
   'Position',[round(Pw*(2.5/20)),round(Pd*(4.5/40)),round(Pw*(15/20)),round(Pd*(1/40))],...
   'FontSize',Fs*8,'FontUnits','normalized');
% Post-setting
set(ptable_remove_edit,'Units','normalized');
ptable_removebracing = uicontrol(pn_panel,'Style','pushbutton','String','Remove Node',...
   'Position',[round(Pw*(21.5/20)),round(Pd*(4.5/40)),round(Pw*(16/20)),round(Pd*(1/40))],...
   'FontSize',Fs*9,'FontUnits','normalized','Callback',{@ptable_remove_pushbutton_Callback}); 
% Post-setting
set(ptable_removebracing,'Units','normalized');
% ************************************************ sub panel5
% INPUT BACKGROUNG using panel.
ptable_app_subpanel = uipanel(pn_panel,'Title','','Units','Pixels','BackgroundColor','black',...
   'Position',[round(Pw*(1/20)),round(Pd*(0.5/40)),round(Pw*(38/20)),round(Pd*(2.5/40))]);
% Post-setting
set(ptable_app_subpanel,'Units','normalized');
% APPLY & CANCEL using pushbutton
ptable_apply = uicontrol(pn_panel,'Style','pushbutton','String','Apply',...
   'Position',[round(Pw*(3/20)),round(Pd*(1/40)),round(Pw*(16/20)),round(Pd*(1.5/40))],...
   'FontSize',Fs*9,'FontUnits','normalized','Callback',{@ptable_apply_pushbutton_Callback}); 
ptable_cancel = uicontrol(pn_panel,'Style','pushbutton','String','Reset',...
   'Position',[round(Pw*(21/20)),round(Pd*(1/40)),round(Pw*(16/20)),round(Pd*(1.5/40))],...
   'FontSize',Fs*9,'FontUnits','normalized','Callback',{@ptable_cancel_pushbutton_Callback}); 
% Post-setting   
set([ptable_apply,ptable_cancel],'Units','normalized'); 
% *************** Visible off for Modeling S
% *** sub panel1
set(ptable_type_subpanel,'Visible','off')
set(ptable_type_text,'Visible','off')
% *** sub panel2
set(ptable_node_subpanel,'Visible','off')
set(ptable_node_text,'Visible','off');
set(ptable_node,'Visible','off');
set([ptable_wsection_text,ptable_wsection_edit,ptable_set,ptable_wsname_edit],'Visible','off');
set([pdesign_text,pdesign_edit,punit_text,punit_edit],'Visible','off');
% *** sub panel3
set(ptable_seg_subpanel,'Visible','off');
set(ptable_seg_text,'Visible','off');
set(ptable_seg,'Visible','off')
% *** sub panel4
set(ptable_brac_subpanel,'Visible','off');
set(ptable_brac_text,'Visible','off');
set(ptable_addbracing,'Visible','off');
set(ptable_remove_edit,'Visible','off');
set(ptable_removebracing,'Visible','off');
% *** sub panel5
set(ptable_app_subpanel,'Visible','off');
set([ptable_apply,ptable_cancel],'Visible','off'); 
% *************** Visible off for Modeling E
% ************************************************************************
% ***************              Visible off S         *********************
% ************************************************************************
% ********************************************** PROPERTIES DEFINE MEMBERS
% ************************************************ sub panel1
pde_type_name = uicontrol(pn_panel,'Style','edit','String','1',...
   'Position',[round(Pw*(11.5/20)),round(Pd*(38.6/40)),round(Pw*(7/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
% ************************************************ sub panel2
% INPUT BOX using edit
pde_jointi_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(11.5/20)),round(Pd*(36.2/40)),round(Pw*(7/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pde_jointj_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(11.5/20)),round(Pd*(35.2/40)),round(Pw*(7/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pde_reference_edit = uicontrol(pn_panel,'Style','popupmenu','String',' Mid-web| Top flange| Bottom flange',...
   'Position',[round(Pw*(8.5/20)),round(Pd*(34/40)),round(Pw*(10/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized');
% ************************************************ sub panel3
% INPUT BOX using edit
pde_bfbi_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(7/20)),round(Pd*(11/40)),round(Pw*(5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pde_tfbi_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(7/20)),round(Pd*(10/40)),round(Pw*(5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized');
pde_bfti_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(7/20)),round(Pd*(9/40)),round(Pw*(5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pde_tfti_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(7/20)),round(Pd*(8/40)),round(Pw*(5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pde_dwi_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(7/20)),round(Pd*(7/40)),round(Pw*(5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pde_twi_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(7/20)),round(Pd*(6/40)),round(Pw*(5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pde_fili_edit = uicontrol(pn_panel,'Style','edit','String','0',...
   'Position',[round(Pw*(7/20)),round(Pd*(5/40)),round(Pw*(5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pde_bfbj_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(13.5/20)),round(Pd*(11/40)),round(Pw*(5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pde_tfbj_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(13.5/20)),round(Pd*(10/40)),round(Pw*(5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized');
pde_bftj_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(13.5/20)),round(Pd*(9/40)),round(Pw*(5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pde_tftj_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(13.5/20)),round(Pd*(8/40)),round(Pw*(5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pde_dwj_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(13.5/20)),round(Pd*(7/40)),round(Pw*(5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pde_twj_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(13.5/20)),round(Pd*(6/40)),round(Pw*(5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized');  
pde_filj_edit = uicontrol(pn_panel,'Style','edit','String','0',...
   'Position',[round(Pw*(13.5/20)),round(Pd*(5/40)),round(Pw*(5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized');
% *************** Visible off for DEFINE MEMBERS S
% *** sub panel1
set(pde_type_name,'Visible','off')
% *** sub panel2
set([pde_jointi_edit,pde_jointj_edit,pde_reference_edit],'Visible','off'); 
% *** sub panel3
set([pde_bfbi_edit,pde_tfbi_edit,pde_bfti_edit,pde_tfti_edit,pde_dwi_edit,pde_twi_edit],'Visible','off');
set([pde_bfbj_edit,pde_tfbj_edit,pde_bftj_edit,pde_tftj_edit,pde_dwj_edit,pde_twj_edit],'Visible','off'); 
set([pde_fili_edit,pde_filj_edit],'Visible','off'); 
% *************** Visible off for DEFINE MEMBERS E
% ********************************************* PROPERTIES DEFINE SEGMENTS
% ************************************************ sub panel1
% INPUT BOX using edit
pdb_member_name = uicontrol(pn_panel,'Style','edit','String','1',...
   'Position',[round(Pw*(9/20)),round(Pd*(38.6/40)),round(Pw*(3.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized');  
pdb_type_name = uicontrol(pn_panel,'Style','edit','String','0',...
   'Position',[round(Pw*(15.5/20)),round(Pd*(38.6/40)),round(Pw*(3/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized');   
% Post-setting
set([pdb_member_name,pdb_type_name],'Units','normalized')
% ************************************************ sub panel2
% INPUT BOX using edit
pdb_coordx_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(11.5/20)),round(Pd*(36/40)),round(Pw*(7/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized','enable','off'); 
pdb_coordy_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(11.5/20)),round(Pd*(35/40)),round(Pw*(7/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized','enable','off'); 
pdb_coordz_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(11.5/20)),round(Pd*(34/40)),round(Pw*(7/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized','enable','off'); 
pdb_length_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(11.5/20)),round(Pd*(31.7/40)),round(Pw*(7/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
% Post-setting
set([pdb_coordx_edit,pdb_coordy_edit,pdb_coordz_edit,pdb_length_edit],...
   'Units','normalized');
% ************************************************ sub panel3
pdb_step_edit = uicontrol(pn_panel,'Style','popupmenu','String','  None |  Step ',...
   'Position',[round(Pw*(8/20)),round(Pd*(14.6/40)),round(Pw*(10.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized');
% Post-setting
set(pdb_step_edit,'Units','normalized');
% INPUT BOX using edit
pdb_bfb_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(8/20)),round(Pd*(11/40)),round(Pw*(10.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pdb_tfb_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(8/20)),round(Pd*(10/40)),round(Pw*(10.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized');
pdb_bft_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(8/20)),round(Pd*(9/40)),round(Pw*(10.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pdb_tft_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(8/20)),round(Pd*(8/40)),round(Pw*(10.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pdb_dw_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(8/20)),round(Pd*(7/40)),round(Pw*(10.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pdb_tw_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(8/20)),round(Pd*(6/40)),round(Pw*(10.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pdb_fil_edit = uicontrol(pn_panel,'Style','edit','String','0',...
   'Position',[round(Pw*(8/20)),round(Pd*(5/40)),round(Pw*(10.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
% Post-setting
set([pdb_bfb_edit,pdb_tfb_edit,pdb_bft_edit,pdb_tft_edit,pdb_dw_edit,pdb_tw_edit],'Units','normalized');
set(pdb_fil_edit,'Units','normalized');  
% *************** Visible off for DEFINE SEGMENTS S 
% *** sub panel1
set([pdb_member_name,pdb_type_name],'Visible','off')
% *** sub panel2
set([pdb_coordx_edit,pdb_coordy_edit,pdb_coordz_edit,pdb_length_edit],'Visible','off');
% *** sub panel3
set(pdb_step_edit,'Visible','off');
set([pdb_bfb_edit,pdb_tfb_edit,pdb_bft_edit,pdb_tft_edit,pdb_dw_edit,pdb_tw_edit],'Visible','off');
set(pdb_fil_edit,'Visible','off');
% *************** Visible off for DEFINE SEGMENTS E
rd_buttongroup = uibuttongroup(pn_panel,'Title','','Units','Pixels','bordertype','none',...
   'BackgroundColor','black','Position',[round(Pw*(3.5/20)),round(Pd*(6.5/40)),round(Pw*(15/20)),round(Pd*(2/40))]);  
rd_on_radiobutton = uicontrol(rd_buttongroup,'Style','radio',...
   'String','On','Tag','undeformed3d_on','Position',[round(Pw*(1.5/20)),round(Pd*(1.2/40)),round(Pw*(8/20)),round(Pd*(0.65/40))],...
   'BackgroundColor','black','ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
rd_off_radiobutton = uicontrol(rd_buttongroup,'Style','radio',...
   'String','Off','Tag','undeformed3d_off','Position',[round(Pw*(8.5/20)),round(Pd*(1.2/40)),round(Pw*(8/20)),round(Pd*(0.65/40))],...
   'BackgroundColor','black','ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
set([rd_buttongroup,rd_on_radiobutton,rd_off_radiobutton],'Visible','off');
% ************************************************************************
% ***************              Visible off E         *********************
% ************************************************************************
% *************************************************** ANALYSIS PARAMETERS
% ************************************************ sub panel1
% INPUT DESCRIPTION using text
ap_type_text = uicontrol(pn_panel,'Style','text',...
   'String','Analysis Parameters','Position',[round(Pw*(1.5/20)),round(Pd*(38.6/40)),round(Pw*(37/20)),round(Pd*(0.65/40))],...
   'BackgroundColor','black','ForegroundColor','yellow','FontSize',Fs*8,'FontWeight','bold','FontUnits','normalized');
% Post-setting
set(ap_type_text,'Units','normalized')
% ************************************************ sub panel2
ap_jval_subpanel = uipanel(pn_panel,'Title','','Units','Pixels','BackgroundColor','black',...
   'Position',[round(Pw*(1/20)),round(Pd*(33.4/40)),round(Pw*(38/20)),round(Pd*(4/40))]); 
ap_jval_text = uicontrol(pn_panel,'Style','text','String','J=0 for slender web cross sections in ELBA',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(35.4/40)),round(Pw*(37/20)),round(Pd*(1.5/40))],...
   'BackgroundColor','black','ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
ap_jval_buttongroup = uibuttongroup(pn_panel,'Title','','Units','Pixels','bordertype','none',...
   'BackgroundColor','black','Position',[round(Pw*(2/20)),round(Pd*(34/40)),round(Pw*(16/20)),round(Pd*(0.75/40))]);  
ap_jval_on_radiobutton = uicontrol(ap_jval_buttongroup,'Style','radio',...
   'String','Yes','Tag','jval_on','Position',[round(Pw*(1/20)),round(Pd*(0/40)),round(Pw*(8/20)),round(Pd*(0.75/40))],...
   'BackgroundColor','black','ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
ap_jval_off_radiobutton = uicontrol(ap_jval_buttongroup,'Style','radio',...
   'String','No','Tag','jval_off','Position',[round(Pw*(9/20)),round(Pd*(0/40)),round(Pw*(8/20)),round(Pd*(0.75/40))],...
   'BackgroundColor','black','ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
% Post-setting   
set([ap_jval_subpanel,ap_jval_text,ap_jval_buttongroup,ap_jval_on_radiobutton,ap_jval_off_radiobutton],'Units','normalized');
% ************************************************ sub panel3
ap_AISC_subpanel = uipanel(pn_panel,'Title','','Units','Pixels','BackgroundColor','black',...
   'Position',[round(Pw*(1/20)),round(Pd*(28.4/40)),round(Pw*(38/20)),round(Pd*(4/40))]); 
ap_AISC_text = uicontrol(pn_panel,'Style','text','String','AISC Provisions',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(31.4/40)),round(Pw*(37/20)),round(Pd*(0.65/40))],...
   'BackgroundColor','black','ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
ap_AISC_buttongroup = uibuttongroup(pn_panel,'Title','','Units','Pixels','bordertype','none',...
   'BackgroundColor','black','Position',[round(Pw*(2/20)),round(Pd*(29/40)),round(Pw*(15/20)),round(Pd*(2/40))]);  
ap_AISC_on_radiobutton = uicontrol(ap_AISC_buttongroup,'Style','radio',...
   'String','Current','Tag','AISC_on','Position',[round(Pw*(1/20)),round(Pd*(1/40)),round(Pw*(20/20)),round(Pd*(0.75/40))],...
   'BackgroundColor','black','ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
ap_AISC_off_radiobutton = uicontrol(ap_AISC_buttongroup,'Style','radio',...
   'String','Recommended','Tag','AISC_off','Position',[round(Pw*(1/20)),round(Pd*(0/40)),round(Pw*(20/20)),round(Pd*(0.75/40))],...
   'BackgroundColor','black','ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
% Post-setting   
set([ap_AISC_subpanel,ap_AISC_text,ap_AISC_buttongroup,ap_AISC_on_radiobutton,ap_AISC_off_radiobutton],'Units','normalized');
% ************************************************ sub panel4
ap_bracket_subpanel = uipanel(pn_panel,'Title','','Units','Pixels','BackgroundColor','black',...
   'Position',[round(Pw*(1/20)),round(Pd*(20.4/40)),round(Pw*(38/20)),round(Pd*(7/40))]); 
ap_bracket_text = uicontrol(pn_panel,'Style','text','String','Bracketing algorithm',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(26.4/40)),round(Pw*(37/20)),round(Pd*(0.65/40))],...
   'BackgroundColor','black','ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
ap_cv_buttongroup = uibuttongroup(pn_panel,'Title','','Units','Pixels','bordertype','none',...
   'BackgroundColor','black','Position',[round(Pw*(1.5/20)),round(Pd*(22/40)),round(Pw*(17/20)),round(Pd*(4/40))]);  
ap_cv_on_radiobutton = uicontrol(ap_cv_buttongroup,'Style','radio',...
   'String','Jeong''s Algorithm ','Tag','cv_on','Position',[round(Pw*(0/20)),round(Pd*(2.5/40)),round(Pw*(17/20)),round(Pd*(0.75/40))],...
   'BackgroundColor','black','ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
ap_cv_off_radiobutton = uicontrol(ap_cv_buttongroup,'Style','radio',...
   'String','Brent''s Algorithm ','Tag','cv_off','Position',[round(Pw*(0/20)),round(Pd*(0/40)),round(Pw*(17/20)),round(Pd*(0.75/40))],...
   'BackgroundColor','black','ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
ap_jeong_text = uicontrol(pn_panel,'Style','text',...
   'String','Jeong''s Bracket Par.','Position',[round(Pw*(1.5/20)),round(Pd*(23.5/40)),round(Pw*(20/20)),round(Pd*(0.65/40))],...
   'BackgroundColor','black','ForegroundColor','white','FontSize',Fs*8,'FontUnits','normalized');
ap_brent_text = uicontrol(pn_panel,'Style','text',...
   'String','Brent''s Bracket Par.','Position',[round(Pw*(1.5/20)),round(Pd*(21/40)),round(Pw*(20/20)),round(Pd*(0.65/40))],...
   'BackgroundColor','black','ForegroundColor','white','FontSize',Fs*8,'FontUnits','normalized');
ap_jeong_edit = uicontrol(pn_panel,'Style','edit','String','5',...
   'Position',[round(Pw*(21.5/20)),round(Pd*(23.5/40)),round(Pw*(16/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
ap_brent_edit = uicontrol(pn_panel,'Style','edit','String','1',...
   'Position',[round(Pw*(21.5/20)),round(Pd*(21/40)),round(Pw*(16/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
% Post-setting   
set([ap_bracket_subpanel,ap_bracket_text,ap_cv_buttongroup,ap_cv_on_radiobutton,ap_cv_off_radiobutton],'Units','normalized');
set([ap_jeong_text,ap_brent_text,ap_jeong_edit,ap_brent_edit],'Units','normalized');
% ************************************************ sub panel5
ap_2nd_subpanel = uipanel(pn_panel,'Title','','Units','Pixels','BackgroundColor','black',...
   'Position',[round(Pw*(1/20)),round(Pd*(15.4/40)),round(Pw*(38/20)),round(Pd*(4/40))]); 
ap_2nd_text = uicontrol(pn_panel,'Style','text','String','2nd-Order Elastic Analysis',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(18.4/40)),round(Pw*(37/20)),round(Pd*(0.65/40))],...
   'BackgroundColor','black','ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
ap_da_text = uicontrol(pn_panel,'Style','text','String','0.8 DM Stiffness Reduction',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(17/40)),round(Pw*(37/20)),round(Pd*(0.65/40))],...
   'BackgroundColor','black','ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
ap_da_buttongroup = uibuttongroup(pn_panel,'Title','','Units','Pixels','bordertype','none',...
   'BackgroundColor','black','Position',[round(Pw*(2/20)),round(Pd*(16/40)),round(Pw*(16/20)),round(Pd*(0.75/40))]);  
ap_da_on_radiobutton = uicontrol(ap_da_buttongroup,'Style','radio',...
   'String','Yes','Tag','da_on','Position',[round(Pw*(1/20)),round(Pd*(0/40)),round(Pw*(8/20)),round(Pd*(0.75/40))],...
   'BackgroundColor','black','ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
ap_da_off_radiobutton = uicontrol(ap_da_buttongroup,'Style','radio',...
   'String','No','Tag','da_off','Position',[round(Pw*(9/20)),round(Pd*(0/40)),round(Pw*(8/20)),round(Pd*(0.75/40))],...
   'BackgroundColor','black','ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
% Post-setting   
set([ap_2nd_subpanel,ap_2nd_text,ap_da_text,ap_da_buttongroup,ap_da_on_radiobutton,ap_da_off_radiobutton],'Units','normalized');
set(ap_cv_on_radiobutton,'Value',0);
set(ap_cv_off_radiobutton,'Value',1)
% *************** Visible off for ANALYSIS PARAMETERS S
% *** sub panel1
set(ap_type_text,'Visible','off')
% *** sub panel2
set([ap_jval_subpanel,ap_jval_text,ap_jval_buttongroup,ap_jval_on_radiobutton,ap_jval_off_radiobutton],'Visible','off');
% *** sub panel3
set([ap_AISC_subpanel,ap_AISC_text,ap_AISC_buttongroup,ap_AISC_on_radiobutton,ap_AISC_off_radiobutton],'Visible','off');
% *** sub panel4
set([ap_bracket_subpanel,ap_bracket_text,ap_cv_buttongroup,ap_cv_on_radiobutton,ap_cv_off_radiobutton],'Visible','off');
set([ap_jeong_text,ap_brent_text,ap_jeong_edit,ap_brent_edit],'Visible','off');
% *** sub panel5
set([ap_2nd_subpanel,ap_2nd_text,ap_da_text,ap_da_buttongroup,ap_da_on_radiobutton,ap_da_off_radiobutton],'Visible','off');
% *************** Visible off for ANALYSIS PARAMETERS E
AnalP(1,1) = 0;
% *** sub panel2
AnalP(2,1)=1; % Jval
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
% ********************************************** Elastic Linear Buckling S
% ************************************************ sub panel1
% INPUT DESCRIPTION using text
am3_type_text = uicontrol(pn_panel,'Style','text','String','Elastic Lin. Buckling','BackgroundColor','black',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(38.6/40)),round(Pw*(37/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','yellow','FontSize',Fs*10,'FontWeight','bold','FontUnits','normalized');
% Post-setting
set(am3_type_text,'Units','normalized')
% *************** Visible off for Elastic Linear Buckling S
% *** sub panel1
set(am3_type_text,'Visible','off')
% *************** Visible off for Elastic Linear Buckling E
% ********************************************** Elastic Linear Buckling E
% ******************************************** Inelastic Linear Buckling S
% ************************************************ sub panel1
% INPUT DESCRIPTION using text
am4_type_text = uicontrol(pn_panel,'Style','text','String','Inelastic Lin. Buckling','BackgroundColor','black',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(38.6/40)),round(Pw*(37/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','yellow','FontSize',Fs*10,'FontWeight','bold','FontUnits','normalized');
% Post-setting
set(am4_type_text,'Units','normalized')
% *************** Visible off for Inelastic Linear Buckling S
% *** sub panel1
set(am4_type_text,'Visible','off')
% *************** Visible off for Inelastic Linear Buckling E
% ******************************************** Inelastic Linear Buckling E
% ***************************************** Inelastic Nonlinear Buckling S
% ************************************************ sub panel1
% INPUT DESCRIPTION using text
am6_type_text = uicontrol(pn_panel,'Style','text','String','Inelastic Nonlin. Buckling','BackgroundColor','black',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(38.6/40)),round(Pw*(37/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','yellow','FontSize',Fs*10,'FontWeight','bold','FontUnits','normalized');
% Post-setting
set(am6_type_text,'Units','normalized')
% *************** Visible off for Inelastic Nonlinear Buckling S
% *** sub panel1
set(am6_type_text,'Visible','off')
% *************** Visible off for Inelastic Nonlinear Buckling E
% ***************************************** Inelastic Nonlinear Buckling E
% ************************************************************** Results S
% ************************************************ sub panel1
% INPUT BACKGROUNG using panel
res_subpanel = uipanel(pn_panel,'Title','','Units','Pixels','BackgroundColor','black',...
   'Position',[round(Pw*(1/20)),round(Pd*(25.4/40)),round(Pw*(38/20)),round(Pd*(12.1/40))]); 
% Post-setting
set(res_subpanel,'Units','normalized')
% INPUT DESCRIPTION using text
res_text = uicontrol(pn_panel,'Style','text','String','Results',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(37.2/40)),round(Pw*(30/20)),round(Pd*(0.65/40))],...
   'BackgroundColor','black','ForegroundColor','white','FontSize',Fs*9,'FontWeight','bold',...
   'FontUnits','normalized');
recba_gamma_text = uicontrol(pn_panel,'Style','text','String','Gamma =',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(35/40)),round(Pw*(10/20)),round(Pd*(0.65/40))],...
   'BackgroundColor','black','ForegroundColor','white',...
   'FontSize',Fs*9,'FontUnits','normalized');
recba_scale_text = uicontrol(pn_panel,'Style','text','String','Scale =',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(33.5/40)),round(Pw*(10/20)),round(Pd*(0.65/40))],...
   'BackgroundColor','black','ForegroundColor','white',...
   'FontSize',Fs*9,'FontUnits','normalized');
% Post-setting
set([res_text,recba_gamma_text,recba_scale_text],'Units','normalized');
% INPUT BOX using edit
recba_gamma_edit = uicontrol(pn_panel,'Style','edit','String','','FontWeight','bold',...
   'Position',[round(Pw*(11.5/20)),round(Pd*(35/40)),round(Pw*(26/20)),round(Pd*(0.65/40))],'FontSize',Fs*8,'FontUnits','normalized','enable','off');
recba_Scale_edit = uicontrol(pn_panel,'Style','edit','String','1',...
   'Position',[round(Pw*(11.5/20)),round(Pd*(33.5/40)),round(Pw*(26/20)),round(Pd*(0.65/40))],'FontSize',Fs*8,'FontUnits','normalized'); 
% Post-setting
set([recba_gamma_edit,recba_Scale_edit],'Units','normalized');
recba_tau_text = uicontrol(pn_panel,'Style','text','String','Responses & Design Resources',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(31/40)),round(Pw*(37/20)),round(Pd*(0.65/40))],...
   'BackgroundColor','black','ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
% INPUT DESCRIPTION using pushbutton
recba_tau_diagram = uicontrol(pn_panel,'Style','popupmenu','String','   Undeformed Geometry |   Buckling Mode + Undeformed Geom. |   Buckling Mode Only |   Axial |   Moment Z ',...
    'Position',[round(Pw*(2.5/20)),round(Pd*(30/40)),round(Pw*(35/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*9,'FontUnits','normalized','Callback',{@recba_tau_diagram_pushbutton_Callback});  
% Post-setting
set([recba_tau_text,recba_tau_diagram],'Units','normalized');  
% *************** Visible off for Results S
% *** sub panel1
set(res_subpanel,'Visible','off')
set([res_text,recba_gamma_text,recba_scale_text],'Visible','off');
set([recba_gamma_edit,recba_Scale_edit],'Visible','off');
set([recba_tau_text,recba_tau_diagram],'Visible','off');  
% *************** Visible off for Results E
% ********************************************** Results E
% ************************************************************** Results E
% *********************************************************** Batch Mode S 
% ************************************************ sub panel1
% INPUT DESCRIPTION using text
auto_type_text = uicontrol(pn_panel,'Style','text','String','','BackgroundColor','black',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(38.6/40)),round(Pw*(37/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','yellow','FontSize',Fs*10,'FontWeight','bold','FontUnits','normalized');
% Post-setting
set(auto_type_text,'Units','normalized')
% ************************************************ sub panel2
auto_modelname_text = uicontrol(pn_panel,'Style','text','String','Name of tests',...
   'Position',[round(Pw*(2.5/20)),round(Pd*(36/40)),round(Pw*(20.5/20)),round(Pd*(0.65/40))],...
   'BackgroundColor','black','ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');

auto_modelnum_text = uicontrol(pn_panel,'Style','text','String','Total # of tests',...
   'Position',[round(Pw*(25.5/20)),round(Pd*(36/40)),round(Pw*(12/20)),round(Pd*(0.65/40))],...
   'BackgroundColor','black','ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');

auto_modelname_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(2.5/20)),round(Pd*(35/40)),round(Pw*(20.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized');
auto_modelnum_edit = uicontrol(pn_panel,'Style','edit','String','',...
   'Position',[round(Pw*(25.5/20)),round(Pd*(35/40)),round(Pw*(12/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized');
auto_lin_apply = uicontrol(pn_panel,'Style','pushbutton','String','Apply',...
   'Position',[round(Pw*(2.5/20)),round(Pd*(27/40)),round(Pw*(35/20)),round(Pd*(1/40))],...
   'FontSize',Fs*9,'FontUnits','normalized','Callback',{@auto_lin_apply_pushbutton_Callback}); 
auto_nonlin_apply = uicontrol(pn_panel,'Style','pushbutton','String','Apply',...
   'Position',[round(Pw*(2.5/20)),round(Pd*(27/40)),round(Pw*(35/20)),round(Pd*(1/40))],...
   'FontSize',Fs*9,'FontUnits','normalized','Callback',{@auto_nonlin_apply_pushbutton_Callback}); 
% Post-setting
set([auto_modelname_text,auto_modelnum_text,auto_modelname_edit,auto_modelnum_edit,...
   auto_lin_apply,auto_nonlin_apply],'Units','normalized');
% *************** Visible off for Batch Mode S
% *** sub panel1
set(auto_type_text,'Visible','off')
% *** sub panel2
set([auto_modelname_text,auto_modelnum_text,auto_modelname_edit,auto_modelnum_edit,...
   auto_lin_apply,auto_nonlin_apply],'Visible','off');
% *************** Visible off for Batch Mode E
% *********************************************************** Batch Mode E

% ************************************************************************
% ******************        SABRE2Calculator              ****************
% ************************************************************************
% Move the GUI to the center of the screen.
movegui(masterf,'center')
set(masterf,'Visible','on')
set(axesm,'Units','normalized')
% ************************************************************************
% *****************             Callback             *********************
% ************************************************************************
% ******************************************************** File Callback S
% --------------------------------------------------------------------
function file_info_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   tic
   set([inf_panel,inf_title_name,inf_name,inf_wj_name,inf_and_name,inf_dw_name,inf_cp_name],'Visible','on')  
   pause(10)
   toc
   set([inf_panel,inf_title_name,inf_name,inf_wj_name,inf_and_name,inf_dw_name,inf_cp_name],'Visible','off') 
end

% --------------------------------------------------------------------
function file_new_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   set(masterf,'WindowButtonDownFcn',@view_defined_xy_menu_Callback);
   % Callback function run when the menu item is selected         
   selection = questdlg('Do you want to start over?','New ','Yes','No','Yes');     
   if strcmp(selection,'No')
      return;
   else
      SABRE2NewFun(pn_panel,pt_title_name,fim_infor_name,ptable_type_subpanel,...
         ptable_type_text,ptable_node_subpanel,pdesign_text,pdesign_edit,punit_text,punit_edit,ptable_node_text,ptable_node,ptable_wsection_text,...
         ptable_wsection_edit,ptable_set,ptable_wsname_edit,ptable_seg_subpanel,...
         ptable_seg_text,ptable_seg,ptable_brac_subpanel,ptable_brac_text,ptable_addbracing,...
         ptable_remove_edit,ptable_removebracing,ptable_app_subpanel,ptable_apply,...
         ptable_cancel,ap_type_text,ap_jval_subpanel,ap_jval_text,ap_jval_buttongroup,...
         ap_jval_on_radiobutton,ap_jval_off_radiobutton,ap_AISC_subpanel,ap_AISC_text,...
         ap_AISC_buttongroup,ap_AISC_on_radiobutton,ap_AISC_off_radiobutton,ap_bracket_subpanel,...
         ap_bracket_text,ap_cv_buttongroup,ap_cv_on_radiobutton,ap_cv_off_radiobutton,...
         ap_jeong_text,ap_brent_text,ap_jeong_edit,ap_brent_edit,ap_2nd_subpanel,...
         ap_2nd_text,ap_da_text,ap_da_buttongroup,ap_da_on_radiobutton,ap_da_off_radiobutton,...
         am3_type_text,am4_type_text,am6_type_text,res_subpanel,res_text,recba_gamma_text,...
         recba_scale_text,recba_gamma_edit,recba_Scale_edit,recba_tau_text,recba_tau_diagram,...
         auto_type_text,auto_modelname_text,auto_modelnum_text,auto_modelname_edit,auto_modelnum_edit,...
         auto_lin_apply,auto_nonlin_apply);        
      % reset
      cla(axesm,'reset'); 
      filename = []; pathname = []; JNodevalue = []; Massemble = []; 
      JNodevalue_i = []; JNodevalue_j = []; Rval=[]; BNodevalue = []; SNodevalue =[]; 
      RNCc = []; NCc = []; Nshe1 = []; Nshe2 = []; DUP1 = []; DUP2 = []; LNC = [];
      LNC1 = []; LNC2 = []; LUEC = []; PNC = []; PNC1 = []; PNC2 = []; BNC = []; FEL = [];
      BNC1 = []; BNC2 = []; t=[]; ULoad=[]; gammma=[]; Funew =[]; EGunew=[]; Qintf=[];
      Qintg=[]; Sincre=[];Bhe1=[]; Bhe2=[]; The1=[]; The2=[]; Bhg=[]; Thg=[]; CSg=[]; SGhe1=[]; SGhe2=[]; tau=[];
      LTYPE=[]; AR=0; AS=0; AE=0; AI=0; ANE=0; ANI=0; Rpg=[]; Rpc=[]; Rpt=[]; Rh=[]; Myc=[]; My=[]; Jval=[];Phi_Py=[]; UC=[];
      cflag=0; LNCpv=[];LIAType=0; NLIAType=0;HomoType=0; crLTB = 0; LGv=0;Rtype=0; AnalP=[];
      NONType=0;LIA=0;  NLIA=0;tdata_seg=[];cnames_node=[]; cnames_seg=[];Gnode=[]; Mseg=[];      
      set(vctm, 'Checked', 'off');
      cameratoolbar('Close');
      axis normal;   
      set(axesm,'Visible','off','Units','normalized','DataAspectRatio',[1 1 1])    
      % Initial View : X-Y View
      az = 0; el = 0; view(az, el);   
      set(masterf,'Name',['SABRE2Calculator',pathname,filename])           
      set([vdum,vtum],'enable','off');set([vdum,vtum], 'Checked', 'off');set([vdum_panel,vdum_type_subpanel],'Visible','off')
      set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','off') 
      set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','off');        
      % Table-Nodes
      tdata_node = zeros(14,2);
      tdata_node(12,:) = 1; tdata_node(13,:) = 1;tdata_node(14,:) = 1;
      cnames_node = {'Joint 1','Joint 2'};
      rnames_node = {'X Coord','bf1','tf1','bf2','tf2','dw',...
         'tw','Afillets','Px','Py','Mz','BC','LH','Step'};
      ptable_node = uitable(pn_panel,'Position',[round(Pw*(2.5/20)),round(Pd*(19.5/40)),round(Pw*(35/20)),round(Pd*(14.5/40))],...
         'Data',tdata_node,'ColumnWidth',{50},'ColumnName',cnames_node,'RowName',rnames_node,'ColumnEditable',true,...
         'FontSize',Fs*10);
      % Table-Nodes
      tdata_seg = [10;50;50;50];
      cnames_seg = {'Segment 1'};
      rnames_seg = {'# of Ele.','Fyf1','Fyw','Fyf2'};
      ptable_seg = uitable(pn_panel,'Position',[round(Pw*(2.5/20)),round(Pd*(9.5/40)),round(Pw*(35/20)),round(Pd*(5/40))],...
         'Data',tdata_seg,'ColumnWidth',{80},'ColumnName',cnames_seg,'RowName',rnames_seg,'ColumnEditable',true,...
         'FontSize',Fs*10);        
   end
end % function end
   
% --------------------------------------------------------------------
function file_open_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   set(masterf,'WindowButtonDownFcn',@view_defined_xy_menu_Callback);
   % Visible function
   [filename, pathname] = uigetfile({'*.inp','All MAT-Files (*.inp)'; ...
      '*.*','All Files (*.*)'},'Select File');
   if isequal([filename,pathname],[0,0]) || isempty(filename) || isempty(pathname)
      return
   else
      SABRE2OpenFun(pn_panel,pt_title_name,fim_infor_name,ptable_type_subpanel,...
         ptable_type_text,ptable_node_subpanel,pdesign_text,pdesign_edit,punit_text,punit_edit,ptable_node_text,ptable_node,ptable_wsection_text,...
         ptable_wsection_edit,ptable_set,ptable_wsname_edit,ptable_seg_subpanel,...
         ptable_seg_text,ptable_seg,ptable_brac_subpanel,ptable_brac_text,ptable_addbracing,...
         ptable_remove_edit,ptable_removebracing,ptable_app_subpanel,ptable_apply,...
         ptable_cancel,ap_type_text,ap_jval_subpanel,ap_jval_text,ap_jval_buttongroup,...
         ap_jval_on_radiobutton,ap_jval_off_radiobutton,ap_AISC_subpanel,ap_AISC_text,...
         ap_AISC_buttongroup,ap_AISC_on_radiobutton,ap_AISC_off_radiobutton,ap_bracket_subpanel,...
         ap_bracket_text,ap_cv_buttongroup,ap_cv_on_radiobutton,ap_cv_off_radiobutton,...
         ap_jeong_text,ap_brent_text,ap_jeong_edit,ap_brent_edit,ap_2nd_subpanel,...
         ap_2nd_text,ap_da_text,ap_da_buttongroup,ap_da_on_radiobutton,ap_da_off_radiobutton,...
         am3_type_text,am4_type_text,am6_type_text,res_subpanel,res_text,recba_gamma_text,...
         recba_scale_text,recba_gamma_edit,recba_Scale_edit,recba_tau_text,recba_tau_diagram,...
         auto_type_text,auto_modelname_text,auto_modelnum_text,auto_modelname_edit,auto_modelnum_edit,...
         auto_lin_apply,auto_nonlin_apply);       
      % reset
      JNodevalue = []; Massemble = []; 
      JNodevalue_i = []; JNodevalue_j = []; Rval=[]; BNodevalue = []; SNodevalue =[]; 
      RNCc = []; NCc = []; Nshe1 = []; Nshe2 = []; DUP1 = []; DUP2 = []; LNC = [];
      LNC1 = []; LNC2 = []; LUEC = []; PNC = []; PNC1 = []; PNC2 = []; BNC = []; FEL = [];
      BNC1 = []; BNC2 = []; t=[]; ULoad=[]; gammma=[]; Funew =[]; EGunew=[]; Qintf=[];
      Qintg=[]; Sincre=[]; Bhe1=[]; Bhe2=[]; The1=[]; The2=[]; Bhg=[]; Thg=[]; CSg=[]; tau=[];SGhe1=[]; SGhe2=[];
      LTYPE=[]; AR=0; AS=0; AE=0; AI=0; ANE=0; ANI=0; cflag=0; LNCpv=[];LIAType=0; crLTB = 0; LGv=0;
      NLIAType=0;HomoType=0; Rpg=[]; Rpc=[]; Rpt=[]; Rh=[]; Myc=[]; My=[]; Jval=[];Phi_Py=[]; UC=[];
      NONType=0;LIA=0;  NLIA=0;tdata_seg=[];cnames_node=[]; cnames_seg=[];Gnode=[]; Mseg=[]; 
      set([vdum,vtum], 'enable', 'off'); set([vdum_panel,vdum_type_subpanel],'Visible','off')
      set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','off') 
      set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','off'); Rtype=0; AnalP=[];

      [JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,SNodevalue,...
         RNCc,Nshe1,Nshe2,DUP1,DUP2,NCc,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,BNC1,BNC2,...
         FEL,error,PNC,PNC1,PNC2,LNC,LNC1,LNC2,AnalP]=SABRE2InpOpen(pathname,filename,ptable_node,ptable_seg,pt_title_name,...
         JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,SNodevalue,...
         LNC,LUEC,BNC,BNC1,BNC2,FEL,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,PNC,PNC1,PNC2,...
         pde_type_name,pde_jointi_edit,pde_jointj_edit,pde_bfbi_edit,pde_tfbi_edit,...
         pde_bfti_edit,pde_tfti_edit,pde_dwi_edit,pde_twi_edit,pde_bfbj_edit,...
         pde_tfbj_edit,pde_bftj_edit,pde_tftj_edit,pde_dwj_edit,pde_twj_edit,...
         pde_fili_edit,pde_filj_edit,pdesign_edit,punit_edit,pdb_member_name,...
         pdb_type_name,pdb_coordx_edit,pdb_coordy_edit,pdb_coordz_edit,...
         pdb_length_edit,pdb_bfb_edit,pdb_tfb_edit,pdb_bft_edit,pdb_tft_edit,...
         pdb_dw_edit,pdb_tw_edit,pdb_fil_edit,pdb_step_edit,vrum_az_slider,...
         vrum_el_slider,vrum_az_edit,vrum_el_edit,ptable_remove_edit,axesm,vstm);     
      set( gca, 'Units', 'normalized', 'Position', [0 0 1 1] );           
      % Opened File
      set(vctm, 'Checked', 'off');
      cameratoolbar('Close');      
      set(masterf,'Name',['SABRE2Calculator: ',pathname,filename])     
      % Initial View : X-Y View
      az = 0; el = 0; view(az, el);        
   end
end % function end

% --------------------------------------------------------------------
function file_save_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   if isequal([filename,pathname],[0,0]) || isempty(filename) || isempty(pathname)
      [filename, pathname] = uiputfile({'*.inp';'*.mat';'*.*'},'Save');	
      if isequal([filename,pathname],[0,0]) || isempty(filename) || isempty(pathname)
         return
      else
         set(masterf,'Name',['SABRE2Calculator: ',pathname,filename])
         File = fullfile(pathname,filename);
         [pathstr,name,ext] = fileparts(filename);
         if isequal(strcmp(ext,'.mat'),1)
            save(File,'JNodevalue','Massemble','JNodevalue_i','JNodevalue_j',...
               'Rval','BNodevalue','SNodevalue','RNCc','NCc','Nshe1','Nshe2',...
               'DUP1','DUP2','LNC','LNC1','LNC2','LUEC','PNC','PNC1','PNC2',...
               'BNC','BNC1','BNC2','FEL','AnalP')
         elseif isequal(strcmp(ext,'.inp'),1)
            SABRE2InpSave(File,ptable_node,ptable_seg,pdesign_edit,punit_edit,AnalP);
         end
      
      end
   else
      File = fullfile(pathname,filename);
      [pathstr,name,ext] = fileparts(filename);
      if isequal(strcmp(ext,'.mat'),1)
         save(File,'JNodevalue','Massemble','JNodevalue_i','JNodevalue_j',...
            'Rval','BNodevalue','SNodevalue','RNCc','NCc','Nshe1','Nshe2',...
            'DUP1','DUP2','LNC','LNC1','LNC2','LUEC','PNC','PNC1','PNC2',...
            'BNC','BNC1','BNC2','FEL','AnalP')
      elseif isequal(strcmp(ext,'.inp'),1)
         SABRE2InpSave(File,ptable_node,ptable_seg,pdesign_edit,punit_edit,AnalP);
      end         
   end
end % function end

% --------------------------------------------------------------------
function file_saveas_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   [filename, pathname] = uiputfile({'*.inp';'*.mat';'*.*'},'Save As');	
   % If 'Cancel' was selected then return
   if isequal([filename,pathname],[0,0]) || isempty(filename) || isempty(pathname)
      return
   else
      set(masterf,'Name',['SABRE2Calculator: ',pathname,filename])
      File = fullfile(pathname,filename);
      [pathstr,name,ext] = fileparts(filename);
      if isequal(strcmp(ext,'.mat'),1)
         save(File,'JNodevalue','Massemble','JNodevalue_i','JNodevalue_j',...
            'Rval','BNodevalue','SNodevalue','RNCc','NCc','Nshe1','Nshe2',...
            'DUP1','DUP2','LNC','LNC1','LNC2','LUEC','PNC','PNC1','PNC2',...
            'BNC','BNC1','BNC2','FEL','AnalP')
      elseif isequal(strcmp(ext,'.inp'),1)
         SABRE2InpSave(File,ptable_node,ptable_seg,pdesign_edit,punit_edit,AnalP);
      end          
   end    
end % function end

% --------------------------------------------------------------------
function file_preview_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   SABRE2PreFun(pn_panel,pt_title_name,fim_infor_name,ptable_type_subpanel,...
      ptable_type_text,ptable_node_subpanel,pdesign_text,pdesign_edit,punit_text,punit_edit,ptable_node_text,ptable_node,ptable_wsection_text,...
      ptable_wsection_edit,ptable_set,ptable_wsname_edit,ptable_seg_subpanel,...
      ptable_seg_text,ptable_seg,ptable_brac_subpanel,ptable_brac_text,ptable_addbracing,...
      ptable_remove_edit,ptable_removebracing,ptable_app_subpanel,ptable_apply,...
      ptable_cancel,ap_type_text,ap_jval_subpanel,ap_jval_text,ap_jval_buttongroup,...
      ap_jval_on_radiobutton,ap_jval_off_radiobutton,ap_AISC_subpanel,ap_AISC_text,...
      ap_AISC_buttongroup,ap_AISC_on_radiobutton,ap_AISC_off_radiobutton,ap_bracket_subpanel,...
      ap_bracket_text,ap_cv_buttongroup,ap_cv_on_radiobutton,ap_cv_off_radiobutton,...
      ap_jeong_text,ap_brent_text,ap_jeong_edit,ap_brent_edit,ap_2nd_subpanel,...
      ap_2nd_text,ap_da_text,ap_da_buttongroup,ap_da_on_radiobutton,ap_da_off_radiobutton,...
      am3_type_text,am4_type_text,am6_type_text,res_subpanel,res_text,recba_gamma_text,...
      recba_scale_text,recba_gamma_edit,recba_Scale_edit,recba_tau_text,recba_tau_diagram,...
      auto_type_text,auto_modelname_text,auto_modelnum_text,auto_modelname_edit,auto_modelnum_edit,...
      auto_lin_apply,auto_nonlin_apply);    
   printpreview
end % function end

% --------------------------------------------------------------------
function file_print_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   printdlg % Printer
end % function end

% --------------------------------------------------------------------
function file_printphoto_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   [filename, pathname] = uiputfile({'*.jpg';'*.png';'*.tif';'*.eps';...
      '*.bmp';'*.pdf';'*.*'},'Save Photo as File');	 
   File = fullfile(pathname,filename);
   % If 'Cancel' was selected then return
   if isequal(filename,0) || isempty(filename) 
      return
   else    
      saveas(gcf,File)
   end 
end % function end

% --------------------------------------------------------------------
function file_quit_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   % Callback function run when the Close menu item is selected    
   selection = questdlg('Do you want to close ?','Close','Yes','No','Yes');
   if strcmp(selection,'No')
      return;
   else
      delete(masterf)
   end    
end % function end
% ******************************************************** File Callback E
% ******************************************************** View Callback S
% --------------------------------------------------------------------
function view_zoom_menu_Callback(hObject, eventdata)
   clc; pan off; rotate3d off; 
   if strcmp(get(gcbo, 'Checked'),'on')
       set(gcbo, 'Checked', 'off');
       set([vrm,vpm], 'Checked', 'off');
       zoom off;
   else 
       set(gcbo, 'Checked', 'on');
       set([vrm,vpm], 'Checked', 'off');
       zoom on;       
   end   
end % function end

% --------------------------------------------------------------------
function view_rotate_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off;
   if strcmp(get(gcbo, 'Checked'),'on')
       set(gcbo, 'Checked', 'off');
       set([vzm,vpm], 'Checked', 'off');
       rotate3d off;
   else 
       set(gcbo, 'Checked', 'on');
       set([vzm,vpm], 'Checked', 'off');
       rotate3d on;
      azf=get(gca,'view'); % Get current view     
      set(vrum_az_slider,'Value',azf(1,1));set(vrum_el_slider,'Value',azf(1,2))
      set(vrum_az_edit,'String',num2str(azf(1,1)));set(vrum_el_edit,'String',num2str(azf(1,2)));          
   end         
end % function end

% --------------------------------------------------------------------
function view_pan_menu_Callback(hObject, eventdata)  
   clc; zoom off; rotate3d off;
   if strcmp(get(gcbo, 'Checked'),'on')
       set(gcbo, 'Checked', 'off');
       set([vzm,vrm], 'Checked', 'off');
       pan off;
   else 
       set(gcbo, 'Checked', 'on');
       set([vzm,vrm], 'Checked', 'off');
       pan on;
   end  
end % function end

% --------------------------------------------------------------------
function view_camera_toolbar_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   if strcmp(get(gcbo, 'Checked'),'on')
      set(vctm, 'Checked', 'off');
      cameratoolbar('Close');
   else
      set(vctm, 'Checked', 'on');
      cameratoolbar;
      set(axesm,'DataAspectRatioMode','manual') 
      azf=get(gca,'view'); % Get current view     
      set(vrum_az_slider,'Value',azf(1,1));set(vrum_el_slider,'Value',azf(1,2))
      set(vrum_az_edit,'String',num2str(azf(1,1)));set(vrum_el_edit,'String',num2str(azf(1,2)));         
   end               
end % function end

% --------------------------------------------------------------------
function view_defined_xyz_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   % Isometric-View
   az = -37.5; el = 30; view(az, el); 
   axis manual;   
   set(axesm,'Visible','off','Units','normalized','DataAspectRatio',[1 1 1]) 
   set( gca, 'Units', 'normalized', 'Position', [0 0 1 1] );   
   set(vrum_az_slider,'Value',az);set(vrum_el_slider,'Value',el)
   set(vrum_az_edit,'String',num2str(az));set(vrum_el_edit,'String',num2str(el));      
end % function end

% --------------------------------------------------------------------
function view_defined_xy_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   az = 0; el = 0; view(az, el);  
   set(vrum_az_slider,'Value',az);set(vrum_el_slider,'Value',el)
   set(vrum_az_edit,'String',num2str(az));set(vrum_el_edit,'String',num2str(el));      
end % function end

% --------------------------------------------------------------------
function view_defined_xz_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   az = 0; el = 90; view(az, el); 
   set(vrum_az_slider,'Value',az);set(vrum_el_slider,'Value',el)
   set(vrum_az_edit,'String',num2str(az));set(vrum_el_edit,'String',num2str(el));      
end % function end

% --------------------------------------------------------------------
function view_defined_yz_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   az = 90; el = 0; view(az, el);  
   set(vrum_az_slider,'Value',az);set(vrum_el_slider,'Value',el)
   set(vrum_az_edit,'String',num2str(az));set(vrum_el_edit,'String',num2str(el));      
end % function end

% --------------------------------------------------------------------
function view_defined_user_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   if strcmp(get(gcbo, 'Checked'),'on')     
      set(vrum, 'Checked', 'off');
      set([vrum_panel,vrum_type_subpanel],'Visible','off')
      set([vrum_az_slider,vrum_el_slider],'Visible','off')
      set([vrum_vi_name,vrum_az_name,vrum_el_name],'Visible','off');
      set([vrum_az_edit,vrum_el_edit],'Visible','off');
   else
      set(vrum, 'Checked', 'on');
      set([vrum_panel,vrum_type_subpanel],'Visible','on')
      set([vrum_az_slider,vrum_el_slider],'Visible','on')
      set([vrum_vi_name,vrum_az_name,vrum_el_name],'Visible','on');
      set([vrum_az_edit,vrum_el_edit],'Visible','on');  
      azf=get(gca,'view'); % Get current view     
      set(vrum_az_slider,'Value',azf(1,1));set(vrum_el_slider,'Value',azf(1,2))
      set(vrum_az_edit,'String',num2str(azf(1,1)));set(vrum_el_edit,'String',num2str(azf(1,2)));
      Fsize=get(recba_Scale_edit,'FontSize');
      set([vrum_az_edit,vrum_el_edit],'FontSize',Fsize)   
   end    
end % function end

% --------------------------------------------------------------------
function vrum_az_slider_callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
      set(vrum_az_edit,'String',num2str(get(vrum_az_slider,'Value')));
      az = str2double(get(vrum_az_edit,'string')); 
      el = str2double(get(vrum_el_edit,'string')); view(az, el);     
end % function end

% --------------------------------------------------------------------
function vrum_el_slider_callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
      set(vrum_el_edit,'String',num2str(get(vrum_el_slider,'Value')));
      az = str2double(get(vrum_az_edit,'string')); 
      el = str2double(get(vrum_el_edit,'string')); view(az, el);     
end % function end

% --------------------------------------------------------------------
function view_fit_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off'); 
   set( gca, 'Units', 'normalized', 'Position', [0 0 0.8 1] );
   if isequal(Buc,1)
       SABRE2ModelP(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j, ...
          Rval,BNodevalue,vrum_az_slider,vrum_el_slider,vrum_az_edit,vrum_el_edit,axesm,vstm);   
       
      [RNCc,Nshe1,Nshe2,DUP1,DUP2,NCc,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,BNC1,BNC2,FEL,error]=SABRE2LBCODE(JNodevalue,...
         Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,SNodevalue,...
         RNCc,Nshe1,Nshe2,DUP1,DUP2,NCc,LNC,LUEC,PNC,BNC,BNC1,BNC2,FEL,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,pt_title_name,axesm,vstm);   
       
      SABRE2AssiCODE(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,SNodevalue,axesm,vstm);  
      set( gca, 'Units', 'normalized', 'Position', [0 0 0.8 1] ); 
   elseif isequal(Buc,2)
      set(rd_on_radiobutton,'Value',1);set(rd_off_radiobutton,'Value',0);
      if ~isempty(Funew) 
         IncreL = 1; Fscale=str2double(get(recba_Scale_edit, 'String')); 
         if isempty(gammma)
            SABRE2RBmode(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,...
               SNodevalue,RNCc,NCc,Nshe1,Nshe2,DUP1,DUP2,Funew(:,:,IncreL),Rval,...
               LNC,LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,Fscale,rd_buttongroup,pt_title_name,...
               AR,AS,AE,AI,ANE,ANI,gammma,LIAType,NLIAType,crLTB,LGv,axesm,vstm);   
            Buc=2;
         else
            SABRE2RBmode(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,...
               SNodevalue,RNCc,NCc,Nshe1,Nshe2,DUP1,DUP2,Funew(:,:,IncreL),Rval,...
               LNC,LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,Fscale,rd_buttongroup,pt_title_name,...
               AR,AS,AE,AI,ANE,ANI,gammma(IncreL,1),LIAType,NLIAType,crLTB,LGv,axesm,vstm); 
            Buc=2;
         end
      end  
      set( gca, 'Units', 'normalized', 'Position', [0 0 0.8 1] ); 
   elseif isequal(Buc,3)
      set(rd_on_radiobutton,'Value',0);set(rd_off_radiobutton,'Value',1);
      if ~isempty(Funew) 
         IncreL = 1; Fscale=str2double(get(recba_Scale_edit, 'String')); 
         if isempty(gammma)
            SABRE2RBmode(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,...
               SNodevalue,RNCc,NCc,Nshe1,Nshe2,DUP1,DUP2,Funew(:,:,IncreL),Rval,...
               LNC,LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,Fscale,rd_buttongroup,pt_title_name,...
               AR,AS,AE,AI,ANE,ANI,gammma,LIAType,NLIAType,crLTB,LGv,axesm,vstm);   
            Buc=3;
         else
            SABRE2RBmode(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,...
               SNodevalue,RNCc,NCc,Nshe1,Nshe2,DUP1,DUP2,Funew(:,:,IncreL),Rval,...
               LNC,LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,Fscale,rd_buttongroup,pt_title_name,...
               AR,AS,AE,AI,ANE,ANI,gammma(IncreL,1),LIAType,NLIAType,crLTB,LGv,axesm,vstm); 
            Buc=3;
         end
      end   
      set( gca, 'Units', 'normalized', 'Position', [0 0 0.8 1] ); 
   elseif isequal(Buc,4)
      IncreL = 1;
      if ~isempty(Qintf)
         Rtype=1;
         SABRE2DiagramAi(JNodevalue,Massemble,BNodevalue,...
            SNodevalue,RNCc,NCc,Nshe1,Nshe2,DUP1,DUP2,Funew(:,:,IncreL),Rval,...
            pt_title_name,Qintf(:,:,IncreL),axesm,vstm);
      end        
   elseif isequal(Buc,5)   
      IncreL = 1;
      if ~isempty(Qintf)
         Rtype=6;
         SABRE2DiagramMz(JNodevalue,Massemble,BNodevalue,...
            SNodevalue,RNCc,NCc,Nshe1,Nshe2,DUP1,DUP2,Funew(:,:,IncreL),Rval,...
            pt_title_name,Qintf(:,:,IncreL),axesm,vstm);
      end      
   elseif isequal(Buc,6)
       if ~isempty(tau)
          SABRE2DiagramSRF(JNodevalue,Massemble,SNodevalue,RNCc,NCc,...
             Nshe1,Nshe2,DUP1,DUP2,tau,Rval,pt_title_name,axesm,vstm);     
       end 
   elseif isequal(Buc,7) 
       if ~isempty(Rpg)
          SABRE2DiagramSRF(JNodevalue,Massemble,SNodevalue,RNCc,NCc,...
             Nshe1,Nshe2,DUP1,DUP2,Rpg,Rval,pt_title_name,axesm,vstm);     
       end        
   elseif isequal(Buc,8) 
       if ~isempty(Rpc)
          SABRE2DiagramSRF(JNodevalue,Massemble,SNodevalue,RNCc,NCc,...
             Nshe1,Nshe2,DUP1,DUP2,Rpc,Rval,pt_title_name,axesm,vstm);     
       end    
   elseif isequal(Buc,9) 
       if ~isempty(Rpt)
          SABRE2DiagramSRF(JNodevalue,Massemble,SNodevalue,RNCc,NCc,...
             Nshe1,Nshe2,DUP1,DUP2,Rpt,Rval,pt_title_name,axesm,vstm);     
       end       
   elseif isequal(Buc,10) 
       if ~isempty(Rh)
          SABRE2DiagramSRF(JNodevalue,Massemble,SNodevalue,RNCc,NCc,...
             Nshe1,Nshe2,DUP1,DUP2,Rh,Rval,pt_title_name,axesm,vstm);     
       end        
   elseif isequal(Buc,11) 
       if ~isempty(Myc)
          Myc=round(Myc*10^1)/10^1;
          SABRE2DiagramSRF(JNodevalue,Massemble,SNodevalue,RNCc,NCc,...
             Nshe1,Nshe2,DUP1,DUP2,Myc,Rval,pt_title_name,axesm,vstm);     
       end       
   elseif isequal(Buc,12) 
       if ~isempty(Myt)
          Myt=round(Myt*10^1)/10^1;
          SABRE2DiagramSRF(JNodevalue,Massemble,SNodevalue,RNCc,NCc,...
             Nshe1,Nshe2,DUP1,DUP2,Myt,Rval,pt_title_name,axesm,vstm);     
       end      
   elseif isequal(Buc,13) 
       if ~isempty(My)
          My=round(My*10^1)/10^1;
          SABRE2DiagramSRF(JNodevalue,Massemble,SNodevalue,RNCc,NCc,...
             Nshe1,Nshe2,DUP1,DUP2,My,Rval,pt_title_name,axesm,vstm);     
       end   
   elseif isequal(Buc,14) 
       if ~isempty(Jval)
          SABRE2DiagramSRF(JNodevalue,Massemble,SNodevalue,RNCc,NCc,...
             Nshe1,Nshe2,DUP1,DUP2,Jval,Rval,pt_title_name,axesm,vstm);     
       end            
    elseif isequal(Buc,15)      
       if ~isempty(Phi_Mmax)
          Phi_Mmax=round(Phi_Mmax*10^1)/10^1;
          SABRE2DiagramSRF(JNodevalue,Massemble,SNodevalue,RNCc,NCc,...
             Nshe1,Nshe2,DUP1,DUP2,Phi_Mmax,Rval,pt_title_name,axesm,vstm);     
       end      
   elseif isequal(Buc,16)
       if ~isempty(Phi_Py)
          Phi_Py=round(Phi_Py*10^1)/10^1;
          SABRE2DiagramSRF(JNodevalue,Massemble,SNodevalue,RNCc,NCc,...
             Nshe1,Nshe2,DUP1,DUP2,Phi_Py,Rval,pt_title_name,axesm,vstm);     
       end    
   elseif isequal(Buc,17)
       if ~isempty(UC)
          SABRE2DiagramSRF(JNodevalue,Massemble,SNodevalue,RNCc,NCc,...
             Nshe1,Nshe2,DUP1,DUP2,UC,Rval,pt_title_name,axesm,vstm);     
       end           
   else
   
      SABRE2ModelP(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j, ...
          Rval,BNodevalue,vrum_az_slider,vrum_el_slider,vrum_az_edit,vrum_el_edit,axesm,vstm);   
      
      RNCc=[];Nshe1=[];Nshe2=[];DUP1=[];DUP2=[];NCc=[];Bhe1=[];Bhe2=[];
      The1=[];The2=[];Bhg=[];Thg=[];CSg=[];BNC1=[];BNC2=[];FEL=[]; SGhe1=[]; SGhe2=[];
      PNC=[];PNC1=[];PNC2=[]; LNC=[];LNC1=[];LNC2=[];
      % get geometry table data   
      G_getdata=get(ptable_node,'Data');
      Gflag=0;
      for i=2:length(G_getdata(1,:))
         if isequal(G_getdata(1,i),0) || isequal(G_getdata(2,i),0) ...
               || isequal(G_getdata(3,i),0) || isequal(G_getdata(4,i),0) ...
               || isequal(G_getdata(5,i),0) || isequal(G_getdata(6,i),0) ...
               || isequal(G_getdata(7,i),0)
            Gflag = Gflag+1;
         end
      end

      if ~isequal(Gflag,0)
         set(pt_title_name,'String','Please define proper geometries & loads')
         set(pt_title_name,'Visible','on')  
      else
         if isempty(Massemble) || isempty(SNodevalue)
         else                  
               % Drawing Nodal white points & generate NC
               [RNCc,Nshe1,Nshe2,DUP1,DUP2,NCc,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,BNC1,BNC2,FEL,error]=SABRE2LBCODE(JNodevalue,...
                  Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,SNodevalue,...
                  RNCc,Nshe1,Nshe2,DUP1,DUP2,NCc,LNC,LUEC,PNC,BNC,BNC1,BNC2,FEL,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,pt_title_name,axesm,vstm);   

               [PNC,PNC1,PNC2]=SABRE2BConApp(JNodevalue,Massemble,Rval,...
                  BNodevalue,RNCc,DUP1,DUP2,PNC,PNC1,PNC2,Bhg,Thg,CSg,ptable_node,pt_title_name,axesm); 

               [LNC,LNC1,LNC2]=SABRE2ForcApp(JNodevalue,Massemble,Rval,...
                  RNCc,DUP1,DUP2,LNC,LNC1,LNC2,LUEC,Nshe1,Nshe2,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,...
                  ptable_node,pt_title_name,axesm,vstm);                

         end
      end
   end
   
end % function end

% --------------------------------------------------------------------
function view_center_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   movegui(gcf,'center')
end % function end

% --------------------------------------------------------------------
function view_diagram_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   if strcmp(get(gcbo, 'Checked'),'on')     
      set(vdum, 'Checked', 'off');
      set([vdum_panel,vdum_type_subpanel],'Visible','off')
      set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','off') 
      set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','off')
   else
      set(vdum, 'Checked', 'on');
      set([vdum_panel,vdum_type_subpanel],'Visible','on')
      set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','on') 
      set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','on')      
   end   
end % function end

% --------------------------------------------------------------------
function view_text_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   if strcmp(get(gcbo, 'Checked'),'on')     
      set(vtum, 'Checked', 'off');
      set(findobj('Type','text'),'Visible','off')
      set(findobj('Tag','axis'),'Visible','on')
   else
      set(vtum, 'Checked', 'on');
      set(findobj('Type','text'),'Visible','on')
      set(findobj('Tag','axis'),'Visible','on')
      set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
   end   
end % function end
% --------------------------------------------------------------------
function view_screenshot_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   if strcmp(get(gcbo, 'Checked'),'on')     
      set(vstm, 'Checked', 'off');
      set(masterf,'Color','k')
      set(pt_title_name,'BackgroundColor','k','ForegroundColor','r')
      set(findobj('Tag','IPanel'),'BackgroundColor',[0.9412 0.9412 0.9412])
      set(findobj('Tag','ITitle'),'ForegroundColor','b','BackgroundColor',[0.9412 0.9412 0.9412])     
      set(findobj('Tag','IText'),'ForegroundColor','k','BackgroundColor',[0.9412 0.9412 0.9412])
      set(findobj('Tag','Text'),'Color','w');set(findobj('Tag','axis'),'Color','w');set(findobj('Tag','S'),'Color','w');
      set(findobj('Tag','JN'),'Color','w');set(findobj('Tag','M'),'Color','w');set(findobj('Tag','EF'),'Color','w');
      set(findobj('Tag','OTF'),'FaceColor',[0.7 0.7 0.7],'EdgeColor',[0.3 0.3 0.3]);
      set(findobj('Tag','OWEB'),'FaceColor',[0.8 0.8 0.8],'EdgeColor',[0.3 0.3 0.3]);
      set(findobj('Tag','OBF'),'FaceColor',[0.7 0.7 0.7],'EdgeColor',[0.3 0.3 0.3]); 
      set(findobj('Tag','SRFT'),'Color','w');set(findobj('Tag','DiagramFrame'),'Color','w');set(findobj('Tag','DiagramBi'),'Color','w');
      set(findobj('Tag','DiagramAi'),'Color','w');set(findobj('Tag','DiagramSy'),'Color','w');set(findobj('Tag','DiagramSz'),'Color','w');
      set(findobj('Tag','DiagramMt'),'Color','w');set(findobj('Tag','DiagramMy'),'Color','w');set(findobj('Tag','DiagramMz'),'Color','w');
      if ~isempty(RNCc)
         for i = 1:length(RNCc(:,1))
            set(findobj('Tag',['RNCc',num2str(i)]),'Color','w');
            set(findobj('Tag',['OTFB',num2str(i)]),'FaceColor',[0.7 0.7 0.7],'EdgeColor',[0.3 0.3 0.3]);
            set(findobj('Tag',['OWEBB',num2str(i)]),'FaceColor',[0.8 0.8 0.8],'EdgeColor',[0.3 0.3 0.3]);
            set(findobj('Tag',['OBFB',num2str(i)]),'FaceColor',[0.7 0.7 0.7],'EdgeColor',[0.3 0.3 0.3]);
         end
      end
   else
      set(vstm, 'Checked', 'on');
      set(masterf,'Color','w')
      set(pt_title_name,'BackgroundColor','w','ForegroundColor','b')
      set(findobj('Tag','IPanel'),'BackgroundColor','k')
      set(findobj('Tag','ITitle'),'ForegroundColor','y','BackgroundColor','k')
      set(findobj('Tag','IText'),'ForegroundColor','w','BackgroundColor','k')     
      set(findobj('Tag','Text'),'Color','k');set(findobj('Tag','axis'),'Color','k');set(findobj('Tag','S'),'Color','k');
      set(findobj('Tag','JN'),'Color','k');set(findobj('Tag','M'),'Color','k');set(findobj('Tag','EF'),'Color','k');
      set(findobj('Tag','OTF'),'FaceColor',[0.6 0.6 0.6],'EdgeColor',[0.6 0.6 0.6]);
      set(findobj('Tag','OWEB'),'FaceColor',[0.7 0.7 0.7],'EdgeColor',[0.6 0.6 0.6]);
      set(findobj('Tag','OBF'),'FaceColor',[0.6 0.6 0.6],'EdgeColor',[0.6 0.6 0.6]);   
      set(findobj('Tag','SRFT'),'Color','k');set(findobj('Tag','DiagramFrame'),'Color',[0 0.5 1]);set(findobj('Tag','DiagramBi'),'Color','k');
      set(findobj('Tag','DiagramAi'),'Color','k');set(findobj('Tag','DiagramSy'),'Color','k');set(findobj('Tag','DiagramSz'),'Color','k');
      set(findobj('Tag','DiagramMt'),'Color','k');set(findobj('Tag','DiagramMy'),'Color','k');set(findobj('Tag','DiagramMz'),'Color','k');      
      if ~isempty(RNCc)
         for i = 1:length(RNCc(:,1))
            set(findobj('Tag',['RNCc',num2str(i)]),'Color',[0 0.5 1]);
            set(findobj('Tag',['OTFB',num2str(i)]),'FaceColor',[0.6 0.6 0.6],'EdgeColor',[0.6 0.6 0.6]);
            set(findobj('Tag',['OWEBB',num2str(i)]),'FaceColor',[0.7 0.7 0.7],'EdgeColor',[0.6 0.6 0.6]);
            set(findobj('Tag',['OBFB',num2str(i)]),'FaceColor',[0.6 0.6 0.6],'EdgeColor',[0.6 0.6 0.6]);
         end
      end      
   end    
end % function end
% ******************************************************** View Callback E

% **************************************************** Modeling Callback S
% --------------------------------------------------------------------
function gtable_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   set(masterf,'WindowButtonDownFcn',@gtable_menu_Callback); 
   SABRE2Table(pn_panel,pt_title_name,fim_infor_name,ptable_type_subpanel,...
      ptable_type_text,ptable_node_subpanel,pdesign_text,pdesign_edit,punit_text,punit_edit,ptable_node_text,ptable_node,ptable_wsection_text,...
      ptable_wsection_edit,ptable_set,ptable_wsname_edit,ptable_seg_subpanel,...
      ptable_seg_text,ptable_seg,ptable_brac_subpanel,ptable_brac_text,ptable_addbracing,...
      ptable_remove_edit,ptable_removebracing,ptable_app_subpanel,ptable_apply,...
      ptable_cancel,ap_type_text,ap_jval_subpanel,ap_jval_text,ap_jval_buttongroup,...
      ap_jval_on_radiobutton,ap_jval_off_radiobutton,ap_AISC_subpanel,ap_AISC_text,...
      ap_AISC_buttongroup,ap_AISC_on_radiobutton,ap_AISC_off_radiobutton,ap_bracket_subpanel,...
      ap_bracket_text,ap_cv_buttongroup,ap_cv_on_radiobutton,ap_cv_off_radiobutton,...
      ap_jeong_text,ap_brent_text,ap_jeong_edit,ap_brent_edit,ap_2nd_subpanel,...
      ap_2nd_text,ap_da_text,ap_da_buttongroup,ap_da_on_radiobutton,ap_da_off_radiobutton,...
      am3_type_text,am4_type_text,am6_type_text,res_subpanel,res_text,recba_gamma_text,...
      recba_scale_text,recba_gamma_edit,recba_Scale_edit,recba_tau_text,recba_tau_diagram,...
      auto_type_text,auto_modelname_text,auto_modelnum_text,auto_modelname_edit,auto_modelnum_edit,...
      auto_lin_apply,auto_nonlin_apply); 
   set( gca, 'Units', 'normalized', 'Position', [0 0 0.8 1] );
   Buc=0;
   SABRE2Model(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,Rval,...
      BNodevalue,vrum_az_slider,vrum_el_slider,vrum_az_edit,vrum_el_edit,axesm,vstm);   
   % get geometry table data   
   G_getdata=get(ptable_node,'Data');
   Gflag=0;
   for i=2:length(G_getdata(1,:))
      if isequal(G_getdata(1,i),0) || isequal(G_getdata(2,i),0) ...
            || isequal(G_getdata(3,i),0) || isequal(G_getdata(4,i),0) ...
            || isequal(G_getdata(5,i),0) || isequal(G_getdata(6,i),0) ...
            || isequal(G_getdata(7,i),0)
         Gflag = Gflag+1;
      end
   end
   
   if ~isequal(Gflag,0)
      set(pt_title_name,'String','Please edit the Modeling input tables and click Apply')
      set(pt_title_name,'Visible','on')  
   else  
      % Drawing Nodal white points & generate NC
      [RNCc,Nshe1,Nshe2,DUP1,DUP2,NCc,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,BNC1,BNC2,FEL,error]=SABRE2LBCODE(JNodevalue,...
         Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,SNodevalue,...
         RNCc,Nshe1,Nshe2,DUP1,DUP2,NCc,LNC,LUEC,PNC,BNC,BNC1,BNC2,FEL,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,pt_title_name,axesm,vstm);   

      [PNC,PNC1,PNC2]=SABRE2BConApp(JNodevalue,Massemble,Rval,...
         BNodevalue,RNCc,DUP1,DUP2,PNC,PNC1,PNC2,Bhg,Thg,CSg,ptable_node,pt_title_name,axesm); 

      [LNC,LNC1,LNC2]=SABRE2ForcApp(JNodevalue,Massemble,Rval,...
         RNCc,DUP1,DUP2,LNC,LNC1,LNC2,LUEC,Nshe1,Nshe2,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,...
         ptable_node,pt_title_name,axesm,vstm); 
   end
   set([vdum,vtum], 'enable', 'off'); set([vdum_panel,vdum_type_subpanel],'Visible','off')
   set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','off') 
   set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','off')     
end % function end


% --------------------------------------------------------------------
function analysis_para_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   set([vdum,vtum], 'enable', 'off'); set([vdum_panel,vdum_type_subpanel],'Visible','off')
   set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','off') 
   set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','off')  
%    set(ap_sw_on_radiobutton,'Value',AnalP(1,1));set(ap_sw_off_radiobutton,'Value',AnalP(1,2));
   if isequal(AnalP(2,1),0)
      set(ap_jval_on_radiobutton,'Value',0);set(ap_jval_off_radiobutton,'Value',1);
   else
      set(ap_jval_on_radiobutton,'Value',1);set(ap_jval_off_radiobutton,'Value',0);
   end
   if isequal(AnalP(3,1),0)
      set(ap_AISC_on_radiobutton,'Value',0);set(ap_AISC_off_radiobutton,'Value',1);
   else
      set(ap_AISC_on_radiobutton,'Value',1);set(ap_AISC_off_radiobutton,'Value',0);
   end
   if isequal(AnalP(4,1),0)
      set(ap_da_on_radiobutton,'Value',0);set(ap_da_off_radiobutton,'Value',1);   
   else
      set(ap_da_on_radiobutton,'Value',1);set(ap_da_off_radiobutton,'Value',0); 
   end
   set( gca, 'Units', 'normalized', 'Position', [0 0 0.8 1] );
end % function end
% --------------------------------------------------------------------
function analysis_parasub_menu_Callback(hObject, eventdata)
   set(masterf,'WindowButtonDownFcn',@analysis_parasub_menu_Callback); 
   AnalP=SABRE2AnalParaFun(pn_panel,pt_title_name,fim_infor_name,ptable_type_subpanel,...
      ptable_type_text,ptable_node_subpanel,pdesign_text,pdesign_edit,punit_text,punit_edit,ptable_node_text,ptable_node,ptable_wsection_text,...
      ptable_wsection_edit,ptable_set,ptable_wsname_edit,ptable_seg_subpanel,...
      ptable_seg_text,ptable_seg,ptable_brac_subpanel,ptable_brac_text,ptable_addbracing,...
      ptable_remove_edit,ptable_removebracing,ptable_app_subpanel,ptable_apply,...
      ptable_cancel,ap_type_text,ap_jval_subpanel,ap_jval_text,ap_jval_buttongroup,...
      ap_jval_on_radiobutton,ap_jval_off_radiobutton,ap_AISC_subpanel,ap_AISC_text,...
      ap_AISC_buttongroup,ap_AISC_on_radiobutton,ap_AISC_off_radiobutton,ap_bracket_subpanel,...
      ap_bracket_text,ap_cv_buttongroup,ap_cv_on_radiobutton,ap_cv_off_radiobutton,...
      ap_jeong_text,ap_brent_text,ap_jeong_edit,ap_brent_edit,ap_2nd_subpanel,...
      ap_2nd_text,ap_da_text,ap_da_buttongroup,ap_da_on_radiobutton,ap_da_off_radiobutton,...
      am3_type_text,am4_type_text,am6_type_text,res_subpanel,res_text,recba_gamma_text,...
      recba_scale_text,recba_gamma_edit,recba_Scale_edit,recba_tau_text,recba_tau_diagram,...
      auto_type_text,auto_modelname_text,auto_modelnum_text,auto_modelname_edit,auto_modelnum_edit,...
      auto_lin_apply,auto_nonlin_apply,AnalP);
   set( gca, 'Units', 'normalized', 'Position', [0 0 0.8 1] );
end % function end

% **************************************************** Analysis Callback S
% --------------------------------------------------------------------
function analysis_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   set(recba_tau_diagram,'Value',1)
   set( gca, 'Units', 'normalized', 'Position', [0 0 0.8 1] );
   Buc=0;ptable_apply_pushbutton_Callback;
   if ~isempty(SNodevalue)
%       if isempty(LUEC)
         xn = sum(sum(SNodevalue(:,:,3)));   % Total number of Elements
         LUEC=zeros(xn,20); % zeros matrix length(NC(:,1)) x 11
%       end
      if isempty(LNC)
         LNC=zeros(length(RNCc(:,1)),14);LNC1=zeros(length(DUP1(:,1)),14);LNC2=zeros(length(DUP2(:,1)),14);      
      end
   end   
   SABRE2Model(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,Rval,...
      BNodevalue,vrum_az_slider,vrum_el_slider,vrum_az_edit,vrum_el_edit,axesm,vstm);   
     
   % get geometry table data   
   G_getdata=get(ptable_node,'Data');
   Gflag=0;
   for i=2:length(G_getdata(1,:))
      if isequal(G_getdata(1,i),0) || isequal(G_getdata(2,i),0) ...
            || isequal(G_getdata(3,i),0) || isequal(G_getdata(4,i),0) ...
            || isequal(G_getdata(5,i),0) || isequal(G_getdata(6,i),0) ...
            || isequal(G_getdata(7,i),0)
         Gflag = Gflag+1;
      end
   end
   
   if ~isequal(Gflag,0)
      set(pt_title_name,'String','Please edit the Modeling input tables and click Apply')
      set(pt_title_name,'Visible','on')  
   else
      % Drawing Nodal white points & generate NC
      [RNCc,Nshe1,Nshe2,DUP1,DUP2,NCc,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,BNC1,BNC2,FEL,error]=SABRE2LBCODE(JNodevalue,...
         Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,SNodevalue,...
         RNCc,Nshe1,Nshe2,DUP1,DUP2,NCc,LNC,LUEC,PNC,BNC,BNC1,BNC2,FEL,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,pt_title_name,axesm,vstm);    

      [PNC,PNC1,PNC2]=SABRE2BConApp(JNodevalue,Massemble,Rval,...
         BNodevalue,RNCc,DUP1,DUP2,PNC,PNC1,PNC2,Bhg,Thg,CSg,ptable_node,pt_title_name,axesm); 

      [LNC,LNC1,LNC2]=SABRE2ForcApp(JNodevalue,Massemble,Rval,...
         RNCc,DUP1,DUP2,LNC,LNC1,LNC2,LUEC,Nshe1,Nshe2,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,...
         ptable_node,pt_title_name,axesm,vstm); 
   end
   set([vdum,vtum], 'enable', 'off'); set([vdum_panel,vdum_type_subpanel],'Visible','off')
   set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','off') 
   set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','off')        
   switch get(get(ap_AISC_buttongroup,'SelectedObject'),'Tag')
      case 'AISC_on' 
         LIAType=0; NLIAType=0;             
      case 'AISC_off'
         LIAType=1; NLIAType=1; 
   end        
   AnalP(1,1) = 0; AnalP(2,1)=get(ap_jval_on_radiobutton,'Value');
   AnalP(3,1)=get(ap_AISC_on_radiobutton,'Value');AnalP(4,1)=get(ap_da_on_radiobutton,'Value');
   AnalP(5,1)=1;AnalP(6,1)=1;   
   
end % function end

% --------------------------------------------------------------------
function analysis_ecba_menu_Callback(hObject,eventdata) 
   set(masterf,'WindowButtonDownFcn',@analysis_para_Callback);
   % Visible function
   SABRE2AELFun(pn_panel,pt_title_name,fim_infor_name,ptable_type_subpanel,...
      ptable_type_text,ptable_node_subpanel,pdesign_text,pdesign_edit,punit_text,punit_edit,ptable_node_text,ptable_node,ptable_wsection_text,...
      ptable_wsection_edit,ptable_set,ptable_wsname_edit,ptable_seg_subpanel,...
      ptable_seg_text,ptable_seg,ptable_brac_subpanel,ptable_brac_text,ptable_addbracing,...
      ptable_remove_edit,ptable_removebracing,ptable_app_subpanel,ptable_apply,...
      ptable_cancel,ap_type_text,ap_jval_subpanel,ap_jval_text,ap_jval_buttongroup,...
      ap_jval_on_radiobutton,ap_jval_off_radiobutton,ap_AISC_subpanel,ap_AISC_text,...
      ap_AISC_buttongroup,ap_AISC_on_radiobutton,ap_AISC_off_radiobutton,ap_bracket_subpanel,...
      ap_bracket_text,ap_cv_buttongroup,ap_cv_on_radiobutton,ap_cv_off_radiobutton,...
      ap_jeong_text,ap_brent_text,ap_jeong_edit,ap_brent_edit,ap_2nd_subpanel,...
      ap_2nd_text,ap_da_text,ap_da_buttongroup,ap_da_on_radiobutton,ap_da_off_radiobutton,...
      am3_type_text,am4_type_text,am6_type_text,res_subpanel,res_text,recba_gamma_text,...
      recba_scale_text,recba_gamma_edit,recba_Scale_edit,recba_tau_text,recba_tau_diagram,...
      auto_type_text,auto_modelname_text,auto_modelnum_text,auto_modelname_edit,auto_modelnum_edit,...
      auto_lin_apply,auto_nonlin_apply); 
   
   clc;pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   set(recba_tau_diagram,'Value',1);
   if isempty(RNCc) || isempty(PNC)     
      set(pt_title_name,'String','Modeling is not completed')
      set(pt_title_name,'Visible','on') 
   else
      if isequal(max(max(abs(LNC(:,5:10)))),0) && isequal(max(max(abs(LUEC(:,5:7)))),0) 
         set(pt_title_name,'String','Modeling is not completed')
         set(pt_title_name,'Visible','on') 
      else
         set(pt_title_name,'Visible','off') 
         AR=0;AS=0;AE=0;AI=0;ANE=0;ANI=0;lambda = 1;
         nmode = 1; ninc = 1;   
         switch get(get(ap_jval_buttongroup,'SelectedObject'),'Tag')
            case 'jval_on' 
               [AE,gammma,EGunew,Qintf,Qintg] = AlanysisBucklingESL(Massemble,...
                  Rval,JNodevalue_i,JNodevalue_j,SNodevalue,RNCc,Nshe1,Nshe2,DUP1,DUP2,LNC,LNC1,LNC2,...
                  LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,nmode,ninc,lambda,pt_title_name,LIAType);  
               set(recba_gamma_edit,'String',num2str(gammma));
            case 'jval_off'
               [AE,gammma,EGunew,Qintf,Qintg] = AlanysisBuckling(Massemble,...
                  Rval,JNodevalue_i,JNodevalue_j,SNodevalue,RNCc,Nshe1,Nshe2,DUP1,DUP2,LNC,LNC1,LNC2,...
                  LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,nmode,ninc,lambda,pt_title_name); 
               set(recba_gamma_edit,'String',num2str(gammma));
         end 
         results_diagram_menu_Callback;
         set(recba_Scale_edit,'String',num2str(1.2*max(max(RNCc(:,5)),max(RNCc(:,7)))));
         set(recba_tau_diagram,'Value',2); 
         if ~isequal( min(min(min(Qintf))), 0) 
            recba_tau_diagram_pushbutton_Callback; 
         end
      end
   end
   set(v1um_p1_edit,'String','');set(v1um_p2_edit,'String','');set(v1um_p3_edit,'String','');
   set(v1um_p4_edit,'String','');set(v1um_p5_edit,'String','');
    
end % function end

% --------------------------------------------------------------------
function analysis_icba_menu_Callback(hObject,eventdata) 
   set(masterf,'WindowButtonDownFcn',@analysis_para_Callback);   
   % Visible function
   SABRE2AINELFun(pn_panel,pt_title_name,fim_infor_name,ptable_type_subpanel,...
      ptable_type_text,ptable_node_subpanel,pdesign_text,pdesign_edit,punit_text,punit_edit,ptable_node_text,ptable_node,ptable_wsection_text,...
      ptable_wsection_edit,ptable_set,ptable_wsname_edit,ptable_seg_subpanel,...
      ptable_seg_text,ptable_seg,ptable_brac_subpanel,ptable_brac_text,ptable_addbracing,...
      ptable_remove_edit,ptable_removebracing,ptable_app_subpanel,ptable_apply,...
      ptable_cancel,ap_type_text,ap_jval_subpanel,ap_jval_text,ap_jval_buttongroup,...
      ap_jval_on_radiobutton,ap_jval_off_radiobutton,ap_AISC_subpanel,ap_AISC_text,...
      ap_AISC_buttongroup,ap_AISC_on_radiobutton,ap_AISC_off_radiobutton,ap_bracket_subpanel,...
      ap_bracket_text,ap_cv_buttongroup,ap_cv_on_radiobutton,ap_cv_off_radiobutton,...
      ap_jeong_text,ap_brent_text,ap_jeong_edit,ap_brent_edit,ap_2nd_subpanel,...
      ap_2nd_text,ap_da_text,ap_da_buttongroup,ap_da_on_radiobutton,ap_da_off_radiobutton,...
      am3_type_text,am4_type_text,am6_type_text,res_subpanel,res_text,recba_gamma_text,...
      recba_scale_text,recba_gamma_edit,recba_Scale_edit,recba_tau_text,recba_tau_diagram,...
      auto_type_text,auto_modelname_text,auto_modelnum_text,auto_modelname_edit,auto_modelnum_edit,...
      auto_lin_apply,auto_nonlin_apply);  
   
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   set(recba_tau_diagram,'Value',1);
   if isempty(RNCc) || isempty(PNC)     
      set(pt_title_name,'String','Modeling is not completed')
      set(pt_title_name,'Visible','on') 
   else
      if isequal(max(max(abs(LNC(:,5:10)))),0) && isequal(max(max(abs(LUEC(:,5:7)))),0)
         set(pt_title_name,'String','Modeling is not completed')
         set(pt_title_name,'Visible','on')
      else
         set(pt_title_name,'Visible','off') 
         AR=0;AS=0;AE=0;AI=0;ANE=0;ANI=0;lambda = 1;nmode = 1;ninc = 1;
         JeongP=str2double(get(ap_jeong_edit,'String'));BrentP=str2double(get(ap_brent_edit,'String'));  
         [AI,gammma,EGunew,Qintf,Qintg,tau,Rpg,Rpc,Rpt,Rh,Myc,Myt,My,Jval,Phi_Mmax,Phi_Py,UC,crLTB,LGv] = AlanysisIEBuckling(Massemble,...
            Rval,JNodevalue_i,JNodevalue_j,SNodevalue,RNCc,Nshe1,Nshe2,DUP1,DUP2,LNC,LNC1,LNC2,...
            LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,nmode,ninc,lambda,pt_title_name,...
            ap_cv_buttongroup,JeongP,BrentP,LIAType); 
         set(recba_gamma_edit,'String',num2str(gammma));
         results_diagram_menu_Callback;
         set(recba_Scale_edit,'String',num2str(1.2*max(max(RNCc(:,5)),max(RNCc(:,7)))));
         set(recba_tau_diagram,'Value',2);
         if ~isequal( min(min(min(Qintf))), 0)
            recba_tau_diagram_pushbutton_Callback;   
         end
         LIA = LIAType;
      end
   end
   set(v1um_p1_edit,'String','');set(v1um_p2_edit,'String','');set(v1um_p3_edit,'String','');
   set(v1um_p4_edit,'String','');set(v1um_p5_edit,'String','');
end % function end

% --------------------------------------------------------------------
function analysis_nonicba_menu_Callback(hObject,eventdata) 
   set(masterf,'WindowButtonDownFcn',@analysis_para_Callback);
   % Visible function
   SABRE2ANONINELFun(pn_panel,pt_title_name,fim_infor_name,ptable_type_subpanel,...
      ptable_type_text,ptable_node_subpanel,pdesign_text,pdesign_edit,punit_text,punit_edit,ptable_node_text,ptable_node,ptable_wsection_text,...
      ptable_wsection_edit,ptable_set,ptable_wsname_edit,ptable_seg_subpanel,...
      ptable_seg_text,ptable_seg,ptable_brac_subpanel,ptable_brac_text,ptable_addbracing,...
      ptable_remove_edit,ptable_removebracing,ptable_app_subpanel,ptable_apply,...
      ptable_cancel,ap_type_text,ap_jval_subpanel,ap_jval_text,ap_jval_buttongroup,...
      ap_jval_on_radiobutton,ap_jval_off_radiobutton,ap_AISC_subpanel,ap_AISC_text,...
      ap_AISC_buttongroup,ap_AISC_on_radiobutton,ap_AISC_off_radiobutton,ap_bracket_subpanel,...
      ap_bracket_text,ap_cv_buttongroup,ap_cv_on_radiobutton,ap_cv_off_radiobutton,...
      ap_jeong_text,ap_brent_text,ap_jeong_edit,ap_brent_edit,ap_2nd_subpanel,...
      ap_2nd_text,ap_da_text,ap_da_buttongroup,ap_da_on_radiobutton,ap_da_off_radiobutton,...
      am3_type_text,am4_type_text,am6_type_text,res_subpanel,res_text,recba_gamma_text,...
      recba_scale_text,recba_gamma_edit,recba_Scale_edit,recba_tau_text,recba_tau_diagram,...
      auto_type_text,auto_modelname_text,auto_modelnum_text,auto_modelname_edit,auto_modelnum_edit,...
      auto_lin_apply,auto_nonlin_apply);  
   
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   set(recba_tau_diagram,'Value',1);
   if isempty(RNCc) || isempty(PNC)     
      set(pt_title_name,'String','Modeling is not completed')
      set(pt_title_name,'Visible','on') 
   else
      if isequal(max(max(abs(LNC(:,5:10)))),0) && isequal(max(max(abs(LUEC(:,5:7)))),0) 
         set(pt_title_name,'String','Modeling is not completed')
         set(pt_title_name,'Visible','on')     
      else
         set(pt_title_name,'Visible','off') 
         AR=0;AS=0;AE=0;AI=0;ANE=0;ANI=0;lambda = 1;nmode = 1;ninc = 1;
         JeongP=str2double(get(ap_jeong_edit,'String'));BrentP=str2double(get(ap_brent_edit,'String'));    
         [ANI,gammma,EGunew,Qintf,Qintg,tau,Rpg,Rpc,Rpt,Rh,Myc,Myt,My,Jval,Phi_Mmax,Phi_Py,UC,crLTB,LGv] = AnalysisNonIEBuckling(Massemble,...
            Rval,JNodevalue_i,JNodevalue_j,SNodevalue,RNCc,Nshe1,Nshe2,DUP1,DUP2,LNC,LNC1,LNC2,...
            LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,nmode,ninc,lambda,pt_title_name,...
            ap_da_buttongroup,ap_cv_buttongroup,JeongP,BrentP,NLIAType);   
         set(recba_gamma_edit,'String',num2str(gammma));
         results_diagram_menu_Callback;
         set(recba_Scale_edit,'String',num2str(1.2*max(max(RNCc(:,5)),max(RNCc(:,7)))));
         set(recba_tau_diagram,'Value',2);
         if ~isequal( min(min(min(Qintf))), 0)
            recba_tau_diagram_pushbutton_Callback; 
         end
      end
   end
   set(v1um_p1_edit,'String','');set(v1um_p2_edit,'String','');set(v1um_p3_edit,'String','');
   set(v1um_p4_edit,'String','');set(v1um_p5_edit,'String',''); 
end % function end

% --------------------------------------------------------------------
function results_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   if strcmp(get(gcbo,'type'),'uimenu') 
      OBJ=get(gcbo,'Tag');
   end   
   SABRE2Model(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j, ...
      Rval,BNodevalue,vrum_az_slider,vrum_el_slider,vrum_az_edit,vrum_el_edit,axesm,vstm);   
   % Drawing Nodal white points & generate NC
   [RNCc,Nshe1,Nshe2,DUP1,DUP2,NCc,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,BNC1,BNC2,FEL,error]=SABRE2LBCODE(JNodevalue,...
      Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,SNodevalue,...
      RNCc,Nshe1,Nshe2,DUP1,DUP2,NCc,LNC,LUEC,PNC,BNC,BNC1,BNC2,FEL,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,pt_title_name,axesm,vstm);    
   % Drawing M*S* 
   SABRE2AssiCODE(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,...
      Rval,BNodevalue,SNodevalue,axesm,vstm); 
   set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'string',''); 
   Rtype =0; set(recba_tau_diagram,'Value',1);
   set( gca, 'Units', 'normalized', 'Position', [0 0 0.8 1] ); 

end % function end   
% --------------------------------------------------------------------
function results_diagram_menu_Callback(hObject, eventdata)
   set(masterf,'WindowButtonDownFcn',@results_diagram_menu_Callback);
   SABRE2Results(pn_panel,pt_title_name,fim_infor_name,ptable_type_subpanel,...
      ptable_type_text,ptable_node_subpanel,pdesign_text,pdesign_edit,punit_text,punit_edit,ptable_node_text,ptable_node,ptable_wsection_text,...
      ptable_wsection_edit,ptable_set,ptable_wsname_edit,ptable_seg_subpanel,...
      ptable_seg_text,ptable_seg,ptable_brac_subpanel,ptable_brac_text,ptable_addbracing,...
      ptable_remove_edit,ptable_removebracing,ptable_app_subpanel,ptable_apply,...
      ptable_cancel,ap_type_text,ap_jval_subpanel,ap_jval_text,ap_jval_buttongroup,...
      ap_jval_on_radiobutton,ap_jval_off_radiobutton,ap_AISC_subpanel,ap_AISC_text,...
      ap_AISC_buttongroup,ap_AISC_on_radiobutton,ap_AISC_off_radiobutton,ap_bracket_subpanel,...
      ap_bracket_text,ap_cv_buttongroup,ap_cv_on_radiobutton,ap_cv_off_radiobutton,...
      ap_jeong_text,ap_brent_text,ap_jeong_edit,ap_brent_edit,ap_2nd_subpanel,...
      ap_2nd_text,ap_da_text,ap_da_buttongroup,ap_da_on_radiobutton,ap_da_off_radiobutton,...
      am3_type_text,am4_type_text,am6_type_text,res_subpanel,res_text,recba_gamma_text,...
      recba_scale_text,recba_gamma_edit,recba_Scale_edit,recba_tau_text,recba_tau_diagram,...
      auto_type_text,auto_modelname_text,auto_modelnum_text,auto_modelname_edit,auto_modelnum_edit,...
      auto_lin_apply,auto_nonlin_apply,AR,AS,AE,AI,ANE,ANI,Sincre,Rtype,Qintf,vdum,v1um_p1_edit,...
      v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit,tau,Rpg,Rpc,Rpt,Rh,Myc,Myt,My,Jval,Phi_Mmax,Phi_Py,UC);
   if isequal(AE,1) || isequal(AI,1) || isequal(AI,2) || isequal(AI,3) ...
         || isequal(ANE,1) || isequal(ANI,1) || isequal(ANI,2) || isequal(ANI,3)
      Funew=EGunew; 
   end 
   Fsize=get(recba_Scale_edit,'FontSize');
   set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'FontSize',Fsize)   
end % function end


% --------------------------------------------------------------------
function analysis_batch_Callback(hObject,eventdata) 
%    set(am_cv_on_radiobutton,'value',0);Buc=0;
%    set(am_cv_off_radiobutton,'value',1)  
   set([vdum,vtum],'enable','off');set([vdum,vtum], 'Checked', 'off');set([vdum_panel,vdum_type_subpanel],'Visible','off')
   set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','off') 
   set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','off')     
end % function end

% --------------------------------------------------------------------
function analysis_icba_batch_menu_Callback(hObject, eventdata)
   set(masterf,'WindowButtonDownFcn',@analysis_icba_batch_menu_Callback);
   SABRE2AELMultiFun(pn_panel,pt_title_name,fim_infor_name,ptable_type_subpanel,...
      ptable_type_text,ptable_node_subpanel,pdesign_text,pdesign_edit,punit_text,punit_edit,ptable_node_text,ptable_node,ptable_wsection_text,...
      ptable_wsection_edit,ptable_set,ptable_wsname_edit,ptable_seg_subpanel,...
      ptable_seg_text,ptable_seg,ptable_brac_subpanel,ptable_brac_text,ptable_addbracing,...
      ptable_remove_edit,ptable_removebracing,ptable_app_subpanel,ptable_apply,...
      ptable_cancel,ap_type_text,ap_jval_subpanel,ap_jval_text,ap_jval_buttongroup,...
      ap_jval_on_radiobutton,ap_jval_off_radiobutton,ap_AISC_subpanel,ap_AISC_text,...
      ap_AISC_buttongroup,ap_AISC_on_radiobutton,ap_AISC_off_radiobutton,ap_bracket_subpanel,...
      ap_bracket_text,ap_cv_buttongroup,ap_cv_on_radiobutton,ap_cv_off_radiobutton,...
      ap_jeong_text,ap_brent_text,ap_jeong_edit,ap_brent_edit,ap_2nd_subpanel,...
      ap_2nd_text,ap_da_text,ap_da_buttongroup,ap_da_on_radiobutton,ap_da_off_radiobutton,...
      am3_type_text,am4_type_text,am6_type_text,res_subpanel,res_text,recba_gamma_text,...
      recba_scale_text,recba_gamma_edit,recba_Scale_edit,recba_tau_text,recba_tau_diagram,...
      auto_type_text,auto_modelname_text,auto_modelnum_text,auto_modelname_edit,auto_modelnum_edit,...
      auto_lin_apply,auto_nonlin_apply); 
   set(auto_type_text,'String','Elastic Lin. Buckling','Visible','on')
end
% --------------------------------------------------------------------
function analysis_nonicba_batch_menu_Callback(hObject, eventdata)
   set(masterf,'WindowButtonDownFcn',@analysis_nonicba_batch_menu_Callback);
   SABRE2ANonLinMultiFun(pn_panel,pt_title_name,fim_infor_name,ptable_type_subpanel,...
      ptable_type_text,ptable_node_subpanel,pdesign_text,pdesign_edit,punit_text,punit_edit,ptable_node_text,ptable_node,ptable_wsection_text,...
      ptable_wsection_edit,ptable_set,ptable_wsname_edit,ptable_seg_subpanel,...
      ptable_seg_text,ptable_seg,ptable_brac_subpanel,ptable_brac_text,ptable_addbracing,...
      ptable_remove_edit,ptable_removebracing,ptable_app_subpanel,ptable_apply,...
      ptable_cancel,ap_type_text,ap_jval_subpanel,ap_jval_text,ap_jval_buttongroup,...
      ap_jval_on_radiobutton,ap_jval_off_radiobutton,ap_AISC_subpanel,ap_AISC_text,...
      ap_AISC_buttongroup,ap_AISC_on_radiobutton,ap_AISC_off_radiobutton,ap_bracket_subpanel,...
      ap_bracket_text,ap_cv_buttongroup,ap_cv_on_radiobutton,ap_cv_off_radiobutton,...
      ap_jeong_text,ap_brent_text,ap_jeong_edit,ap_brent_edit,ap_2nd_subpanel,...
      ap_2nd_text,ap_da_text,ap_da_buttongroup,ap_da_on_radiobutton,ap_da_off_radiobutton,...
      am3_type_text,am4_type_text,am6_type_text,res_subpanel,res_text,recba_gamma_text,...
      recba_scale_text,recba_gamma_edit,recba_Scale_edit,recba_tau_text,recba_tau_diagram,...
      auto_type_text,auto_modelname_text,auto_modelnum_text,auto_modelname_edit,auto_modelnum_edit,...
      auto_lin_apply,auto_nonlin_apply); 
   set(auto_type_text,'String','Inelastic Nonlin. Buckling','Visible','on')
end

% ************************************************************************
% *****************               STYLE              *********************
% ************************************************************************
% -------------------------------------------------------------------- 
function ptable_aisc_pushbutton_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');  
   wnum = get(ptable_wsection_edit,'Value');
   filename1='AISCSTEEL.mat';
   Sectiondata=load(fullfile(filename1));
   SECTION=Sectiondata.SECTION;
   TYPE=Sectiondata.TYPE;
   
   % get geometry table data
   G_getdata=get(ptable_node,'Data');

   % Assign geometry table data
   G_setdata=G_getdata;   
   dunit=get(punit_edit,'Value');
   if isequal(wnum,1) % AISC none
      
      for i=1:length(G_setdata(1,:))
         G_setdata(2,i) = 0;
         G_setdata(3,i) = 0;
         G_setdata(4,i) = 0; 
         G_setdata(5,i) = 0; 
         G_setdata(6,i) = 0; 
         G_setdata(7,i) = 0; 
         G_setdata(8,i) = 0;                 
      end
      
   elseif wnum > 1
      Ai=(SECTION((wnum-1),1))*(SECTION((wnum-1),2)) ...
         + (SECTION((wnum-1),3))*(SECTION((wnum-1),4)) ...
         + (SECTION((wnum-1),5)-2*SECTION((wnum-1),2))*(SECTION((wnum-1),6));
      Afls = (SECTION((wnum-1),7))- Ai;     % fillet Area
      
      for i=1:length(G_setdata(1,:))
         if isequal(dunit,1)
            G_setdata(2,i) = SECTION((wnum-1),1);
            G_setdata(3,i) = SECTION((wnum-1),2);
            G_setdata(4,i) = SECTION((wnum-1),3);          
            G_setdata(5,i) = SECTION((wnum-1),4);  
            G_setdata(6,i) = SECTION((wnum-1),5)-2*SECTION((wnum-1),2);  
            G_setdata(7,i) = SECTION((wnum-1),6);
            G_setdata(8,i) = Afls;
         elseif isequal(dunit,2)
            G_setdata(2,i) = SECTION((wnum-1),1)*2.54;
            G_setdata(3,i) = SECTION((wnum-1),2)*2.54;
            G_setdata(4,i) = SECTION((wnum-1),3)*2.54;          
            G_setdata(5,i) = SECTION((wnum-1),4)*2.54;  
            G_setdata(6,i) = (SECTION((wnum-1),5)-2*SECTION((wnum-1),2))*2.54;  
            G_setdata(7,i) = SECTION((wnum-1),6)*2.54;
            G_setdata(8,i) = Afls*2.54*2.54;            
         else
            
         end
      end
      set(ptable_wsname_edit,'String',num2str(TYPE((wnum),:)));
      
   end   
   set(ptable_node,'Data',G_setdata)
 end % function end

% -------------------------------------------------------------------- 
function ptable_add_pushbutton_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   %----------------------------- Geometry
   % get geometry table data
   G_getdata=get(ptable_node,'Data');
      
   % Automatic additional node numbering
   nextnnode = length(G_getdata(1,:))-1;
   
   % Assign geometry table data
   G_setdata=G_getdata(:,1:end-1);
   Gnode=[];
   if isequal(length(G_getdata(1,:)),2) % No internal node
      Gnode = ['Node ',num2str(nextnnode)]; % column name
      G_setdata(:,length(G_getdata(1,:))) =  G_getdata(:,1);
      G_setdata(:,length(G_getdata(1,:))+1) =  G_getdata(:,end);
   else
      for i=1:nextnnode
         Gnode = [Gnode;'Node ',num2str(i)];
      end
      G_setdata(:,length(G_getdata(1,:))) =  G_getdata(:,1);
      G_setdata(:,length(G_getdata(1,:))+1) =  G_getdata(:,end);         
      
   end

   % set additional node column name
   cnames_node = {'Joint 1',Gnode,'Joint 2'};
   set(ptable_node,'ColumnName',cnames_node)
   % set additional geometry table data
   set(ptable_node,'Data',G_setdata)
   
   %----------------------------- Material
   % get material table data
   M_getdata=get(ptable_seg,'Data');
      
   % Assign material table data
   M_setdata=M_getdata;
   Mseg=[];
   if isequal(length(M_getdata(1,:)),1)
      Mseg = ['Segment ',num2str(nextnnode+1)];
      M_setdata(:,length(M_getdata(1,:))+1) =  M_getdata(:,1);
   else
      for i=2:(nextnnode+1)
         Mseg = [Mseg;'Segment ',num2str(i)];
      end
      M_setdata(:,length(M_getdata(1,:))+1) =  M_getdata(:,1);         
      
   end

   % set additional node column name
   cnames_seg = {'Segment 1',Mseg};
   set(ptable_seg,'ColumnName',cnames_seg)
   % set additional geometry table data
   set(ptable_seg,'Data',M_setdata)   

   % ----------- Set remove node edit box
   % get geometry table data
   G_getdata=get(ptable_node,'Data');
   if isequal(length(G_getdata(1,:)),2)
      set(ptable_remove_edit,'String','NONE')
   else
      popnum = 1:1:(length(G_getdata(1,:))-2);
      set(ptable_remove_edit,'String',{'NONE',num2str(popnum')})      
   end   
   
   % Initially Auto Genetate BNodevalue for No Bracing Cases
   if isempty(BNodevalue)
         BNodevalue(1,1,1)=1;
         BNodevalue(1,1,2)=0; % 0 No bracing
   end 

   if ~isequal(length(G_getdata(1,:)),2)
      for i = 1:(length(G_getdata(1,:))-2)
         set(pdb_member_name,'String',num2str(1));
         set(pdb_type_name,'String',num2str(i));
         set(pdb_coordx_edit,'String',num2str(G_getdata(1,i+1)));
         set(pdb_coordy_edit,'String',num2str(0));
         set(pdb_coordz_edit,'String',num2str(0));    
         set(pdb_length_edit,'String',num2str(G_getdata(1,i+1)));
         set(pdb_bfb_edit,'String',num2str(G_getdata(2,i+1)));
         set(pdb_tfb_edit,'String',num2str(G_getdata(3,i+1)));
         set(pdb_bft_edit,'String',num2str(G_getdata(4,i+1)));
         set(pdb_tft_edit,'String',num2str(G_getdata(5,i+1)));
         set(pdb_dw_edit,'String',num2str(G_getdata(6,i+1)));
         set(pdb_tw_edit,'String',num2str(G_getdata(7,i+1)));
         set(pdb_fil_edit,'String',num2str(G_getdata(8,i+1)));
         set(pdb_step_edit,'Value',round(G_getdata(14,i+1)));
 
         [BNodevalue,steplength]=SABRE2SegmApp(JNodevalue,...
            Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,pt_title_name,...
            pdb_member_name,pdb_type_name,pdb_coordx_edit,pdb_coordy_edit,...
            pdb_coordz_edit,pdb_length_edit,pdb_bfb_edit,pdb_tfb_edit,...
            pdb_bft_edit,pdb_tft_edit,pdb_dw_edit,pdb_tw_edit,pdb_fil_edit,pdb_step_edit);         
      end
   end
   
   
 end % function end

% --------------------------------------------------------------------
function ptable_remove_pushbutton_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');     
   % node to remove
   rmnode=get(ptable_remove_edit,'Value');

   if ~isequal(rmnode,1)  
      
      %----------------------------- Geometry
      % get geometry table data
      G_getdata=get(ptable_node,'Data');

      % Assign geometry table data
      G_setdata=G_getdata;
      
      % Remove data
      G_setdata(:,rmnode)=[];
      
      if isequal(length(G_setdata(1,:)),2)
         cnames_node = {'Joint 1','Joint 2'};
      else
         for i=1:(length(G_setdata(1,:))-2)
            if isequal(i,1)
               Gnode = ['Node ',num2str(i)];
            else
               Gnode = [Gnode;'Node ',num2str(i)];
            end
         end
         cnames_node = {'Joint 1',Gnode,'Joint 2'};       
      end
      
      % set additional node column name
      set(ptable_node,'ColumnName',cnames_node)
      % set additional geometry table data
      set(ptable_node,'Data',G_setdata) 

      %----------------------------- Material
      % get material table data
      M_getdata=get(ptable_seg,'Data');
      
      % Assign material table data
      M_setdata=M_getdata;
      
      % Remove data
      M_setdata(:,rmnode)=[];      
      
      if isequal(length(M_setdata(1,:)),1)
         cnames_seg = {'Segment 1'};         
      else
         for i=1:(length(M_setdata(1,:))-1)
            if isequal(i,1)
               Mseg = ['Segment ',num2str(i+1)];
            else
               Mseg = [Mseg;'Segment ',num2str(i+1)];      
            end
         end
         cnames_seg = {'Segment 1',Mseg};
      end

      % set additional node column name
      set(ptable_seg,'ColumnName',cnames_seg)
      % set additional geometry table data
      set(ptable_seg,'Data',M_setdata)   
   end
   
   % ----------- Set remove node
   % get geometry table data
   G_getdata=get(ptable_node,'Data');

   if isequal(length(G_getdata(1,:)),2)
      set(ptable_remove_edit,'Value',1)
      set(ptable_remove_edit,'String','NONE')
   else
      set(ptable_remove_edit,'Value',1)
      set(ptable_remove_edit,'String','NONE')      
      popnum = 1:1:(length(G_getdata(1,:))-2);
      set(ptable_remove_edit,'String',{'NONE',num2str(popnum')})      
   end      

 end % function end  

% --------------------------------------------------------------------
function ptable_apply_pushbutton_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   gammma=[];EGunew=[];Qintf=[];Qintg=[];tau=[];Rpg=[];Rpc=[];Rpt=[];Rh=[];
   Myc=[];Myt=[];My=[];Jval=[];Phi_Py=[];Phi_Mmax=[]; UC =[];
   JNodevalue=[]; Massemble=[];JNodevalue_i=[];JNodevalue_j=[];
   Rval=[];BNodevalue=[];SNodevalue=[]; 
   dunit=get(punit_edit,'Value');
   if isequal(dunit,2)
      AnalP(7,1)=2;
   else
      AnalP(7,1)=1;
   end   
   % reset axesm
   azf=get(gca,'view'); % Get current view
   cla (axesm,'reset');
   view(azf(1,1), azf(1,2));
   axis manual;   
   set(axesm,'Visible','off','Units','normalized','DataAspectRatio',[1 1 1]) 
   set( gca, 'Units', 'normalized', 'Position', [0 0 0.8 1] );   
   [JNodevalue]=SABRE2JointApp(JNodevalue,ptable_node,pt_title_name);
      
   % get geometry table data   
   G_getdata=get(ptable_node,'Data');
   Gflag=0;
   for i=2:length(G_getdata(1,:))
      if isequal(G_getdata(1,i),0) || isequal(G_getdata(2,i),0) ...
            || isequal(G_getdata(3,i),0) || isequal(G_getdata(4,i),0) ...
            || isequal(G_getdata(5,i),0) || isequal(G_getdata(6,i),0) ...
            || isequal(G_getdata(7,i),0)
         Gflag = Gflag+1;
      end
   end
   

   
   if ~isempty(JNodevalue)
      daxis=get(pdesign_edit,'Value');
      if ~isequal(Gflag,0)
         set(pt_title_name,'String','Please edit the Modeling input tables and click Apply')
         set(pt_title_name,'Visible','on')     
      elseif isempty(daxis) || isnan(daxis) || ...
            round(daxis) <= 0 || round(daxis) > 3 
         set(pt_title_name,'String','Please edit the Modeling input tables and click Apply')
         set(pt_title_name,'Visible','on') 
      else
      
          
         set(pde_type_name,'String',num2str(1))
         set(pde_jointi_edit,'String',num2str(1));
         set(pde_jointj_edit,'String',num2str(2));
         set(pde_bfbi_edit,'String',num2str(G_getdata(2,1)));
         set(pde_tfbi_edit,'String',num2str(G_getdata(3,1)));
         set(pde_bfti_edit,'String',num2str(G_getdata(4,1)));
         set(pde_tfti_edit,'String',num2str(G_getdata(5,1)));
         set(pde_dwi_edit,'String',num2str(G_getdata(6,1)));
         set(pde_twi_edit,'String',num2str(G_getdata(7,1)));
         set(pde_fili_edit,'String',num2str(G_getdata(8,1)));   
         set(pde_bfbj_edit,'String',num2str(G_getdata(2,end)));
         set(pde_tfbj_edit,'String',num2str(G_getdata(3,end)));
         set(pde_bftj_edit,'String',num2str(G_getdata(4,end)));
         set(pde_tftj_edit,'String',num2str(G_getdata(5,end)));
         set(pde_dwj_edit,'String',num2str(G_getdata(6,end)));
         set(pde_twj_edit,'String',num2str(G_getdata(7,end)));
         set(pde_filj_edit,'String',num2str(G_getdata(8,end)));        
%          set(pde_reference_edit,'Value',round(G_getdata(2,1)));
         
         [Massemble,JNodevalue_i,JNodevalue_j,Rval,...
            BNodevalue]=SABRE2MembApp(JNodevalue,Massemble,JNodevalue_i,...
            JNodevalue_j,Rval,BNodevalue,pde_type_name,pt_title_name,...
            pde_jointi_edit,pde_jointj_edit,pde_bfbi_edit,pde_tfbi_edit,...
            pde_bfti_edit,pde_tfti_edit,pde_dwi_edit,pde_twi_edit,pde_bfbj_edit,...
            pde_tfbj_edit,pde_bftj_edit,pde_tftj_edit,pde_dwj_edit,pde_twj_edit,pde_fili_edit,pde_filj_edit,...
            pdesign_edit);     
      end

      if ~isempty(Massemble) 
         steplength =[];
         if ~isequal(length(G_getdata(1,:)),2)
            for i = 1:(length(G_getdata(1,:))-2)
               set(pdb_member_name,'String',num2str(1));
               set(pdb_type_name,'String',num2str(i));
               set(pdb_coordx_edit,'String',num2str(G_getdata(1,i+1)));
               set(pdb_coordy_edit,'String',num2str(0));
               set(pdb_coordz_edit,'String',num2str(0));    
               set(pdb_length_edit,'String',num2str(G_getdata(1,i+1)));
               set(pdb_bfb_edit,'String',num2str(G_getdata(2,i+1)));
               set(pdb_tfb_edit,'String',num2str(G_getdata(3,i+1)));
               set(pdb_bft_edit,'String',num2str(G_getdata(4,i+1)));
               set(pdb_tft_edit,'String',num2str(G_getdata(5,i+1)));
               set(pdb_dw_edit,'String',num2str(G_getdata(6,i+1)));
               set(pdb_tw_edit,'String',num2str(G_getdata(7,i+1)));
               set(pdb_fil_edit,'String',num2str(G_getdata(8,i+1)));
               set(pdb_step_edit,'Value',round(G_getdata(14,i+1)))

               [BNodevalue,steplength1]=SABRE2SegmApp(JNodevalue,...
                  Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,pt_title_name,...
                  pdb_member_name,pdb_type_name,pdb_coordx_edit,pdb_coordy_edit,...
                  pdb_coordz_edit,pdb_length_edit,pdb_bfb_edit,pdb_tfb_edit,...
                  pdb_bft_edit,pdb_tft_edit,pdb_dw_edit,pdb_tw_edit,pdb_fil_edit,pdb_step_edit);     
               
         
               if isempty(steplength1) || steplength1 <=0
                  steplength(i,1)=0;
               else
                  steplength(i,1)=steplength1;
               end
               
            end
         end
         
         [SNodevalue]=SABRE2AssiApp(BNodevalue,SNodevalue,ptable_node,ptable_seg,steplength,punit_edit,pt_title_name);
   
      end

   end

   SABRE2ModelP(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,Rval,...
      BNodevalue,vrum_az_slider,vrum_el_slider,vrum_az_edit,vrum_el_edit,axesm,vstm);   
   
   RNCc=[];Nshe1=[];Nshe2=[];DUP1=[];DUP2=[];NCc=[];Bhe1=[];Bhe2=[];
   The1=[];The2=[];Bhg=[];Thg=[];BNC1=[];BNC2=[];FEL=[]; SGhe1=[]; SGhe2=[];
   PNC=[];PNC1=[];PNC2=[]; LNC=[];LNC1=[];LNC2=[];

   
   if isempty(Massemble) || isempty(SNodevalue)
   else
      % Drawing Nodal white points & generate NC
      [RNCc,Nshe1,Nshe2,DUP1,DUP2,NCc,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,BNC1,BNC2,FEL,error]=SABRE2LBCODE(JNodevalue,...
         Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,SNodevalue,...
         RNCc,Nshe1,Nshe2,DUP1,DUP2,NCc,LNC,LUEC,PNC,BNC,BNC1,BNC2,FEL,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,pt_title_name,axesm,vstm);         

      [PNC,PNC1,PNC2]=SABRE2BConApp(JNodevalue,Massemble,Rval,...
         BNodevalue,RNCc,DUP1,DUP2,PNC,PNC1,PNC2,Bhg,Thg,CSg,ptable_node,pt_title_name,axesm); 

      [LNC,LNC1,LNC2]=SABRE2ForcApp(JNodevalue,Massemble,Rval,...
         RNCc,DUP1,DUP2,LNC,LNC1,LNC2,LUEC,Nshe1,Nshe2,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,...
         ptable_node,pt_title_name,axesm,vstm);
   end
  
end % function end   
   
% --------------------------------------------------------------------
function ptable_cancel_pushbutton_Callback(hObject, eventdata)
   selection = questdlg('Do you want to clear all?','Grounded Spring','Yes','No','Yes');     
   if strcmp(selection,'No')
      return;
   else 
      % Table-Nodes
      tdata_node = zeros(14,2);
      tdata_node(12,:) = 1; tdata_node(13,:) = 1;tdata_node(14,:) = 1;
      cnames_node = {'Joint 1','Joint 2'};
      rnames_node = {'X Coord','bf1','tf1','bf2','tf2','dw',...
         'tw','Afillets','Px','Py','Mz','BC','LH','Step'};
      set(ptable_node,'Data',tdata_node,'ColumnName',cnames_node,'RowName',rnames_node);

      % Table-Nodes
      tdata_seg = [10;50;50;50];
      cnames_seg = {'Segment 1'};
      rnames_seg = {'# of Ele.','Fyf1','Fyw','Fyf2'};
      set(ptable_seg,'Data',tdata_seg,'ColumnName',cnames_seg,'RowName',rnames_seg);  
   end
end % function end   

% --------------------------------------------------------------------
function recba_tau_diagram_pushbutton_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'string','');  
   if isequal(get(recba_tau_diagram,'Value'),1)
      Buc=1;
       SABRE2ModelP(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j, ...
          Rval,BNodevalue,vrum_az_slider,vrum_el_slider,vrum_az_edit,vrum_el_edit,axesm,vstm);   
       
      [RNCc,Nshe1,Nshe2,DUP1,DUP2,NCc,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,BNC1,BNC2,FEL,error]=SABRE2LBCODE(JNodevalue,...
         Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,SNodevalue,...
         RNCc,Nshe1,Nshe2,DUP1,DUP2,NCc,LNC,LUEC,PNC,BNC,BNC1,BNC2,FEL,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,pt_title_name,axesm,vstm);   
       
      SABRE2AssiCODE(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,SNodevalue,axesm,vstm);  
      set([vdum,vtum], 'enable', 'off'); set([vdum_panel,vdum_type_subpanel],'Visible','off');
      set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','off') 
      set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','off')    
      set( gca, 'Units', 'normalized', 'Position', [0 0 0.8 1] ); 
   elseif isequal(get(recba_tau_diagram,'Value'),2)
      Buc=1;
      set(rd_on_radiobutton,'Value',1);set(rd_off_radiobutton,'Value',0);
      if ~isempty(Funew) 
         IncreL = 1; Fscale=str2double(get(recba_Scale_edit, 'String')); 
         if isempty(gammma)
            SABRE2RBmode(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,...
               SNodevalue,RNCc,NCc,Nshe1,Nshe2,DUP1,DUP2,Funew(:,:,IncreL),Rval,...
               LNC,LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,Fscale,rd_buttongroup,pt_title_name,...
               AR,AS,AE,AI,ANE,ANI,gammma,LIAType,NLIAType,crLTB,LGv,axesm,vstm);   
            Buc=2;
         else
            SABRE2RBmode(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,...
               SNodevalue,RNCc,NCc,Nshe1,Nshe2,DUP1,DUP2,Funew(:,:,IncreL),Rval,...
               LNC,LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,Fscale,rd_buttongroup,pt_title_name,...
               AR,AS,AE,AI,ANE,ANI,gammma(IncreL,1),LIAType,NLIAType,crLTB,LGv,axesm,vstm); 
            Buc=2;
         end
      end  
      set([vdum,vtum], 'enable', 'off'); set([vdum_panel,vdum_type_subpanel],'Visible','off');
      set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','off') 
      set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','off')    
      set( gca, 'Units', 'normalized', 'Position', [0 0 0.8 1] ); 
   elseif isequal(get(recba_tau_diagram,'Value'),3)
      Buc=1;
      set(rd_on_radiobutton,'Value',0);set(rd_off_radiobutton,'Value',1);
      if ~isempty(Funew) 
         IncreL = 1; Fscale=str2double(get(recba_Scale_edit, 'String')); 
         if isempty(gammma)
            SABRE2RBmode(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,...
               SNodevalue,RNCc,NCc,Nshe1,Nshe2,DUP1,DUP2,Funew(:,:,IncreL),Rval,...
               LNC,LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,Fscale,rd_buttongroup,pt_title_name,...
               AR,AS,AE,AI,ANE,ANI,gammma,LIAType,NLIAType,crLTB,LGv,axesm,vstm);   
            Buc=3;
         else
            SABRE2RBmode(JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,...
               SNodevalue,RNCc,NCc,Nshe1,Nshe2,DUP1,DUP2,Funew(:,:,IncreL),Rval,...
               LNC,LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,Fscale,rd_buttongroup,pt_title_name,...
               AR,AS,AE,AI,ANE,ANI,gammma(IncreL,1),LIAType,NLIAType,crLTB,LGv,axesm,vstm); 
            Buc=3;
         end
      end  
      set([vdum,vtum], 'enable', 'off'); set([vdum_panel,vdum_type_subpanel],'Visible','off');
      set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','off') 
      set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','off')        
      set( gca, 'Units', 'normalized', 'Position', [0 0 0.8 1] ); 
   elseif isequal(get(recba_tau_diagram,'Value'),4)
      Buc=4;IncreL = 1; set([vdum,vtum], 'enable', 'on');
      if strcmp(get(vdum, 'Checked'),'on')     
         set([vdum_panel,vdum_type_subpanel],'Visible','on')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','on') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','on')
      else
         set([vdum_panel,vdum_type_subpanel],'Visible','off')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','off') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','off')      
      end       
      if ~isempty(Qintf)
         Rtype=1; 
         SABRE2DiagramAi(JNodevalue,Massemble,BNodevalue,...
            SNodevalue,RNCc,NCc,Nshe1,Nshe2,DUP1,DUP2,Funew(:,:,IncreL),Rval,...
            pt_title_name,Qintf(:,:,IncreL),axesm,vstm);
         if strcmp(get(vtum, 'Checked'),'on')  
            set(findobj('Type','text'),'Visible','on'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         else
            set(findobj('Type','text'),'Visible','off'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         end                    
      end            
   elseif isequal(get(recba_tau_diagram,'Value'),5)
      Buc=5;IncreL = 1; set([vdum,vtum], 'enable', 'on');
      if strcmp(get(vdum, 'Checked'),'on')     
         set([vdum_panel,vdum_type_subpanel],'Visible','on')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','on') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','on')
      else
         set([vdum_panel,vdum_type_subpanel],'Visible','off')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','off') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','off')      
      end         
      if ~isempty(Qintf)
         Rtype=6; 
         SABRE2DiagramMz(JNodevalue,Massemble,BNodevalue,...
            SNodevalue,RNCc,NCc,Nshe1,Nshe2,DUP1,DUP2,Funew(:,:,IncreL),Rval,...
            pt_title_name,Qintf(:,:,IncreL),axesm,vstm);
         if strcmp(get(vtum, 'Checked'),'on')  
            set(findobj('Type','text'),'Visible','on'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         else
            set(findobj('Type','text'),'Visible','off'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         end           
      end            
   elseif isequal(get(recba_tau_diagram,'Value'),6)    
      set([vdum,vtum], 'enable', 'on');
      if strcmp(get(vdum, 'Checked'),'on')     
         set([vdum_panel,vdum_type_subpanel],'Visible','on')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','on') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','on')
      else
         set([vdum_panel,vdum_type_subpanel],'Visible','off')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','off') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','off')      
      end         
       if ~isempty(tau)
          Buc=6; 
          SABRE2DiagramSRF(JNodevalue,Massemble,SNodevalue,RNCc,NCc,...
             Nshe1,Nshe2,DUP1,DUP2,tau,Rval,pt_title_name,axesm,vstm); 
         if strcmp(get(vtum, 'Checked'),'on')  
            set(findobj('Type','text'),'Visible','on'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         else
            set(findobj('Type','text'),'Visible','off'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         end            
       end
   elseif isequal(get(recba_tau_diagram,'Value'),7)
      set([vdum,vtum], 'enable', 'on');
      if strcmp(get(vdum, 'Checked'),'on')     
         set([vdum_panel,vdum_type_subpanel],'Visible','on')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','on') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','on')
      else
         set([vdum_panel,vdum_type_subpanel],'Visible','off')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','off') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','off')      
      end         
       if ~isempty(Rpg)
          Buc=7;
          SABRE2DiagramSRF(JNodevalue,Massemble,SNodevalue,RNCc,NCc,...
             Nshe1,Nshe2,DUP1,DUP2,Rpg,Rval,pt_title_name,axesm,vstm); 
         if strcmp(get(vtum, 'Checked'),'on')  
            set(findobj('Type','text'),'Visible','on'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         else
            set(findobj('Type','text'),'Visible','off'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         end            
       end  
   elseif isequal(get(recba_tau_diagram,'Value'),8)
      set([vdum,vtum], 'enable', 'on');
      if strcmp(get(vdum, 'Checked'),'on')     
         set([vdum_panel,vdum_type_subpanel],'Visible','on')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','on') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','on')
      else
         set([vdum_panel,vdum_type_subpanel],'Visible','off')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','off') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','off')      
      end         
       if ~isempty(Rpc)
          Buc=8;
          SABRE2DiagramSRF(JNodevalue,Massemble,SNodevalue,RNCc,NCc,...
             Nshe1,Nshe2,DUP1,DUP2,Rpc,Rval,pt_title_name,axesm,vstm);  
         if strcmp(get(vtum, 'Checked'),'on')  
            set(findobj('Type','text'),'Visible','on'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         else
            set(findobj('Type','text'),'Visible','off'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         end            
       end  
   elseif isequal(get(recba_tau_diagram,'Value'),9)
      set([vdum,vtum], 'enable', 'on');
      if strcmp(get(vdum, 'Checked'),'on')     
         set([vdum_panel,vdum_type_subpanel],'Visible','on')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','on') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','on')
      else
         set([vdum_panel,vdum_type_subpanel],'Visible','off')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','off') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','off')      
      end         
       if ~isempty(Rpt)
          Buc=9;
          SABRE2DiagramSRF(JNodevalue,Massemble,SNodevalue,RNCc,NCc,...
             Nshe1,Nshe2,DUP1,DUP2,Rpt,Rval,pt_title_name,axesm,vstm);   
         if strcmp(get(vtum, 'Checked'),'on')  
            set(findobj('Type','text'),'Visible','on'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         else
            set(findobj('Type','text'),'Visible','off'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         end            
       end 
   elseif isequal(get(recba_tau_diagram,'Value'),10)
      set([vdum,vtum], 'enable', 'on');
      if strcmp(get(vdum, 'Checked'),'on')     
         set([vdum_panel,vdum_type_subpanel],'Visible','on')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','on') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','on')
      else
         set([vdum_panel,vdum_type_subpanel],'Visible','off')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','off') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','off')      
      end         
       if ~isempty(Rh)
          Buc=10;
          SABRE2DiagramSRF(JNodevalue,Massemble,SNodevalue,RNCc,NCc,...
             Nshe1,Nshe2,DUP1,DUP2,Rh,Rval,pt_title_name,axesm,vstm);   
         if strcmp(get(vtum, 'Checked'),'on')  
            set(findobj('Type','text'),'Visible','on'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         else
            set(findobj('Type','text'),'Visible','off'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         end            
       end  
   elseif isequal(get(recba_tau_diagram,'Value'),11)
      set([vdum,vtum], 'enable', 'on');
      if strcmp(get(vdum, 'Checked'),'on')     
         set([vdum_panel,vdum_type_subpanel],'Visible','on')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','on') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','on')
      else
         set([vdum_panel,vdum_type_subpanel],'Visible','off')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','off') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','off')      
      end         
       if ~isempty(Myc)
          Buc=11;Myc=round(Myc*10^1)/10^1;
          SABRE2DiagramSRF(JNodevalue,Massemble,SNodevalue,RNCc,NCc,...
             Nshe1,Nshe2,DUP1,DUP2,Myc,Rval,pt_title_name,axesm,vstm); 
         if strcmp(get(vtum, 'Checked'),'on')  
            set(findobj('Type','text'),'Visible','on'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         else
            set(findobj('Type','text'),'Visible','off'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         end            
       end 
   elseif isequal(get(recba_tau_diagram,'Value'),12)
      set([vdum,vtum], 'enable', 'on');
      if strcmp(get(vdum, 'Checked'),'on')     
         set([vdum_panel,vdum_type_subpanel],'Visible','on')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','on') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','on')
      else
         set([vdum_panel,vdum_type_subpanel],'Visible','off')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','off') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','off')      
      end         
       if ~isempty(Myt)
          Buc=12;Myt=round(Myt*10^1)/10^1;
          SABRE2DiagramSRF(JNodevalue,Massemble,SNodevalue,RNCc,NCc,...
             Nshe1,Nshe2,DUP1,DUP2,Myt,Rval,pt_title_name,axesm,vstm);  
         if strcmp(get(vtum, 'Checked'),'on')  
            set(findobj('Type','text'),'Visible','on'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         else
            set(findobj('Type','text'),'Visible','off'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         end            
       end 
   elseif isequal(get(recba_tau_diagram,'Value'),13)
      set([vdum,vtum], 'enable', 'on');
      if strcmp(get(vdum, 'Checked'),'on')     
         set([vdum_panel,vdum_type_subpanel],'Visible','on')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','on') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','on')
      else
         set([vdum_panel,vdum_type_subpanel],'Visible','off')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','off') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','off')      
      end         
       if ~isempty(My)
          Buc=13;My=round(My*10^1)/10^1;
          SABRE2DiagramSRF(JNodevalue,Massemble,SNodevalue,RNCc,NCc,...
             Nshe1,Nshe2,DUP1,DUP2,My,Rval,pt_title_name,axesm,vstm);   
         if strcmp(get(vtum, 'Checked'),'on')  
            set(findobj('Type','text'),'Visible','on'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         else
            set(findobj('Type','text'),'Visible','off'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         end            
       end 
   elseif isequal(get(recba_tau_diagram,'Value'),14)
      set([vdum,vtum], 'enable', 'on');
      if strcmp(get(vdum, 'Checked'),'on')     
         set([vdum_panel,vdum_type_subpanel],'Visible','on')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','on') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','on')
      else
         set([vdum_panel,vdum_type_subpanel],'Visible','off')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','off') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','off')      
      end         
       if ~isempty(Jval)
          Buc=14;
          SABRE2DiagramSRF(JNodevalue,Massemble,SNodevalue,RNCc,NCc,...
             Nshe1,Nshe2,DUP1,DUP2,Jval,Rval,pt_title_name,axesm,vstm); 
         if strcmp(get(vtum, 'Checked'),'on')  
            set(findobj('Type','text'),'Visible','on'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         else
            set(findobj('Type','text'),'Visible','off'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         end            
       end        
   elseif isequal(get(recba_tau_diagram,'Value'),15)
      set([vdum,vtum], 'enable', 'on');
      if strcmp(get(vdum, 'Checked'),'on')     
         set([vdum_panel,vdum_type_subpanel],'Visible','on')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','on') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','on')
      else
         set([vdum_panel,vdum_type_subpanel],'Visible','off')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','off') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','off')      
      end         
       if ~isempty(Phi_Mmax)
          Buc=15; Phi_Mmax=round(Phi_Mmax*10^1)/10^1;
          SABRE2DiagramSRF(JNodevalue,Massemble,SNodevalue,RNCc,NCc,...
             Nshe1,Nshe2,DUP1,DUP2,Phi_Mmax,Rval,pt_title_name,axesm,vstm); 
         if strcmp(get(vtum, 'Checked'),'on')  
            set(findobj('Type','text'),'Visible','on'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         else
            set(findobj('Type','text'),'Visible','off'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         end            
       end 
   elseif isequal(get(recba_tau_diagram,'Value'),16)
      set([vdum,vtum], 'enable', 'on');
      if strcmp(get(vdum, 'Checked'),'on')     
         set([vdum_panel,vdum_type_subpanel],'Visible','on')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','on') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','on')
      else
         set([vdum_panel,vdum_type_subpanel],'Visible','off')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','off') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','off')      
      end         
       if ~isempty(Phi_Py)
          Buc=16;Phi_Py=round(Phi_Py*10^1)/10^1;
          SABRE2DiagramSRF(JNodevalue,Massemble,SNodevalue,RNCc,NCc,...
             Nshe1,Nshe2,DUP1,DUP2,Phi_Py,Rval,pt_title_name,axesm,vstm);  
         if strcmp(get(vtum, 'Checked'),'on')  
            set(findobj('Type','text'),'Visible','on'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         else
            set(findobj('Type','text'),'Visible','off'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         end            
       end   
   elseif isequal(get(recba_tau_diagram,'Value'),17)
      set([vdum,vtum], 'enable', 'on');
      if strcmp(get(vdum, 'Checked'),'on')     
         set([vdum_panel,vdum_type_subpanel],'Visible','on')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','on') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','on')
      else
         set([vdum_panel,vdum_type_subpanel],'Visible','off')
         set([vdum_type_name,v1um_p1_text,v1um_p2_text,v1um_p3_text,v1um_p4_text,v1um_p5_text],'Visible','off') 
         set([v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit],'Visible','off')      
      end         
       if ~isempty(UC)
          Buc=17;
          SABRE2DiagramSRF(JNodevalue,Massemble,SNodevalue,RNCc,NCc,...
             Nshe1,Nshe2,DUP1,DUP2,UC,Rval,pt_title_name,axesm,vstm);   
         if strcmp(get(vtum, 'Checked'),'on')  
            set(findobj('Type','text'),'Visible','on'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         else
            set(findobj('Type','text'),'Visible','off'); set(findobj('Tag','axis'),'Visible','on');
            set(findobj('Tag','EF'),'Visible','off');set(findobj('Tag','S'),'Visible','off');
         end            
       end        
   end
end % function end

% --------------------------------------------------------------------
function auto_lin_apply_pushbutton_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   
   if isempty(get(auto_modelname_edit,'String'))         
      set(pt_title_name,'String','Please, define the proper name')
      set(pt_title_name,'Visible','on')
  
   elseif isempty(get(auto_modelnum_edit,'String')) ...
         || isnan(str2double(get(auto_modelnum_edit,'String'))) ...
         || str2double(get(auto_modelnum_edit,'String')) <=0         
      set(pt_title_name,'String','Please, define the proper # of tests')
      set(pt_title_name,'Visible','on')      
      
   else
      set(pt_title_name,'Visible','off')
      maxnum = str2double(get(auto_modelnum_edit,'String'));
   
  
   [filename, pathname] = uiputfile({'*.txt';'*.*'},'Save');	
   % If 'Cancel' was selected then return
   if isequal([filename,pathname],[0,0]) || isempty(filename) || isempty(pathname)
      return
   else
      File = fullfile(pathname,filename); 
      
      % Define a file name of I/O 
      outfile =strcat(File);   % Output file name.
      out = fopen(outfile,'w');                       % Output file is opened.  
      LIAType = 0;
      fprintf(out,'****************************************************************\n');
      fprintf(out,['** ',filename,'        \n']);
      fprintf(out,'**                  Elastic Linear Buckling                   **\n');
      fprintf(out,'****************************************************************\n'); 
%       fprintf(out,'           PhiPn       PhiMn        PR       PL       ML       MR\n'); 
      fprintf(out,'           ML          MR\n'); 
      for modelnum=1:maxnum
         % Open
         [JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,SNodevalue,...
            RNCc,Nshe1,Nshe2,DUP1,DUP2,NCc,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,BNC1,BNC2,...
            FEL,error,PNC,PNC1,PNC2,LNC,LNC1,LNC2,AnalP]=SABRE2InpOpenBatch(pathname,filename,ptable_node,ptable_seg,pt_title_name,...
            JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,SNodevalue,...
            LNC,LUEC,BNC,BNC1,BNC2,FEL,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,PNC,PNC1,PNC2,...
            pde_type_name,pde_jointi_edit,pde_jointj_edit,pde_bfbi_edit,pde_tfbi_edit,...
            pde_bfti_edit,pde_tfti_edit,pde_dwi_edit,pde_twi_edit,pde_bfbj_edit,...
            pde_tfbj_edit,pde_bftj_edit,pde_tftj_edit,pde_dwj_edit,pde_twj_edit,...
            pde_fili_edit,pde_filj_edit,pdesign_edit,punit_edit,pdb_member_name,...
            pdb_type_name,pdb_coordx_edit,pdb_coordy_edit,pdb_coordz_edit,...
            pdb_length_edit,pdb_bfb_edit,pdb_tfb_edit,pdb_bft_edit,pdb_tft_edit,...
            pdb_dw_edit,pdb_tw_edit,pdb_fil_edit,pdb_step_edit,vrum_az_slider,...
            vrum_el_slider,vrum_az_edit,vrum_el_edit,ptable_remove_edit,axesm,vstm,modelnum,auto_modelname_edit);            
         % Analysis
         set(recba_tau_diagram,'Value',1);
         if isempty(RNCc) || isempty(PNC)     
            set(pt_title_name,'String','Modeling is not completed')
            set(pt_title_name,'Visible','on') 
         else
            if isequal(max(max(abs(LNC(:,5:10)))),0) && isequal(max(max(abs(LUEC(:,5:7)))),0) 
               set(pt_title_name,'String','Modeling is not completed')
               set(pt_title_name,'Visible','on') 
            else
               set(pt_title_name,'Visible','off') 
               AR=0;AS=0;AE=0;AI=0;ANE=0;ANI=0;lambda = 1;
               nmode = 1; ninc = 1;   
%                switch get(get(ap_jval_buttongroup,'SelectedObject'),'Tag')
%                   case 'jval_on' 
%                      [AE,gammma,EGunew,Qintf,Qintg] = AlanysisBucklingESL(Massemble,...
%                         Rval,JNodevalue_i,JNodevalue_j,SNodevalue,RNCc,Nshe1,Nshe2,DUP1,DUP2,LNC,LNC1,LNC2,...
%                         LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,nmode,ninc,lambda,pt_title_name,LIAType);  
%                      set(recba_gamma_edit,'String',num2str(gammma));
%                   case 'jval_off'
                     [AE,gammma,EGunew,Qintf,Qintg] = AlanysisBuckling(Massemble,...
                        Rval,JNodevalue_i,JNodevalue_j,SNodevalue,RNCc,Nshe1,Nshe2,DUP1,DUP2,LNC,LNC1,LNC2,...
                        LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,nmode,ninc,lambda,pt_title_name); 
                     set(recba_gamma_edit,'String',num2str(gammma));
%                end 
      %          results_diagram_menu_Callback;
      %          set(recba_Scale_edit,'String',num2str(1.2*max(max(RNCc(:,5)),max(RNCc(:,7)))));
      %          set(recba_tau_diagram,'Value',2); 
      %          if ~isequal( min(min(min(Qintf))), 0) 
      %             recba_tau_diagram_pushbutton_Callback; 
      %          end
            end
         end       

         % Report Results
         Qintf=round(Qintf*10^4)/10^4; 
         maxPt = max(max(Qintf(:,1)),max(-Qintf(:,8)));
         minPt = min(min(Qintf(:,1)),min(-Qintf(:,8)));
         if abs(maxPt) > abs(minPt)
            Pt=maxPt;   
         else
            Pt=minPt; 
         end         
         
         Pl = Qintf(1,1);
         Pr = -Qintf(end,8);
         
         
         maxMzt = max(max(-Qintf(:,6)),max(Qintf(:,13)));
         minMzt = min(min(-Qintf(:,6)),min(Qintf(:,13)));
         if abs(maxMzt) > abs(minMzt)
            Mzt=maxMzt;   
         else
            Mzt=minMzt; 
         end
         
         Ml = -Qintf(1,6);
         Mr = Qintf(end,13);
         
         maxPhi_Mmax=max(max(Phi_Mmax));
         mintau = min(min(tau));      
%          fprintf(out,'%4.0f %12.4f %12.4f %12.4f %12.4f %12.4f %12.4f\n',modelnum,Pt,Mzt,Pl,Pr,Ml,Mr);
         fprintf(out,'%4.0f %12.4f %12.4f\n',modelnum,Ml,Mr);
      end % end for

      fprintf(out,'\n');
      fprintf(out,'\n');
      fprintf(out,'\n');
      
   end  % isequal([filename,pathname],[0,0]) 

   fclose('all'); 
   
   end % isempty
   
end % function end

% --------------------------------------------------------------------
function auto_nonlin_apply_pushbutton_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzm,vrm,vpm], 'Checked', 'off');
   
   if isempty(get(auto_modelname_edit,'String'))         
      set(pt_title_name,'String','Please, define the proper name')
      set(pt_title_name,'Visible','on')
  
   elseif isempty(get(auto_modelnum_edit,'String')) ...
         || isnan(str2double(get(auto_modelnum_edit,'String'))) ...
         || str2double(get(auto_modelnum_edit,'String')) <=0         
      set(pt_title_name,'String','Please, define the proper # of tests')
      set(pt_title_name,'Visible','on')      
      
   else
      set(pt_title_name,'Visible','off')
      maxnum = str2double(get(auto_modelnum_edit,'String'));
   
  
   [filename, pathname] = uiputfile({'*.txt';'*.*'},'Save');	
   % If 'Cancel' was selected then return
   if isequal([filename,pathname],[0,0]) || isempty(filename) || isempty(pathname)
      return
   else
      File = fullfile(pathname,filename); 
      
      % Define a file name of I/O 
      outfile =strcat(File);   % Output file name.
      out = fopen(outfile,'w');                       % Output file is opened.  
      
      NLIAType = 0;
      set(ap_da_on_radiobutton,'value',0)
      set(ap_da_off_radiobutton,'value',1)       
      fprintf(out,'****************************************************************\n');
      fprintf(out,['** ',filename,'        \n']);
      fprintf(out,'**                     Current Eqations                       **\n');  
      fprintf(out,'**                     Direct Method Off                      **\n'); 
      fprintf(out,'****************************************************************\n');  
      fprintf(out,'           PhiPn       PhiMn          SRF       PhiMmax\n');    
      for modelnum=1:maxnum
         % Open
         [JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,SNodevalue,...
            RNCc,Nshe1,Nshe2,DUP1,DUP2,NCc,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,BNC1,BNC2,...
            FEL,error,PNC,PNC1,PNC2,LNC,LNC1,LNC2,AnalP]=SABRE2InpOpenBatch(pathname,filename,ptable_node,ptable_seg,pt_title_name,...
            JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,SNodevalue,...
            LNC,LUEC,BNC,BNC1,BNC2,FEL,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,PNC,PNC1,PNC2,...
            pde_type_name,pde_jointi_edit,pde_jointj_edit,pde_bfbi_edit,pde_tfbi_edit,...
            pde_bfti_edit,pde_tfti_edit,pde_dwi_edit,pde_twi_edit,pde_bfbj_edit,...
            pde_tfbj_edit,pde_bftj_edit,pde_tftj_edit,pde_dwj_edit,pde_twj_edit,...
            pde_fili_edit,pde_filj_edit,pdesign_edit,punit_edit,pdb_member_name,...
            pdb_type_name,pdb_coordx_edit,pdb_coordy_edit,pdb_coordz_edit,...
            pdb_length_edit,pdb_bfb_edit,pdb_tfb_edit,pdb_bft_edit,pdb_tft_edit,...
            pdb_dw_edit,pdb_tw_edit,pdb_fil_edit,pdb_step_edit,vrum_az_slider,...
            vrum_el_slider,vrum_az_edit,vrum_el_edit,ptable_remove_edit,axesm,vstm,modelnum,auto_modelname_edit);            
         % Analysis
         set(recba_tau_diagram,'Value',1);
         if isempty(RNCc) || isempty(PNC)     
            set(pt_title_name,'String','Modeling is not completed')
            set(pt_title_name,'Visible','on') 
         else
            if isequal(max(max(abs(LNC(:,5:10)))),0) && isequal(max(max(abs(LUEC(:,5:7)))),0)
               set(pt_title_name,'String','Modeling is not completed')
               set(pt_title_name,'Visible','on')
            else
               set(pt_title_name,'Visible','off') 
               AR=0;AS=0;AE=0;AI=0;ANE=0;ANI=0;lambda = 1;nmode = 1;ninc = 1;
               JeongP=str2double(get(ap_jeong_edit,'String'));BrentP=str2double(get(ap_brent_edit,'String'));    
               [ANI,gammma,EGunew,Qintf,Qintg,tau,Rpg,Rpc,Rpt,Rh,Myc,Myt,My,Jval,Phi_Mmax,Phi_Py,UC,crLTB,LGv] = AnalysisNonIEBuckling(Massemble,...
                  Rval,JNodevalue_i,JNodevalue_j,SNodevalue,RNCc,Nshe1,Nshe2,DUP1,DUP2,LNC,LNC1,LNC2,...
                  LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,nmode,ninc,lambda,pt_title_name,...
                  ap_da_buttongroup,ap_cv_buttongroup,JeongP,BrentP,NLIAType);   
%                set(recba_gamma_edit,'String',num2str(gammma));
%                results_diagram_menu_Callback;
%                set(recba_Scale_edit,'String',num2str(1.2*max(max(RNCc(:,5)),max(RNCc(:,7)))));
%                set(recba_tau_diagram,'Value',2);
%                if ~isequal( min(min(min(Qintf))), 0)
%                   recba_tau_diagram_pushbutton_Callback; 
%                end
            end
         end         

         % Report Results
         Qintf=round(Qintf*10^4)/10^4; 
         maxPt = max(max(Qintf(:,1)),max(-Qintf(:,8)));
         minPt = min(min(Qintf(:,1)),min(-Qintf(:,8)));
         if abs(maxPt) > abs(minPt)
            Pt=maxPt;   
         else
            Pt=minPt; 
         end         
         
         maxMzt = max(max(-Qintf(:,6)),max(Qintf(:,13)));
         minMzt = min(min(-Qintf(:,6)),min(Qintf(:,13)));
         if abs(maxMzt) > abs(minMzt)
            Mzt=maxMzt;   
         else
            Mzt=minMzt; 
         end
         maxPhi_Mmax=max(max(Phi_Mmax));
         mintau = min(min(tau));      
         fprintf(out,'%4.0f %12.4f %12.4f %12.4f %12.4f\n',modelnum,Pt,Mzt,mintau,maxPhi_Mmax);
      end % end for

      fprintf(out,'\n');
      fprintf(out,'\n');
      fprintf(out,'\n');
      
      NLIAType = 0;
      set(ap_da_on_radiobutton,'value',1)
      set(ap_da_off_radiobutton,'value',0)       
      fprintf(out,'****************************************************************\n');
      fprintf(out,['** ',filename,'        \n']);
      fprintf(out,'**                     Current Eqations                       **\n');  
      fprintf(out,'**                     Direct Method On                       **\n'); 
      fprintf(out,'****************************************************************\n');  
      fprintf(out,'           PhiPn       PhiMn          SRF       PhiMmax\n');    
      for modelnum=1:maxnum
         % Open
         [JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,SNodevalue,...
            RNCc,Nshe1,Nshe2,DUP1,DUP2,NCc,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,BNC1,BNC2,...
            FEL,error,PNC,PNC1,PNC2,LNC,LNC1,LNC2,AnalP]=SABRE2InpOpenBatch(pathname,filename,ptable_node,ptable_seg,pt_title_name,...
            JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,SNodevalue,...
            LNC,LUEC,BNC,BNC1,BNC2,FEL,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,PNC,PNC1,PNC2,...
            pde_type_name,pde_jointi_edit,pde_jointj_edit,pde_bfbi_edit,pde_tfbi_edit,...
            pde_bfti_edit,pde_tfti_edit,pde_dwi_edit,pde_twi_edit,pde_bfbj_edit,...
            pde_tfbj_edit,pde_bftj_edit,pde_tftj_edit,pde_dwj_edit,pde_twj_edit,...
            pde_fili_edit,pde_filj_edit,pdesign_edit,punit_edit,pdb_member_name,...
            pdb_type_name,pdb_coordx_edit,pdb_coordy_edit,pdb_coordz_edit,...
            pdb_length_edit,pdb_bfb_edit,pdb_tfb_edit,pdb_bft_edit,pdb_tft_edit,...
            pdb_dw_edit,pdb_tw_edit,pdb_fil_edit,pdb_step_edit,vrum_az_slider,...
            vrum_el_slider,vrum_az_edit,vrum_el_edit,ptable_remove_edit,axesm,vstm,modelnum,auto_modelname_edit);            
         % Analysis
         set(recba_tau_diagram,'Value',1);
         if isempty(RNCc) || isempty(PNC)     
            set(pt_title_name,'String','Modeling is not completed')
            set(pt_title_name,'Visible','on') 
         else
            if isequal(max(max(abs(LNC(:,5:10)))),0) && isequal(max(max(abs(LUEC(:,5:7)))),0)
               set(pt_title_name,'String','Modeling is not completed')
               set(pt_title_name,'Visible','on')
            else
               set(pt_title_name,'Visible','off') 
               AR=0;AS=0;AE=0;AI=0;ANE=0;ANI=0;lambda = 1;nmode = 1;ninc = 1;
               JeongP=str2double(get(ap_jeong_edit,'String'));BrentP=str2double(get(ap_brent_edit,'String'));    
               [ANI,gammma,EGunew,Qintf,Qintg,tau,Rpg,Rpc,Rpt,Rh,Myc,Myt,My,Jval,Phi_Mmax,Phi_Py,UC,crLTB,LGv] = AnalysisNonIEBuckling(Massemble,...
                  Rval,JNodevalue_i,JNodevalue_j,SNodevalue,RNCc,Nshe1,Nshe2,DUP1,DUP2,LNC,LNC1,LNC2,...
                  LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,nmode,ninc,lambda,pt_title_name,...
                  ap_da_buttongroup,ap_cv_buttongroup,JeongP,BrentP,NLIAType);   
%                set(recba_gamma_edit,'String',num2str(gammma));
%                results_diagram_menu_Callback;
%                set(recba_Scale_edit,'String',num2str(1.2*max(max(RNCc(:,5)),max(RNCc(:,7)))));
%                set(recba_tau_diagram,'Value',2);
%                if ~isequal( min(min(min(Qintf))), 0)
%                   recba_tau_diagram_pushbutton_Callback; 
%                end
            end
         end         

         % Report Results
         Qintf=round(Qintf*10^4)/10^4; 
         maxPt = max(max(Qintf(:,1)),max(-Qintf(:,8)));
         minPt = min(min(Qintf(:,1)),min(-Qintf(:,8)));
         if abs(maxPt) > abs(minPt)
            Pt=maxPt;   
         else
            Pt=minPt; 
         end         
         
         maxMzt = max(max(-Qintf(:,6)),max(Qintf(:,13)));
         minMzt = min(min(-Qintf(:,6)),min(Qintf(:,13)));
         if abs(maxMzt) > abs(minMzt)
            Mzt=maxMzt;   
         else
            Mzt=minMzt; 
         end
         maxPhi_Mmax=max(max(Phi_Mmax));
         mintau = min(min(tau));      
         fprintf(out,'%4.0f %12.4f %12.4f %12.4f %12.4f\n',modelnum,Pt,Mzt,mintau,maxPhi_Mmax);
      end % end for

      fprintf(out,'\n');
      fprintf(out,'\n');
      fprintf(out,'\n');
      
      NLIAType = 1;
      set(ap_da_on_radiobutton,'value',0)
      set(ap_da_off_radiobutton,'value',1)       
      fprintf(out,'****************************************************************\n');
      fprintf(out,['** ',filename,'        \n']);
      fprintf(out,'**                     Modified Eqations                      **\n');  
      fprintf(out,'**                     Direct Method Off                      **\n'); 
      fprintf(out,'****************************************************************\n');  
      fprintf(out,'           PhiPn       PhiMn          SRF       PhiMmax\n');    
      for modelnum=1:maxnum
         % Open
         [JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,SNodevalue,...
            RNCc,Nshe1,Nshe2,DUP1,DUP2,NCc,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,BNC1,BNC2,...
            FEL,error,PNC,PNC1,PNC2,LNC,LNC1,LNC2,AnalP]=SABRE2InpOpenBatch(pathname,filename,ptable_node,ptable_seg,pt_title_name,...
            JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,SNodevalue,...
            LNC,LUEC,BNC,BNC1,BNC2,FEL,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,PNC,PNC1,PNC2,...
            pde_type_name,pde_jointi_edit,pde_jointj_edit,pde_bfbi_edit,pde_tfbi_edit,...
            pde_bfti_edit,pde_tfti_edit,pde_dwi_edit,pde_twi_edit,pde_bfbj_edit,...
            pde_tfbj_edit,pde_bftj_edit,pde_tftj_edit,pde_dwj_edit,pde_twj_edit,...
            pde_fili_edit,pde_filj_edit,pdesign_edit,punit_edit,pdb_member_name,...
            pdb_type_name,pdb_coordx_edit,pdb_coordy_edit,pdb_coordz_edit,...
            pdb_length_edit,pdb_bfb_edit,pdb_tfb_edit,pdb_bft_edit,pdb_tft_edit,...
            pdb_dw_edit,pdb_tw_edit,pdb_fil_edit,pdb_step_edit,vrum_az_slider,...
            vrum_el_slider,vrum_az_edit,vrum_el_edit,ptable_remove_edit,axesm,vstm,modelnum,auto_modelname_edit);            
         % Analysis
         set(recba_tau_diagram,'Value',1);
         if isempty(RNCc) || isempty(PNC)     
            set(pt_title_name,'String','Modeling is not completed')
            set(pt_title_name,'Visible','on') 
         else
            if isequal(max(max(abs(LNC(:,5:10)))),0) && isequal(max(max(abs(LUEC(:,5:7)))),0)
               set(pt_title_name,'String','Modeling is not completed')
               set(pt_title_name,'Visible','on')
            else
               set(pt_title_name,'Visible','off') 
               AR=0;AS=0;AE=0;AI=0;ANE=0;ANI=0;lambda = 1;nmode = 1;ninc = 1;
               JeongP=str2double(get(ap_jeong_edit,'String'));BrentP=str2double(get(ap_brent_edit,'String'));    
               [ANI,gammma,EGunew,Qintf,Qintg,tau,Rpg,Rpc,Rpt,Rh,Myc,Myt,My,Jval,Phi_Mmax,Phi_Py,UC,crLTB,LGv] = AnalysisNonIEBuckling(Massemble,...
                  Rval,JNodevalue_i,JNodevalue_j,SNodevalue,RNCc,Nshe1,Nshe2,DUP1,DUP2,LNC,LNC1,LNC2,...
                  LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,nmode,ninc,lambda,pt_title_name,...
                  ap_da_buttongroup,ap_cv_buttongroup,JeongP,BrentP,NLIAType);   
%                set(recba_gamma_edit,'String',num2str(gammma));
%                results_diagram_menu_Callback;
%                set(recba_Scale_edit,'String',num2str(1.2*max(max(RNCc(:,5)),max(RNCc(:,7)))));
%                set(recba_tau_diagram,'Value',2);
%                if ~isequal( min(min(min(Qintf))), 0)
%                   recba_tau_diagram_pushbutton_Callback; 
%                end
            end
         end         

         % Report Results
         Qintf=round(Qintf*10^4)/10^4; 
         maxPt = max(max(Qintf(:,1)),max(-Qintf(:,8)));
         minPt = min(min(Qintf(:,1)),min(-Qintf(:,8)));
         if abs(maxPt) > abs(minPt)
            Pt=maxPt;   
         else
            Pt=minPt; 
         end         
         
         maxMzt = max(max(-Qintf(:,6)),max(Qintf(:,13)));
         minMzt = min(min(-Qintf(:,6)),min(Qintf(:,13)));
         if abs(maxMzt) > abs(minMzt)
            Mzt=maxMzt;   
         else
            Mzt=minMzt; 
         end
         maxPhi_Mmax=max(max(Phi_Mmax));
         mintau = min(min(tau));      
         fprintf(out,'%4.0f %12.4f %12.4f %12.4f %12.4f\n',modelnum,Pt,Mzt,mintau,maxPhi_Mmax);
      end % end for

      fprintf(out,'\n');
      fprintf(out,'\n');
      fprintf(out,'\n');
      
      NLIAType = 1;
      set(ap_da_on_radiobutton,'value',1)
      set(ap_da_off_radiobutton,'value',0)         
      fprintf(out,'****************************************************************\n');
      fprintf(out,['** ',filename,'        \n']);
      fprintf(out,'**                     Modified Eqations                      **\n');  
      fprintf(out,'**                     Direct Method On                       **\n'); 
      fprintf(out,'****************************************************************\n');  
      fprintf(out,'           PhiPn       PhiMn          SRF       PhiMmax\n');    
      for modelnum=1:maxnum
         % Open
         [JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,SNodevalue,...
            RNCc,Nshe1,Nshe2,DUP1,DUP2,NCc,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,BNC1,BNC2,...
            FEL,error,PNC,PNC1,PNC2,LNC,LNC1,LNC2,AnalP]=SABRE2InpOpenBatch(pathname,filename,ptable_node,ptable_seg,pt_title_name,...
            JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,SNodevalue,...
            LNC,LUEC,BNC,BNC1,BNC2,FEL,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Bhg,Thg,CSg,PNC,PNC1,PNC2,...
            pde_type_name,pde_jointi_edit,pde_jointj_edit,pde_bfbi_edit,pde_tfbi_edit,...
            pde_bfti_edit,pde_tfti_edit,pde_dwi_edit,pde_twi_edit,pde_bfbj_edit,...
            pde_tfbj_edit,pde_bftj_edit,pde_tftj_edit,pde_dwj_edit,pde_twj_edit,...
            pde_fili_edit,pde_filj_edit,pdesign_edit,punit_edit,pdb_member_name,...
            pdb_type_name,pdb_coordx_edit,pdb_coordy_edit,pdb_coordz_edit,...
            pdb_length_edit,pdb_bfb_edit,pdb_tfb_edit,pdb_bft_edit,pdb_tft_edit,...
            pdb_dw_edit,pdb_tw_edit,pdb_fil_edit,pdb_step_edit,vrum_az_slider,...
            vrum_el_slider,vrum_az_edit,vrum_el_edit,ptable_remove_edit,axesm,vstm,modelnum,auto_modelname_edit);            
         % Analysis
         set(recba_tau_diagram,'Value',1);
         if isempty(RNCc) || isempty(PNC)     
            set(pt_title_name,'String','Modeling is not completed')
            set(pt_title_name,'Visible','on') 
         else
            if isequal(max(max(abs(LNC(:,5:10)))),0) && isequal(max(max(abs(LUEC(:,5:7)))),0)
               set(pt_title_name,'String','Modeling is not completed')
               set(pt_title_name,'Visible','on')
            else
               set(pt_title_name,'Visible','off') 
               AR=0;AS=0;AE=0;AI=0;ANE=0;ANI=0;lambda = 1;nmode = 1;ninc = 1;
               JeongP=str2double(get(ap_jeong_edit,'String'));BrentP=str2double(get(ap_brent_edit,'String'));    
               [ANI,gammma,EGunew,Qintf,Qintg,tau,Rpg,Rpc,Rpt,Rh,Myc,Myt,My,Jval,Phi_Mmax,Phi_Py,UC,crLTB,LGv] = AnalysisNonIEBuckling(Massemble,...
                  Rval,JNodevalue_i,JNodevalue_j,SNodevalue,RNCc,Nshe1,Nshe2,DUP1,DUP2,LNC,LNC1,LNC2,...
                  LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,nmode,ninc,lambda,pt_title_name,...
                  ap_da_buttongroup,ap_cv_buttongroup,JeongP,BrentP,NLIAType);   
%                set(recba_gamma_edit,'String',num2str(gammma));
%                results_diagram_menu_Callback;
%                set(recba_Scale_edit,'String',num2str(1.2*max(max(RNCc(:,5)),max(RNCc(:,7)))));
%                set(recba_tau_diagram,'Value',2);
%                if ~isequal( min(min(min(Qintf))), 0)
%                   recba_tau_diagram_pushbutton_Callback; 
%                end
            end
         end         

         % Report Results
         Qintf=round(Qintf*10^4)/10^4; 
         maxPt = max(max(Qintf(:,1)),max(-Qintf(:,8)));
         minPt = min(min(Qintf(:,1)),min(-Qintf(:,8)));
         if abs(maxPt) > abs(minPt)
            Pt=maxPt;   
         else
            Pt=minPt; 
         end         
         
         maxMzt = max(max(-Qintf(:,6)),max(Qintf(:,13)));
         minMzt = min(min(-Qintf(:,6)),min(Qintf(:,13)));
         if abs(maxMzt) > abs(minMzt)
            Mzt=maxMzt;   
         else
            Mzt=minMzt; 
         end
         maxPhi_Mmax=max(max(Phi_Mmax));
         mintau = min(min(tau));      
         fprintf(out,'%4.0f %12.4f %12.4f %12.4f %12.4f\n',modelnum,Pt,Mzt,mintau,maxPhi_Mmax);
      end % end for

   end  % isequal([filename,pathname],[0,0]) 

   fclose('all'); 
   
   end % isempty

end % function end


end % Main function end