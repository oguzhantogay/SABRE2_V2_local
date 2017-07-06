clc; clear
%% -------------edit the directory--------------------------------------
inpath='C:\Users\rslein3\Desktop\Altered\input\';
outpath='C:\Users\rslein3\Desktop\Altered\output\';
%% ---------------------------------------------------------------------

Analysis_type='ILBA';

inpfilename = ls(fullfile(inpath, '*.mat')); %import all .mat files within a path directory
numfiles=size(inpfilename,1);
writeID = fullfile(outpath,'out.txt'); 
outfile =strcat(writeID);   % Output file name.
out = fopen(outfile,'wt');  % Output file is opened.  
for runs=1:1%numfiles
filename=inpfilename(runs,:);

% ************************************************************************
% ******************             SABRE2              *********************
% ************************************************************************

%% Open .mat file
data=load(fullfile(inpath,filename));
[JNodevalue,Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,...
 SNodevalue,RNCc,NCc,Nshe1,Nshe2,DUP1,DUP2,LNC,LNC1,LNC2,...
 LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,AnalP]=SABRE2OpenCODE_ryan(data);
% Drawing Nodal white points & generate NC
[RNCc,Nshe1,Nshe2,DUP1,DUP2,NCc,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Mhe1,Mhe2,Bhg,Thg,CSg,BNC1,BNC2,FEL,error]=SABRE2LBCODE(JNodevalue,...
 Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,SNodevalue,...
 RNCc,Nshe1,Nshe2,DUP1,DUP2,NCc,LNC,LUEC,PNC,BNC,BNC1,BNC2,FEL,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Mhe1,Mhe2,Bhg,Thg,CSg,LabType,pt_title_name,axesm,vstm);    
% Initial View : X-Y View
az = 0; el = 0; view(az, el); 
if ~isempty(AnalP)
    if isequal(AnalP(1,1),0)
        set(ap_sw_on_radiobutton,'Value',0);set(ap_sw_off_radiobutton,'Value',1);
    else
        set(ap_sw_on_radiobutton,'Value',1);set(ap_sw_off_radiobutton,'Value',0);
    end
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
        set(api_assign_edit,'String',num2str(AnalP(5,1)));set(apninc_assign_edit,'String',num2str(AnalP(6,1)));
end

ap_AISC_buttongroup='AISC_off'; %provision year
ap_cv_buttongroup='cv_off'; %????
ap_sw_buttongroup='sw off'; %self weight flag
ap_jval_buttongroup='jval_on'; %J=0 for slender webs
ap_nmode=1; %number of buckling modes
ap_ninc = 1; %increment size
ap_da_buttongroup = 'da_on';
switch ap_AISC_buttongroup
  case 'AISC_on' 
     LIAType=0; NLIAType=0;             
  case 'AISC_off'
     LIAType=1; NLIAType=1; 
end 





switch Analysis_type
    case 'FirstOrderEigen'
        lambda=AnalP(5,1);
%          ninc = str2double(get(apninc_assign_edit,'String'));     
         [AR,Funew,Qintf,QintfE,QintgP,Qintg1,Qintg2,MIE] = Analysis1st(Massemble,Rval,JNodevalue_i,JNodevalue_j,SNodevalue,...
            RNCc,Nshe1,Nshe2,DUP1,DUP2,LNC,LNC1,LNC2,LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,ap_ninc,lambda,ap_sw_buttongroup,pt_title_name); 
         FunewP =Funew;FunewR =Funew;%set(ri_scale_edit,'String',num2str(1.2*max(max(RNCc(:,5)),max(RNCc(:,7)))));

    case 'SecondOrderEigen'
        lambda=AnalP(5,1); tolerance = 0.001;niter = 30;        
         [AS,Funew,Qintf,QintfE,QintgP,Qintg1,Qintg2,MIE,Sincre] = Analysis2nd_ryan(Massemble,Rval,...
            JNodevalue_i,JNodevalue_j,SNodevalue,RNCc,Nshe1,Nshe2,DUP1,DUP2,LNC,LNC1,LNC2,...
            LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,tolerance,ap_ninc,niter,lambda,ap_sw_buttongroup,ap_da_buttongroup);
         FunewP =Funew;FunewR =Funew;
         
    case 'ELBA'
         lambda = 1; 
         switch ap_jval_buttongroup
            case 'jval_on' 
               [AE,gammma,EGunew,Qintf,QintfE,Qintg1,Qintg2,MIE] = AnalysisBucklingESL_ryan(Massemble,...
                  Rval,JNodevalue_i,JNodevalue_j,SNodevalue,RNCc,Nshe1,Nshe2,DUP1,DUP2,LNC,LNC1,LNC2,...
                  LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,ap_nmode,ap_ninc,lambda,ap_sw_buttongroup,LIAType); 
            case 'jval_off'
               [AE,gammma,FunewR,EGunew,Qintf,QintfE,Qintg1,Qintg2,MIE] = AnalysisBuckling_ryan(Massemble,...
                  Rval,JNodevalue_i,JNodevalue_j,SNodevalue,RNCc,Nshe1,Nshe2,DUP1,DUP2,LNC,LNC1,LNC2,...
                  LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,ap_nmode,ap_ninc,lambda,ap_sw_buttongroup); 
         end
         %print gamma to textflie
         gamma = num2str(gammma);
         currentdate = date;
         fprintf(out,[gamma,' ',inpfilename(runs,:),' ',currentdate, '\n']);
         
    case 'ILBA'
         lambda = 1;ap_nmode = 1;ap_ninc = 1;
         JeongP=5;BrentP=1; 
         [AI,gammma,FunewR,EGunew,Qintf,QintfE,Qintg1,Qintg2,MIE,tau,Rpg,Rpc,Rpt,Rh,Myc,Myt,My,Jval,Phi_Mmax,Phi_Py,UC,crLTB,LGv] = AnalysisIEBuckling_ryan(Massemble,...
            Rval,JNodevalue_i,JNodevalue_j,SNodevalue,RNCc,Nshe1,Nshe2,DUP1,DUP2,LNC,LNC1,LNC2,...
            LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,ap_nmode,ap_ninc,lambda,...
            ap_sw_buttongroup,ap_cv_buttongroup,JeongP,BrentP,LIAType); 
         %print gamma to textflie
         gamma = num2str(gammma);
         currentdate = date;
         fprintf(out,[gamma,' ',inpfilename(runs,:),' ',currentdate, '\n']);
        

    case 'ENBA'
         APP=0;AR=0;AS=0;AE=0;AI=0;ANE=0;ANI=0;lambda = 1;ap_nmode = 1;ap_ninc = 1;FunewP=[];QintgP=[];
         JeongP=str2double(get(ap_jeong_edit,'String'));BrentP=str2double(get(ap_brent_edit,'String')); 
         switch get(get(ap_jval_buttongroup,'SelectedObject'),'Tag')
            case 'jval_on'       
               [ANE,gammma,FunewR,EGunew,Qintf,QintfE,Qintg1,Qintg2,MIE] = AnalysisNonBucklingESL(Massemble,...
                  Rval,JNodevalue_i,JNodevalue_j,SNodevalue,RNCc,Nshe1,Nshe2,DUP1,DUP2,LNC,LNC1,LNC2,...
                  LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,ap_nmode,ap_ninc,lambda,pt_title_name,...
                  ap_sw_buttongroup,ap_da_buttongroup,ap_cv_buttongroup,JeongP,BrentP,NLIAType);    

            case 'jval_off'
               [ANE,gammma,FunewR,EGunew,Qintf,QintfE,Qintg1,Qintg2,MIE] = AnalysisNonBuckling(Massemble,...
                  Rval,JNodevalue_i,JNodevalue_j,SNodevalue,RNCc,Nshe1,Nshe2,DUP1,DUP2,LNC,LNC1,LNC2,...
                  LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,ap_nmode,ap_ninc,lambda,pt_title_name,...
                  ap_sw_buttongroup,ap_da_buttongroup,ap_cv_buttongroup,JeongP,BrentP);                
         end  
         
    case 'ENBA_check'
            lambda = 1;ap_nmode = 1;ap_ninc = 1
            JeongP=5;BrentP=1;  
         [AI,gammma,FunewR,EGunew,Qintf,QintfE,Qintg1,Qintg2,MIE,tau,Rpg,Rpc,Rpt,Rh,Myc,Myt,My,Jval,Phi_Mmax,Phi_Py,UC,crLTB,LGv] = AnalysisIEBucklingCheck(Massemble,...
            Rval,JNodevalue_i,JNodevalue_j,SNodevalue,RNCc,Nshe1,Nshe2,DUP1,DUP2,LNC,LNC1,LNC2,...
            LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,ap_nmode,ap_ninc,lambda,...
            ap_sw_buttongroup,ap_cv_buttongroup,JeongP,BrentP,LIAType); 
        
    case 'INBA'
         APP=0;AR=0;AS=0;AE=0;AI=0;ANE=0;ANI=0;lambda = 1;ap_nmode = 1;ap_ninc = 1;FunewP=[];QintgP=[];
         JeongP=str2double(get(ap_jeong_edit,'String'));BrentP=str2double(get(ap_brent_edit,'String'));    
         [ANI,gammma,FunewR,EGunew,Qintf,QintfE,Qintg1,Qintg2,MIE,tau,Rpg,Rpc,Rpt,Rh,Myc,Myt,My,Jval,Phi_Mmax,Phi_Py,UC,crLTB,LGv] = AnalysisNonIEBuckling(Massemble,...
            Rval,JNodevalue_i,JNodevalue_j,SNodevalue,RNCc,Nshe1,Nshe2,DUP1,DUP2,LNC,LNC1,LNC2,...
            LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,ap_nmode,ap_ninc,lambda,pt_title_name,...
            ap_sw_buttongroup,ap_da_buttongroup,ap_cv_buttongroup,JeongP,BrentP,NLIAType);   

    case 'INBA_check'
         APP=0;AR=0;AS=0;AE=0;AI=0;ANE=0;ANI=0;lambda = 1;ap_nmode = 1;ap_ninc = 1;FunewP=[];QintgP=[];
         JeongP=str2double(get(ap_jeong_edit,'String'));BrentP=str2double(get(ap_brent_edit,'String'));    
         [ANI,gammma,FunewR,EGunew,Qintf,QintfE,Qintg1,Qintg2,MIE,tau,Rpg,Rpc,Rpt,Rh,Myc,Myt,My,Jval,Phi_Mmax,Phi_Py,UC,crLTB,LGv] = AnalysisNonIEBucklingCheck(Massemble,...
            Rval,JNodevalue_i,JNodevalue_j,SNodevalue,RNCc,Nshe1,Nshe2,DUP1,DUP2,LNC,LNC1,LNC2,...
            LUEC,PNC,PNC1,PNC2,BNC,BNC1,BNC2,FEL,ap_nmode,ap_ninc,lambda,pt_title_name,...
            ap_sw_buttongroup,ap_da_buttongroup,ap_cv_buttongroup,JeongP,BrentP,NLIAType);   
end

close
end


