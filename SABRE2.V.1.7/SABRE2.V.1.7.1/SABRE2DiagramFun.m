function SABRE2DiagramFun(pn_panel,pt_title_name,fim_infor_name,pd_type_subpanel,pdn_type_text,...
   pdn_type_name,pd_coord_subpanel,pdn_coord_text,pdn_coordx_text,pdn_coordy_text,...
   pdn_coordz_text,pdn_coordx_edit,pdn_coordy_edit,pdn_coordz_edit,punit_text,punit_edit,pd_app_subpanel,...
   pdn_apply,pdn_cancel,pde_type_text,pde_type_name,pde_buttongroup,pde_member_text,...
   pde_jointi_radiobutton,pde_jointj_radiobutton,pde_jointi_edit,pde_jointj_edit,...
   pde_reference_text,pde_reference_edit,pde_subpanel,pde_AISC_text,pde_wsection_text,...
   pde_wsection_edit,pde_set,pde_wsname_edit,pdm_subpanel,pde_section_text,pde_ji_text,...
   pde_jj_text,pde_bfb_text,pde_tfb_text,pde_bft_text,pde_tft_text,pde_dw_text,pde_tw_text,...
   pde_bfbi_edit,pde_tfbi_edit,pde_bfti_edit,pde_tfti_edit,pde_dwi_edit,pde_twi_edit,...
   pde_bfbj_edit,pde_tfbj_edit,pde_bftj_edit,pde_tftj_edit,pde_dwj_edit,pde_twj_edit,...
   pde_fil_text,pde_fili_edit,pde_filj_edit,pde_apply,pde_cancel,pdb_member_text,pdb_type_text,...
   pdb_member_name,pdb_type_name,pdb_length_text,pdb_coordx_edit,pdb_coordy_edit,pdb_coordz_edit,...
   pdb_length_edit,pdb_length_set,pdb_wsection_edit,pdb_set,pdb_step_text,pdb_step_edit,pdstep_subpanel,...
   pdb_bfb_edit,pdb_tfb_edit,pdb_bft_edit,pdb_tft_edit,pdb_dw_edit,pdb_tw_edit,pdb_fil_edit,...
   pdb_apply,pdb_cancel,pdmi_name,pdmix_edit,pdmiy_edit,pdmiz_edit,pdmi_text,pdmi_type_edit,pdmi_apply,pam_type_text,pam_segmentn_text,pamse_assign_text,pam_segment_edit,...
   pamse_assign_edit,pam_all,pam_assign_text,pamen_assign_text,pame_assign_text,pamg_assign_text,...
   pamfy_assign_text,pamrho_assign_text,pamfyfi_assign_text,pamfyw_assign_text,pamfyfo_assign_text,...
   pamen_assign_edit,pame_assign_edit,pamg_assign_edit,pamfy_assign_edit,pamrho_assign_edit,...
   pamfyfi_assign_edit,pamfyw_assign_edit,pamfyfo_assign_edit,pam_apply,pam_cancel,lfm_type_text,...
   lfm_type_name,lfm_coordx_edit,lfm_coordy_edit,lfm_coordz_edit,lfm_ld_text,lfm_ld_edit,lfm_all_apply,...
   lfm_clc_apply,lfm_height_text,lfm_member_text,lfm_height_edit,lfm_alpha_text,lfm_alpha_edit,...
   lfm_fc_text,lfm_fx_text,lfm_fy_text,lfm_fz_text,lfm_mx_text,lfm_my_text,lfm_mz_text,...
   lfm_fx_edit,lfm_fy_edit,lfm_fz_edit,lfm_mx_edit,lfm_my_edit,lfm_mz_edit,lfm_apply,lfm_cancel,...
   lum_type_text,lum_type_mem,lum_type_seg,lum_clc_apply,lum_height_edit,lum_wx_text,lum_wy_text,...
   lum_wz_text,lum_wx_edit,lum_wy_edit,lum_wz_edit,lum_apply,lum_cancel,bfm_type_text,bfm_type_name,...
   bfm_coordx_edit,bfm_coordy_edit,bfm_coordz_edit,bfm_clc_apply,bfm_height_text,bfm_member_text,...
   bfm_height_edit,bfm_bc_text,bfm_ux_text,bfm_uy_text,bfm_uz_text,bfm_rx_text,bfm_ry_text,bfm_rz_text,...
   bfm_phix_text,bfm_ux_buttongroup,bfm_ux_on_radiobutton,bfm_ux_off_radiobutton,bfm_uy_buttongroup,...
   bfm_uy_on_radiobutton,bfm_uy_off_radiobutton,bfm_uz_buttongroup,bfm_uz_on_radiobutton,bfm_uz_off_radiobutton,...
   bfm_rx_buttongroup,bfm_rx_on_radiobutton,bfm_rx_off_radiobutton,bfm_ry_buttongroup,bfm_ry_on_radiobutton,...
   bfm_ry_off_radiobutton,bfm_rz_buttongroup,bfm_rz_on_radiobutton,bfm_rz_off_radiobutton,bfm_phix_buttongroup,...
   bfm_phix_on_radiobutton,bfm_phix_off_radiobutton,bfm_ux_edit,bfm_uy_edit,bfm_uz_edit,bfm_rx_edit,bfm_ry_edit,...
   bfm_rz_edit,bfm_phix_edit,bfm_apply,bfm_cancel,bsm_type_text,bsm_member_name,bsm_type_name,bsm_buttongroup,...
   bsm_member_text,bsm_jointi_radiobutton,bsm_jointj_radiobutton,bsm_jointi_edit,bsm_jointj_edit,...
   bsm_clc_apply,bsm_height_edit,bsm_bc_text,bsm_kv_text,bsm_kv_edit,bsm_apply,bsm_cancel,bgm_type_name,...
   bgm_coordx_edit,bgm_coordy_edit,bgm_coordz_edit,bgm_clc_apply,bgm_height_edit,bgm_bc_text,...
   bgm_ux_edit,bgm_uy_edit,bgm_uz_edit,bgm_rx_edit,bgm_ry_edit,bgm_rz_edit,bgm_phix_edit,bgm_apply,...
   bgm_cancel,bpm_type_text,bpm_type_name,bpm_section_text,bpm_flexure_text,bpm_ni_text,...
   bpm_nj_text,bpm_ni_edit,bpm_nj_edit,bpm_fr_text,bpm_my_text,bpm_myni_text,bpm_mynj_text,bpm_myni_edit,bpm_mynj_edit,bpm_mz_text,...
   bpm_mzni_text,bpm_mznj_text,bpm_mzni_edit,bpm_mznj_edit,bpm_warp_text,bpm_wni_text,bpm_wnj_text,bpm_wni_edit,...
   bpm_wnj_edit,bpm_apply,bpm_cancel,ap_type_text,ap_sw_subpanel,ap_sw_text,ap_sw_buttongroup,...
   ap_sw_on_radiobutton,ap_sw_off_radiobutton,ap_jval_subpanel,ap_jval_text,ap_jval_buttongroup,...
   ap_jval_on_radiobutton,ap_jval_off_radiobutton,ap_AISC_subpanel,ap_AISC_text,ap_AISC_buttongroup,...
   ap_AISC_on_radiobutton,ap_AISC_off_radiobutton,ap_bracket_subpanel,ap_bracket_text,ap_cv_buttongroup,...
   ap_cv_on_radiobutton,ap_cv_off_radiobutton,ap_jeong_text,ap_brent_text,ap_jeong_edit,ap_brent_edit,...
   ap_1st_subpanel,ap_1st_text,api_assign_text,apninc_assign_text,api_assign_edit,apninc_assign_edit,...
   ap_2nd_subpanel,ap_2nd_text,ap_da_text,ap_da_buttongroup,ap_da_on_radiobutton,ap_da_off_radiobutton,...
   ap_mode_subpanel,ap_mode_text,ap_mode_edit,apninc_mode_edit,ap_apply_subpanel,ap_apply,am1_type_text,am2_type_text,...
   am3_type_text,am4_type_text,am5_type_text,am6_type_text,ri_type_text,ri_diagram_subpanel,...
   ri_diagram_text,ri_internal_text,rin_diagram,ria_diagram,risy_diagram,risz_diagram,...
   rit_diagram,rimy_diagram,rimz_diagram,ribi_diagram,ri_tau_text,ri_tau_diagram,...
   rd_diagram_subpanel,ri_report_text,ri_report_edit,ri_report,ri_deflect_text,ri_scale_text,...
   ri_scale_edit,rd3_diagram,rd_buttongroup,rd_undef3d_text,rd_on_radiobutton,rd_off_radiobutton,...
   ri_apply,ri_cancel,ri_infor_text,ri_infor,rrd_type_text,rrd_type_edit,rr_nodal_subpanel,...
   rr_nodal_text,rrfx_nodal_text,rrfy_nodal_text,rrfz_nodal_text,rrt_nodal_text,rrmy_nodal_text,...
   rrmz_nodal_text,rrbi_nodal_text,rrfx_nodal_edit,rrfy_nodal_edit,rrfz_nodal_edit,rrmx_nodal_edit,...
   rrmy_nodal_edit,rrmz_nodal_edit,rrbi_nodal_edit,rd_nodal_text,rdux_nodal_text,rduy_nodal_text,...
   rduz_nodal_text,rdrx_nodal_text,rdry_nodal_text,rdrz_nodal_text,rdwqrp_nodal_text,rdux_nodal_edit,...
   rduy_nodal_edit,rduz_nodal_edit,rdrx_nodal_edit,rdry_nodal_edit,rdrz_nodal_edit,rdwarp_nodal_edit,...
   rrd_apply,rrd_cancel,ref_type_text,ref_type_edit,re_force_text,refx_force_text,refy_force_text,...
   refz_force_text,ret_force_text,remy_force_text,remz_force_text,rebi_force_text,refx_force_edit,...
   refy_force_edit,refz_force_edit,remx_force_edit,remy_force_edit,remz_force_edit,rebi_force_edit,...
   re_forcebar_slider,re_forcebar_edit,ref_apply,ref_cancel,AR,AS,AE,AI,ANE,ANI,Sincre,Rtype,Qintf,...
   vdum,v1um_p1_edit,v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit,tau,Rpg,Rpc,Rpt,Rh,Myc,Myt,My,Jval,Phi_Mmax,Phi_Py,UC,PrPeL,PrPeL2nd,PrPeLB,PrPeLNB,vstm)


% Developed by Woo Yong Jeong.
% Date : 07/01/2013.
% ************************************************************************
% *****************              VISIBLE              ********************
% ************************************************************************
set(pn_panel,'Visible','on')
% *************** Title
% set(pt_title_name,'Visible','off')
% *************** About
set(fim_infor_name,'Visible','off')

% *************** Visible off for DEFINE JOINTS S
% *** sub panel1
set(pd_type_subpanel,'Visible','on')
set([pdn_type_text,pdn_type_name],'Visible','off')
% *** sub panel2
set(pd_coord_subpanel,'Visible','off');
set([pdn_coord_text,pdn_coordx_text,pdn_coordy_text,pdn_coordz_text],'Visible','off');
set([pdn_coordx_edit,pdn_coordy_edit,pdn_coordz_edit,punit_text,punit_edit],'Visible','off');
% *** sub panel3
set(pd_app_subpanel,'Visible','on');
set([pdn_apply,pdn_cancel],'Visible','off'); 
% *************** Visible off for DEFINE JOINTS E

% *************** Visible off for DEFINE MEMBERS S
% *** sub panel1
set([pde_type_text,pde_type_name],'Visible','off')
% *** sub panel2
set(pde_buttongroup,'Visible','off');
set([pde_member_text,pde_jointi_radiobutton,pde_jointj_radiobutton],'Visible','off');
set([pde_jointi_edit,pde_jointj_edit],'Visible','off'); 
set([pde_reference_text,pde_reference_edit],'Visible','off');
% *** sub panel3
set(pde_subpanel,'Visible','off')
set([pde_AISC_text,pde_wsection_text],'Visible','off');
set([pde_wsection_edit,pde_set,pde_wsname_edit],'Visible','off');
% *** sub panel4
set(pdm_subpanel,'Visible','on');
set(pde_section_text,'Visible','off');
set([pde_ji_text,pde_jj_text],'Visible','off');
set([pde_bfb_text,pde_tfb_text,pde_bft_text],'Visible','off');
set([pde_tft_text,pde_dw_text,pde_tw_text],'Visible','off');
set([pde_bfbi_edit,pde_tfbi_edit,pde_bfti_edit,pde_tfti_edit,pde_dwi_edit,pde_twi_edit],'Visible','off');
set([pde_bfbj_edit,pde_tfbj_edit,pde_bftj_edit,pde_tftj_edit,pde_dwj_edit,pde_twj_edit],'Visible','off'); 
set([pde_fil_text,pde_fili_edit,pde_filj_edit],'Visible','off');
% *** sub panel5
set([pde_apply,pde_cancel],'Visible','off'); 
% *************** Visible off for DEFINE MEMBERS E

% *************** Visible off for DEFINE SEGMENTS S 
% *** sub panel1
set([pdb_member_text,pdb_type_text],'Visible','off')
set([pdb_member_name,pdb_type_name],'Visible','off')
% *** sub panel2
set(pdb_length_text,'Visible','off');
set([pdb_coordx_edit,pdb_coordy_edit,pdb_coordz_edit,pdb_length_edit,pdb_length_set],'Visible','off');
% *** sub panel3
set([pdb_wsection_edit,pdb_set],'Visible','off');
set([pdb_step_text,pdb_step_edit,pdstep_subpanel],'Visible','off');
% *** sub panel4
set([pdb_bfb_edit,pdb_tfb_edit,pdb_bft_edit,pdb_tft_edit,pdb_dw_edit,pdb_tw_edit],'Visible','off');
set(pdb_fil_edit,'Visible','off');
% *** sub panel5
set([pdb_apply,pdb_cancel],'Visible','off'); 
% *************** Visible off for DEFINE SEGMENTS E

% *************** Visible off for MIRROR S
set([pdmi_name,pdmix_edit,pdmiy_edit,pdmiz_edit,pdmi_text,pdmi_type_edit,pdmi_apply],'Visible','off'); 
% *************** Visible off for MIRROR E

% *************** Visible off for ASSIGN MEMBERS S
% *** sub panel1
set(pam_type_text,'Visible','off')
% *** sub panel2
set([pam_segmentn_text,pamse_assign_text],'Visible','off');
set([pam_segment_edit,pamse_assign_edit,pam_all],'Visible','off'); 
% *** sub panel3
set([pam_assign_text,pamen_assign_text,pame_assign_text,pamg_assign_text,pamfy_assign_text,pamrho_assign_text],'Visible','off');
set([pamfyfi_assign_text,pamfyw_assign_text,pamfyfo_assign_text],'Visible','off');
set([pamen_assign_edit,pame_assign_edit,pamg_assign_edit,pamfy_assign_edit,pamrho_assign_edit],'Visible','off'); 
set([pamfyfi_assign_edit,pamfyw_assign_edit,pamfyfo_assign_edit],'Visible','off');
% *** sub panel4
set([pam_apply,pam_cancel],'Visible','off'); 
% *************** Visible off for ASSIGN MEMBERS E

% *************** Visible off for POINT LOADS S
% *** sub panel1
set([lfm_type_text,lfm_type_name],'Visible','off')
% *** sub panel2
set([lfm_coordx_edit,lfm_coordy_edit,lfm_coordz_edit],'Visible','off');
set([lfm_ld_text,lfm_ld_edit,lfm_all_apply,lfm_clc_apply],'Visible','off')
% *** sub panel3
set([lfm_height_text,lfm_member_text],'Visible','off');
set([lfm_height_edit,lfm_alpha_text,lfm_alpha_edit],'Visible','off');
% *** sub panel4
set(lfm_fc_text,'Visible','off');
set([lfm_fx_text,lfm_fy_text,lfm_fz_text],'Visible','off');
set([lfm_mx_text,lfm_my_text,lfm_mz_text],'Visible','off');
set([lfm_fx_edit,lfm_fy_edit,lfm_fz_edit,lfm_mx_edit,...
   lfm_my_edit,lfm_mz_edit],'Visible','off');
% *** sub panel5
set([lfm_apply,lfm_cancel],'Visible','off'); 
% *************** Visible off for POINT LOADS E

% *************** Visible off for UNIFORM LOADS S
% *** sub panel1
set(lum_type_text,'Visible','off')
% *** sub panel2
set([lum_type_mem,lum_type_seg],'Visible','off');
set(lum_clc_apply,'Visible','off');
% *** sub panel3
set(lum_height_edit,'Visible','off');
% *** sub panel4
set([lum_wx_text,lum_wy_text,lum_wz_text],'Visible','off');
set([lum_wx_edit,lum_wy_edit,lum_wz_edit],'Visible','off');
% *** sub panel5
set([lum_apply,lum_cancel],'Visible','off'); 
% *************** Visible off for UNIFORM LOADS E

% *************** Visible off for FIXITIES S
% *** sub panel1
set([bfm_type_text,bfm_type_name],'Visible','off')
% *** sub panel2
set([bfm_coordx_edit,bfm_coordy_edit,bfm_coordz_edit],'Visible','off');
set(bfm_clc_apply,'Visible','off');
% *** sub panel3
set([bfm_height_text,bfm_member_text],'Visible','off');
set(bfm_height_edit,'Visible','off');
% *** sub panel4
set(bfm_bc_text,'Visible','off');
set([bfm_ux_text,bfm_uy_text,bfm_uz_text],'Visible','off');
set([bfm_rx_text,bfm_ry_text,bfm_rz_text,bfm_phix_text],'Visible','off');
set([bfm_ux_buttongroup,bfm_ux_on_radiobutton,bfm_ux_off_radiobutton],'Visible','off');
set([bfm_uy_buttongroup,bfm_uy_on_radiobutton,bfm_uy_off_radiobutton],'Visible','off');
set([bfm_uz_buttongroup,bfm_uz_on_radiobutton,bfm_uz_off_radiobutton],'Visible','off');
set([bfm_rx_buttongroup,bfm_rx_on_radiobutton,bfm_rx_off_radiobutton],'Visible','off');
set([bfm_ry_buttongroup,bfm_ry_on_radiobutton,bfm_ry_off_radiobutton],'Visible','off');
set([bfm_rz_buttongroup,bfm_rz_on_radiobutton,bfm_rz_off_radiobutton],'Visible','off');
set([bfm_phix_buttongroup,bfm_phix_on_radiobutton,bfm_phix_off_radiobutton],'Visible','off');
set([bfm_ux_edit,bfm_uy_edit,bfm_uz_edit,bfm_rx_edit,...
   bfm_ry_edit,bfm_rz_edit,bfm_phix_edit],'Visible','off');
% *** sub panel5
set([bfm_apply,bfm_cancel],'Visible','off'); 
% *************** Visible off for FIXITIES E

% *************** Visible off for SHEAR PANEL S
% *** sub panel1
set(bsm_type_text,'Visible','off')
set([bsm_member_name,bsm_type_name],'Visible','off')
% *** sub panel2
set(bsm_buttongroup,'Visible','off');
set([bsm_member_text,bsm_jointi_radiobutton,bsm_jointj_radiobutton],'Visible','off');
set([bsm_jointi_edit,bsm_jointj_edit],'Visible','off');
set(bsm_clc_apply,'Visible','off');
% *** sub panel3
set(bsm_height_edit,'Visible','off');
% *** sub panel4
set([bsm_bc_text,bsm_kv_text,bsm_kv_edit],'Visible','off');
% *** sub panel5
set([bsm_apply,bsm_cancel],'Visible','off'); 
% *************** Visible off for SHEAR PANEL E

% *************** Visible off for GROUND SPRING S
% *** sub panel1
set(bgm_type_name,'Visible','off')
% *** sub panel2
set([bgm_coordx_edit,bgm_coordy_edit,bgm_coordz_edit],'Visible','off');
set(bgm_clc_apply,'Visible','off');
% *** sub panel3
set(bgm_height_edit,'Visible','off');
% *** sub panel4
set(bgm_bc_text,'Visible','off');
set([bgm_ux_edit,bgm_uy_edit,bgm_uz_edit,bgm_rx_edit,bgm_ry_edit,bgm_rz_edit,bgm_phix_edit],'Visible','off');
% *** sub panel5
set([bgm_apply,bgm_cancel],'Visible','off');
% *************** Visible off for GROUND SPRING E

% *************** Visible off for FLEXURE S
% *** sub panel1
set([bpm_type_text,bpm_type_name],'Visible','off')
% *** sub panel2
set([bpm_section_text,bpm_flexure_text,bpm_ni_text,bpm_nj_text],'Visible','off');
set([bpm_ni_edit,bpm_nj_edit],'Visible','off');
% *** sub panel2-1
set([bpm_fr_text,bpm_my_text,bpm_myni_text,bpm_mynj_text,bpm_myni_edit,bpm_mynj_edit],'Visible','off');
set([bpm_mz_text,bpm_mzni_text,bpm_mznj_text,bpm_mzni_edit,bpm_mznj_edit],'Visible','off');
% *** sub panel3
set([bpm_warp_text,bpm_wni_text,bpm_wnj_text],'Visible','off');
set([bpm_wni_edit,bpm_wnj_edit],'Visible','off');
% *** sub panel4
set([bpm_apply,bpm_cancel],'Visible','off'); 
% *************** Visible off for FLEXURE E

% *************** Visible off for ANALYSIS PARAMETERS S
% *** sub panel1
set(ap_type_text,'Visible','off')
% *** sub panel2
set([ap_sw_subpanel,ap_sw_text,ap_sw_buttongroup,ap_sw_on_radiobutton,ap_sw_off_radiobutton],'Visible','off');
% *** sub panel3
set([ap_jval_subpanel,ap_jval_text,ap_jval_buttongroup,ap_jval_on_radiobutton,ap_jval_off_radiobutton],'Visible','off');
% *** sub panel4
set([ap_AISC_subpanel,ap_AISC_text,ap_AISC_buttongroup,ap_AISC_on_radiobutton,ap_AISC_off_radiobutton],'Visible','off');
% *** sub panel5
set([ap_bracket_subpanel,ap_bracket_text,ap_cv_buttongroup,ap_cv_on_radiobutton,ap_cv_off_radiobutton],'Visible','off');
set([ap_jeong_text,ap_brent_text,ap_jeong_edit,ap_brent_edit],'Visible','off');
% *** sub panel6
set([ap_1st_subpanel,ap_1st_text,api_assign_text,apninc_assign_text,api_assign_edit,apninc_assign_edit],'Visible','off');
% *** sub panel7
set([ap_2nd_subpanel,ap_2nd_text,ap_da_text,ap_da_buttongroup,ap_da_on_radiobutton,ap_da_off_radiobutton],'Visible','off');
% *** sub panel8
set([ap_mode_subpanel,ap_mode_text,ap_mode_edit,apninc_mode_edit],'Visible','off');
% *** sub panel9
set([ap_apply_subpanel,ap_apply],'Visible','off');
% *************** Visible off for ANALYSIS PARAMETERS E

% *************** Visible off for ANALYSIS S
set(am1_type_text,'Visible','off')
set(am2_type_text,'Visible','off')
set(am3_type_text,'Visible','off')
set(am4_type_text,'Visible','off')
set(am5_type_text,'Visible','off')
set(am6_type_text,'Visible','off')
% *************** Visible off for ANALYSIS E

% ********* Visible off for INTERNAL FORCE DIAGRAM & DEFLECTED SHAPE S
% *** sub panel1
set(ri_type_text,'Visible','on')
% *** sub panel2
set([ri_diagram_subpanel,ri_diagram_text,ri_internal_text],'Visible','on');
set([rin_diagram,ria_diagram,risy_diagram,risz_diagram,...
    rit_diagram,rimy_diagram,rimz_diagram,ribi_diagram],'Visible','on'); 
 set([ri_tau_text,ri_tau_diagram],'Visible','on');
% *** sub panel3
set(rd_diagram_subpanel,'Visible','on');
set([ri_report_text,ri_report_edit,ri_report],'Visible','on');
% *** sub panel4
set([ri_deflect_text,ri_scale_text,ri_scale_edit],'Visible','on');  
set([rd3_diagram,rd_buttongroup,rd_undef3d_text,rd_on_radiobutton,rd_off_radiobutton],'Visible','on'); 
% *** sub panel5
set([ri_apply,ri_cancel,ri_infor],'Visible','on');  
% set(ri_infor_text,'Visible','off');
% ********* Visible off for INTERNAL FORCE DIAGRAM & DEFLECTED SHAPE E

% *************** Visible off for NODAL REACTION & DISPLACEMENT S 
% *** sub panel1
set([rrd_type_text,rrd_type_edit],'Visible','off')
% *** sub panel2
set(rr_nodal_subpanel,'Visible','off');
set([rr_nodal_text,rrfx_nodal_text,rrfy_nodal_text,...
   rrfz_nodal_text,rrt_nodal_text,rrmy_nodal_text,rrmz_nodal_text,rrbi_nodal_text],'Visible','off');
set([rrfx_nodal_edit,rrfy_nodal_edit,rrfz_nodal_edit,...
   rrmx_nodal_edit,rrmy_nodal_edit,rrmz_nodal_edit,rrbi_nodal_edit],'Visible','off');
% *** sub panel3
set([rd_nodal_text,rdux_nodal_text,rduy_nodal_text,...
   rduz_nodal_text,rdrx_nodal_text,rdry_nodal_text,rdrz_nodal_text,rdwqrp_nodal_text],'Visible','off');
set([rdux_nodal_edit,rduy_nodal_edit,rduz_nodal_edit,...
   rdrx_nodal_edit,rdry_nodal_edit,rdrz_nodal_edit,rdwarp_nodal_edit],'Visible','off');
% *** sub panel4
set([rrd_apply,rrd_cancel],'Visible','off'); 
% *************** Visible off for NODAL REACTION & DISPLACEMENT E

% *************** Visible off for ELEMENT FORCE S
% *** sub panel1
set([ref_type_text,ref_type_edit],'Visible','off')
% *** sub pane2
set([re_force_text,refx_force_text,refy_force_text,...
   refz_force_text,ret_force_text,remy_force_text,remz_force_text,rebi_force_text],'Visible','off');
set([refx_force_edit,refy_force_edit,refz_force_edit,...
   remx_force_edit,remy_force_edit,remz_force_edit,rebi_force_edit],'Visible','off');
% *** sub pane3
set([re_forcebar_slider,re_forcebar_edit],'Visible','off');
% *** sub pane4
set([ref_apply,ref_cancel],'Visible','off');
% *************** Visible off for ELEMENT FORCE E


% ------------------------------------------------------------------------
% -----------------------        EDIT INUPT       ------------------------
% ------------------------------------------------------------------------ 
ninc = str2double(get(apninc_assign_edit,'String'));
lambda = str2double(get(api_assign_edit,'String'));
if isequal(AR,1)
   Inpopnum = lambda:lambda:(ninc);
   set(ri_type_text,'String','1st Order Elastic')   
   set(ri_apply,'String','Increments')
elseif isequal(AS,1)
   Inpopnum = lambda:lambda:(Sincre);
   set(ri_type_text,'String','2nd Order Elastic') 
   set(ri_apply,'String','Increments')
elseif isequal(AE,1) 
   nmode = str2double(get(ap_mode_edit,'String')); 
   Inpopnum = 1:1:nmode;
   set(ri_type_text,'String','El. Lin. Buckling')
   set(ri_apply,'String','Mode')
elseif isequal(AI,2)
   Inpopnum = 1:1:1;
   set(ri_type_text,'String','Inel. Lin. Buckling')  
   set(ri_apply,'String','Mode')
elseif isequal(AI,1)
   Inpopnum = 1:1:1;
   set(ri_type_text,'String','Inel. Lin. Buckling')  
   set(ri_apply,'String','Mode')
elseif isequal(AI,3)
   Inpopnum = 1:1:1;
   set(ri_type_text,'String','Inel. Lin. Buckling')  
   set(ri_apply,'String','Mode') 
elseif isequal(AI,4)
   Inpopnum = 1:1:1;
   set(ri_type_text,'String','Inel. Lin. Buckling')  
   set(ri_apply,'String','Mode')     
elseif isequal(ANE,1) 
   Inpopnum = 1:1:1;
   set(ri_type_text,'String','El. Nonlin. Buckling')
   set(ri_apply,'String','Mode')
elseif isequal(ANI,2)
   Inpopnum = 1:1:1;
   set(ri_type_text,'String','Inel. Nonlin. Buckling')  
   set(ri_apply,'String','Mode')
elseif isequal(ANI,1)
   Inpopnum = 1:1:1;
   set(ri_type_text,'String','Inel. Nonlin. Buckling')  
   set(ri_apply,'String','Mode')
elseif isequal(ANI,3)
   Inpopnum = 1:1:1;
   set(ri_type_text,'String','Inel. Nonlin. Buckling')  
   set(ri_apply,'String','Mode')  
elseif isequal(ANI,4)
   Inpopnum = 1:1:1;
   set(ri_type_text,'String','Inel. Nonlin. Buckling')  
   set(ri_apply,'String','Mode')    
else
   Inpopnum = 1:1:1;
   set(ri_type_text,'String','')
   set(ri_apply,'String','Increments')
end  
set(ri_cancel,'String',num2str(Inpopnum'))   

% ------------------------------------------------------------------------
% -----------------------        Read Data        ------------------------
% ------------------------------------------------------------------------
set(v1um_p1_edit,'String','');
set(v1um_p2_edit,'String','');
set(v1um_p3_edit,'String','');
set(v1um_p4_edit,'String','');
set(v1um_p5_edit,'String','');
          
if strcmp(get(vdum, 'Checked'),'on') 
   
   if isequal(Rtype,0)
   elseif isequal(Rtype,1)
      set(findobj('linewidth',2.5),'linewidth',0.5) 
      if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
        set(findobj('Color',[0.9 0.1 0]),'Color',[0.4 0.4 0.4]) 
      elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background 
        set(findobj('Color',[0.9 0.1 0]),'Color','y')    
      end
      if ~isempty(Qintf)
         Qintf=round(Qintf*10^1)/10^1;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0],'linewidth',2.5);   
            incre = get(ri_cancel,'Value'); 
            enum= sscanf(get(gco,'Tag'),'Ai%u');
            set(v1um_p1_edit,'String',num2str(-Qintf(enum,1,incre)));
            set(v1um_p5_edit,'String',num2str(Qintf(enum,8,incre)));
         end
      end
   elseif isequal(Rtype,2)
       set(findobj('linewidth',2.5),'linewidth',0.5) 
      if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
        set(findobj('Color',[0.9 0.1 0]),'Color',[0.4 0.4 0.4]) 
      elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background 
        set(findobj('Color',[0.9 0.1 0]),'Color','y')    
      end
      if ~isempty(Qintf)
         Qintf=round(Qintf*10^1)/10^1;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0],'linewidth',2.5);  
            incre = get(ri_cancel,'Value'); 
            enum= sscanf(get(gco,'Tag'),'Sy%u');
            set(v1um_p1_edit,'String',num2str(Qintf(enum,2,incre)));
            set(v1um_p5_edit,'String',num2str(-Qintf(enum,9,incre)));
         end
      end    
   elseif isequal(Rtype,3)
       set(findobj('linewidth',2.5),'linewidth',0.5) 
      if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
        set(findobj('Color',[0.9 0.1 0]),'Color',[0.4 0.4 0.4]) 
      elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background 
        set(findobj('Color',[0.9 0.1 0]),'Color','y')    
      end
      if ~isempty(Qintf)
         Qintf=round(Qintf*10^1)/10^1;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0],'linewidth',2.5);   
            incre = get(ri_cancel,'Value'); 
            enum= sscanf(get(gco,'Tag'),'Sz%u');
            set(v1um_p1_edit,'String',num2str(-Qintf(enum,3,incre)));
            set(v1um_p5_edit,'String',num2str(Qintf(enum,10,incre)));
         end
      end    
   elseif isequal(Rtype,4)
       set(findobj('linewidth',2.5),'linewidth',0.5) 
      if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
        set(findobj('Color',[0.9 0.1 0]),'Color',[0.4 0.4 0.4]) 
      elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background 
        set(findobj('Color',[0.9 0.1 0]),'Color','y')    
      end
      if ~isempty(Qintf)
         Qintf=round(Qintf*10^1)/10^1;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0],'linewidth',2.5);   
            incre = get(ri_cancel,'Value'); 
            enum= sscanf(get(gco,'Tag'),'Mt%u');
            set(v1um_p1_edit,'String',num2str(-Qintf(enum,4,incre)));
            set(v1um_p5_edit,'String',num2str(Qintf(enum,11,incre)));
         end
      end 
   elseif isequal(Rtype,5)
       set(findobj('linewidth',2.5),'linewidth',0.5) 
      if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
        set(findobj('Color',[0.9 0.1 0]),'Color',[0.4 0.4 0.4]) 
      elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background 
        set(findobj('Color',[0.9 0.1 0]),'Color','y')    
      end
      if ~isempty(Qintf)
         Qintf=round(Qintf*10^1)/10^1;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0],'linewidth',2.5); 
            incre = get(ri_cancel,'Value'); 
            enum= sscanf(get(gco,'Tag'),'My%u');
            set(v1um_p1_edit,'String',num2str(-Qintf(enum,5,incre)));
            set(v1um_p5_edit,'String',num2str(Qintf(enum,12,incre)));
         end
      end   
   elseif isequal(Rtype,6)
       set(findobj('linewidth',2.5),'linewidth',0.5) 
      if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
        set(findobj('Color',[0.9 0.1 0]),'Color',[0.4 0.4 0.4]) 
      elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background 
        set(findobj('Color',[0.9 0.1 0]),'Color','y')    
      end
      if ~isempty(Qintf)
         Qintf=round(Qintf*10^1)/10^1;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0],'linewidth',2.5);   
            incre = get(ri_cancel,'Value'); 
            enum= sscanf(get(gco,'Tag'),'Mz%u');
            set(v1um_p1_edit,'String',num2str(-Qintf(enum,6,incre)));
            set(v1um_p5_edit,'String',num2str(Qintf(enum,13,incre)));
         end
      end
   elseif isequal(Rtype,7)
       set(findobj('linewidth',2.5),'linewidth',0.5) 
      if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
        set(findobj('Color',[0.9 0.1 0]),'Color',[0.4 0.4 0.4]) 
      elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background 
        set(findobj('Color',[0.9 0.1 0]),'Color','y')    
      end
      if ~isempty(Qintf)
         Qintf=round(Qintf*10^1)/10^1;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0],'linewidth',2.5);    
            incre = get(ri_cancel,'Value'); 
            enum= sscanf(get(gco,'Tag'),'Bi%u');
            set(v1um_p1_edit,'String',num2str(Qintf(enum,7,incre)));
            set(v1um_p5_edit,'String',num2str(-Qintf(enum,14,incre)));
         end
      end
      
   elseif isequal(get(ri_tau_diagram,'Value'),1)    
%       set(findobj('Color','m'),'Color','y') 
   elseif isequal(get(ri_tau_diagram,'Value'),2) 
       set(findobj('linewidth',2.5),'linewidth',0.5) 
      if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
        set(findobj('Color',[0.9 0.1 0]),'Color',[0.4 0.4 0.4]) 
      elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background 
        set(findobj('Color',[0.9 0.1 0]),'Color','y')    
      end
      if isequal(AS,1)
      if ~isempty(PrPeL2nd)
%          PrPeL=round(PrPeL*10^3)/10^3;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
           set(gco,'Color',[0.9 0.1 0],'linewidth',2.5); 
            incre = get(ri_cancel,'Value');
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(PrPeL2nd(1,enum,incre)));
            set(v1um_p2_edit,'String',num2str(PrPeL2nd(2,enum,incre)));
            set(v1um_p3_edit,'String',num2str(PrPeL2nd(3,enum,incre)));
            set(v1um_p4_edit,'String',num2str(PrPeL2nd(4,enum,incre)));
            set(v1um_p5_edit,'String',num2str(PrPeL2nd(5,enum,incre)));
         end
      end    
      elseif isequal(AE,1)
      if ~isempty(PrPeLB)
%          PrPeL=round(PrPeL*10^3)/10^3;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0],'linewidth',2.5); 
            incre = get(ri_cancel,'Value');
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(PrPeLB(1,enum,incre)));
            set(v1um_p2_edit,'String',num2str(PrPeLB(2,enum,incre)));
            set(v1um_p3_edit,'String',num2str(PrPeLB(3,enum,incre)));
            set(v1um_p4_edit,'String',num2str(PrPeLB(4,enum,incre)));
            set(v1um_p5_edit,'String',num2str(PrPeLB(5,enum,incre)));
         end
      end  
      elseif isequal(ANE,1)
      if ~isempty(PrPeLNB)
%          PrPeL=round(PrPeL*10^3)/10^3;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0],'linewidth',2.5); 
            incre = get(ri_cancel,'Value');
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(PrPeLNB(1,enum,incre)));
            set(v1um_p2_edit,'String',num2str(PrPeLNB(2,enum,incre)));
            set(v1um_p3_edit,'String',num2str(PrPeLNB(3,enum,incre)));
            set(v1um_p4_edit,'String',num2str(PrPeLNB(4,enum,incre)));
            set(v1um_p5_edit,'String',num2str(PrPeLNB(5,enum,incre)));
         end
      end      
      else
      if ~isempty(tau)
         tau=round(tau*10^3)/10^3;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0],'linewidth',2.5);   
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(tau(1,enum)));
            set(v1um_p2_edit,'String',num2str(tau(2,enum)));
            set(v1um_p3_edit,'String',num2str(tau(3,enum)));
            set(v1um_p4_edit,'String',num2str(tau(4,enum)));
            set(v1um_p5_edit,'String',num2str(tau(5,enum)));
         end
      end   
      end
   elseif isequal(get(ri_tau_diagram,'Value'),3) 
       set(findobj('linewidth',2.5),'linewidth',0.5) 
      if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
        set(findobj('Color',[0.9 0.1 0]),'Color',[0.4 0.4 0.4]) 
      elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background 
        set(findobj('Color',[0.9 0.1 0]),'Color','y')    
      end
      if ~isempty(Rpg)
         Rpg=round(Rpg*10^3)/10^3;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0],'linewidth',2.5);  
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(Rpg(1,enum)));
            set(v1um_p2_edit,'String',num2str(Rpg(2,enum)));
            set(v1um_p3_edit,'String',num2str(Rpg(3,enum)));
            set(v1um_p4_edit,'String',num2str(Rpg(4,enum)));
            set(v1um_p5_edit,'String',num2str(Rpg(5,enum)));
         end
      end  
   elseif isequal(get(ri_tau_diagram,'Value'),4) 
       set(findobj('linewidth',2.5),'linewidth',0.5) 
      if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
        set(findobj('Color',[0.9 0.1 0]),'Color',[0.4 0.4 0.4]) 
      elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background 
        set(findobj('Color',[0.9 0.1 0]),'Color','y')    
      end
      if ~isempty(Rpc)
         Rpc=round(Rpc*10^3)/10^3;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0],'linewidth',2.5);   
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(Rpc(1,enum)));
            set(v1um_p2_edit,'String',num2str(Rpc(2,enum)));
            set(v1um_p3_edit,'String',num2str(Rpc(3,enum)));
            set(v1um_p4_edit,'String',num2str(Rpc(4,enum)));
            set(v1um_p5_edit,'String',num2str(Rpc(5,enum)));
         end
      end        
   elseif isequal(get(ri_tau_diagram,'Value'),5) 
       set(findobj('linewidth',2.5),'linewidth',0.5) 
      if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
        set(findobj('Color',[0.9 0.1 0]),'Color',[0.4 0.4 0.4]) 
      elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background 
        set(findobj('Color',[0.9 0.1 0]),'Color','y')    
      end
      if ~isempty(Rpt)
         Rpt=round(Rpt*10^3)/10^3;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0],'linewidth',2.5); 
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(Rpt(1,enum)));
            set(v1um_p2_edit,'String',num2str(Rpt(2,enum)));
            set(v1um_p3_edit,'String',num2str(Rpt(3,enum)));
            set(v1um_p4_edit,'String',num2str(Rpt(4,enum)));
            set(v1um_p5_edit,'String',num2str(Rpt(5,enum)));
         end
      end       
   elseif isequal(get(ri_tau_diagram,'Value'),6) 
       set(findobj('linewidth',2.5),'linewidth',0.5) 
      if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
        set(findobj('Color',[0.9 0.1 0]),'Color',[0.4 0.4 0.4]) 
      elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background 
        set(findobj('Color',[0.9 0.1 0]),'Color','y')    
      end 
      if ~isempty(Rh)
         Rh=round(Rh*10^3)/10^3;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0],'linewidth',2.5);   
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(Rh(1,enum)));
            set(v1um_p2_edit,'String',num2str(Rh(2,enum)));
            set(v1um_p3_edit,'String',num2str(Rh(3,enum)));
            set(v1um_p4_edit,'String',num2str(Rh(4,enum)));
            set(v1um_p5_edit,'String',num2str(Rh(5,enum)));
         end
      end      
   elseif isequal(get(ri_tau_diagram,'Value'),7) 
       set(findobj('linewidth',2.5),'linewidth',0.5) 
      if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
        set(findobj('Color',[0.9 0.1 0]),'Color',[0.4 0.4 0.4]) 
      elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background 
        set(findobj('Color',[0.9 0.1 0]),'Color','y')    
      end 
      if ~isempty(Myc)
         Myc=round(Myc*10^1)/10^1;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0],'linewidth',2.5);    
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(Myc(1,enum)));
            set(v1um_p2_edit,'String',num2str(Myc(2,enum)));
            set(v1um_p3_edit,'String',num2str(Myc(3,enum)));
            set(v1um_p4_edit,'String',num2str(Myc(4,enum)));
            set(v1um_p5_edit,'String',num2str(Myc(5,enum)));
         end
      end        
   elseif isequal(get(ri_tau_diagram,'Value'),8)
       set(findobj('linewidth',2.5),'linewidth',0.5) 
      if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
        set(findobj('Color',[0.9 0.1 0]),'Color',[0.4 0.4 0.4]) 
      elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background 
        set(findobj('Color',[0.9 0.1 0]),'Color','y')    
      end
      if ~isempty(Myt)
         Myt=round(Myt*10^1)/10^1;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0],'linewidth',2.5);  
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(Myt(1,enum)));
            set(v1um_p2_edit,'String',num2str(Myt(2,enum)));
            set(v1um_p3_edit,'String',num2str(Myt(3,enum)));
            set(v1um_p4_edit,'String',num2str(Myt(4,enum)));
            set(v1um_p5_edit,'String',num2str(Myt(5,enum)));
         end
      end   
   elseif isequal(get(ri_tau_diagram,'Value'),9) 
       set(findobj('linewidth',2.5),'linewidth',0.5) 
      if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
        set(findobj('Color',[0.9 0.1 0]),'Color',[0.4 0.4 0.4]) 
      elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background 
        set(findobj('Color',[0.9 0.1 0]),'Color','y')    
      end 
      if ~isempty(My)
         My=round(My*10^1)/10^1;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
           set(gco,'Color',[0.9 0.1 0],'linewidth',2.5);   
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(My(1,enum)));
            set(v1um_p2_edit,'String',num2str(My(2,enum)));
            set(v1um_p3_edit,'String',num2str(My(3,enum)));
            set(v1um_p4_edit,'String',num2str(My(4,enum)));
            set(v1um_p5_edit,'String',num2str(My(5,enum)));
         end
      end    
   elseif isequal(get(ri_tau_diagram,'Value'),10) 
       set(findobj('linewidth',2.5),'linewidth',0.5) 
      if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
        set(findobj('Color',[0.9 0.1 0]),'Color',[0.4 0.4 0.4]) 
      elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background 
        set(findobj('Color',[0.9 0.1 0]),'Color','y')    
      end
      if ~isempty(Jval)
         Jval=round(Jval*10^3)/10^3;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0],'linewidth',2.5);   
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(Jval(1,enum)));
            set(v1um_p2_edit,'String',num2str(Jval(2,enum)));
            set(v1um_p3_edit,'String',num2str(Jval(3,enum)));
            set(v1um_p4_edit,'String',num2str(Jval(4,enum)));
            set(v1um_p5_edit,'String',num2str(Jval(5,enum)));
         end
      end         
   elseif isequal(get(ri_tau_diagram,'Value'),11) 
       set(findobj('linewidth',2.5),'linewidth',0.5) 
      if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
        set(findobj('Color',[0.9 0.1 0]),'Color',[0.4 0.4 0.4]) 
      elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background 
        set(findobj('Color',[0.9 0.1 0]),'Color','y')    
      end
      if ~isempty(Phi_Mmax)
         Phi_Mmax=round(Phi_Mmax*10^1)/10^1;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0],'linewidth',2.5);    
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(Phi_Mmax(1,enum)));
            set(v1um_p2_edit,'String',num2str(Phi_Mmax(2,enum)));
            set(v1um_p3_edit,'String',num2str(Phi_Mmax(3,enum)));
            set(v1um_p4_edit,'String',num2str(Phi_Mmax(4,enum)));
            set(v1um_p5_edit,'String',num2str(Phi_Mmax(5,enum)));
         end
      end         
   elseif isequal(get(ri_tau_diagram,'Value'),12) 
       set(findobj('linewidth',2.5),'linewidth',0.5) 
      if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
        set(findobj('Color',[0.9 0.1 0]),'Color',[0.4 0.4 0.4]) 
      elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background 
        set(findobj('Color',[0.9 0.1 0]),'Color','y')    
      end 
      if ~isempty(Phi_Py)
         Phi_Py=round(Phi_Py*10^1)/10^1;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0],'linewidth',2.5);   
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(Phi_Py(1,enum)));
            set(v1um_p2_edit,'String',num2str(Phi_Py(2,enum)));
            set(v1um_p3_edit,'String',num2str(Phi_Py(3,enum)));
            set(v1um_p4_edit,'String',num2str(Phi_Py(4,enum)));
            set(v1um_p5_edit,'String',num2str(Phi_Py(5,enum)));
         end
      end         
   elseif isequal(get(ri_tau_diagram,'Value'),13) 
       set(findobj('linewidth',2.5),'linewidth',0.5) 
      if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
        set(findobj('Color',[0.9 0.1 0]),'Color',[0.4 0.4 0.4]) 
      elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background 
        set(findobj('Color',[0.9 0.1 0]),'Color','y')    
      end 
      if ~isempty(UC)
         UC=round(UC*10^3)/10^3;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0],'linewidth',2.5);   
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(UC(1,enum)));
            set(v1um_p2_edit,'String',num2str(UC(2,enum)));
            set(v1um_p3_edit,'String',num2str(UC(3,enum)));
            set(v1um_p4_edit,'String',num2str(UC(4,enum)));
            set(v1um_p5_edit,'String',num2str(UC(5,enum)));
         end
      end           
   elseif isequal(get(ri_tau_diagram,'Value'),14) 
       set(findobj('linewidth',2.5),'linewidth',0.5) 
      if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
        set(findobj('Color',[0.9 0.1 0]),'Color',[0.4 0.4 0.4]) 
      elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background 
        set(findobj('Color',[0.9 0.1 0]),'Color','y')    
      end 
      if ~isempty(PrPeL)
%          PrPeL=round(PrPeL*10^3)/10^3;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0],'linewidth',2.5); 
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(PrPeL(1,enum)));
            set(v1um_p2_edit,'String',num2str(PrPeL(2,enum)));
            set(v1um_p3_edit,'String',num2str(PrPeL(3,enum)));
            set(v1um_p4_edit,'String',num2str(PrPeL(4,enum)));
            set(v1um_p5_edit,'String',num2str(PrPeL(5,enum)));
         end
      end      
   end
   
end

end









