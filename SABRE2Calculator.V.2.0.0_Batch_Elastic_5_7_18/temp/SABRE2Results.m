function SABRE2Results(pn_panel,pt_title_name,fim_infor_name,ptable_type_subpanel,...
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
   v1um_p2_edit,v1um_p3_edit,v1um_p4_edit,v1um_p5_edit,tau,Rpg,Rpc,Rpt,Rh,Myc,Myt,My,Jval,Phi_Mmax,Phi_Py,UC)

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
set(am6_type_text,'Visible','off')
% *************** Visible off for Inelastic Nonlinear Buckling E

% *************** Visible off for Results S
% *** sub panel1
set(res_subpanel,'Visible','on')
set([res_text,recba_gamma_text,recba_scale_text],'Visible','on');
set([recba_gamma_edit,recba_Scale_edit],'Visible','on');
set([recba_tau_text,recba_tau_diagram],'Visible','on');  
% *************** Visible off for Results E

% *************** Visible off for Batch Mode S
% *** sub panel1
set(auto_type_text,'Visible','off')
% *** sub panel2
set([auto_modelname_text,auto_modelnum_text,auto_modelname_edit,auto_modelnum_edit,...
   auto_lin_apply,auto_nonlin_apply],'Visible','off');
% *************** Visible off for Batch Mode E
   
% ------------------------------------------------------------------------
% -----------------------        EDIT INUPT       ------------------------
% ------------------------------------------------------------------------ 
if isequal(AE,1) 
   set(am3_type_text,'Visible','on')
   set(recba_tau_diagram,'enable','on')
elseif isequal(AI,2)
   set(am4_type_text,'Visible','on') 
   set(recba_tau_diagram,'enable','on')
elseif isequal(AI,1)
   set(am4_type_text,'Visible','on') 
   set(recba_tau_diagram,'enable','on')
elseif isequal(AI,3)
   set(am4_type_text,'Visible','on')  
   set(recba_tau_diagram,'enable','on')
elseif isequal(ANI,1)
   set(am6_type_text,'Visible','on')  
   set(recba_tau_diagram,'enable','on')
elseif isequal(ANI,2)
   set(am6_type_text,'Visible','on') 
   set(recba_tau_diagram,'enable','on')
elseif isequal(ANI,3)
   set(am6_type_text,'Visible','on') 
   set(recba_tau_diagram,'enable','on')
else
%       set(recba_tau_diagram,'enable','off')
   set([am3_type_text,am4_type_text,am6_type_text],'Visible','off')
end 
   
% ------------------------------------------------------------------------
% -----------------------        Read Data        ------------------------
% ------------------------------------------------------------------------
set(v1um_p1_edit,'String','');
set(v1um_p2_edit,'String','');
set(v1um_p3_edit,'String','');
set(v1um_p4_edit,'String','');
set(v1um_p5_edit,'String','');
     

if strcmp(get(vdum, 'Checked'),'on') 
   
   if isequal(get(recba_tau_diagram,'Value'),1)    
      
   elseif isequal(get(recba_tau_diagram,'Value'),4)
      set(findobj('Color',[0.9 0.1 0]),'Color','y') 
      if ~isempty(Qintf)
         Qintf=round(Qintf*10^1)/10^1;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0])   
            incre = 1; 
            enum= sscanf(get(gco,'Tag'),'Ai%u');
            set(v1um_p1_edit,'String',num2str(-Qintf(enum,1,incre)));
            set(v1um_p5_edit,'String',num2str(Qintf(enum,8,incre)));
         end
      end      
   elseif isequal(get(recba_tau_diagram,'Value'),5) 
      set(findobj('Color',[0.9 0.1 0]),'Color','y') 
      if ~isempty(Qintf)
         Qintf=round(Qintf*10^1)/10^1;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0])   
            incre = 1; 
            enum= sscanf(get(gco,'Tag'),'Mz%u');
            set(v1um_p1_edit,'String',num2str(-Qintf(enum,6,incre)));
            set(v1um_p5_edit,'String',num2str(Qintf(enum,13,incre)));
         end
      end      
   elseif isequal(get(recba_tau_diagram,'Value'),6)       
      set(findobj('Color',[0.9 0.1 0]),'Color','y') 
      if ~isempty(tau)
         tau=round(tau*10^3)/10^3;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0])   
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(tau(1,enum)));
            set(v1um_p2_edit,'String',num2str(tau(2,enum)));
            set(v1um_p3_edit,'String',num2str(tau(3,enum)));
            set(v1um_p4_edit,'String',num2str(tau(4,enum)));
            set(v1um_p5_edit,'String',num2str(tau(5,enum)));
         end
      end
   elseif isequal(get(recba_tau_diagram,'Value'),7) 
      set(findobj('Color',[0.9 0.1 0]),'Color','y') 
      if ~isempty(Rpg)
         Rpg=round(Rpg*10^3)/10^3;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0])   
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(Rpg(1,enum)));
            set(v1um_p2_edit,'String',num2str(Rpg(2,enum)));
            set(v1um_p3_edit,'String',num2str(Rpg(3,enum)));
            set(v1um_p4_edit,'String',num2str(Rpg(4,enum)));
            set(v1um_p5_edit,'String',num2str(Rpg(5,enum)));
         end
      end  
   elseif isequal(get(recba_tau_diagram,'Value'),8) 
      set(findobj('Color',[0.9 0.1 0]),'Color','y') 
      if ~isempty(Rpc)
         Rpc=round(Rpc*10^3)/10^3;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0])   
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(Rpc(1,enum)));
            set(v1um_p2_edit,'String',num2str(Rpc(2,enum)));
            set(v1um_p3_edit,'String',num2str(Rpc(3,enum)));
            set(v1um_p4_edit,'String',num2str(Rpc(4,enum)));
            set(v1um_p5_edit,'String',num2str(Rpc(5,enum)));
         end
      end        
   elseif isequal(get(recba_tau_diagram,'Value'),9) 
      set(findobj('Color',[0.9 0.1 0]),'Color','y') 
      if ~isempty(Rpt)
         Rpt=round(Rpt*10^3)/10^3;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0])   
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(Rpt(1,enum)));
            set(v1um_p2_edit,'String',num2str(Rpt(2,enum)));
            set(v1um_p3_edit,'String',num2str(Rpt(3,enum)));
            set(v1um_p4_edit,'String',num2str(Rpt(4,enum)));
            set(v1um_p5_edit,'String',num2str(Rpt(5,enum)));
         end
      end       
   elseif isequal(get(recba_tau_diagram,'Value'),10) 
      set(findobj('Color',[0.9 0.1 0]),'Color','y') 
      if ~isempty(Rh)
         Rh=round(Rh*10^3)/10^3;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0])   
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(Rh(1,enum)));
            set(v1um_p2_edit,'String',num2str(Rh(2,enum)));
            set(v1um_p3_edit,'String',num2str(Rh(3,enum)));
            set(v1um_p4_edit,'String',num2str(Rh(4,enum)));
            set(v1um_p5_edit,'String',num2str(Rh(5,enum)));
         end
      end      
   elseif isequal(get(recba_tau_diagram,'Value'),11) 
      set(findobj('Color',[0.9 0.1 0]),'Color','y') 
      if ~isempty(Myc)
         Myc=round(Myc*10^1)/10^1;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0])   
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(Myc(1,enum)));
            set(v1um_p2_edit,'String',num2str(Myc(2,enum)));
            set(v1um_p3_edit,'String',num2str(Myc(3,enum)));
            set(v1um_p4_edit,'String',num2str(Myc(4,enum)));
            set(v1um_p5_edit,'String',num2str(Myc(5,enum)));
         end
      end        
   elseif isequal(get(recba_tau_diagram,'Value'),12) 
      set(findobj('Color',[0.9 0.1 0]),'Color','y') 
      if ~isempty(Myt)
         Myt=round(Myt*10^1)/10^1;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0])   
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(Myt(1,enum)));
            set(v1um_p2_edit,'String',num2str(Myt(2,enum)));
            set(v1um_p3_edit,'String',num2str(Myt(3,enum)));
            set(v1um_p4_edit,'String',num2str(Myt(4,enum)));
            set(v1um_p5_edit,'String',num2str(Myt(5,enum)));
         end
      end   
   elseif isequal(get(recba_tau_diagram,'Value'),13) 
      set(findobj('Color',[0.9 0.1 0]),'Color','y') 
      if ~isempty(My)
         My=round(My*10^1)/10^1;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0])   
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(My(1,enum)));
            set(v1um_p2_edit,'String',num2str(My(2,enum)));
            set(v1um_p3_edit,'String',num2str(My(3,enum)));
            set(v1um_p4_edit,'String',num2str(My(4,enum)));
            set(v1um_p5_edit,'String',num2str(My(5,enum)));
         end
      end 
   elseif isequal(get(recba_tau_diagram,'Value'),14) 
      set(findobj('Color',[0.9 0.1 0]),'Color','y') 
      if ~isempty(Jval)
         Jval=round(Jval*10^3)/10^3;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0])   
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(Jval(1,enum)));
            set(v1um_p2_edit,'String',num2str(Jval(2,enum)));
            set(v1um_p3_edit,'String',num2str(Jval(3,enum)));
            set(v1um_p4_edit,'String',num2str(Jval(4,enum)));
            set(v1um_p5_edit,'String',num2str(Jval(5,enum)));
         end
      end       
      
   elseif isequal(get(recba_tau_diagram,'Value'),15) 
      set(findobj('Color',[0.9 0.1 0]),'Color','y') 
      if ~isempty(Phi_Mmax)
         Phi_Mmax=round(Phi_Mmax*10^1)/10^1;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0])   
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(Phi_Mmax(1,enum)));
            set(v1um_p2_edit,'String',num2str(Phi_Mmax(2,enum)));
            set(v1um_p3_edit,'String',num2str(Phi_Mmax(3,enum)));
            set(v1um_p4_edit,'String',num2str(Phi_Mmax(4,enum)));
            set(v1um_p5_edit,'String',num2str(Phi_Mmax(5,enum)));
         end
      end         
   elseif isequal(get(recba_tau_diagram,'Value'),16) 
      set(findobj('Color',[0.9 0.1 0]),'Color','y') 
      if ~isempty(Phi_Py)
         Phi_Py=round(Phi_Py*10^1)/10^1;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0])   
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(Phi_Py(1,enum)));
            set(v1um_p2_edit,'String',num2str(Phi_Py(2,enum)));
            set(v1um_p3_edit,'String',num2str(Phi_Py(3,enum)));
            set(v1um_p4_edit,'String',num2str(Phi_Py(4,enum)));
            set(v1um_p5_edit,'String',num2str(Phi_Py(5,enum)));
         end
      end       
   elseif isequal(get(recba_tau_diagram,'Value'),17) 
      set(findobj('Color',[0.9 0.1 0]),'Color','y') 
      if ~isempty(UC)
         UC=round(UC*10^3)/10^3;
         % If click Element text, set the data automatically.
         if strcmp(get(gco,'type'),'line')
            set(gco,'Color',[0.9 0.1 0])   
            enum= sscanf(get(gco,'Tag'),'SRF%u');
            set(v1um_p1_edit,'String',num2str(UC(1,enum)));
            set(v1um_p2_edit,'String',num2str(UC(2,enum)));
            set(v1um_p3_edit,'String',num2str(UC(3,enum)));
            set(v1um_p4_edit,'String',num2str(UC(4,enum)));
            set(v1um_p5_edit,'String',num2str(UC(5,enum)));
         end
      end         
   end
end


set( gca, 'Units', 'normalized', 'Position', [0 0 0.8 1] ); 

end