function SABRE2ANONINELFun(pn_panel,pt_title_name,fim_infor_name,ptable_type_subpanel,...
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
   auto_lin_apply,auto_nonlin_apply)

% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
% ************************************************************************
% *****************              VISIBLE              ********************
% ************************************************************************
set(pn_panel,'Visible','on')
% *************** Title
% set(pt_title_name,'Visible','off')
% *************** About
set(fim_infor_name,'Visible','off')

% *************** Visible off for Modeling S
% *** sub panel1
set(ptable_type_subpanel,'Visible','on')
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

% *************** Visible off for Elastic Linear Buckling S
% *** sub panel1
set(am3_type_text,'Visible','off')
% *************** Visible off for Elastic Linear Buckling E

% *************** Visible off for Inelastic Linear Buckling S
% *** sub panel1
set(am4_type_text,'Visible','off')
% *************** Visible off for Inelastic Linear Buckling E

% *************** Visible off for Inelastic Nonlinear Buckling S
% *** sub panel1
set(am6_type_text,'Visible','on')
% *************** Visible off for Inelastic Nonlinear Buckling E

% *************** Visible off for Results S
% *** sub panel1
set(res_subpanel,'Visible','off')
set([res_text,recba_gamma_text,recba_scale_text],'Visible','off');
set([recba_gamma_edit,recba_Scale_edit],'Visible','off');
set([recba_tau_text,recba_tau_diagram],'Visible','off');  
% *************** Visible off for Results E

% *************** Visible off for Batch Mode S
% *** sub panel1
set(auto_type_text,'Visible','off')
% *** sub panel2
set([auto_modelname_text,auto_modelnum_text,auto_modelname_edit,auto_modelnum_edit,...
   auto_lin_apply,auto_nonlin_apply],'Visible','off');
% *************** Visible off for Batch Mode E


% ------------------------------------------------------------------------
% -----------------------        Read Data        ------------------------
% ------------------------------------------------------------------------
set(recba_tau_diagram,'String','   Undeformed Geometry |   Buckling Mode + Undeformed Geom. |   Buckling Mode Only |   Axial |   Moment Z |   SRF |   Rpg |   Rpc |   Rpt |   Rh |   Myc |   Myt |   My |   J |   Phi_Mmax |   Phi_Pye |   CS UC ')

end