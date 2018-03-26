function SABRE2RInfor(pt_title_name,ri_infor_text,AE,AI,ANE,ANI,gammma,UC,LIAType,NLIAType,crLTB,LGv,Massemble,SNodevalue,ap_da_buttongroup,IncreL)
% Developed by Woo Yong Jeong.
% Date : 07/01/2013.
% ************************************************************************
% *****                      Information                              ****
% ************************************************************************
xn = sum(sum(SNodevalue(:,:,3)));   % Total number of Elements
mem=length(Massemble(:,1));         % Total number of members
HType = 0;
for i = 1:mem
   for j = 1:max(SNodevalue(i,:,2))
      for k = 1:SNodevalue(i,j,3)
         if isequal(SNodevalue(i,j,11),1)
            HType = HType+1;
         end           
      end
   end
end
if isequal(HType,0)
   HomoType=0;
elseif isequal(HType,xn)
   HomoType=1;
else
   HomoType=2;
end
if isequal(AE,1) 
   if isequal(LIAType,0)
      set(pt_title_name,'String',['Elastic Linear Buckling Analysis Results. Mode = ',num2str(IncreL),'. Applied Load Ratio = ',num2str(gammma(1,1))]) 
      set(pt_title_name,'Visible','on')     
   elseif isequal(LIAType,1)
      set(pt_title_name,'String',['Elastic Linear Buckling Analysis Results. Mode = ',num2str(IncreL),'. Applied Load Ratio = ',num2str(gammma(1,1))]) 
      set(pt_title_name,'Visible','on')         
   end      
%    if isequal(HomoType,0)
%       set(ri_infor_text,'String','Homogeneous Member(s)') 
%       set(ri_infor_text,'Visible','on') 
%    elseif isequal(HomoType,1)
%       set(ri_infor_text,'String','Hybrid Member(s)') 
%       set(ri_infor_text,'Visible','on') 
%    end
elseif isequal(AI,2) || isequal(AI,1) || isequal(AI,3)
   if isequal(LIAType,0)
      if isequal(crLTB,1)
         set(pt_title_name,'String',['Inelastic Linear Buckling Analysis Results (Current Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1)),' (FLB)',...
            '.  Buckling Applied Load Ratio =',num2str(LGv),' (Buckling)']) 
      elseif isequal(crLTB,2)
         set(pt_title_name,'String',['Inelastic Linear Buckling Analysis Results (Current Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1)),' (TFY)',...
            '.  Buckling Applied Load Ratio =',num2str(LGv),' (Buckling)']) 
      elseif isequal(crLTB,3)
         set(pt_title_name,'String',['Inelastic Linear Buckling Analysis Results (Current Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1)),' (CFY)',...
            '.  Buckling Applied Load Ratio =',num2str(LGv),' (Buckling)']) 
      else
         set(pt_title_name,'String',['Inelastic Linear Buckling Analysis Results (Current Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1))]) 
      end
      set(pt_title_name,'Visible','on')       
   elseif isequal(LIAType,1)
      if isequal(crLTB,1)
         set(pt_title_name,'String',['Inelastic Linear Buckling Analysis Results (Modified Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1)),' (FLB)',...
            '.  Buckling Applied Load Ratio =',num2str(LGv),' (Buckling)']) 
      elseif isequal(crLTB,2)
         set(pt_title_name,'String',['Inelastic Linear Buckling Analysis Results (Modified Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1)),' (TFY)',...
            '.  Buckling Applied Load Ratio =',num2str(LGv),' (Buckling)']) 
      elseif isequal(crLTB,3)
         set(pt_title_name,'String',['Inelastic Linear Buckling Analysis Results (Modified Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1)),' (CFY)',...
            '.  Buckling Applied Load Ratio =',num2str(LGv),' (Buckling)']) 
      else
         set(pt_title_name,'String',['Inelastic Linear Buckling Analysis Results (Modified Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1))]) 
      end  
      set(pt_title_name,'Visible','on') 
   end
   if isequal(HomoType,0)
      set(ri_infor_text,'String','Homogeneous Member(s)') 
      set(ri_infor_text,'Visible','on') 
   elseif isequal(HomoType,1)
      set(ri_infor_text,'String','Hybrid Member(s)') 
      set(ri_infor_text,'Visible','on') 
   end 
elseif isequal(AI,4)   
   UC = round(UC*10^6)/10^6;
   [max_UCrow, indexrow]=max(UC);
   [max_UC, UCcol]=max(max_UCrow);    
   if isequal(LIAType,0)
      if max_UC >= 0.9999
         max_UC = round(max_UC*10^3)/10^3;
         if isequal(crLTB,1)
            set(pt_title_name,'String',['Inelastic Linear Buckling Check (Current Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),' (FLB), Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Cannot Support the Specified Load.'])
            set(pt_title_name,'Visible','on')    
         elseif isequal(crLTB,2)
            set(pt_title_name,'String',['Inelastic Linear Buckling Check (Current Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),' (TFY), Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Cannot Support the Specified Load.'])
            set(pt_title_name,'Visible','on') 
         elseif isequal(crLTB,3)
            set(pt_title_name,'String',['Inelastic Linear Buckling Check (Current Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),' (CFY), Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Cannot Support the Specified Load.'])
            set(pt_title_name,'Visible','on') 
         else
            set(pt_title_name,'String',['Inelastic Linear Buckling Check (Current Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),', Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Cannot Support the Specified Load.'])
            set(pt_title_name,'Visible','on') 
         end
      else 
%          if isequal(crLTB,1)
%              set(pt_title_name,'String',['Inelastic Linear Buckling Check (Current Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),' (FLB), Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Can Support the Specified Load.'])   
%              set(pt_title_name,'Visible','on')
%          elseif isequal(crLTB,2)
%              set(pt_title_name,'String',['Inelastic Linear Buckling Check (Current Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),' (TFY), Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Can Support the Specified Load.'])   
%              set(pt_title_name,'Visible','on') 
%          elseif isequal(crLTB,3)
%              set(pt_title_name,'String',['Inelastic Linear Buckling Check (Current Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),' (CFY), Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Can Support the Specified Load.'])   
%              set(pt_title_name,'Visible','on')
%          else
             set(pt_title_name,'String',['Inelastic Linear Buckling Check (Current Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),', Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Can Support the Specified Load.'])   
             set(pt_title_name,'Visible','on')
%          end
      end     
   elseif isequal(LIAType,1)
      if max_UC >= 0.9999
         max_UC = round(max_UC*10^3)/10^3;
         if isequal(crLTB,1)
            set(pt_title_name,'String',['Inelastic Linear Buckling Check (Modified Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),' (FLB), Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Cannot Support the Specified Load.'])
            set(pt_title_name,'Visible','on')   
         elseif isequal(crLTB,2)
            set(pt_title_name,'String',['Inelastic Linear Buckling Check (Modified Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),' (TFY), Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Cannot Support the Specified Load.'])
            set(pt_title_name,'Visible','on')   
         elseif isequal(crLTB,3)
            set(pt_title_name,'String',['Inelastic Linear Buckling Check (Modified Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),' (CFY), Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Cannot Support the Specified Load.'])
            set(pt_title_name,'Visible','on') 
         else
            set(pt_title_name,'String',['Inelastic Linear Buckling Check (Modified Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),', Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Cannot Support the Specified Load.'])
            set(pt_title_name,'Visible','on') 
         end
      else 
%          if isequal(crLTB,1)
%              set(pt_title_name,'String',['Inelastic Linear Buckling Check (Modified Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),' (FLB), Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Can Support the Specified Load.'])   
%              set(pt_title_name,'Visible','on')
%          elseif isequal(crLTB,2)
%              set(pt_title_name,'String',['Inelastic Linear Buckling Check (Modified Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),' (TFY), Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Can Support the Specified Load.'])   
%              set(pt_title_name,'Visible','on')  
%          elseif isequal(crLTB,3)
%              set(pt_title_name,'String',['Inelastic Linear Buckling Check (Modified Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),' (CFY), Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Can Support the Specified Load.'])   
%              set(pt_title_name,'Visible','on') 
%          else
             set(pt_title_name,'String',['Inelastic Linear Buckling Check (Modified Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),', Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Can Support the Specified Load.'])   
             set(pt_title_name,'Visible','on') 
%          end
      end        
   end   
   if isequal(HomoType,0)
      set(ri_infor_text,'String','Homogeneous Member(s)') 
      set(ri_infor_text,'Visible','on') 
   elseif isequal(HomoType,1)
      set(ri_infor_text,'String','Hybrid Member(s)') 
      set(ri_infor_text,'Visible','on') 
   end    
   
elseif isequal(ANE,1) 
   if isequal(NLIAType,0)
      set(pt_title_name,'String',['Elastic Nonlinear Buckling Analysis Results. Applied Load Ratio = ',num2str(gammma(1,1))]) 
      set(pt_title_name,'Visible','on')
   elseif isequal(NLIAType,1)
      set(pt_title_name,'String',['Elastic Nonlinear Buckling Analysis Results. Applied Load Ratio = ',num2str(gammma(1,1))]) 
      set(pt_title_name,'Visible','on')      
   end
%    if isequal(HomoType,0)
%       set(ri_infor_text,'String','Homogeneous Member(s)') 
%       set(ri_infor_text,'Visible','on') 
%    elseif isequal(HomoType,1)
%       set(ri_infor_text,'String','Hybrid Member(s)') 
%       set(ri_infor_text,'Visible','on') 
%    end   
elseif isequal(ANI,2) || isequal(ANI,1) || isequal(ANI,3)
   if isequal(NLIAType,0)
      if isequal(crLTB,1)
         set(pt_title_name,'String',['Inelastic Nonlinear Buckling Analysis Results (Current Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1)),' (FLB)',...
            '.  Buckling Applied Load Ratio =',num2str(LGv),' (Buckling)']) 
      elseif isequal(crLTB,2)
         set(pt_title_name,'String',['Inelastic Nonlinear Buckling Analysis Results (Current Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1)),' (TFY)',...
            '.  Buckling Applied Load Ratio =',num2str(LGv),' (Buckling)']) 
      elseif isequal(crLTB,3)
         set(pt_title_name,'String',['Inelastic Nonlinear Buckling Analysis Results (Current Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1)),' (CFY)',...
            '.  Buckling Applied Load Ratio =',num2str(LGv),' (Buckling)']) 
      else
         set(pt_title_name,'String',['Inelastic Nonlinear Buckling Analysis Results (Current Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1))]) 
      end
      set(pt_title_name,'Visible','on')  
   elseif isequal(NLIAType,1)
      if isequal(crLTB,1)
         set(pt_title_name,'String',['Inelastic Nonlinear Buckling Analysis Results (Modified Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1)),' (FLB)',...
            '.  Buckling Applied Load Ratio =',num2str(LGv),' (Buckling)']) 
      elseif isequal(crLTB,2)
         set(pt_title_name,'String',['Inelastic Nonlinear Buckling Analysis Results (Modified Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1)),' (TFY)',...
            '.  Buckling Applied Load Ratio =',num2str(LGv),' (Buckling)']) 
      elseif isequal(crLTB,3)
         set(pt_title_name,'String',['Inelastic Nonlinear Buckling Analysis Results (Modified Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1)),' (CFY)',...
            '.  Buckling Applied Load Ratio =',num2str(LGv),' (Buckling)']) 
      else
         set(pt_title_name,'String',['Inelastic Nonlinear Buckling Analysis Results (Modified Strength Eqs.).  Applied Load Ratio = ',num2str(gammma(1,1))]) 
      end
      set(pt_title_name,'Visible','on') 
   end
   if isequal(HomoType,0)
      switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
         case 'da_on'
            set(ri_infor_text,'String','Homogeneous Member(s). DM Stiffness is applied')      
            set(ri_infor_text,'Visible','on')       
         case 'da_off'
            set(ri_infor_text,'String','Homogeneous Member(s). DM Stiffness is not applied')      
            set(ri_infor_text,'Visible','on')             
      end
   elseif isequal(HomoType,1)
      switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
         case 'da_on'
            set(ri_infor_text,'String','Hybrid Member(s). DM Stiffness is applied')      
            set(ri_infor_text,'Visible','on')       
         case 'da_off'
            set(ri_infor_text,'String','Hybrid Member(s). DM Stiffness is not applied')      
            set(ri_infor_text,'Visible','on')             
      end      
   end
elseif isequal(ANI,4)
   UC = round(UC*10^6)/10^6;
   [max_UCrow, indexrow]=max(UC);
   [max_UC, UCcol]=max(max_UCrow);    
   if isequal(NLIAType,0)
      if max_UC >= 0.9999
         max_UC = round(max_UC*10^3)/10^3;
         if isequal(crLTB,1)         
            set(pt_title_name,'String',['Inelastic Nonlinear Buckling Check (Current Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),' (FLB), Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Cannot Support the Specified Load.'])
            set(pt_title_name,'Visible','on')     
         elseif isequal(crLTB,2)         
            set(pt_title_name,'String',['Inelastic Nonlinear Buckling Check (Current Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),' (TFY), Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Cannot Support the Specified Load.'])
            set(pt_title_name,'Visible','on')  
         elseif isequal(crLTB,3)         
            set(pt_title_name,'String',['Inelastic Nonlinear Buckling Check (Current Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),' (CFY), Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Cannot Support the Specified Load.'])
            set(pt_title_name,'Visible','on')
         else         
            set(pt_title_name,'String',['Inelastic Nonlinear Buckling Check (Current Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),', Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Cannot Support the Specified Load.'])
            set(pt_title_name,'Visible','on')
         end
      else 
%         if isequal(crLTB,1)  
%           set(pt_title_name,'String',['Inelastic Nonlinear Buckling Check (Current Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),' (FLB), Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Can Support the Specified Load.'])   
%           set(pt_title_name,'Visible','on')
%         elseif isequal(crLTB,2)  
%           set(pt_title_name,'String',['Inelastic Nonlinear Buckling Check (Current Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),' (TFY), Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Can Support the Specified Load.'])   
%           set(pt_title_name,'Visible','on')  
%         elseif isequal(crLTB,3)  
%           set(pt_title_name,'String',['Inelastic Nonlinear Buckling Check (Current Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),' (CFY), Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Can Support the Specified Load.'])   
%           set(pt_title_name,'Visible','on') 
%         else  
          set(pt_title_name,'String',['Inelastic Nonlinear Buckling Check (Current Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),', Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Can Support the Specified Load.'])   
          set(pt_title_name,'Visible','on') 
%         end
      end     
   elseif isequal(NLIAType,1)
      if max_UC >= 0.9999
         max_UC = round(max_UC*10^3)/10^3;
         if isequal(crLTB,1) 
            set(pt_title_name,'String',['Inelastic Nonlinear Buckling Check (Modified Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),' (FLB), Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Cannot Support the Specified Load.'])
            set(pt_title_name,'Visible','on')    
         elseif isequal(crLTB,2) 
            set(pt_title_name,'String',['Inelastic Nonlinear Buckling Check (Modified Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),' (TFY), Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Cannot Support the Specified Load.'])
            set(pt_title_name,'Visible','on')
         elseif isequal(crLTB,3) 
            set(pt_title_name,'String',['Inelastic Nonlinear Buckling Check (Modified Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),' (CFY), Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Cannot Support the Specified Load.'])
            set(pt_title_name,'Visible','on')
         else 
            set(pt_title_name,'String',['Inelastic Nonlinear Buckling Check (Modified Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),', Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Cannot Support the Specified Load.'])
            set(pt_title_name,'Visible','on')
         end
      else 
%          if isequal(crLTB,1) 
%              set(pt_title_name,'String',['Inelastic Nonlinear Buckling Check (Modified Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),' (FLB), Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Can Support the Specified Load.'])   
%              set(pt_title_name,'Visible','on')
%          elseif isequal(crLTB,2) 
%              set(pt_title_name,'String',['Inelastic Nonlinear Buckling Check (Modified Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),' (TFY), Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Can Support the Specified Load.'])   
%              set(pt_title_name,'Visible','on')   
%          elseif isequal(crLTB,3) 
%              set(pt_title_name,'String',['Inelastic Nonlinear Buckling Check (Modified Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),' (CFY), Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Can Support the Specified Load.'])   
%              set(pt_title_name,'Visible','on')  
%          else 
             set(pt_title_name,'String',['Inelastic Nonlinear Buckling Check (Modified Strength Eqs.), Eigenvalue = ',num2str(gammma(1,1)),', Maximum Cross-Section Unity Check = ',num2str(max_UC),'. The Structure Can Support the Specified Load.'])   
             set(pt_title_name,'Visible','on')  
%          end
      end        
   end    
   if isequal(HomoType,0)
      switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
         case 'da_on'
            set(ri_infor_text,'String','Homogeneous Member(s). DM Stiffness is applied')      
            set(ri_infor_text,'Visible','on')       
         case 'da_off'
            set(ri_infor_text,'String','Homogeneous Member(s). DM Stiffness is not applied')      
            set(ri_infor_text,'Visible','on')             
      end
   elseif isequal(HomoType,1)
      switch get(get(ap_da_buttongroup,'SelectedObject'),'Tag')  
         case 'da_on'
            set(ri_infor_text,'String','Hybrid Member(s). DM Stiffness is applied')      
            set(ri_infor_text,'Visible','on')       
         case 'da_off'
            set(ri_infor_text,'String','Hybrid Member(s). DM Stiffness is not applied')      
            set(ri_infor_text,'Visible','on')             
      end      
   end   
else
   set(pt_title_name,'Visible','off') 
end


