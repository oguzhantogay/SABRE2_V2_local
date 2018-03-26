function [cflag]=SABRE2Curve(Qintfs,Funews,Qintgs,cflag,APP,apninc_assign_edit,api_assign_edit)
% Developed by Woo Yong Jeong.
% Date : 03/01/2015.
% ************************************************************************
% *****                     Generate SABRE2 Plots                    *****
% ************************************************************************
% Global Variables
global filenamep;
global pathnamep; 
global Title; 
global UTitle;
global xdata; 
global ydata; 
global zdata; 
global LP;
global Nodenum;
global dofree;

global Lcolor; 
global Lst; 
global Ltic;
global flagp; flagp=0;
global QintfCV;
global FunewCV;
global QintgCV;
   
if isempty(Funews)
   Qintfs =[]; Qintgs=[];
end

QintfCV=Qintfs;
FunewCV=Funews;
QintgCV=Qintgs;  
   
cflag=cflag+1;
if isequal(cflag,1) && isequal(APP,1) % First Open S
   
filenamep = []; 
pathnamep = [];
Title=[];UTitle=[];
xdata=[];
ydata=[];
zdata=[];
LP = [];
Nodenum =[];
dofree =[];

Lcolor = [];
Lst = [];
Ltic = []; 
% ************************************************************************
% *****      Graphical User Interface for General beam/frame FEA     *****
% ************************************************************************ 
clc;
scrsz = get(groot,'ScreenSize'); Sw=scrsz(3); Sd=scrsz(4);% Get ScreenSize
% Create and then hide the GUI(Master figure) as it is being constructed.
masterc = figure('Position',[Sw*2/10,Sd*2/10,round(Sw*7/10),round(Sd*7/10)],'Units','normalized',...
   'MenuBar','none','NumberTitle','off','Visible','off','Name','SABRE2 Plots','Color','k');
if scrsz(3) > 2050
   Fs=1;
else
   Fs = Sw/2050;
end
% ************************************************************************
% *****************               MENUS              *********************
% ************************************************************************
fc = uimenu(masterc,'Label','File');   % File memu
   fic = uimenu(fc,'Label','About','Callback',{@filec_info_menu_Callback});
%    fnc = uimenu(fc,'Label','New','Callback',{@filec_new_menu_Callback});
%    foc = uimenu(fc,'Label','Open','Callback',{@filec_open_menu_Callback});
   fsc = uimenu(fc,'Label','Save','Callback',{@filec_save_menu_Callback});
   fsac= uimenu(fc,'Label','Save As','Callback',{@filec_saveas_menu_Callback});
   fprc= uimenu(fc,'Label','Preview','Callback',{@filec_preview_menu_Callback});
   fpc = uimenu(fc,'Label','Print','Callback',{@filec_print_menu_Callback});
   fppc= uimenu(fc,'Label','Print Photo','Callback',{@filec_printphoto_menu_Callback});
   fqc = uimenu(fc,'Label','Quit','Callback',{@filec_quit_menu_Callback});  
vc = uimenu(masterc,'Label','View');
   vzc = uimenu(vc,'Label','Zoom','Callback',{@viewc_zoom_menu_Callback});
   vrc = uimenu(vc,'Label','Rotate','Callback',{@viewc_rotate_menu_Callback});
   vpc = uimenu(vc,'Label','Pan','Callback',{@viewc_pan_menu_Callback});
   vdc = uimenu(vc,'Label','Defined Views');   
      vroc = uimenu(vdc,'Label','Isometric(X-Y-Z) View','Callback',{@viewc_defined_xyz_menu_Callback});
      vrxyc = uimenu(vdc,'Label','Front(X-Y) View','Callback',{@viewc_defined_xy_menu_Callback});
      vrxzc = uimenu(vdc,'Label','Top(X-Z) View','Callback',{@viewc_defined_xz_menu_Callback});
      vryzc = uimenu(vdc,'Label','Side(Y-Z) View','Callback',{@viewc_defined_yz_menu_Callback});
      vruc = uimenu(vdc,'Label','User Defined View','Callback',{@viewc_defined_user_menu_Callback});      
   vfc = uimenu(vc,'Label','Fit','Callback',{@viewc_fit_menu_Callback});
   vcc = uimenu(vc,'Label','Screen Center','Callback',{@viewc_center_menu_Callback}); 
   vstc = uimenu(vc,'Label','White Background','Callback',{@viewc_screenshot_menu_Callback});  
rc = uimenu(masterc,'Label','Plots','Callback',{@curve_menu_Callback});  
% *************************************************************** set menu
% submenu accelerator : shortcut 
set(fsc,'Accelerator','S'); set(fpc,'Accelerator','P')
set(fqc,'Accelerator','Q')
% submenu sepatation & Checked
set([fic,fsc,fprc,fqc],'Separator','on')
set([vzc,vdc,vfc,vstc],'Separator','on')
% ************************************************************************
% *****************                AXES              *********************
% ************************************************************************ 
axesc = axes('Position',[0,0,round(Sw*(7/10)*(8/10)),round(Sd*(7/10))],...
   'Visible','off','Units','Pixels');
% X-Y View
az = 0; el = 0; view(az, el);
% ************************************************************************
% *****************            COMPONENTS            *********************
% ************************************************************************
Pw=round(Sw*(8/10)*(1/10));Pd=round(Sd*(8/10));
% ***************************************************** INFORMATION panel
% INPUT BACKGROUNG using panel.
inf_panel = uipanel('Visible','off','Title','','Units','Pixels','Tag','IPanelc',...
   'BackgroundColor',[0.9412 0.9412 0.9412],'Position',...
   [round(Sw*(1.5/10)*(8.5/10)),round(Sd*(1.9/10)),round(Sw*(5/10)*(9.4/10)),round(Sd*(4/10))]);
% Post-setting
set(inf_panel,'Units','normalized')
% INPUT BACKGROUNG TEXT 
inf_title_name = uicontrol('Style','text','String','SABRE2 Plots v1.7','Tag','ITitlec',...  
   'Position',[round(Sw*(1.5/10)*(9/10)),round(Sd*(5/10)),round(Sw*(5/10)*(9/10)),round(Sd*(0.5/10))],...
   'ForegroundColor','b','BackgroundColor',[0.9412 0.9412 0.9412],'FontSize',Fs*22,'FontWeight','bold','FontUnits','normalized');
inf_name = uicontrol('Style','text','String','Developed by ','Tag','ITextc',...  
   'Position',[round(Sw*(1.5/10)*(9/10)),round(Sd*(4/10)),round(Sw*(5/10)*(9/10)),round(Sd*(0.5/10))],...
   'ForegroundColor','k','BackgroundColor',[0.9412 0.9412 0.9412],'FontSize',Fs*17,'FontWeight','bold','FontUnits','normalized');
inf_wj_name = uicontrol('Style','text','String','Woo Yong Jeong,','Tag','ITextc',...  
   'Position',[round(Sw*(1.5/10)*(9/10)),round(Sd*(3.5/10)),round(Sw*(5/10)*(9/10)),round(Sd*(0.5/10))],...
   'ForegroundColor','k','BackgroundColor',[0.9412 0.9412 0.9412],'FontSize',Fs*17,'FontWeight','bold','FontUnits','normalized');
inf_and_name = uicontrol('Style','text','String','Oguzhan Togay,','Tag','ITextc',...  
   'Position',[round(Sw*(1.5/10)*(9/10)),round(Sd*(3/10)),round(Sw*(5/10)*(9/10)),round(Sd*(0.5/10))],...
   'ForegroundColor','k','BackgroundColor',[0.9412 0.9412 0.9412],'FontSize',Fs*17,'FontWeight','bold','FontUnits','normalized');
inf_dw_name = uicontrol('Style','text','String','Donald W. White','Tag','ITextc',...  
   'Position',[round(Sw*(1.5/10)*(9/10)),round(Sd*(2.5/10)),round(Sw*(5/10)*(9/10)),round(Sd*(0.5/10))],...
   'ForegroundColor','k','BackgroundColor',[0.9412 0.9412 0.9412],'FontSize',Fs*17,'FontWeight','bold','FontUnits','normalized');
inf_cp_name = uicontrol('Style','text','String','(Copyright 2018 All rights reserved)','Tag','ITextc',...  
   'Position',[round(Sw*(1.5/10)*(9/10)),round(Sd*(2/10)),round(Sw*(5/10)*(9/10)),round(Sd*(0.5/10))],...
   'ForegroundColor','k','BackgroundColor',[0.9412 0.9412 0.9412],'FontSize',Fs*17,'FontWeight','bold','FontUnits','normalized');
% Post-setting
set([inf_title_name,inf_name,inf_wj_name,inf_and_name,inf_dw_name,inf_cp_name],'Visible','off','Units','normalized') 
% ***************************************************** main panel
% INPUT BACKGROUNG using panel.
pc_panel = uipanel('Visible','on','Title','','Units','Pixels','BackgroundColor',[0.5 0.5 0.5],...
   'Position',[round(Sw*(7/10)*(8/10)),0,round(Sw*(7/10)*(2/10)),round(Sd*(7/10))]);
% Post-setting
set(pc_panel,'Units','normalized')
% ******************************************************* Top Center title
% INPUT BACKGROUNG TEXT 
pc_title_name = uicontrol('Style','text','String','','BackgroundColor','k',...
   'Position',[0,round(Sd*(7/10)*(9.55/10)),round(Sw*(7/10)*(8/10)),round(Sd*(7/10)*(0.35/10))],...
   'ForegroundColor','r','FontSize',Fs*10,'FontWeight','bold','FontUnits','normalized');
% Post-setting
set(pc_title_name,'Visible','off','Units','normalized') 
% ****************************************************************** ABOUT
% INPUT BACKGROUNG TEXT 
fic_infor_name = uicontrol('Style','text','String','','BackgroundColor',[0 0 0],...
   'Position',[0,round(Sd*(7/10)*(9.55/10)),round(Sw*(7/10)*(8/10)),round(Sd*(7/10)*(0.35/10))],...
   'ForegroundColor','yellow','FontSize',Fs*10,'FontWeight','bold','FontUnits','normalized');
% Post-setting
set(fic_infor_name,'Visible','off','Units','normalized') 
% ****************************************************** USER DEFINED VIEW
% INPUT BACKGROUNG using panel.
vruc_panel = uipanel('Visible','on','Title','','Units','Pixels','BackgroundColor',[0.5 0.5 0.5],...
   'Position',[round(Sw*(6/10)*(7.9/10)),0,round(Sw*(7/10)*(1.13/10)),round(Sd*(1.4/10))]);
% Post-setting
set(vruc_panel,'Units','normalized')
% INPUT BACKGROUNG using panel
vruc_type_subpanel = uipanel(vruc_panel,'Title','','Units','Pixels','BackgroundColor','black',...
   'Position',[round(Pw*(1/20)),round(Pd*(0.5/40)),round(Pw*(17.5/20)),round(Pd*(5.5/40))]);
% Post-setting
set(vruc_type_subpanel,'Units','normalized')
% INPUT BACKGROUNG using slider.
vruc_el_slider = uicontrol(vruc_type_subpanel,'Style','slider','BackgroundColor',[0.7 0.7 0.7],...
   'Max',180,'Min',-180,'Value',0,'SliderStep',[0.01 0.1],'Callback',{@vruc_el_slider_callback},...
   'Position',[round(Pw*(1.5/20)),round(Pd*(3/40)),round(Pw*(14.5/20)),round(Pd*(0.65/40))]);
vruc_az_slider = uicontrol(vruc_type_subpanel,'Style','slider','BackgroundColor',[0.7 0.7 0.7],...
   'Max',180,'Min',-180,'Value',0,'SliderStep',[0.01 0.1],'Callback',{@vruc_az_slider_callback},...
   'Position',[round(Pw*(1.5/20)),round(Pd*(0.5/40)),round(Pw*(14.5/20)),round(Pd*(0.65/40))]);
% Post-setting
set([vruc_az_slider,vruc_el_slider],'Units','normalized');
% INPUT BACKGROUNG TEXT 
vruc_vi_name = uicontrol(vruc_panel,'Style','text','String','Define View','BackgroundColor',[0 0 0],...
   'Position',[round(Pw*(2/20)),round(Pd*(5.7/40)),round(Pw*(13/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*10,'FontWeight','bold','FontUnits','normalized');
vruc_el_name = uicontrol(vruc_type_subpanel,'Style','text','String','Elevation','BackgroundColor',[0 0 0],...
   'Position',[round(Pw*(1/20)),round(Pd*(3.8/40)),round(Pw*(8/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*10,'FontWeight','bold','FontUnits','normalized');
vruc_az_name = uicontrol(vruc_type_subpanel,'Style','text','String','Azimuth','BackgroundColor',[0 0 0],...
   'Position',[round(Pw*(1/20)),round(Pd*(1.3/40)),round(Pw*(8/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*10,'FontWeight','bold','FontUnits','normalized');
% Post-setting
set([vruc_vi_name,vruc_az_name,vruc_el_name],'Units','normalized') 
% INPUT BOX using edit
vruc_el_edit = uicontrol(vruc_type_subpanel,'Style','edit','String','0.00','FontSize',Fs*9,'FontWeight','bold',...
   'BackgroundColor','black','ForegroundColor','white','FontUnits','normalized',...
   'Position',[round(Pw*(10.5/20)),round(Pd*(3.8/40)),round(Pw*(5/20)),round(Pd*(0.65/40))]); 
vruc_az_edit = uicontrol(vruc_type_subpanel,'Style','edit','String','0.00','FontSize',Fs*9,'FontWeight','bold',...
   'BackgroundColor','black','ForegroundColor','white','FontUnits','normalized',...
   'Position',[round(Pw*(10.5/20)),round(Pd*(1.3/40)),round(Pw*(5/20)),round(Pd*(0.65/40))]); 
% Post-setting
set([vruc_az_edit,vruc_el_edit],'Units','normalized');
% *************** Visible off for USER DEFINED VIEW S
% *** sub panel1
set([vruc_panel,vruc_type_subpanel],'Visible','off')
set([vruc_az_slider,vruc_el_slider],'Visible','off')
set([vruc_vi_name,vruc_az_name,vruc_el_name],'Visible','off');
set([vruc_az_edit,vruc_el_edit],'Visible','off');
% *************** Visible off for USER DEFINED VIEW E



% ********************************************************** ATTRIBUTES S  
% ************************************************ sub panel1
pdc_type_subpanel = uipanel(pc_panel,'Title','','Units','Pixels','BackgroundColor','black',...
   'Position',[round(Pw*(1/20)),round(Pd*(33/40)),round(Pw*(33/20)),round(Pd*(2/40))]);
% Post-setting
set(pdc_type_subpanel,'Units','normalized')
% INPUT DESCRIPTION using text
pdc_num_text = uicontrol(pc_panel,'Style','text','String','#','BackgroundColor','black',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(34/40)),round(Pw*(3/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','yellow','FontSize',Fs*10,'FontWeight','bold','FontUnits','normalized');
pdc_type_text = uicontrol(pc_panel,'Style','text','String','Title','BackgroundColor','black',...
   'Position',[round(Pw*(3.5/20)),round(Pd*(34/40)),round(Pw*(9.5/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','yellow','FontSize',Fs*10,'FontWeight','bold','FontUnits','normalized');
% INPUT BOX using edit
pdc_type_num = uicontrol(pc_panel,'Style','edit','String','1',...
   'Position',[round(Pw*(2/20)),round(Pd*(33.3/40)),round(Pw*(4/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized');
pdc_type_name = uicontrol(pc_panel,'Style','edit','String','',...
   'Position',[round(Pw*(7/20)),round(Pd*(33.3/40)),round(Pw*(26/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized');   
% Post-setting
set([pdc_num_text,pdc_type_text,pdc_type_num,pdc_type_name],'Units','normalized')
% ************************************************ sub panel2
% INPUT BACKGROUNG using panel.[5,578,180,130]
pdx_co_subpanel = uipanel(pc_panel,'Title','','Units','Pixels','BackgroundColor','black',...
   'Position',[round(Pw*(1/20)),round(Pd*(26/40)),round(Pw*(33/20)),round(Pd*(6/40))]);  
% Post-setting
set(pdx_co_subpanel,'Units','normalized');
% INPUT DESCRIPTION using text
pdx_co_text = uicontrol(pc_panel,'Style','text','String','X-axis Plot Properties','BackgroundColor','black',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(31.7/40)),round(Pw*(22/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontWeight','bold','FontUnits','normalized');
pdx_label_text = uicontrol(pc_panel,'Style','text','String','Define Label','BackgroundColor','black',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(30.5/40)),round(Pw*(10/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
pdx_data_text = uicontrol(pc_panel,'Style','text','String','Define Data','BackgroundColor','black',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(29.5/40)),round(Pw*(10/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
pdx_eln_text = uicontrol(pc_panel,'Style','text','String','Node# ','BackgroundColor','black',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(28.3/40)),round(Pw*(4.5/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
pdx_dof_text = uicontrol(pc_panel,'Style','text','String','dof =','BackgroundColor','black',...
   'Position',[round(Pw*(12/20)),round(Pd*(28.3/40)),round(Pw*(4.5/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
pdx_scale_text = uicontrol(pc_panel,'Style','text','String','Scale =','BackgroundColor','black',...
   'Position',[round(Pw*(22.5/20)),round(Pd*(28.3/40)),round(Pw*(4.5/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
pdx_min_text = uicontrol(pc_panel,'Style','text','String','Min =','BackgroundColor','black',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(26.8/40)),round(Pw*(4.5/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
pdx_max_text = uicontrol(pc_panel,'Style','text','String','Max =','BackgroundColor','black',...
   'Position',[round(Pw*(12/20)),round(Pd*(26.8/40)),round(Pw*(4.5/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
pdx_div_text = uicontrol(pc_panel,'Style','text','String','Div.s =','BackgroundColor','black',...
   'Position',[round(Pw*(22.5/20)),round(Pd*(26.8/40)),round(Pw*(4.5/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
% Post-setting
set([pdx_co_text,pdx_label_text,pdx_data_text,pdx_eln_text,pdx_dof_text,pdx_scale_text],'Units','normalized');
set([pdx_min_text,pdx_max_text,pdx_div_text],'Units','normalized');
% INPUT BOX using edit
pdx_label_edit = uicontrol(pc_panel,'Style','edit','String','X Axis',...
   'Position',[round(Pw*(12/20)),round(Pd*(30.5/40)),round(Pw*(21/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pdx_data_edit = uicontrol(pc_panel,'Style','popupmenu','String',' None| Applied Load Ratio | Displacement(s) | Internal Force(s)',...
   'Position',[round(Pw*(12/20)),round(Pd*(29.5/40)),round(Pw*(21/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized','Callback',{@pdx_data_menu_Callback});  
pdx_eln_edit = uicontrol(pc_panel,'Style','popupmenu','String','1',...
   'Position',[round(Pw*(6/20)),round(Pd*(28.3/40)),round(Pw*(5.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pdx_dof_edit = uicontrol(pc_panel,'Style','popupmenu','String',' dis-X | dis-Y | dis-Z | X-rot | Y-rot | Z-rot| Warp',...
   'Position',[round(Pw*(16.5/20)),round(Pd*(28.3/40)),round(Pw*(5.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pdx_scale_edit = uicontrol(pc_panel,'Style','edit','String','1',...
   'Position',[round(Pw*(27.5/20)),round(Pd*(28.3/40)),round(Pw*(5.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pdx_min_edit = uicontrol(pc_panel,'Style','edit','String','0',...
   'Position',[round(Pw*(6/20)),round(Pd*(26.8/40)),round(Pw*(5.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pdx_max_edit = uicontrol(pc_panel,'Style','edit','String','1',...
   'Position',[round(Pw*(16.5/20)),round(Pd*(26.8/40)),round(Pw*(5.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pdx_div_edit = uicontrol(pc_panel,'Style','edit','String','5',...
   'Position',[round(Pw*(27.5/20)),round(Pd*(26.8/40)),round(Pw*(5.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
% Post-setting
set([pdx_label_edit,pdx_data_edit,pdx_eln_edit,pdx_dof_edit,pdx_scale_edit],'Units','normalized');
set([pdx_min_edit,pdx_max_edit,pdx_div_edit],'Units','normalized');
% ************************************************ sub panel3
% INPUT BACKGROUNG using panel.[5,578,180,130]
pdy_co_subpanel = uipanel(pc_panel,'Title','','Units','Pixels','BackgroundColor','black',...
   'Position',[round(Pw*(1/20)),round(Pd*(19/40)),round(Pw*(33/20)),round(Pd*(6/40))]);  
% Post-setting
set(pdy_co_subpanel,'Units','normalized');
% INPUT DESCRIPTION using text
pdy_co_text = uicontrol(pc_panel,'Style','text','String','Y-axis Plot Properties','BackgroundColor','black',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(24.7/40)),round(Pw*(22/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontWeight','bold','FontUnits','normalized');
pdy_label_text = uicontrol(pc_panel,'Style','text','String','Define Label','BackgroundColor','black',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(23.5/40)),round(Pw*(10/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
pdy_data_text = uicontrol(pc_panel,'Style','text','String','Define Data','BackgroundColor','black',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(22.5/40)),round(Pw*(10/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
pdy_eln_text = uicontrol(pc_panel,'Style','text','String','Node# ','BackgroundColor','black',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(21.3/40)),round(Pw*(4.5/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
pdy_dof_text = uicontrol(pc_panel,'Style','text','String','dof =','BackgroundColor','black',...
   'Position',[round(Pw*(12/20)),round(Pd*(21.3/40)),round(Pw*(4.5/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
pdy_scale_text = uicontrol(pc_panel,'Style','text','String','Scale =','BackgroundColor','black',...
   'Position',[round(Pw*(22.5/20)),round(Pd*(21.3/40)),round(Pw*(4.5/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
pdy_min_text = uicontrol(pc_panel,'Style','text','String','Min =','BackgroundColor','black',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(19.8/40)),round(Pw*(4.5/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
pdy_max_text = uicontrol(pc_panel,'Style','text','String','Max =','BackgroundColor','black',...
   'Position',[round(Pw*(12/20)),round(Pd*(19.8/40)),round(Pw*(4.5/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
pdy_div_text = uicontrol(pc_panel,'Style','text','String','Div.s =','BackgroundColor','black',...
   'Position',[round(Pw*(22.5/20)),round(Pd*(19.8/40)),round(Pw*(4.5/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
% Post-setting
set([pdy_co_text,pdy_label_text,pdy_data_text,pdy_eln_text,pdy_dof_text,pdy_scale_text],'Units','normalized');
set([pdy_min_text,pdy_max_text,pdy_div_text],'Units','normalized');
% INPUT BOX using edit
pdy_label_edit = uicontrol(pc_panel,'Style','edit','String','Y Axis',...
   'Position',[round(Pw*(12/20)),round(Pd*(23.5/40)),round(Pw*(21/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pdy_data_edit = uicontrol(pc_panel,'Style','popupmenu','String',' None| Applied Load Ratio | Displacement(s) | Internal Force(s)',...
   'Position',[round(Pw*(12/20)),round(Pd*(22.5/40)),round(Pw*(21/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized','Callback',{@pdy_data_menu_Callback}); 
pdy_eln_edit = uicontrol(pc_panel,'Style','popupmenu','String','1',...
   'Position',[round(Pw*(6/20)),round(Pd*(21.3/40)),round(Pw*(5.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pdy_dof_edit = uicontrol(pc_panel,'Style','popupmenu','String',' dis-X | dis-Y | dis-Z | X-rot | Y-rot | Z-rot| Warp',...
   'Position',[round(Pw*(16.5/20)),round(Pd*(21.3/40)),round(Pw*(5.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pdy_scale_edit = uicontrol(pc_panel,'Style','edit','String','1',...
   'Position',[round(Pw*(27.5/20)),round(Pd*(21.3/40)),round(Pw*(5.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized');  
pdy_min_edit = uicontrol(pc_panel,'Style','edit','String','0',...
   'Position',[round(Pw*(6/20)),round(Pd*(19.8/40)),round(Pw*(5.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pdy_max_edit = uicontrol(pc_panel,'Style','edit','String','1',...
   'Position',[round(Pw*(16.5/20)),round(Pd*(19.8/40)),round(Pw*(5.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pdy_div_edit = uicontrol(pc_panel,'Style','edit','String','5',...
   'Position',[round(Pw*(27.5/20)),round(Pd*(19.8/40)),round(Pw*(5.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
% Post-setting
set([pdy_label_edit,pdy_data_edit,pdy_eln_edit,pdy_dof_edit,pdy_scale_edit],'Units','normalized');
set([pdy_min_edit,pdy_max_edit,pdy_div_edit],'Units','normalized');
% ************************************************ sub panel4
% INPUT BACKGROUNG using panel.[5,578,180,130]
pdz_co_subpanel = uipanel(pc_panel,'Title','','Units','Pixels','BackgroundColor','black',...
   'Position',[round(Pw*(1/20)),round(Pd*(12/40)),round(Pw*(33/20)),round(Pd*(6/40))]);  
% Post-setting
set(pdz_co_subpanel,'Units','normalized');
% INPUT DESCRIPTION using text
pdz_co_text = uicontrol(pc_panel,'Style','text','String','Z-axis Plot Properties','BackgroundColor','black',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(17.7/40)),round(Pw*(22/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontWeight','bold','FontUnits','normalized');
pdz_label_text = uicontrol(pc_panel,'Style','text','String','Define Label','BackgroundColor','black',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(16.5/40)),round(Pw*(10/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
pdz_data_text = uicontrol(pc_panel,'Style','text','String','Define Data','BackgroundColor','black',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(15.5/40)),round(Pw*(10/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
pdz_eln_text = uicontrol(pc_panel,'Style','text','String','Node# ','BackgroundColor','black',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(14.3/40)),round(Pw*(4.5/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
pdz_dof_text = uicontrol(pc_panel,'Style','text','String','dof =','BackgroundColor','black',...
   'Position',[round(Pw*(12/20)),round(Pd*(14.3/40)),round(Pw*(4.5/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
pdz_scale_text = uicontrol(pc_panel,'Style','text','String','Scale =','BackgroundColor','black',...
   'Position',[round(Pw*(22.5/20)),round(Pd*(14.3/40)),round(Pw*(4.5/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
pdz_min_text = uicontrol(pc_panel,'Style','text','String','Min =','BackgroundColor','black',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(12.8/40)),round(Pw*(4.5/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
pdz_max_text = uicontrol(pc_panel,'Style','text','String','Max =','BackgroundColor','black',...
   'Position',[round(Pw*(12/20)),round(Pd*(12.8/40)),round(Pw*(4.5/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
pdz_div_text = uicontrol(pc_panel,'Style','text','String','Div.s =','BackgroundColor','black',...
   'Position',[round(Pw*(22.5/20)),round(Pd*(12.8/40)),round(Pw*(4.5/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
% Post-setting
set([pdz_co_text,pdz_label_text,pdz_data_text,pdz_eln_text,pdz_dof_text,pdz_scale_text],'Units','normalized');
set([pdz_min_text,pdz_max_text,pdz_div_text],'Units','normalized');
% INPUT BOX using edit
pdz_label_edit = uicontrol(pc_panel,'Style','edit','String','Z Axis',...
   'Position',[round(Pw*(12/20)),round(Pd*(16.5/40)),round(Pw*(21/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pdz_data_edit = uicontrol(pc_panel,'Style','popupmenu','String',' None| Applied Load Ratio | Displacement(s) | Internal Force(s)',...
   'Position',[round(Pw*(12/20)),round(Pd*(15.5/40)),round(Pw*(21/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized','Callback',{@pdz_data_menu_Callback}); 
pdz_eln_edit = uicontrol(pc_panel,'Style','popupmenu','String','1',...
   'Position',[round(Pw*(6/20)),round(Pd*(14.3/40)),round(Pw*(5.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pdz_dof_edit = uicontrol(pc_panel,'Style','popupmenu','String',' dis-X | dis-Y | dis-Z | X-rot | Y-rot | Z-rot| Warp',...
   'Position',[round(Pw*(16.5/20)),round(Pd*(14.3/40)),round(Pw*(5.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pdz_scale_edit = uicontrol(pc_panel,'Style','edit','String','1',...
   'Position',[round(Pw*(27.5/20)),round(Pd*(14.3/40)),round(Pw*(5.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized');  
pdz_min_edit = uicontrol(pc_panel,'Style','edit','String','0',...
   'Position',[round(Pw*(6/20)),round(Pd*(12.8/40)),round(Pw*(5.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pdz_max_edit = uicontrol(pc_panel,'Style','edit','String','1',...
   'Position',[round(Pw*(16.5/20)),round(Pd*(12.8/40)),round(Pw*(5.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pdz_div_edit = uicontrol(pc_panel,'Style','edit','String','5',...
   'Position',[round(Pw*(27.5/20)),round(Pd*(12.8/40)),round(Pw*(5.5/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
% Post-setting
set([pdz_label_edit,pdz_data_edit,pdz_eln_edit,pdz_dof_edit,pdz_scale_edit],'Units','normalized');
set([pdz_min_edit,pdz_max_edit,pdz_div_edit],'Units','normalized');
% ************************************************ sub panel5
% INPUT BACKGROUNG using panel.[5,578,180,130]
pdc_co_subpanel = uipanel(pc_panel,'Title','','Units','Pixels','BackgroundColor','black',...
   'Position',[round(Pw*(1/20)),round(Pd*(3.5/40)),round(Pw*(33/20)),round(Pd*(6.5/40))]);  
% Post-setting
set(pdc_co_subpanel,'Units','normalized');
% INPUT DESCRIPTION using text
pdc_co_text = uicontrol(pc_panel,'Style','text','String','Line Properties','BackgroundColor','black',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(9.7/40)),round(Pw*(22/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontWeight','bold','FontUnits','normalized');
pdc_label_text = uicontrol(pc_panel,'Style','text','String','Color','BackgroundColor','black',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(8.5/40)),round(Pw*(10/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
pdc_data_text = uicontrol(pc_panel,'Style','text','String','Style','BackgroundColor','black',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(7.5/40)),round(Pw*(10/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
pdc_eln_text = uicontrol(pc_panel,'Style','text','String','Thickness','BackgroundColor','black',...
   'Position',[round(Pw*(1.5/20)),round(Pd*(6.5/40)),round(Pw*(10/20)),round(Pd*(0.65/40))],...
   'ForegroundColor','white','FontSize',Fs*9,'FontUnits','normalized');
% Post-setting
set([pdc_co_text,pdc_label_text,pdc_data_text,pdc_eln_text],'Units','normalized');
% INPUT BOX using edit
pdc_label_edit = uicontrol(pc_panel,'Style','popupmenu','String','Yellow |Blue |Green |White |Red |Cyan |Magenta ',...
   'Position',[round(Pw*(12/20)),round(Pd*(8.5/40)),round(Pw*(21/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pdc_data_edit = uicontrol(pc_panel,'Style','popupmenu','String','Solid |Dashed |Dotted |Circle ',...
   'Position',[round(Pw*(12/20)),round(Pd*(7.5/40)),round(Pw*(21/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
pdc_eln_edit = uicontrol(pc_panel,'Style','popupmenu','String','1 |2 |3 ',...
   'Position',[round(Pw*(12/20)),round(Pd*(6.5/40)),round(Pw*(21/20)),round(Pd*(0.65/40))],...
   'FontSize',Fs*8,'FontUnits','normalized'); 
% Post-setting
set([pdc_label_edit,pdc_data_edit,pdc_eln_edit],'Units','normalized');
% ************************************************ sub panel6
% INPUT BACKGROUNG using panel.
pdc_app_subpanel = uipanel(pc_panel,'Title','','Units','Pixels','BackgroundColor','black',...
   'Position',[round(Pw*(1/20)),round(Pd*(0.5/40)),round(Pw*(33/20)),round(Pd*(2/40))]);
% Post-setting
set(pdc_app_subpanel,'Units','normalized');
% APPLY & CANCEL using pushbutton
pdc_apply = uicontrol(pc_panel,'Style','pushbutton','String','Apply',...
   'Position',[round(Pw*(3/20)),round(Pd*(1/40)),round(Pw*(13/20)),round(Pd*(1/40))],...
   'FontSize',Fs*9,'FontUnits','normalized','Callback',{@pdc_apply_pushbutton_Callback}); 
pdc_cancel = uicontrol(pc_panel,'Style','pushbutton','String','Remove',...
   'Position',[round(Pw*(19/20)),round(Pd*(1/40)),round(Pw*(13/20)),round(Pd*(1/40))],...
   'FontSize',Fs*9,'FontUnits','normalized','Callback',{@pdc_cancel_pushbutton_Callback}); 
% Post-setting   
set([pdc_apply,pdc_cancel],'Units','normalized');  
% Visible off
set(pc_panel,'Visible','off')
% ************************************************ sub panel1
set(pdc_type_subpanel,'Visible','off')
set([pdc_num_text,pdc_type_text,pdc_type_num,pdc_type_name],'Visible','off')
% ************************************************ sub panel2
set(pdx_co_subpanel,'Visible','off');
set([pdx_co_text,pdx_label_text,pdx_data_text,pdx_eln_text,pdx_dof_text,pdx_scale_text],'Visible','off');
set([pdx_min_text,pdx_max_text,pdx_div_text],'Visible','off');
set([pdx_label_edit,pdx_data_edit,pdx_eln_edit,pdx_dof_edit,pdx_scale_edit],'Visible','off');
set([pdx_min_edit,pdx_max_edit,pdx_div_edit],'Visible','off');
% ************************************************ sub panel3
set(pdy_co_subpanel,'Visible','off');
set([pdy_co_text,pdy_label_text,pdy_data_text,pdy_eln_text,pdy_dof_text,pdy_scale_text],'Visible','off');
set([pdy_min_text,pdy_max_text,pdy_div_text],'Visible','off');
set([pdy_label_edit,pdy_data_edit,pdy_eln_edit,pdy_dof_edit,pdy_scale_edit],'Visible','off');
set([pdy_min_edit,pdy_max_edit,pdy_div_edit],'Visible','off');
% ************************************************ sub panel4
set(pdz_co_subpanel,'Visible','off');
set([pdz_co_text,pdz_label_text,pdz_data_text,pdz_eln_text,pdz_dof_text,pdz_scale_text],'Visible','off');
set([pdz_min_text,pdz_max_text,pdz_div_text],'Visible','off');
set([pdz_label_edit,pdz_data_edit,pdz_eln_edit,pdz_dof_edit,pdz_scale_edit],'Visible','off');
set([pdz_min_edit,pdz_max_edit,pdz_div_edit],'Visible','off');
% ************************************************ sub panel5
set(pdc_co_subpanel,'Visible','off');
set([pdc_co_text,pdc_label_text,pdc_data_text,pdc_eln_text],'Visible','off');
set([pdc_label_edit,pdc_data_edit,pdc_eln_edit],'Visible','off');
% ************************************************ sub panel6
set(pdc_app_subpanel,'Visible','off');
set([pdc_apply,pdc_cancel],'Visible','off'); 
    
% ************************************************************************
% ****************            SABRE2  Plots            *******************
% ************************************************************************
% Move the GUI to the center of the screen.
movegui(masterc,'center')
set(masterc,'Visible','on')
set(axesc,'Units','normalized') 
end % First Open E

% ************************************************************************
% *****************             Callback             *********************
% ************************************************************************
% ******************************************************** File Callback S
% --------------------------------------------------------------------
function filec_info_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzc,vrc,vpc], 'Checked', 'off');
   tic
   set([inf_panel,inf_title_name,inf_name,inf_wj_name,inf_and_name,inf_dw_name,inf_cp_name],'Visible','on') 
   pause(10)
   toc
   set([inf_panel,inf_title_name,inf_name,inf_wj_name,inf_and_name,inf_dw_name,inf_cp_name],'Visible','off') 
end

% % --------------------------------------------------------------------
% function filec_new_menu_Callback(hObject, eventdata)
%    clc; pan off; zoom off; rotate3d off; set([vzc,vrc,vpc], 'Checked', 'off');
%    set(masterc,'WindowButtonDownFcn',@viewc_defined_xy_menu_Callback);
%    % Callback function run when the Close menu item is selected         
%    selection = questdlg('Do you want to start over?',...
%       'New ','Yes','No','Yes');     
%    if strcmp(selection,'No')
%       return;
%    else    
%       for i = 1:length(LP(1,:))
%          delete(findobj('Tag',num2str(i)))    
%       end
%       
%       curve_menu_Callback(hObject, eventdata);
%       flagp=0;
%       filename = []; pathnamep = []; Title=[];UTitle=[];
%       xdata=[]; ydata=[]; zdata=[]; LP = [];
%       Lcolor = []; Lst = []; Ltic = [];  
%       delete(findobj('Tag','IP'))
%       legend('off')
%       
%       % Initial View : X-Y View
%       az = 0; el = 0; view(az, el);  
%       set(masterc,'Name',['SABRE2 Plots',pathnamep,filename])   
%       % ************************************************ sub panel1
%       set(pdc_type_num,'String','1')
%       set(pdc_type_name,'String','')
%       % ************************************************ sub panel2
%       set(pdx_label_edit,'String','X Axis')
%       set(pdx_data_edit,'Value',1)
%       set(pdx_eln_edit,'String','1','Visible','off')
%       set(pdx_dof_edit,'Value',1,'Visible','off')
%       set(pdx_scale_edit,'String','1','Visible','off')
%       set(pdx_min_edit,'String','0')
%       set(pdx_max_edit,'String','1')     
%       set(pdx_div_edit,'String','5')
%       % ************************************************ sub panel3
%       set(pdy_label_edit,'String','Y Axis')
%       set(pdy_data_edit,'Value',1)
%       set(pdy_eln_edit,'String','1','Visible','off')
%       set(pdy_dof_edit,'Value',1,'Visible','off')
%       set(pdy_scale_edit,'String','1','Visible','off')
%       set(pdy_min_edit,'String','0')
%       set(pdy_max_edit,'String','1')     
%       set(pdy_div_edit,'String','5')
%       % ************************************************ sub panel4
%       set(pdz_label_edit,'String','Z Axis')
%       set(pdz_data_edit,'Value',1)
%       set(pdz_eln_edit,'String','1','Visible','off')
%       set(pdz_dof_edit,'Value',1,'Visible','off')
%       set(pdz_scale_edit,'String','1','Visible','off')
%       set(pdz_min_edit,'String','0')
%       set(pdz_max_edit,'String','1')     
%       set(pdz_div_edit,'String','5')      
%       % ************************************************ sub panel4
%       set(pdc_label_edit,'Value',1)
%       set(pdc_data_edit,'Value',1)
%       set(pdc_eln_edit,'Value',1)           
%       
%    end
% end % function end
   
% % --------------------------------------------------------------------
% function filec_open_menu_Callback(hObject, eventdata)
%    clc; pan off; zoom off; rotate3d off; set([vzc,vrc,vpc], 'Checked', 'off');
%    set(masterc,'WindowButtonDownFcn',@viewc_defined_xy_menu_Callback);
%    % Visible function
%    [filename, pathnamep] = uigetfile({'*.mat','All MAT-Files (*.mat)'; ...
%       '*.*','All Files (*.*)'},'Select File');
%    if isequal([filename,pathnamep],[0,0]) || isempty(filename) || isempty(pathnamep)
%       return
%    else
%       
%    end
% end % function end
   
% --------------------------------------------------------------------
function filec_save_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzc,vrc,vpc], 'Checked', 'off');
   if isempty([filenamep,pathnamep])
      [filenamep, pathnamep] = uiputfile({'*.txt';'*.*'},'Save');	
      set(masterc,'Name',['SABRE2: ',pathnamep,filenamep])
      File = fullfile(pathnamep,filenamep);
      SABRE2InpSave(File,xdata,ydata,zdata,Title,Nodenum,dofree);
   else
      File = fullfile(pathnamep,filenamep);
      SABRE2InpSave(File,xdata,ydata,zdata,Title,Nodenum,dofree);
   end
end % function end

% --------------------------------------------------------------------
function filec_saveas_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzc,vrc,vpc], 'Checked', 'off');
   [filenamep, pathnamep] = uiputfile({'*.txt';'*.*'},'Save As');	
   % If 'Cancel' was selected then return
   if isequal([filenamep,pathnamep],[0,0]) || isempty(filenamep) || isempty(pathnamep)
      return
   else
      set(masterc,'Name',['SABRE2: ',pathnamep,filenamep])
      File = fullfile(pathnamep,filenamep);
      SABRE2InpSave(File,xdata,ydata,zdata,Title,Nodenum,dofree);
   end    
end % function end

% --------------------------------------------------------------------
function filec_preview_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzc,vrc,vpc], 'Checked', 'off');
   printpreview
end % function end

% --------------------------------------------------------------------
function filec_print_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzc,vrc,vpc], 'Checked', 'off');
   printdlg % Printer
end % function end

% --------------------------------------------------------------------
function filec_printphoto_menu_Callback(hObject, eventdata)
   clc;pan off; zoom off; rotate3d off; set([vzc,vrc,vpc], 'Checked', 'off');
   [filenamep, pathnamep] = uiputfile({'*.jpg';'*.png';'*.tif';'*.eps';...
      '*.bmp';'*.pdf';'*.*'},'Save Photo as File');	 
   File = fullfile(pathnamep,filenamep);
   % If 'Cancel' was selected then return
   if isequal(filenamep,0) || isempty(filenamep) 
      return
   else    
      saveas(gcf,File)
   end 
end % function end

% --------------------------------------------------------------------
function filec_quit_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzc,vrc,vpc], 'Checked', 'off');
   % Callback function run when the Close menu item is selected    
   selection = questdlg('Do you want to close ?','Close','Yes','No','Yes');
   if strcmp(selection,'No')
      return;
   else
      delete(masterc)
   end    
   cflag=0;
end % function end
% ******************************************************** File Callback E
% ******************************************************** View Callback S
% --------------------------------------------------------------------
function viewc_zoom_menu_Callback(hObject, eventdata)
   clc; pan off; rotate3d off; 
   if strcmp(get(gcbo, 'Checked'),'on')
       set(gcbo, 'Checked', 'off');
       set([vrc,vpc], 'Checked', 'off');
       zoom off;
   else 
       set(gcbo, 'Checked', 'on');
       set([vrc,vpc], 'Checked', 'off');
       zoom on; 
   end   
end % function end

% --------------------------------------------------------------------
function viewc_rotate_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off;
   if strcmp(get(gcbo, 'Checked'),'on')
       set(gcbo, 'Checked', 'off');
       set([vzc,vpc], 'Checked', 'off');
       rotate3d off;
   else 
       set(gcbo, 'Checked', 'on');
       set([vzc,vpc], 'Checked', 'off');
       rotate3d on;
      azf=get(gca,'view'); % Get current view     
      set(vruc_az_slider,'Value',azf(1,1));set(vruc_el_slider,'Value',azf(1,2))
      set(vruc_az_edit,'String',num2str(azf(1,1)));set(vruc_el_edit,'String',num2str(azf(1,2)));         
   end         
end % function end

% --------------------------------------------------------------------
function viewc_pan_menu_Callback(hObject, eventdata)  
   clc; zoom off; rotate3d off;
   if strcmp(get(gcbo, 'Checked'),'on')
       set(gcbo, 'Checked', 'off');
       set([vzc,vrc], 'Checked', 'off');
       pan off;
   else 
       set(gcbo, 'Checked', 'on');
       set([vzc,vrc], 'Checked', 'off');
       pan on;
   end  
end % function end

% --------------------------------------------------------------------
function viewc_defined_xyz_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzc,vrc,vpc], 'Checked', 'off');
   % Isometric-View
   az = -37.5; el = 30; view(az, el); 
   axis manual;   
   set( gca, 'Units', 'normalized', 'Position', [0 0.25 0.7 0.7] );
   set(vruc_az_slider,'Value',az);set(vruc_el_slider,'Value',el)
   set(vruc_az_edit,'String',num2str(az));set(vruc_el_edit,'String',num2str(el));    
end % function end

% --------------------------------------------------------------------
function viewc_defined_xy_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzc,vrc,vpc], 'Checked', 'off');
   az = 0; el = 0; view(az, el);  
   set( gca, 'Units', 'normalized', 'Position', [0 0.15 0.7 0.7] );
   set(vruc_az_slider,'Value',az);set(vruc_el_slider,'Value',el)
   set(vruc_az_edit,'String',num2str(az));set(vruc_el_edit,'String',num2str(el));    
end % function end

% --------------------------------------------------------------------
function viewc_defined_xz_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzc,vrc,vpc], 'Checked', 'off');
   az = 0; el = 90; view(az, el);  
   set( gca, 'Units', 'normalized', 'Position', [0 0.15 0.7 0.7] );
   set(vruc_az_slider,'Value',az);set(vruc_el_slider,'Value',el)
   set(vruc_az_edit,'String',num2str(az));set(vruc_el_edit,'String',num2str(el));    
end % function end

% --------------------------------------------------------------------
function viewc_defined_yz_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzc,vrc,vpc], 'Checked', 'off');
   az = 90; el = 0; view(az, el);    
   set( gca, 'Units', 'normalized', 'Position', [0 0.15 0.7 0.7] );
   set(vruc_az_slider,'Value',az);set(vruc_el_slider,'Value',el)
   set(vruc_az_edit,'String',num2str(az));set(vruc_el_edit,'String',num2str(el));    
end % function end

% --------------------------------------------------------------------
function viewc_defined_user_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzc,vrc,vpc], 'Checked', 'off');
   if strcmp(get(gcbo, 'Checked'),'on')     
      set(vruc, 'Checked', 'off');
      set([vruc_panel,vruc_type_subpanel],'Visible','off')
      set([vruc_az_slider,vruc_el_slider],'Visible','off')
      set([vruc_vi_name,vruc_az_name,vruc_el_name],'Visible','off');
      set([vruc_az_edit,vruc_el_edit],'Visible','off');
   else
      set(vruc, 'Checked', 'on');
      set([vruc_panel,vruc_type_subpanel],'Visible','on')
      set([vruc_az_slider,vruc_el_slider],'Visible','on')
      set([vruc_vi_name,vruc_az_name,vruc_el_name],'Visible','on');
      set([vruc_az_edit,vruc_el_edit],'Visible','on');   
      azf=get(gca,'view'); % Get current view     
      set(vruc_az_slider,'Value',azf(1,1));set(vruc_el_slider,'Value',azf(1,2))
      set(vruc_az_edit,'String',num2str(azf(1,1)));set(vruc_el_edit,'String',num2str(azf(1,2)));
      Fsize=get(pdc_type_num,'FontSize');
      set([vruc_az_edit,vruc_el_edit],'FontSize',Fsize)         
   end    
   set( gca, 'Units', 'normalized', 'Position', [0 0.15 0.7 0.7] );
end % function end

% --------------------------------------------------------------------
function vruc_az_slider_callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzc,vrc,vpc], 'Checked', 'off');
      set(vruc_az_edit,'String',num2str(get(vruc_az_slider,'Value')));
      az = str2double(get(vruc_az_edit,'string')); 
      el = str2double(get(vruc_el_edit,'string')); view(az, el);     
end % function end

% --------------------------------------------------------------------
function vruc_el_slider_callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzc,vrc,vpc], 'Checked', 'off');
      set(vruc_el_edit,'String',num2str(get(vruc_el_slider,'Value')));
      az = str2double(get(vruc_az_edit,'string')); 
      el = str2double(get(vruc_el_edit,'string')); view(az, el);     
end % function end
% --------------------------------------------------------------------
function viewc_fit_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzc,vrc,vpc], 'Checked', 'off'); 
   set( gca, 'Units', 'normalized', 'Position', [0 0.15 0.7 0.7] );
end % function end

% --------------------------------------------------------------------
function viewc_center_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzc,vrc,vpc], 'Checked', 'off');
   movegui(gcf,'center')
   set( gca, 'Units', 'normalized', 'Position', [0 0.15 0.7 0.7] );
end % function end

% --------------------------------------------------------------------
function viewc_screenshot_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzc,vrc,vpc], 'Checked', 'off');
   if strcmp(get(gcbo, 'Checked'),'on')     
      set(vstc, 'Checked', 'off');
      set(masterc,'Color','k')
      set(pc_title_name,'BackgroundColor','k','ForegroundColor','r')
      set(findobj('Tag','IPanelc'),'BackgroundColor',[0.9412 0.9412 0.9412])
      set(findobj('Tag','ITitlec'),'ForegroundColor','b','BackgroundColor',[0.9412 0.9412 0.9412])     
      set(findobj('Tag','ITextc'),'ForegroundColor','k','BackgroundColor',[0.9412 0.9412 0.9412])      
      set(findobj('Tag','IP'),'Color','w');
      set(axesc, 'Color', [0 0 0],'XColor', 'w', 'YColor', 'w', 'ZColor', 'w' );
      set(findobj('Tag','legend'),'Textcolor','w','Color','k','EdgeColor','k');
   else
      set(vstc, 'Checked', 'on');
      set(masterc,'Color','w')
      set(pc_title_name,'BackgroundColor','w','ForegroundColor','b')
      set(findobj('Tag','IPanelc'),'BackgroundColor','k')
      set(findobj('Tag','ITitlec'),'ForegroundColor','y','BackgroundColor','k')
      set(findobj('Tag','ITextc'),'ForegroundColor','w','BackgroundColor','k')        
      set(findobj('Tag','IP'),'Color','k');
      set(axesc, 'Color', [1 1 1],'XColor', 'k', 'YColor', 'k', 'ZColor', 'k' );
      set(findobj('Tag','legend'),'Textcolor','k','Color','w','EdgeColor','w');  
   end    
end % function end
% ******************************************************** View Callback E
 
% --------------------------------------------------------------------
function curve_menu_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzc,vrc,vpc], 'Checked', 'off');
%    set(masterc,'WindowButtonDownFcn',@curve_menu_Callback);
   flagp=1+flagp;
   if isequal(flagp,1)
   % -------------------------------------------------------------------
   % --------------------     Visible on      --------------------------
   % -------------------------------------------------------------------
   set(pc_panel,'Visible','on')
   % ************************************************ sub panel1
   set(pdc_type_subpanel,'Visible','on')
   set([pdc_num_text,pdc_type_text,pdc_type_num,pdc_type_name],'Visible','on')
   % ************************************************ sub panel2
   set(pdx_co_subpanel,'Visible','on');
   set([pdx_co_text,pdx_label_text,pdx_data_text],'Visible','on');
   set([pdx_eln_text,pdx_dof_text,pdx_scale_text],'Visible','off');
   set([pdx_min_text,pdx_max_text,pdx_div_text],'Visible','on');
   set([pdx_label_edit,pdx_data_edit],'Visible','on');
   set([pdx_eln_edit,pdx_dof_edit,pdx_scale_edit],'Visible','off');
   set([pdx_min_edit,pdx_max_edit,pdx_div_edit],'Visible','on');
   % ************************************************ sub panel3
   set(pdy_co_subpanel,'Visible','on');
   set([pdy_co_text,pdy_label_text,pdy_data_text],'Visible','on');
   set([pdy_eln_text,pdy_dof_text,pdy_scale_text],'Visible','off');
   set([pdy_min_text,pdy_max_text,pdy_div_text],'Visible','on');
   set([pdy_label_edit,pdy_data_edit],'Visible','on');
   set([pdy_eln_edit,pdy_dof_edit,pdy_scale_edit],'Visible','off');
   set([pdy_min_edit,pdy_max_edit,pdy_div_edit],'Visible','on');
   % ************************************************ sub panel4
   set(pdz_co_subpanel,'Visible','on');
   set([pdz_co_text,pdz_label_text,pdz_data_text],'Visible','on');
   set([pdz_eln_text,pdz_dof_text,pdz_scale_text],'Visible','off');
   set([pdz_min_text,pdz_max_text,pdz_div_text],'Visible','on');
   set([pdz_label_edit,pdz_data_edit],'Visible','on');
   set([pdz_eln_edit,pdz_dof_edit,pdz_scale_edit],'Visible','off');
   set([pdz_min_edit,pdz_max_edit,pdz_div_edit],'Visible','on');
   % ************************************************ sub panel5
   set(pdc_co_subpanel,'Visible','on');
   set([pdc_co_text,pdc_label_text,pdc_data_text,pdc_eln_text],'Visible','on');
   set([pdc_label_edit,pdc_data_edit,pdc_eln_edit],'Visible','on');
   % ************************************************ sub panel6
   set(pdc_app_subpanel,'Visible','on');
   set([pdc_apply,pdc_cancel],'Visible','on');    

   % -------------------------------------------------------------------
   % ------------------     Initial Axes      --------------------------
   % -------------------------------------------------------------------
   azf=get(gca,'view');   
   % reset axesc
   cla (axesc,'reset');   
   x=0:1/5:1;
   z=0:1/5:1;
   y=0:1/5:1;
   delete(findobj('Tag','IP'))
   if isequal(strcmp(get(vstc,'Checked'),'on'),1) % white background
      plot3(axesc,0,0,0,'Color','k','linewidth',1,'Tag','IP')      
   elseif isequal(strcmp(get(vstc,'Checked'),'on'),0) % black background 
      plot3(axesc,0,0,0,'Color','w','linewidth',1,'Tag','IP')
   end 
      
   hold on;   
   set(axesc,'xlim',[min(x) max(x)],'zlim',[min(y) max(y)],'ylim',[min(z) max(z)]) 

   % View
   view(azf(1,1), azf(1,2));
   axis manual;   
   set(axesc,'Visible','on','Units','normalized','DataAspectRatio',[1 1 1]) 
   if isequal(strcmp(get(vstc,'Checked'),'on'),1) % white background
      set(axesc, 'Color', [1 1 1],'XColor', 'k', 'YColor', 'k', 'ZColor', 'k' );
   elseif isequal(strcmp(get(vstc,'Checked'),'on'),0) % black background 
      set(axesc, 'Color', [0 0 0],'XColor', 'w', 'YColor', 'w', 'ZColor', 'w' );
   end
   set(axesc, 'XTickMode', 'manual','YTickMode', 'manual', 'ZTickMode', 'manual');
   set(axesc, 'XTick', x,'YTick', y, 'ZTick', z);

   ax = gca;
   ax.XLabel.String = 'X Axis';
   ax.YLabel.String = 'Z Axis';
   ax.ZLabel.String = 'Y Axis';
   set( gca, 'Units', 'normalized', 'Position', [0 0.15 0.7 0.7] );   

   end
 
end % function end

% --------------------------------------------------------------------
function pdx_data_menu_Callback(hObject, eventdata)
   pan off; zoom off; rotate3d off; set([vzc,vrc,vpc], 'Checked', 'off');
   if ~isempty(get(pdc_type_num,'String'))
      % Number of plots
      tnum = round(str2double(get(pdc_type_num,'String')));    
      % Data
      if isequal(get(pdx_data_edit,'Value'),1)  % ---------------- None
         set([pdx_eln_text,pdx_dof_text,pdx_scale_text],'Visible','off'); 
         set([pdx_eln_edit,pdx_dof_edit,pdx_scale_edit],'Visible','off');
         Nodenum(1,tnum) =0;
         dofree(1,tnum) =0;         
         if isempty(FunewCV)
             xdata(1,tnum)=0;
         else
            for incre=1:length(FunewCV(1,1,:))
               xdata(incre,tnum) = 0; 
            end

         end         

      elseif isequal(get(pdx_data_edit,'Value'),2) % ----- Applied Load(s)
         set([pdx_eln_text,pdx_dof_text,pdx_scale_text],'Visible','off'); 
         set([pdx_eln_edit,pdx_dof_edit,pdx_scale_edit],'Visible','off');      
         ninc = str2double(get(apninc_assign_edit,'String'));
         lambda = str2double(get(api_assign_edit,'String'));
         Nodenum(1,tnum) =0;
         dofree(1,tnum) =0;
         if isempty(FunewCV)
             xdata(1,tnum)=0;
         else
            pn = 1;
            for incre=1:length(FunewCV(1,1,:))
               xdata(incre,tnum)=0;
               if ~isequal(max(max(abs(FunewCV(:,:,incre)))),0)
                  xdata(pn,tnum) = lambda*incre; 
                  pn=pn+1;
               end
            end
         end    

      elseif isequal(get(pdx_data_edit,'Value'),3) % -------- Displacement   
         % Node numbers
         Nodenum(1,tnum) =get(pdx_eln_edit,'Value');
         dofree(1,tnum) =get(pdx_dof_edit,'Value');           
         if isempty(FunewCV)
            set([pdx_eln_text,pdx_dof_text,pdx_scale_text],'Visible','off'); 
            set([pdx_eln_edit,pdx_dof_edit,pdx_scale_edit],'Visible','off');             
            set(pdx_eln_edit,'String',num2str(0)) 
            xdata(1,tnum)=0;
         else
            set([pdx_eln_text,pdx_dof_text,pdx_scale_text],'Visible','on'); 
            set([pdx_eln_edit,pdx_dof_edit,pdx_scale_edit],'Visible','on');             
            Tynum=1:1:length(FunewCV(:,1,1));
            set(pdx_eln_edit,'String',num2str(Tynum'))  
          
            pn = 1;
            for incre=1:length(FunewCV(1,1,:))
               xdata(incre,tnum)=0;
               if ~isequal(max(max(abs(FunewCV(:,:,incre)))),0)
                  xdata(incre,tnum) = FunewCV(get(pdx_eln_edit,'Value'),(get(pdx_dof_edit,'Value')),incre); 
                  pn=pn+1;
               end                  
            end            
         end

      elseif isequal(get(pdx_data_edit,'Value'),4) % ----- Internal Force
         % Node numbers
         Nodenum(1,tnum) =get(pdx_eln_edit,'Value');
         dofree(1,tnum) =get(pdx_dof_edit,'Value');            
         if isempty(FunewCV)
            set([pdx_eln_text,pdx_dof_text,pdx_scale_text],'Visible','off'); 
            set([pdx_eln_edit,pdx_dof_edit,pdx_scale_edit],'Visible','off');             
            set(pdx_eln_edit,'String',num2str(0)) 
            xdata(1,tnum)=0;
         else
            set([pdx_eln_text,pdx_dof_text,pdx_scale_text],'Visible','on'); 
            set([pdx_eln_edit,pdx_dof_edit,pdx_scale_edit],'Visible','on');             
            Tynum=1:1:length(FunewCV(:,1,1));
            set(pdx_eln_edit,'String',num2str(Tynum')) 
         
            pn = 1;
            for incre = 1:length(QintgCV(1,1,:))
               xdata(incre,tnum)=0;
               if ~isequal(max(max(abs(FunewCV(:,:,incre)))),0)               
                  xdata(incre,tnum)=round(QintgCV(get(pdx_eln_edit,'Value'),get(pdx_dof_edit,'Value'),incre)*10^5)/10^5;
                  pn=pn+1;
               end                  
            end         
         end

      end % end Value

      xmin = min( min(min(xdata(:,:))),0 );
      xmax = max( max(max(xdata(:,:))),0 );
      if isequal(xmin,xmax)
         xmin = xmin - 0.5;
         xmax = xmax + 0.5;
      end             
      if isempty(Title)
         set(pdx_min_edit,'String',num2str(xmin))  
         set(pdx_max_edit,'String',num2str(xmax))  
      end
   end
 
end

% --------------------------------------------------------------------
function pdy_data_menu_Callback(hObject, eventdata)
   pan off; zoom off; rotate3d off; set([vzc,vrc,vpc], 'Checked', 'off');
   if ~isempty(get(pdc_type_num,'String'))
      % Number of plots
      tnum = round(str2double(get(pdc_type_num,'String')));
      % Data
      if isequal(get(pdy_data_edit,'Value'),1)  % ---------------- None
         set([pdy_eln_text,pdy_dof_text,pdy_scale_text],'Visible','off'); 
         set([pdy_eln_edit,pdy_dof_edit,pdy_scale_edit],'Visible','off');
         Nodenum(2,tnum) =0;
         dofree(2,tnum) =0;         
         if isempty(FunewCV)
             ydata(1,tnum)=0;
         else
            for incre=1:length(FunewCV(1,1,:))
               ydata(incre,tnum) = 0; 
            end

         end 

      elseif isequal(get(pdy_data_edit,'Value'),2) % ----- Applied Load(s)
         set([pdy_eln_text,pdy_dof_text,pdy_scale_text],'Visible','off'); 
         set([pdy_eln_edit,pdy_dof_edit,pdy_scale_edit],'Visible','off'); 
         ninc = str2double(get(apninc_assign_edit,'String'));
         lambda = str2double(get(api_assign_edit,'String'));
         Nodenum(2,tnum) =0;
         dofree(2,tnum) =0;
         if isempty(FunewCV)
             ydata(1,tnum)=0;
         else
            pn = 1;
            for incre=1:length(FunewCV(1,1,:))
               ydata(incre,tnum)=0;
               if ~isequal(max(max(abs(FunewCV(:,:,incre)))),0)               
                  ydata(incre,tnum) = lambda*incre; 
                  pn=pn+1;
               end                  
            end
         end         

      elseif isequal(get(pdy_data_edit,'Value'),3) % -------- Displacement      
         % Node numbers
         Nodenum(2,tnum) =get(pdy_eln_edit,'Value');
         dofree(2,tnum) =get(pdy_dof_edit,'Value');           
         if isempty(FunewCV)
            set([pdy_eln_text,pdy_dof_text,pdy_scale_text],'Visible','off'); 
            set([pdy_eln_edit,pdy_dof_edit,pdy_scale_edit],'Visible','off');             
            set(pdy_eln_edit,'String',num2str(0)) 
            ydata(1,tnum)=0;
         else
            set([pdy_eln_text,pdy_dof_text,pdy_scale_text],'Visible','on'); 
            set([pdy_eln_edit,pdy_dof_edit,pdy_scale_edit],'Visible','on');             
            Tynum=1:1:length(FunewCV(:,1,1));
            set(pdy_eln_edit,'String',num2str(Tynum')) 
          
            pn = 1;
            for incre=1:length(FunewCV(1,1,:))
               ydata(incre,tnum)=0;
               if ~isequal(max(max(abs(FunewCV(:,:,incre)))),0)               
                  ydata(incre,tnum) = FunewCV(get(pdy_eln_edit,'Value'),(get(pdy_dof_edit,'Value')),incre); 
                  pn=pn+1;
               end                     
            end            
         end

      elseif isequal(get(pdy_data_edit,'Value'),4) % ----- Internal Force
         % Node numbers
         Nodenum(2,tnum) =get(pdy_eln_edit,'Value');
         dofree(2,tnum) =get(pdy_dof_edit,'Value');            
         if isempty(FunewCV)
            set([pdy_eln_text,pdy_dof_text,pdy_scale_text],'Visible','off'); 
            set([pdy_eln_edit,pdy_dof_edit,pdy_scale_edit],'Visible','off');             
            set(pdy_eln_edit,'String',num2str(0)) 
            ydata(1,tnum)=0;
         else
            set([pdy_eln_text,pdy_dof_text,pdy_scale_text],'Visible','on'); 
            set([pdy_eln_edit,pdy_dof_edit,pdy_scale_edit],'Visible','on');             
            Tynum=1:1:length(FunewCV(:,1,1));
            set(pdy_eln_edit,'String',num2str(Tynum')) 
         
            pn = 1;
            for incre = 1:length(QintgCV(1,1,:)) 
               ydata(incre,tnum)=0;
               if ~isequal(max(max(abs(FunewCV(:,:,incre)))),0)                
                  ydata(incre,tnum)=round(QintgCV(get(pdy_eln_edit,'Value'),get(pdy_dof_edit,'Value'),incre)*10^5)/10^5;
                  pn=pn+1;
               end                        
            end         
         end

      end % end Value

      ymin = min( min(min(ydata(:,:))),0 );
      ymax = max( max(max(ydata(:,:))),0 );
      if isequal(ymin,ymax)
         ymin = ymin - 0.5;
         ymax = ymax + 0.5;
      end        
      if isempty(Title)
         set(pdy_min_edit,'String',num2str(ymin))  
         set(pdy_max_edit,'String',num2str(ymax)) 
      end

   end
end

% --------------------------------------------------------------------
function pdz_data_menu_Callback(hObject, eventdata)
   pan off; zoom off; rotate3d off; set([vzc,vrc,vpc], 'Checked', 'off');
   if ~isempty(get(pdc_type_num,'String'))
      % Number of plots
      tnum = round(str2double(get(pdc_type_num,'String')));
      % Data
      if isequal(get(pdz_data_edit,'Value'),1)  % ---------------- None
         set([pdz_eln_text,pdz_dof_text,pdz_scale_text],'Visible','off'); 
         set([pdz_eln_edit,pdz_dof_edit,pdz_scale_edit],'Visible','off');
         Nodenum(3,tnum) =0;
         dofree(3,tnum) =0;         
         if isempty(FunewCV)
             zdata(1,tnum)=0;
         else
            for incre=1:length(FunewCV(1,1,:))
               zdata(incre,tnum) = 0; 
            end

         end 

      elseif isequal(get(pdz_data_edit,'Value'),2) % ----- Applied Load(s)
         set([pdz_eln_text,pdz_dof_text,pdz_scale_text],'Visible','off'); 
         set([pdz_eln_edit,pdz_dof_edit,pdz_scale_edit],'Visible','off'); 
         ninc = str2double(get(apninc_assign_edit,'String'));
         lambda = str2double(get(api_assign_edit,'String'));
         Nodenum(3,tnum) =0;
         dofree(3,tnum) =0;
         if isempty(FunewCV)
             zdata(1,tnum)=0;
         else
            pn = 1;
            for incre=1:length(FunewCV(1,1,:))
               zdata(incre,tnum)=0;
               if ~isequal(max(max(abs(FunewCV(:,:,incre)))),0)               
                  zdata(incre,tnum) = lambda*incre; 
                  pn=pn+1;
               end                  
            end
         end         

      elseif isequal(get(pdz_data_edit,'Value'),3) % -------- Displacement  
         Nodenum(3,tnum) =get(pdz_eln_edit,'Value');
         dofree(3,tnum) =get(pdz_dof_edit,'Value');         
         % Node numbers
         if isempty(FunewCV)
            set([pdz_eln_text,pdz_dof_text,pdz_scale_text],'Visible','off'); 
            set([pdz_eln_edit,pdz_dof_edit,pdz_scale_edit],'Visible','off');             
            set(pdz_eln_edit,'String',num2str(0)) 
            zdata(1,tnum)=0;
         else
            set([pdz_eln_text,pdz_dof_text,pdz_scale_text],'Visible','on'); 
            set([pdz_eln_edit,pdz_dof_edit,pdz_scale_edit],'Visible','on');             
            Tynum=1:1:length(FunewCV(:,1,1));
            set(pdz_eln_edit,'String',num2str(Tynum')) 
            pn = 1;
            for incre=1:length(FunewCV(1,1,:))
               zdata(incre,tnum)=0;
               if ~isequal(max(max(abs(FunewCV(:,:,incre)))),0)               
                  zdata(incre,tnum) = FunewCV(get(pdz_eln_edit,'Value'),(get(pdz_dof_edit,'Value')),incre); 
                  pn=pn+1;
               end                    
            end            
         end

      elseif isequal(get(pdz_data_edit,'Value'),4) % ----- Internal Force
         % Node numbers
         Nodenum(3,tnum) =get(pdz_eln_edit,'Value');
         dofree(3,tnum) =get(pdz_dof_edit,'Value');            
         if isempty(FunewCV)
            set([pdz_eln_text,pdz_dof_text,pdz_scale_text],'Visible','off'); 
            set([pdz_eln_edit,pdz_dof_edit,pdz_scale_edit],'Visible','off');             
            set(pdz_eln_edit,'String',num2str(0)) 
            zdata(1,tnum)=0;
         else
            set([pdz_eln_text,pdz_dof_text,pdz_scale_text],'Visible','on'); 
            set([pdz_eln_edit,pdz_dof_edit,pdz_scale_edit],'Visible','on');             
            Tynum=1:1:length(FunewCV(:,1,1));
            set(pdz_eln_edit,'String',num2str(Tynum')) 
            pn = 1;
            for incre = 1:length(QintgCV(1,1,:)) 
               zdata(incre,tnum)=0;
               if ~isequal(max(max(abs(FunewCV(:,:,incre)))),0)                  
                  zdata(incre,tnum)=round(QintgCV(get(pdz_eln_edit,'Value'),get(pdz_dof_edit,'Value'),incre)*10^5)/10^5;
                  pn=pn+1;
               end                      
            end         
         end 

      end % end Value

      zmin = min( min(min(zdata(:,:))),0 );
      zmax = max( max(max(zdata(:,:))),0 );
      if isequal(zmin,zmax)
         zmin = zmin - 0.5;
         zmax = zmax + 0.5;
      end       

      if isempty(Title)
         set(pdz_min_edit,'String',num2str(zmin))  
         set(pdz_max_edit,'String',num2str(zmax)) 
      end

   end
end

% --------------------------------------------------------------------
function pdc_apply_pushbutton_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzc,vrc,vpc], 'Checked', 'off');  
if isempty(FunewCV) 
   set(pc_title_name,'String','Analysis did not finish.')
   set(pc_title_name,'Visible','on')          
else

% Automatic Curve numbering
if isempty(Title)
   nextcurve = 1;
   
   azf=get(gca,'view');   
   % reset axesc
   cla (axesc,'reset');   
   x=0:1/5:1;
   z=0:1/5:1;
   y=0:1/5:1;
   delete(findobj('Tag','IP'))
   if isequal(strcmp(get(vstc,'Checked'),'on'),1) % white background
      plot3(axesc,0,0,0,'Color','k','linewidth',1,'Tag','IP')      
   elseif isequal(strcmp(get(vstc,'Checked'),'on'),0) % black background 
      plot3(axesc,0,0,0,'Color','w','linewidth',1,'Tag','IP')
   end    
   hold on;   
   set(axesc,'xlim',[min(x) max(x)],'zlim',[min(y) max(y)],'ylim',[min(z) max(z)]) 

   % View
   view(azf(1,1), azf(1,2));
   axis manual;   
   set(axesc,'Visible','on','Units','normalized','DataAspectRatio',[1 1 1]) 
   if isequal(strcmp(get(vstc,'Checked'),'on'),1) % white background
      set(axesc, 'Color', [1 1 1],'XColor', 'k', 'YColor', 'k', 'ZColor', 'k' );      
   elseif isequal(strcmp(get(vstc,'Checked'),'on'),0) % black background 
      set(axesc, 'Color', [0 0 0],'XColor', 'w', 'YColor', 'w', 'ZColor', 'w' );
   end     
   set(axesc, 'XTickMode', 'manual','YTickMode', 'manual', 'ZTickMode', 'manual');
   set(axesc, 'XTick', x,'YTick', y, 'ZTick', z);

   ax = gca;
   ax.XLabel.String = 'X Axis';
   ax.YLabel.String = 'Z Axis';
   ax.ZLabel.String = 'Y Axis';
   set( gca, 'Units', 'normalized', 'Position', [0 0.15 0.7 0.7] );      
   
else
   nextcurve = length(Title(:,1))+1;
end

% % Call the functions
% pdx_data_menu_Callback(hObject, eventdata)
% pdy_data_menu_Callback(hObject, eventdata)
% pdz_data_menu_Callback(hObject, eventdata)

% ******************************************* X-axis Plot Properties  
xval1 = str2double(get(pdx_min_edit,'String'))*str2double(get(pdx_scale_edit,'String'));
xval2 = str2double(get(pdx_max_edit,'String'))*str2double(get(pdx_scale_edit,'String'));      
if xval1 < xval2
   xmin =  xval1;
   xmax =  xval2;
else
   xmin =  xval2;
   xmax =  xval1;
end
xdiv=str2double(get(pdx_div_edit,'string')); 

% ******************************************* Y-axis Plot Properties 
yval1 = str2double(get(pdy_min_edit,'String'))*str2double(get(pdy_scale_edit,'String'));
yval2 = str2double(get(pdy_max_edit,'String'))*str2double(get(pdy_scale_edit,'String'));      
if yval1 < yval2
   ymin =  yval1;
   ymax =  yval2;
else
   ymin =  yval2;
   ymax =  yval1;
end

ydiv=str2double(get(pdy_div_edit,'string'));

% ******************************************* Z-axis Plot Properties 
zval1 = str2double(get(pdz_min_edit,'String'))*str2double(get(pdz_scale_edit,'String'));
zval2 = str2double(get(pdz_max_edit,'String'))*str2double(get(pdz_scale_edit,'String'));      
if zval1 < zval2
   zmin =  zval1;
   zmax =  zval2;
else
   zmin =  zval2;
   zmax =  zval1;
end
zdiv=str2double(get(pdz_div_edit,'string'));
      
% Call the functions
pdx_data_menu_Callback(hObject, eventdata)
pdy_data_menu_Callback(hObject, eventdata)
pdz_data_menu_Callback(hObject, eventdata)

if isempty(get(pdc_type_num,'string')) ...
      || isnan(str2double(get(pdc_type_num,'String'))) ...
      || str2double(get(pdc_type_num,'String')) <= 0  
   set(pc_title_name,'String','Please enter Plot number. ')
   set(pc_title_name,'Visible','on')    
elseif isempty(get(pdc_type_name,'string'))
   set(pc_title_name,'String','Please enter Plot Title. ')
   set(pc_title_name,'Visible','on')     
else   
   % Number of Plots
   tnum = round(str2double(get(pdc_type_num,'String')));
   if tnum > nextcurve
      set(pc_title_name,'String',['Please enter Plot number ',num2str(nextcurve)])
      set(pc_title_name,'Visible','on') 
   else
      set(pc_title_name,'Visible','off')
      % Curve Title
      if isequal(tnum,nextcurve)
         if isempty(Title)
            Title= ['1','. ',get(pdc_type_name,'string')];
            UTitle= get(pdc_type_name,'string');
         else
            Title= [Title; [num2str(tnum),'. ',get(pdc_type_name,'string')]];
            UTitle= [UTitle; get(pdc_type_name,'string')];           
         end
      else
         CTitle = cellstr(Title);
         CTitle = strrep(CTitle, CTitle(tnum), cellstr([num2str(tnum),'. ',get(pdc_type_name,'string')]));
         Title=char(CTitle);
         UCTitle = cellstr(UTitle);
         UCTitle = strrep(UCTitle, UCTitle(tnum), cellstr(get(pdc_type_name,'string')));
         UTitle=char(UCTitle);         
      end
      
      ax = gca;
      % ******************************************* X-axis Plot Properties 
      % Label
      ax.XLabel.String = get(pdx_label_edit,'string');   
%       xmin=str2double(get(pdx_min_edit,'string')); 
%       xmax=str2double(get(pdx_max_edit,'string')); 
%       xdiv=str2double(get(pdx_div_edit,'string')); 
      
      % ******************************************* Y-axis Plot Properties 
      % Label      
      ax.YLabel.String = get(pdz_label_edit,'string');
%       ymin=str2double(get(pdy_min_edit,'string')); 
%       ymax=str2double(get(pdy_max_edit,'string')); 
%       ydiv=str2double(get(pdy_div_edit,'string'));

      % ******************************************* Z-axis Plot Properties 
      % Label      
      ax.ZLabel.String = get(pdy_label_edit,'string'); 
%       zmin=str2double(get(pdz_min_edit,'string')); 
%       zmax=str2double(get(pdz_max_edit,'string')); 
%       zdiv=str2double(get(pdz_div_edit,'string'));

   LP(1,tnum) = get(pdc_label_edit,'value');
   LP(2,tnum) = get(pdc_data_edit,'value');
   LP(3,tnum) = get(pdc_eln_edit,'value');

   for i = 1:length(LP(1,:))
      xr=xdata(:,i)*str2double(get(pdx_scale_edit,'String'));
      yr=ydata(:,i)*str2double(get(pdy_scale_edit,'String'));
      zr=zdata(:,i)*str2double(get(pdz_scale_edit,'String'));
      
      x=[];y=[];z=[];
      for k = 1:length(xr)
         if isequal(xr(k,1),0) && isequal(yr(k,1),0) && isequal(zr(k,1),0)   
         else
            x(k,1) =xr(k,1);y(k,1) =yr(k,1);z(k,1) =zr(k,1);
         end
      end

      delete(findobj('Tag',num2str(i)))
      % ****************************************************** Plot
      if isequal(LP(3,i),1)
         if isequal(LP(2,i),1)
            if isequal(LP(1,i),1)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','-','Color','y','Tag',num2str(i));
            elseif isequal(LP(1,i),2)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','-','Color','b','Tag',num2str(i));
            elseif isequal(LP(1,i),3)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','-','Color','g','Tag',num2str(i));           
            elseif isequal(LP(1,i),4)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','-','Color','w','Tag',num2str(i));              
            elseif isequal(LP(1,i),5)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','-','Color','r','Tag',num2str(i));             
            elseif isequal(LP(1,i),6)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','-','Color','c','Tag',num2str(i));     
            elseif isequal(LP(1,i),7)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','-','Color','m','Tag',num2str(i));                 
            end                       
         elseif isequal(LP(2,i),2)
            if isequal(LP(1,i),1)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','--','Color','y','Tag',num2str(i));
            elseif isequal(LP(1,i),2)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','--','Color','b','Tag',num2str(i));
            elseif isequal(LP(1,i),3)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','--','Color','g','Tag',num2str(i));           
            elseif isequal(LP(1,i),4)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','--','Color','w','Tag',num2str(i));              
            elseif isequal(LP(1,i),5)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','--','Color','r','Tag',num2str(i));             
            elseif isequal(LP(1,i),6)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','--','Color','c','Tag',num2str(i));     
            elseif isequal(LP(1,i),7)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','--','Color','m','Tag',num2str(i));                 
            end 
         elseif isequal(LP(2,i),3)
            if isequal(LP(1,i),1)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle',':','Color','y','Tag',num2str(i));
            elseif isequal(LP(1,i),2)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle',':','Color','b','Tag',num2str(i));
            elseif isequal(LP(1,i),3)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle',':','Color','g','Tag',num2str(i));           
            elseif isequal(LP(1,i),4)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle',':','Color','w','Tag',num2str(i));              
            elseif isequal(LP(1,i),5)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle',':','Color','r','Tag',num2str(i));             
            elseif isequal(LP(1,i),6)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle',':','Color','c','Tag',num2str(i));     
            elseif isequal(LP(1,i),7)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle',':','Color','m','Tag',num2str(i));                 
            end 
         elseif isequal(LP(2,i),4)
            if isequal(LP(1,i),1)
               plot3(axesc,x,z*0,y,'linewidth',1,'Marker','o','Color','y','Tag',num2str(i));
            elseif isequal(LP(1,i),2)
               plot3(axesc,x,z*0,y,'linewidth',1,'Marker','o','Color','b','Tag',num2str(i));
            elseif isequal(LP(1,i),3)
               plot3(axesc,x,z*0,y,'linewidth',1,'Marker','o','Color','g','Tag',num2str(i));           
            elseif isequal(LP(1,i),4)
               plot3(axesc,x,z*0,y,'linewidth',1,'Marker','o','Color','w','Tag',num2str(i));              
            elseif isequal(LP(1,i),5)
               plot3(axesc,x,z*0,y,'linewidth',1,'Marker','o','Color','r','Tag',num2str(i));             
            elseif isequal(LP(1,i),6)
               plot3(axesc,x,z*0,y,'linewidth',1,'Marker','o','Color','c','Tag',num2str(i));     
            elseif isequal(LP(1,i),7)
               plot3(axesc,x,z*0,y,'linewidth',1,'Marker','o','Color','m','Tag',num2str(i));                 
            end
         end            
         
      elseif isequal(LP(3,i),2)
         if isequal(LP(2,i),1)
            if isequal(LP(1,i),1)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','-','Color','y','Tag',num2str(i));
            elseif isequal(LP(1,i),2)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','-','Color','b','Tag',num2str(i));
            elseif isequal(LP(1,i),3)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','-','Color','g','Tag',num2str(i));           
            elseif isequal(LP(1,i),4)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','-','Color','w','Tag',num2str(i));              
            elseif isequal(LP(1,i),5)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','-','Color','r','Tag',num2str(i));             
            elseif isequal(LP(1,i),6)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','-','Color','c','Tag',num2str(i));     
            elseif isequal(LP(1,i),7)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','-','Color','m','Tag',num2str(i));                 
            end                       
         elseif isequal(LP(2,i),2)
            if isequal(LP(1,i),1)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','--','Color','y','Tag',num2str(i));
            elseif isequal(LP(1,i),2)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','--','Color','b','Tag',num2str(i));
            elseif isequal(LP(1,i),3)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','--','Color','g','Tag',num2str(i));           
            elseif isequal(LP(1,i),4)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','--','Color','w','Tag',num2str(i));              
            elseif isequal(LP(1,i),5)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','--','Color','r','Tag',num2str(i));             
            elseif isequal(LP(1,i),6)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','--','Color','c','Tag',num2str(i));     
            elseif isequal(LP(1,i),7)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','--','Color','m','Tag',num2str(i));                 
            end 
         elseif isequal(LP(2,i),3)
            if isequal(LP(1,i),1)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle',':','Color','y','Tag',num2str(i));
            elseif isequal(LP(1,i),2)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle',':','Color','b','Tag',num2str(i));
            elseif isequal(LP(1,i),3)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle',':','Color','g','Tag',num2str(i));           
            elseif isequal(LP(1,i),4)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle',':','Color','w','Tag',num2str(i));              
            elseif isequal(LP(1,i),5)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle',':','Color','r','Tag',num2str(i));             
            elseif isequal(LP(1,i),6)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle',':','Color','c','Tag',num2str(i));     
            elseif isequal(LP(1,i),7)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle',':','Color','m','Tag',num2str(i));                 
            end 
         elseif isequal(LP(2,i),4)
            if isequal(LP(1,i),1)
               plot3(axesc,x,z*0,y,'linewidth',2,'Marker','o','Color','y','Tag',num2str(i));
            elseif isequal(LP(1,i),2)
               plot3(axesc,x,z*0,y,'linewidth',2,'Marker','o','Color','b','Tag',num2str(i));
            elseif isequal(LP(1,i),3)
               plot3(axesc,x,z*0,y,'linewidth',2,'Marker','o','Color','g','Tag',num2str(i));           
            elseif isequal(LP(1,i),4)
               plot3(axesc,x,z*0,y,'linewidth',2,'Marker','o','Color','w','Tag',num2str(i));              
            elseif isequal(LP(1,i),5)
               plot3(axesc,x,z*0,y,'linewidth',2,'Marker','o','Color','r','Tag',num2str(i));             
            elseif isequal(LP(1,i),6)
               plot3(axesc,x,z*0,y,'linewidth',2,'Marker','o','Color','c','Tag',num2str(i));     
            elseif isequal(LP(1,i),7)
               plot3(axesc,x,z*0,y,'linewidth',2,'Marker','o','Color','m','Tag',num2str(i));                 
            end
         end    
         
      elseif isequal(LP(3,i),3)
         if isequal(LP(2,i),1)
            if isequal(LP(1,i),1)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','-','Color','y','Tag',num2str(i));
            elseif isequal(LP(1,i),2)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','-','Color','b','Tag',num2str(i));
            elseif isequal(LP(1,i),3)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','-','Color','g','Tag',num2str(i));           
            elseif isequal(LP(1,i),4)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','-','Color','w','Tag',num2str(i));              
            elseif isequal(LP(1,i),5)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','-','Color','r','Tag',num2str(i));             
            elseif isequal(LP(1,i),6)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','-','Color','c','Tag',num2str(i));     
            elseif isequal(LP(1,i),7)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','-','Color','m','Tag',num2str(i));                 
            end                       
         elseif isequal(LP(2,i),2)
            if isequal(LP(1,i),1)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','--','Color','y','Tag',num2str(i));
            elseif isequal(LP(1,i),2)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','--','Color','b','Tag',num2str(i));
            elseif isequal(LP(1,i),3)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','--','Color','g','Tag',num2str(i));           
            elseif isequal(LP(1,i),4)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','--','Color','w','Tag',num2str(i));              
            elseif isequal(LP(1,i),5)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','--','Color','r','Tag',num2str(i));             
            elseif isequal(LP(1,i),6)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','--','Color','c','Tag',num2str(i));     
            elseif isequal(LP(1,i),7)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','--','Color','m','Tag',num2str(i));                 
            end 
         elseif isequal(LP(2,i),3)
            if isequal(LP(1,i),1)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle',':','Color','y','Tag',num2str(i));
            elseif isequal(LP(1,i),2)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle',':','Color','b','Tag',num2str(i));
            elseif isequal(LP(1,i),3)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle',':','Color','g','Tag',num2str(i));           
            elseif isequal(LP(1,i),4)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle',':','Color','w','Tag',num2str(i));              
            elseif isequal(LP(1,i),5)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle',':','Color','r','Tag',num2str(i));             
            elseif isequal(LP(1,i),6)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle',':','Color','c','Tag',num2str(i));     
            elseif isequal(LP(1,i),7)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle',':','Color','m','Tag',num2str(i));                 
            end 
         elseif isequal(LP(2,i),4)
            if isequal(LP(1,i),1)
               plot3(axesc,x,z*0,y,'linewidth',3,'Marker','o','Color','y','Tag',num2str(i));
            elseif isequal(LP(1,i),2)
               plot3(axesc,x,z*0,y,'linewidth',3,'Marker','o','Color','b','Tag',num2str(i));
            elseif isequal(LP(1,i),3)
               plot3(axesc,x,z*0,y,'linewidth',3,'Marker','o','Color','g','Tag',num2str(i));           
            elseif isequal(LP(1,i),4)
               plot3(axesc,x,z*0,y,'linewidth',3,'Marker','o','Color','w','Tag',num2str(i));              
            elseif isequal(LP(1,i),5)
               plot3(axesc,x,z*0,y,'linewidth',3,'Marker','o','Color','r','Tag',num2str(i));             
            elseif isequal(LP(1,i),6)
               plot3(axesc,x,z*0,y,'linewidth',3,'Marker','o','Color','c','Tag',num2str(i));     
            elseif isequal(LP(1,i),7)
               plot3(axesc,x,z*0,y,'linewidth',3,'Marker','o','Color','m','Tag',num2str(i));                 
            end
         end
         
      end   
      hold on
   end
   delete(findobj('Tag','IP'))
   h=legend(Title,'Location','northeast');
   if isequal(strcmp(get(vstc,'Checked'),'on'),1) % white background
      set(h,'Textcolor','k','Color','w','EdgeColor','w')
   elseif isequal(strcmp(get(vstc,'Checked'),'on'),0) % black background
      set(h,'Textcolor','w','Color','k','EdgeColor','k')
   end
      

   % Automatic Curve numbering
   if isempty(Title)
      nextcurve = 1;
   else
      nextcurve = length(Title(:,1))+1;
   end
   set(pdc_type_num,'string',num2str(nextcurve));

   % ************************************ Set Automatic view direction
   if isempty(pdx_label_edit) || isequal(get(pdx_data_edit,'Value'),1)
      if ~isempty(pdy_label_edit) && ~isequal(get(pdy_data_edit,'Value'),1) ...
            && ~isempty(pdz_label_edit) && ~isequal(get(pdz_data_edit,'Value'),1)
         % YZ-View
         az = 90; el = 0; view(az, el); 
      else
         % XY-View
         az = 0; el = 0; view(az, el);      
      end      

   elseif isempty(pdy_label_edit) || isequal(get(pdy_data_edit,'Value'),1)      
      if ~isempty(pdx_label_edit) && ~isequal(get(pdx_data_edit,'Value'),1) ...
            && ~isempty(pdz_label_edit) && ~isequal(get(pdz_data_edit,'Value'),1)
         % XZ-View
         az = 0; el = 90; view(az, el);      
      else
         % XY-View
         az = 0; el = 0; view(az, el);   
      end

   elseif isempty(pdz_label_edit) || isequal(get(pdz_data_edit,'Value'),1)      
      if ~isempty(pdx_label_edit) && ~isequal(get(pdx_data_edit,'Value'),1) ...
            && ~isempty(pdy_label_edit) && ~isequal(get(pdy_data_edit,'Value'),1)
         % XY-View
         az = 0; el = 0; view(az, el);
      else
         % XY-View
         az = 0; el = 0; view(az, el);      
      end

   elseif ~isempty(pdx_label_edit) && ~isequal(get(pdx_data_edit,'Value'),1) ...
          && ~isempty(pdy_label_edit) && ~isequal(get(pdy_data_edit,'Value'),1) ...
          && ~isempty(pdz_label_edit) && ~isequal(get(pdz_data_edit,'Value'),1) ...
         % Isometric-View
         az = -37.5; el = 30; view(az, el);          
   end

   xt=xmin:(xmax-xmin)/xdiv:xmax; 
   yt=ymin:(ymax-ymin)/ydiv:ymax; 
   zt=zmin:(zmax-zmin)/zdiv:zmax; 
   set(axesc,'xlim',[xmin xmax],'zlim',[ymin ymax],'ylim',[zmin zmax])
   axis manual;  axis square;  
   if isequal(strcmp(get(vstc,'Checked'),'on'),1) % white background
      set(axesc, 'Color',[1 1 1],'XColor', 'k', 'YColor', 'k', 'ZColor', 'k' );      
   elseif isequal(strcmp(get(vstc,'Checked'),'on'),0) % black background 
      set(axesc, 'Color',[0 0 0],'XColor', 'w', 'YColor', 'w', 'ZColor', 'w' );
   end      
   set(axesc, 'XTickMode', 'manual','YTickMode', 'manual', 'ZTickMode', 'manual');
   set(axesc, 'XTick', xt,'YTick', zt, 'ZTick', yt);
   set( gca, 'Units', 'normalized', 'Position', [0 0.15 0.7 0.7] );  
   
   end  
end

end % FunewCV
end % function end



% --------------------------------------------------------------------
function pdc_cancel_pushbutton_Callback(hObject, eventdata)
   clc; pan off; zoom off; rotate3d off; set([vzc,vrc,vpc], 'Checked', 'off');
   
if isempty(FunewCV) 
   set(pc_title_name,'String','Analysis did not finish.')
   set(pc_title_name,'Visible','on')          
else
   
% Automatic Curve numbering
if isempty(Title)
   nextcurve = 1;
else
   nextcurve = length(Title(:,1))+1;
end


% ******************************************* X-axis Plot Properties  
xval1 = str2double(get(pdx_min_edit,'String'))*str2double(get(pdx_scale_edit,'String'));
xval2 = str2double(get(pdx_max_edit,'String'))*str2double(get(pdx_scale_edit,'String'));      
if xval1 < xval2
   xmin =  xval1;
   xmax =  xval2;
else
   xmin =  xval2;
   xmax =  xval1;
end
xdiv=str2double(get(pdx_div_edit,'string')); 

% ******************************************* Y-axis Plot Properties 
yval1 = str2double(get(pdy_min_edit,'String'))*str2double(get(pdy_scale_edit,'String'));
yval2 = str2double(get(pdy_max_edit,'String'))*str2double(get(pdy_scale_edit,'String'));      
if yval1 < yval2
   ymin =  yval1;
   ymax =  yval2;
else
   ymin =  yval2;
   ymax =  yval1;
end

ydiv=str2double(get(pdy_div_edit,'string'));

% ******************************************* Z-axis Plot Properties 
zval1 = str2double(get(pdz_min_edit,'String'))*str2double(get(pdz_scale_edit,'String'));
zval2 = str2double(get(pdz_max_edit,'String'))*str2double(get(pdz_scale_edit,'String'));      
if zval1 < zval2
   zmin =  zval1;
   zmax =  zval2;
else
   zmin =  zval2;
   zmax =  zval1;
end
zdiv=str2double(get(pdz_div_edit,'string'));


if isempty(get(pdc_type_num,'string')) ...
      || isnan(str2double(get(pdc_type_num,'String'))) ...
      || str2double(get(pdc_type_num,'String')) <= 0  
   set(pc_title_name,'String','Please enter Plot number ')
   set(pc_title_name,'Visible','on')    
elseif isempty(get(pdc_type_name,'string'))
   set(pc_title_name,'String','Please enter Plot Title ')
   set(pc_title_name,'Visible','on')     
else   
   % Number of Plots
   tnum = round(str2double(get(pdc_type_num,'String')));
   if tnum >= nextcurve
      set(pc_title_name,'String',['Please enter smaller Plot number than ',num2str(nextcurve)])
      set(pc_title_name,'Visible','on') 
   else
      set(pc_title_name,'Visible','off')
      % Curve Title
      FTitle=[];
      
      Title(tnum,:)=[];
      xdata(:,tnum)=[];
      ydata(:,tnum)=[];
      zdata(:,tnum)=[]; 
      UTitle(tnum,:)=[];
      LP(:,tnum)=[];
      delete(findobj('Tag',num2str(tnum)))
      
      if ~isempty(Title)
         for i=1:length(Title(:,1))
            if isequal(length(Title(:,1)),1)
               FTitle= ['1','. ',UTitle(i,:)];
            else
               FTitle= [FTitle; [num2str(i),'. ',UTitle(i,:)]];
            end         
         end
      end
      Title=FTitle;
      
      ax = gca;
   if ~isempty(Title)
      % ******************************************* X-axis Plot Properties 
      % Label
      ax.XLabel.String = get(pdx_label_edit,'string');   
%       xmin=str2double(get(pdx_min_edit,'string')); 
%       xmax=str2double(get(pdx_max_edit,'string')); 
%       xdiv=str2double(get(pdx_div_edit,'string')); 
      
      % ******************************************* Y-axis Plot Properties 
      % Label      
      ax.YLabel.String = get(pdz_label_edit,'string');
%       ymin=str2double(get(pdy_min_edit,'string')); 
%       ymax=str2double(get(pdy_max_edit,'string')); 
%       ydiv=str2double(get(pdy_div_edit,'string'));

      % ******************************************* Z-axis Plot Properties 
      % Label      
      ax.ZLabel.String = get(pdy_label_edit,'string'); 
%       zmin=str2double(get(pdz_min_edit,'string')); 
%       zmax=str2double(get(pdz_max_edit,'string')); 
%       zdiv=str2double(get(pdz_div_edit,'string'));
      
   for i = 1:length(LP(1,:))
      xr=xdata(:,i)*str2double(get(pdx_scale_edit,'String'));
      yr=ydata(:,i)*str2double(get(pdy_scale_edit,'String'));
      zr=zdata(:,i)*str2double(get(pdz_scale_edit,'String'));
    
      x=[];y=[];z=[];
      for k = 1:length(xr)
         if isequal(xr(k,1),0) && isequal(yr(k,1),0) && isequal(zr(k,1),0)   
         else
            x(k,1) =xr(k,1);y(k,1) =yr(k,1);z(k,1) =zr(k,1);
         end
      end
      
      delete(findobj('Tag',num2str(i)))
      % ****************************************************** Plot
      if isequal(LP(3,i),1)
         if isequal(LP(2,i),1)
            if isequal(LP(1,i),1)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','-','Color','y','Tag',num2str(i));
            elseif isequal(LP(1,i),2)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','-','Color','b','Tag',num2str(i));
            elseif isequal(LP(1,i),3)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','-','Color','g','Tag',num2str(i));           
            elseif isequal(LP(1,i),4)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','-','Color','w','Tag',num2str(i));              
            elseif isequal(LP(1,i),5)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','-','Color','r','Tag',num2str(i));             
            elseif isequal(LP(1,i),6)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','-','Color','c','Tag',num2str(i));     
            elseif isequal(LP(1,i),7)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','-','Color','m','Tag',num2str(i));                 
            end                       
         elseif isequal(LP(2,i),2)
            if isequal(LP(1,i),1)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','--','Color','y','Tag',num2str(i));
            elseif isequal(LP(1,i),2)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','--','Color','b','Tag',num2str(i));
            elseif isequal(LP(1,i),3)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','--','Color','g','Tag',num2str(i));           
            elseif isequal(LP(1,i),4)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','--','Color','w','Tag',num2str(i));              
            elseif isequal(LP(1,i),5)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','--','Color','r','Tag',num2str(i));             
            elseif isequal(LP(1,i),6)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','--','Color','c','Tag',num2str(i));     
            elseif isequal(LP(1,i),7)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle','--','Color','m','Tag',num2str(i));                 
            end 
         elseif isequal(LP(2,i),3)
            if isequal(LP(1,i),1)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle',':','Color','y','Tag',num2str(i));
            elseif isequal(LP(1,i),2)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle',':','Color','b','Tag',num2str(i));
            elseif isequal(LP(1,i),3)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle',':','Color','g','Tag',num2str(i));           
            elseif isequal(LP(1,i),4)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle',':','Color','w','Tag',num2str(i));              
            elseif isequal(LP(1,i),5)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle',':','Color','r','Tag',num2str(i));             
            elseif isequal(LP(1,i),6)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle',':','Color','c','Tag',num2str(i));     
            elseif isequal(LP(1,i),7)
               plot3(axesc,x,z*0,y,'linewidth',1,'LineStyle',':','Color','m','Tag',num2str(i));                 
            end 
         elseif isequal(LP(2,i),4)
            if isequal(LP(1,i),1)
               plot3(axesc,x,z*0,y,'linewidth',1,'Marker','o','Color','y','Tag',num2str(i));
            elseif isequal(LP(1,i),2)
               plot3(axesc,x,z*0,y,'linewidth',1,'Marker','o','Color','b','Tag',num2str(i));
            elseif isequal(LP(1,i),3)
               plot3(axesc,x,z*0,y,'linewidth',1,'Marker','o','Color','g','Tag',num2str(i));           
            elseif isequal(LP(1,i),4)
               plot3(axesc,x,z*0,y,'linewidth',1,'Marker','o','Color','w','Tag',num2str(i));              
            elseif isequal(LP(1,i),5)
               plot3(axesc,x,z*0,y,'linewidth',1,'Marker','o','Color','r','Tag',num2str(i));             
            elseif isequal(LP(1,i),6)
               plot3(axesc,x,z*0,y,'linewidth',1,'Marker','o','Color','c','Tag',num2str(i));     
            elseif isequal(LP(1,i),7)
               plot3(axesc,x,z*0,y,'linewidth',1,'Marker','o','Color','m','Tag',num2str(i));                 
            end
         end            
         
      elseif isequal(LP(3,i),2)
         if isequal(LP(2,i),1)
            if isequal(LP(1,i),1)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','-','Color','y','Tag',num2str(i));
            elseif isequal(LP(1,i),2)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','-','Color','b','Tag',num2str(i));
            elseif isequal(LP(1,i),3)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','-','Color','g','Tag',num2str(i));           
            elseif isequal(LP(1,i),4)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','-','Color','w','Tag',num2str(i));              
            elseif isequal(LP(1,i),5)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','-','Color','r','Tag',num2str(i));             
            elseif isequal(LP(1,i),6)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','-','Color','c','Tag',num2str(i));     
            elseif isequal(LP(1,i),7)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','-','Color','m','Tag',num2str(i));                 
            end                       
         elseif isequal(LP(2,i),2)
            if isequal(LP(1,i),1)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','--','Color','y','Tag',num2str(i));
            elseif isequal(LP(1,i),2)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','--','Color','b','Tag',num2str(i));
            elseif isequal(LP(1,i),3)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','--','Color','g','Tag',num2str(i));           
            elseif isequal(LP(1,i),4)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','--','Color','w','Tag',num2str(i));              
            elseif isequal(LP(1,i),5)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','--','Color','r','Tag',num2str(i));             
            elseif isequal(LP(1,i),6)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','--','Color','c','Tag',num2str(i));     
            elseif isequal(LP(1,i),7)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle','--','Color','m','Tag',num2str(i));                 
            end 
         elseif isequal(LP(2,i),3)
            if isequal(LP(1,i),1)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle',':','Color','y','Tag',num2str(i));
            elseif isequal(LP(1,i),2)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle',':','Color','b','Tag',num2str(i));
            elseif isequal(LP(1,i),3)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle',':','Color','g','Tag',num2str(i));           
            elseif isequal(LP(1,i),4)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle',':','Color','w','Tag',num2str(i));              
            elseif isequal(LP(1,i),5)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle',':','Color','r','Tag',num2str(i));             
            elseif isequal(LP(1,i),6)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle',':','Color','c','Tag',num2str(i));     
            elseif isequal(LP(1,i),7)
               plot3(axesc,x,z*0,y,'linewidth',2,'LineStyle',':','Color','m','Tag',num2str(i));                 
            end 
         elseif isequal(LP(2,i),4)
            if isequal(LP(1,i),1)
               plot3(axesc,x,z*0,y,'linewidth',2,'Marker','o','Color','y','Tag',num2str(i));
            elseif isequal(LP(1,i),2)
               plot3(axesc,x,z*0,y,'linewidth',2,'Marker','o','Color','b','Tag',num2str(i));
            elseif isequal(LP(1,i),3)
               plot3(axesc,x,z*0,y,'linewidth',2,'Marker','o','Color','g','Tag',num2str(i));           
            elseif isequal(LP(1,i),4)
               plot3(axesc,x,z*0,y,'linewidth',2,'Marker','o','Color','w','Tag',num2str(i));              
            elseif isequal(LP(1,i),5)
               plot3(axesc,x,z*0,y,'linewidth',2,'Marker','o','Color','r','Tag',num2str(i));             
            elseif isequal(LP(1,i),6)
               plot3(axesc,x,z*0,y,'linewidth',2,'Marker','o','Color','c','Tag',num2str(i));     
            elseif isequal(LP(1,i),7)
               plot3(axesc,x,z*0,y,'linewidth',2,'Marker','o','Color','m','Tag',num2str(i));                 
            end
         end    
         
      elseif isequal(LP(3,i),3)
         if isequal(LP(2,i),1)
            if isequal(LP(1,i),1)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','-','Color','y','Tag',num2str(i));
            elseif isequal(LP(1,i),2)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','-','Color','b','Tag',num2str(i));
            elseif isequal(LP(1,i),3)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','-','Color','g','Tag',num2str(i));           
            elseif isequal(LP(1,i),4)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','-','Color','w','Tag',num2str(i));              
            elseif isequal(LP(1,i),5)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','-','Color','r','Tag',num2str(i));             
            elseif isequal(LP(1,i),6)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','-','Color','c','Tag',num2str(i));     
            elseif isequal(LP(1,i),7)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','-','Color','m','Tag',num2str(i));                 
            end                       
         elseif isequal(LP(2,i),2)
            if isequal(LP(1,i),1)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','--','Color','y','Tag',num2str(i));
            elseif isequal(LP(1,i),2)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','--','Color','b','Tag',num2str(i));
            elseif isequal(LP(1,i),3)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','--','Color','g','Tag',num2str(i));           
            elseif isequal(LP(1,i),4)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','--','Color','w','Tag',num2str(i));              
            elseif isequal(LP(1,i),5)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','--','Color','r','Tag',num2str(i));             
            elseif isequal(LP(1,i),6)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','--','Color','c','Tag',num2str(i));     
            elseif isequal(LP(1,i),7)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle','--','Color','m','Tag',num2str(i));                 
            end 
         elseif isequal(LP(2,i),3)
            if isequal(LP(1,i),1)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle',':','Color','y','Tag',num2str(i));
            elseif isequal(LP(1,i),2)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle',':','Color','b','Tag',num2str(i));
            elseif isequal(LP(1,i),3)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle',':','Color','g','Tag',num2str(i));           
            elseif isequal(LP(1,i),4)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle',':','Color','w','Tag',num2str(i));              
            elseif isequal(LP(1,i),5)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle',':','Color','r','Tag',num2str(i));             
            elseif isequal(LP(1,i),6)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle',':','Color','c','Tag',num2str(i));     
            elseif isequal(LP(1,i),7)
               plot3(axesc,x,z*0,y,'linewidth',3,'LineStyle',':','Color','m','Tag',num2str(i));                 
            end 
         elseif isequal(LP(2,i),4)
            if isequal(LP(1,i),1)
               plot3(axesc,x,z*0,y,'linewidth',3,'Marker','o','Color','y','Tag',num2str(i));
            elseif isequal(LP(1,i),2)
               plot3(axesc,x,z*0,y,'linewidth',3,'Marker','o','Color','b','Tag',num2str(i));
            elseif isequal(LP(1,i),3)
               plot3(axesc,x,z*0,y,'linewidth',3,'Marker','o','Color','g','Tag',num2str(i));           
            elseif isequal(LP(1,i),4)
               plot3(axesc,x,z*0,y,'linewidth',3,'Marker','o','Color','w','Tag',num2str(i));              
            elseif isequal(LP(1,i),5)
               plot3(axesc,x,z*0,y,'linewidth',3,'Marker','o','Color','r','Tag',num2str(i));             
            elseif isequal(LP(1,i),6)
               plot3(axesc,x,z*0,y,'linewidth',3,'Marker','o','Color','c','Tag',num2str(i));     
            elseif isequal(LP(1,i),7)
               plot3(axesc,x,z*0,y,'linewidth',3,'Marker','o','Color','m','Tag',num2str(i));                 
            end
         end
         
      end   
      hold on
   end
   delete(findobj('Tag','IP'))
   h=legend(Title,'Location','northeast');
   if isequal(strcmp(get(vstc,'Checked'),'on'),1) % white background
      set(h,'Textcolor','k','Color','w','EdgeColor','w')
   elseif isequal(strcmp(get(vstc,'Checked'),'on'),0) % black background
      set(h,'Textcolor','w','Color','k','EdgeColor','k')
   end
      
   xt=xmin:(xmax-xmin)/xdiv:xmax; 
   yt=ymin:(ymax-ymin)/ydiv:ymax; 
   zt=zmin:(zmax-zmin)/zdiv:zmax; 
   set(axesc,'xlim',[xmin xmax],'zlim',[ymin ymax],'ylim',[zmin zmax])
   axis manual;  axis square;  
   if isequal(strcmp(get(vstc,'Checked'),'on'),1) % white background
      set(axesc, 'Color',[1 1 1],'XColor', 'k', 'YColor', 'k', 'ZColor', 'k' );      
   elseif isequal(strcmp(get(vstc,'Checked'),'on'),0) % black background 
      set(axesc, 'Color',[0 0 0],'XColor', 'w', 'YColor', 'w', 'ZColor', 'w' );
   end 
   set(axesc, 'XTickMode', 'manual','YTickMode', 'manual', 'ZTickMode', 'manual');
   set(axesc, 'XTick', xt,'YTick', zt, 'ZTick', yt);
   set( gca, 'Units', 'normalized', 'Position', [0 0.15 0.7 0.7] );  
   
   
   end

   if isempty(Title)
      azf=get(gca,'view');   
      % reset axesc
      cla (axesc,'reset');   
      x=0:1/5:1;
      z=0:1/5:1;
      y=0:1/5:1;
      delete(findobj('Tag','IP'))
      if isequal(strcmp(get(vstc,'Checked'),'on'),1) % white background
         plot3(axesc,0,0,0,'Color','k','linewidth',1,'Tag','IP')
      elseif isequal(strcmp(get(vstc,'Checked'),'on'),0) % black background
         plot3(axesc,0,0,0,'Color','w','linewidth',1,'Tag','IP')
      end
      hold on;   
      set(axesc,'xlim',[min(x) max(x)],'zlim',[min(y) max(y)],'ylim',[min(z) max(z)]) 

      % View
      view(azf(1,1), azf(1,2));
      axis manual;   
      set(axesc,'Visible','on','Units','normalized','DataAspectRatio',[1 1 1]) 
      if isequal(strcmp(get(vstc,'Checked'),'on'),1) % white background
         set(axesc, 'Color',[1 1 1],'XColor', 'k', 'YColor', 'k', 'ZColor', 'k' );      
      elseif isequal(strcmp(get(vstc,'Checked'),'on'),0) % black background 
         set(axesc, 'Color',[0 0 0],'XColor', 'w', 'YColor', 'w', 'ZColor', 'w' );
      end       
      set(axesc, 'XTickMode', 'manual','YTickMode', 'manual', 'ZTickMode', 'manual');
      set(axesc, 'XTick', x,'YTick', y, 'ZTick', z);

      ax = gca;
      ax.XLabel.String = 'X Axis';
      ax.YLabel.String = 'Z Axis';
      ax.ZLabel.String = 'Y Axis';
      set( gca, 'Units', 'normalized', 'Position', [0 0.15 0.7 0.7] );    

   end

   % Automatic Curve numbering
   if isempty(Title)
      nextcurve = 1;
   else
      nextcurve = length(Title(:,1))+1;
   end
   set(pdc_type_num,'string',num2str(nextcurve));      

   end  
  
end

end % FunewCV
end % function end

















end