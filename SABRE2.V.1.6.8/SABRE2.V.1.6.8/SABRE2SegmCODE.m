function [BNodevalue]=SABRE2SegmCODE(JNodevalue,Massemble,...
   JNodevalue_i,JNodevalue_j,BNodevalue,pdb_coordx_edit,pdb_coordy_edit,pdb_coordz_edit,pdb_step_edit,seglength)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
% ************************************************************************
% *********              Reordering Segment nodes         ****************
% ************************************************************************
% fprintf('segment code massemble')
% Massemble
% fprintf('segm code bnode = ')
% BNodevalue
if isempty(JNodevalue)||isempty(Massemble)||isempty(BNodevalue) ...
      || isempty(JNodevalue_i) || isempty(JNodevalue_j)
   mem =[];
else
   mem=length(Massemble(:,1));
   
   % *********************************************************** Sorting S 
   L0 = BNodevalue; % Initial data Set
   % Distance from i node
   for i = 1:mem
      if ~isequal(max(BNodevalue(i,:,2)),0) % No Bracing
         for j = 1:max(BNodevalue(i,:,2))
            dX0(j,1) = JNodevalue_i(i,3)-BNodevalue(i,j,3);
            dY0(j,1) = JNodevalue_i(i,4)-BNodevalue(i,j,4);
            dZ0(j,1) = JNodevalue_i(i,5)-BNodevalue(i,j,5);           
            L0(i,j,16) = sqrt( ( dX0(j,1) )^2 +( dY0(j,1) )^2+( dZ0(j,1) )^2  ) ;
         end
      end
   end  
%    L0
   
   % Sort whole columns with respect to distance from i node
   L1=[];BNodevalueOrder=[];

   for i = 1:mem    
      if isequal(max(BNodevalue(i,:,2)),0) % No Bracing
%          for n=1:max(BNodevalue(:,:,2))
            BNodevalueOrder(i,1,1) = L0(i,1,1);
            BNodevalueOrder(i,1,2) = L0(i,1,2);
%          end
      else
         for j = 1:max(BNodevalue(i,:,2))
            L1(j,:) =  L0(i,j,:);   
%             L1(j,:)
%             L0(i,j,:)
         end
         L1 = sortrows(L1,16);         
         for j = 1:max(BNodevalue(i,:,2))
            for k = 1:16
               BNodevalueOrder(i,j,k) = L1(j,k);
            end  
         end        
         L1(:,:)=[];
      end
   end
   % Reset BNodevalue Using Sorted BNodevalueOrder
   BNodeval=BNodevalueOrder;
%    L1
   
   % *********************************************************** Sorting E 
  
% ------------------------------------------------------------------------   
% ----------------            Steped elements           ------------------ 
% ------------------------------------------------------------------------ 
   % *** Global frame angle for each element without considering shear center
   alpharef = zeros(length(Massemble(:,1)),2);    
   for i=1:length(Massemble(:,1))
       opp = JNodevalue_j(i,4)-JNodevalue_i(i,4); % element depth in y-dir
       adj = JNodevalue_j(i,3)-JNodevalue_i(i,3); % element length in x-dir         
       alpharef(i,1)=i;
       alpharef(i,2)=atan2(opp,adj);   % Only global frame angle
   end 
   
%     fprintf('\nBNodevalue before ifs')
%     BNodevalue
%     fprintf('BNodeval before ifs')
%     BNodeval
% ------------------------------------------------------------------------   
% ----------------      Add   Steped elements           ------------------ 
% ------------------------------------------------------------------------ 
   for i = 1:mem
       fprintf('\nifs for 1')
%        fprintf('\nBNodevalue before ifs')
%        BNodevalue
       
      if ~isequal(max(BNodeval(i,:,2)),0) % No Bracing  
          fprintf('\nifs if # 1')
         p=1;
         for j = 1:max(BNodeval(i,:,2))
             fprintf('\nifs for 2')
%              fprintf('\nBNodevalue before in for 2')
%              BNodevalue
%              fprintf('BNodeval before in for 2')
%              BNodeval
            if isequal(round(str2double(get(pdb_coordx_edit,'String'))*10^5)/10^5,round(BNodeval(i,j,3)*10^5)/10^5) ...
                  && isequal(round(str2double(get(pdb_coordy_edit,'String'))*10^5)/10^5,round(BNodeval(i,j,4)*10^5)/10^5) ...
                  && isequal(round(str2double(get(pdb_coordz_edit,'String'))*10^5)/10^5,round(BNodeval(i,j,5)*10^5)/10^5)  % if condition 1 - 1
               fprintf('\n# 1 - 1')
                  
               % ------------------------The first Internal Node Number S
               if isequal(j,1) % For the first internal node % if condition 2 -1
                   fprintf('\n# 2 - 1')
                  if isequal(1,max(BNodeval(i,:,2))) % if condition 3 -1
                      fprintf('\n# 3 - 1')   
                     if ~isequal(round(JNodevalue_i(i,6)*10^5)/10^5,round(BNodeval(i,j,6)*10^5)/10^5) ... 
                           || ~isequal(round(JNodevalue_i(i,7)*10^5)/10^5,round(BNodeval(i,j,7)*10^5)/10^5) ...
                           || ~isequal(round(JNodevalue_i(i,8)*10^5)/10^5,round(BNodeval(i,j,8)*10^5)/10^5) ...
                           || ~isequal(round(JNodevalue_i(i,9)*10^5)/10^5,round(BNodeval(i,j,9)*10^5)/10^5) ...
                           || ~isequal(round(JNodevalue_i(i,11)*10^5)/10^5,round(BNodeval(i,j,11)*10^5)/10^5) % if condition 4 - 1
                       fprintf('\n# 4 - 1') 
                       % --------------- Calculation the difference of SC S   
                        % Section properties at each element under natural frame
                        bfb1=JNodevalue_i(i,6);bfb2=BNodeval(i,j,6);  % Bottom flange width
                        tfb1=JNodevalue_i(i,7);tfb2=BNodeval(i,j,7);  % Bottom flange thickness
                        bft1=JNodevalue_i(i,8);bft2=BNodeval(i,j,8);  % Top flange width
                        tft1=JNodevalue_i(i,9);tft2=BNodeval(i,j,9);  % Top flange thickness
                        Dg1=JNodevalue_i(i,10);Dg2=BNodeval(i,j,10);  % dw:Web depth (y-dir)
                        tw1=JNodevalue_i(i,11);tw2=BNodeval(i,j,11);  % dw:Web depth (y-dir)
                        hg1=JNodevalue_i(i,13);hg2=BNodeval(i,j,13);  % h : Distance between flange centroids

                        % Shear center
                        % Start node
                        % bottom flange centroid to shear center
                        hsb1 = (tft1.*bft1.^3.*hg1)./(tfb1.*bfb1.^3+tft1.*bft1.^3); 
                        Dsb1 = hsb1 - tfb1/2; % bottom of Web depth to shear center
                        hst1 = hg1 - hsb1;    % top flange centroid to shear center
                        Dst1 = hst1 - tft1/2;    % top of Web depth to shear center
                        % End node
                        % bottom flange centroid to shear center
                        hsb2 = (tft2.*bft2.^3.*hg2)./(tfb2.*bfb2.^3+tft2.*bft2.^3); 
                        Dsb2 = hsb2 - tfb2/2; % bottom of Web depth to shear center
                        hst2 = hg2 - hsb2;    % top flange centroid to shear center
                        Dst2 = hst2 - tft2/2;    % top of Web depth to shear center               
                        ys1=Dg1/2 - Dst1; ys2=Dg2/2 - Dst2;    % Shear center  
                        
                        s = abs(ys1-ys2); % Difference in shear center  
                        s = max(s, ( max( max(bfb1,bft1),max(bfb2,bft2) ) )/10 );
                        Af1= bfb1*tfb1+bft1*tft1+tw1;
                        Af2= bfb2*tfb2+bft2*tft2+tw2;
                        L = sqrt( (JNodevalue_j(i,3)-JNodevalue_i(i,3))^2 ...
                           + (JNodevalue_j(i,4)-JNodevalue_i(i,4))^2 + (JNodevalue_j(i,5)-JNodevalue_i(i,5))^2 );                         
                        % --------------- Calculation the difference of SC E
%                         fprintf('\nBNodevalue before in 5 - 1')
%                         BNodevalue
%                         fprintf('BNodeval before in 5 - 1')
%                         BNodeval
                        get(pdb_step_edit,'Value')
                        if isequal(get(pdb_step_edit,'Value'),1) % No step    % if condition 5 - 1 
                            fprintf('\n# 5 - 1')
                           % original element              
                           BNodevalue(i,p,1)=BNodeval(i,j,1);
                           BNodevalue(i,p,2)=p;
                           BNodevalue(i,p,3)=BNodeval(i,j,3);
                           BNodevalue(i,p,4)=BNodeval(i,j,4);
                           BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                           BNodevalue(i,p,6)=BNodeval(i,j,6);
                           BNodevalue(i,p,7)=BNodeval(i,j,7);
                           BNodevalue(i,p,8)=BNodeval(i,j,8);
                           BNodevalue(i,p,9)=BNodeval(i,j,9);
                           BNodevalue(i,p,10)=BNodeval(i,j,10);                  
                           BNodevalue(i,p,11)=BNodeval(i,j,11);
                           BNodevalue(i,p,12)=BNodeval(i,j,12);
                           BNodevalue(i,p,13)=BNodeval(i,j,13);
                           BNodevalue(i,p,14)=BNodeval(i,j,14);                            
                           BNodevalue(i,p,15)=1;
                           BNodevalue(i,p,16)=BNodeval(i,j,15); 
                           p=p+1;
                           
                        elseif isequal(get(pdb_step_edit,'Value'),2) % left step      % if condition 5 - 2  
                            fprintf('\n# 5 - 2')


                           if (BNodeval(i,j,16)/2 > s ) && (Af1 >= Af2) % if condition 6 - 1
                               fprintf('\n# 6 - 1')
                              % Linear interpolation
                              segLoc = [0, BNodeval(i,j,16)];
                              segLocstep = [0, BNodeval(i,j,16)-s, BNodeval(i,j,16)];                               
                              Dgs=[JNodevalue_i(i,10),BNodeval(i,j,10)];
                              dts=[JNodevalue_i(i,12),BNodeval(i,j,12)];
                              hgs=[JNodevalue_i(i,13),BNodeval(i,j,13)];
                              Afills=[JNodevalue_i(i,14),BNodeval(i,j,14)];                              
                              Dgsb=interp1(segLoc,Dgs,segLocstep);
                              dtsb=interp1(segLoc,dts,segLocstep);
                              hgsb=interp1(segLoc,hgs,segLocstep);
                              Afillsb=interp1(segLoc,Afills,segLocstep);
                              
                              % original element                
                              BNodevalue(i,p,1)=BNodeval(i,j,1);
                              BNodevalue(i,p,2)=p;
                              BNodevalue(i,p,3)=BNodeval(i,j,3);
                              BNodevalue(i,p,4)=BNodeval(i,j,4);
                              BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                              BNodevalue(i,p,6)=BNodeval(i,j,6);
                              BNodevalue(i,p,7)=BNodeval(i,j,7);
                              BNodevalue(i,p,8)=BNodeval(i,j,8);
                              BNodevalue(i,p,9)=BNodeval(i,j,9);
                              BNodevalue(i,p,10)=BNodeval(i,j,10);                  
                              BNodevalue(i,p,11)=BNodeval(i,j,11);
                              BNodevalue(i,p,12)=BNodeval(i,j,12);
                              BNodevalue(i,p,13)=BNodeval(i,j,13);
                              BNodevalue(i,p,14)=BNodeval(i,j,14);
                              BNodevalue(i,p,15)=1;
                              BNodevalue(i,p,16)=BNodeval(i,j,16); 
                              p=p+1;                            
                              % add step element
                              % Rotation
                              Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
                                 sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
                                 0 0 1];                           
                              Lb2 =[BNodeval(i,j,16)-s;0;0];
                              Lb2 = Rz*Lb2+[JNodevalue_i(i,3);JNodevalue_i(i,4);JNodevalue_i(i,5)]; 
%                               Lb2
%                               Dgsb
%                               dtsb
%                               hgsb
%                               Afillsb
                              i
                              j
                              p
                              BNodevalue(i,p,1)=BNodeval(i,j,1);
                              BNodevalue(i,p,2)=p;
                              BNodevalue(i,p,3)=Lb2(1,1);
                              BNodevalue(i,p,4)=Lb2(2,1);
                              BNodevalue(i,p,5)=Lb2(3,1);                 
                              BNodevalue(i,p,6)=JNodevalue_i(i,6);
                              BNodevalue(i,p,7)=JNodevalue_i(i,7);
                              BNodevalue(i,p,8)=JNodevalue_i(i,8);
                              BNodevalue(i,p,9)=JNodevalue_i(i,9);
                              BNodevalue(i,p,10)=Dgsb(1,2);                
                              BNodevalue(i,p,11)=JNodevalue_i(i,11);
                              BNodevalue(i,p,12)=dtsb(1,2);
                              BNodevalue(i,p,13)=hgsb(1,2);
                              BNodevalue(i,p,14)=Afillsb(1,2);         
                              BNodevalue(i,p,15)=2;
                              BNodevalue(i,p,16)=BNodeval(i,j,16)-s;
                              p=p+1;
                              fprintf('\nBNodevalue after in 6 - 1')
                              BNodevalue
                              fprintf('BNodeval after in 6 - 1')
                              BNodeval
                           elseif (BNodeval(i,j,16)/2 > s ) && (Af1 < Af2)  % if condition 6 - 2 
                               fprintf('\n# 6 - 2')
                              % Linear interpolation
                              %-----
                              segLoc = [BNodeval(i,j,16), L];
                              segLocstep = [BNodeval(i,j,16), BNodeval(i,j,16)+s, L];                               
                              Dgs=[BNodeval(i,j,10),JNodevalue_j(i,10)];
                              dts=[BNodeval(i,j,12),JNodevalue_j(i,12)];
                              hgs=[BNodeval(i,j,13),JNodevalue_j(i,13)];
                              Afills=[BNodeval(i,j,14),JNodevalue_j(i,14)];                              
                              Dgsb=interp1(segLoc,Dgs,segLocstep);
                              dtsb=interp1(segLoc,dts,segLocstep);
                              hgsb=interp1(segLoc,hgs,segLocstep);
                              Afillsb=interp1(segLoc,Afills,segLocstep);
                              %-------
                              
                              % original element                
                              BNodevalue(i,p,1)=BNodeval(i,j,1);
                              BNodevalue(i,p,2)=p;
                              BNodevalue(i,p,3)=BNodeval(i,j,3);
                              BNodevalue(i,p,4)=BNodeval(i,j,4);
                              BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                              BNodevalue(i,p,6)=JNodevalue_i(i,6);
                              BNodevalue(i,p,7)=JNodevalue_i(i,7);
                              BNodevalue(i,p,8)=JNodevalue_i(i,8);
                              BNodevalue(i,p,9)=JNodevalue_i(i,9);
                              BNodevalue(i,p,10)=BNodeval(i,j,10);                
                              BNodevalue(i,p,11)=JNodevalue_i(i,11);
                              BNodevalue(i,p,12)=BNodeval(i,j,12);
                              BNodevalue(i,p,13)=BNodeval(i,j,13);
                              BNodevalue(i,p,14)=BNodeval(i,j,14);   
                              BNodevalue(i,p,15)=1;
                              BNodevalue(i,p,16)=BNodeval(i,j,16); 
                              p=p+1;                               
                              % add step element
                              % Rotation
                              Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
                                 sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
                                 0 0 1];                           
                              Lb2 =[BNodeval(i,j,16)+s;0;0];
                              Lb2 = Rz*Lb2+[JNodevalue_i(i,3);JNodevalue_i(i,4);JNodevalue_i(i,5)]; 
                              BNodevalue(i,p,1)=BNodeval(i,j,1);
                              BNodevalue(i,p,2)=p;
                              BNodevalue(i,p,3)=Lb2(1,1);
                              BNodevalue(i,p,4)=Lb2(2,1);
                              BNodevalue(i,p,5)=Lb2(3,1);                 
                              BNodevalue(i,p,6)=BNodeval(i,j,6);
                              BNodevalue(i,p,7)=BNodeval(i,j,7);
                              BNodevalue(i,p,8)=BNodeval(i,j,8);
                              BNodevalue(i,p,9)=BNodeval(i,j,9);
                              BNodevalue(i,p,10)=Dgsb(1,2);
                              BNodevalue(i,p,11)=BNodeval(i,j,11);
                              BNodevalue(i,p,12)=dtsb(1,2);
                              BNodevalue(i,p,13)=hgsb(1,2);
                              BNodevalue(i,p,14)=Afillsb(1,2);        
                              BNodevalue(i,p,15)=2;
                              BNodevalue(i,p,16)=BNodeval(i,j,16)+s;
                              p=p+1;
%                               fprintf('\nBNodevalue after in 6 - 2')
%                               BNodevalue
%                               fprintf('BNodeval after in 6 - 2')
%                               BNodeval
                                                           
                           end % (BNodeval(i,j,16) > 2*s )                                                 
                        end % isequal(get(pdb_step_edit,'Value'),1) % No step
                        
                     elseif ~isequal(round(JNodevalue_j(i,6)*10^5)/10^5,round(BNodeval(i,j,6)*10^5)/10^5) ... 
                           || ~isequal(round(JNodevalue_j(i,7)*10^5)/10^5,round(BNodeval(i,j,7)*10^5)/10^5) ...
                           || ~isequal(round(JNodevalue_j(i,8)*10^5)/10^5,round(BNodeval(i,j,8)*10^5)/10^5) ...
                           || ~isequal(round(JNodevalue_j(i,9)*10^5)/10^5,round(BNodeval(i,j,9)*10^5)/10^5) ...
                           || ~isequal(round(JNodevalue_j(i,11)*10^5)/10^5,round(BNodeval(i,j,11)*10^5)/10^5) % if condition 4 - 2 
                        fprintf('\n# 4 - 2')
                        
                       % --------------- Calculation the difference of SC S   
                        % Section properties at each element under natural frame
                        bfb2=JNodevalue_j(i,6);bfb1=BNodeval(i,j,6);  % Bottom flange width
                        tfb2=JNodevalue_j(i,7);tfb1=BNodeval(i,j,7);  % Bottom flange thickness
                        bft2=JNodevalue_j(i,8);bft1=BNodeval(i,j,8);  % Top flange width
                        tft2=JNodevalue_j(i,9);tft1=BNodeval(i,j,9);  % Top flange thickness
                        Dg2=JNodevalue_j(i,10);Dg1=BNodeval(i,j,10);  % dw:Web depth (y-dir)
                        tw2=JNodevalue_j(i,11);tw1=BNodeval(i,j,11);  % dw:Web depth (y-dir)
                        hg2=JNodevalue_j(i,13);hg1=BNodeval(i,j,13);  % h : Distance between flange centroids

                        % Shear center
                        % Start node
                        % bottom flange centroid to shear center
                        hsb1 = (tft1.*bft1.^3.*hg1)./(tfb1.*bfb1.^3+tft1.*bft1.^3); 
                        Dsb1 = hsb1 - tfb1/2; % bottom of Web depth to shear center
                        hst1 = hg1 - hsb1;    % top flange centroid to shear center
                        Dst1 = hst1 - tft1/2;    % top of Web depth to shear center
                        % End node
                        % bottom flange centroid to shear center
                        hsb2 = (tft2.*bft2.^3.*hg2)./(tfb2.*bfb2.^3+tft2.*bft2.^3); 
                        Dsb2 = hsb2 - tfb2/2; % bottom of Web depth to shear center
                        hst2 = hg2 - hsb2;    % top flange centroid to shear center
                        Dst2 = hst2 - tft2/2;    % top of Web depth to shear center               
                        ys1=Dg1/2 - Dst1; ys2=Dg2/2 - Dst2;    % Shear center  
                        
                        s = abs(ys1-ys2); % Difference in shear center  
                        s = max(s, ( max( max(bfb1,bft1),max(bfb2,bft2) ) )/10 );
                        Af1= bfb1*tfb1+bft1*tft1+tw1;
                        Af2= bfb2*tfb2+bft2*tft2+tw2;
                        
                        L = sqrt( (JNodevalue_j(i,3)-JNodevalue_i(i,3))^2 ...
                           + (JNodevalue_j(i,4)-JNodevalue_i(i,4))^2 + (JNodevalue_j(i,5)-JNodevalue_i(i,5))^2 ); 
                        % --------------- Calculation the difference of SC E   

                        if isequal(get(pdb_step_edit,'Value'),1) % No step      % if condition 7 - 1   
                            fprintf('\n# 7 - 1')
                           % original element              
                           BNodevalue(i,p,1)=BNodeval(i,j,1);
                           BNodevalue(i,p,2)=p;
                           BNodevalue(i,p,3)=BNodeval(i,j,3);
                           BNodevalue(i,p,4)=BNodeval(i,j,4);
                           BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                           BNodevalue(i,p,6)=BNodeval(i,j,6);
                           BNodevalue(i,p,7)=BNodeval(i,j,7);
                           BNodevalue(i,p,8)=BNodeval(i,j,8);
                           BNodevalue(i,p,9)=BNodeval(i,j,9);
                           BNodevalue(i,p,10)=BNodeval(i,j,10);                  
                           BNodevalue(i,p,11)=BNodeval(i,j,11);
                           BNodevalue(i,p,12)=BNodeval(i,j,12);
                           BNodevalue(i,p,13)=BNodeval(i,j,13);
                           BNodevalue(i,p,14)=BNodeval(i,j,14);                            
                           BNodevalue(i,p,15)=1;
                           BNodevalue(i,p,16)=BNodeval(i,j,15); 
                           p=p+1;
                           
                        elseif isequal(get(pdb_step_edit,'Value'),2) % left step   % if condition 7 - 2
                            fprintf('\n# 7 - 2')
                           if ( abs(L-BNodeval(i,j,16))/2 > s ) && ( Af1 < Af2 )    % if condition 8 - 1
                               fprintf('\n# 8 - 1')
                              % Linear interpolation
                              segLoc = [BNodeval(i,j,16), L];
                              segLocstep = [BNodeval(i,j,16), BNodeval(i,j,16)+s, L];                               
                              Dgs=[BNodeval(i,j,10),JNodevalue_j(i,10)];
                              dts=[BNodeval(i,j,12),JNodevalue_j(i,12)];
                              hgs=[BNodeval(i,j,13),JNodevalue_j(i,13)];
                              Afills=[BNodeval(i,j,14),JNodevalue_j(i,14)];                              
                              Dgsb=interp1(segLoc,Dgs,segLocstep);
                              dtsb=interp1(segLoc,dts,segLocstep);
                              hgsb=interp1(segLoc,hgs,segLocstep);
                              Afillsb=interp1(segLoc,Afills,segLocstep);
                              
                              % original element                
                              BNodevalue(i,p,1)=BNodeval(i,j,1);
                              BNodevalue(i,p,2)=p;
                              BNodevalue(i,p,3)=BNodeval(i,j,3);
                              BNodevalue(i,p,4)=BNodeval(i,j,4);
                              BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                              BNodevalue(i,p,6)=BNodeval(i,j,6);
                              BNodevalue(i,p,7)=BNodeval(i,j,7);
                              BNodevalue(i,p,8)=BNodeval(i,j,8);
                              BNodevalue(i,p,9)=BNodeval(i,j,9);
                              BNodevalue(i,p,10)=BNodeval(i,j,10);                  
                              BNodevalue(i,p,11)=BNodeval(i,j,11);
                              BNodevalue(i,p,12)=BNodeval(i,j,12);
                              BNodevalue(i,p,13)=BNodeval(i,j,13);
                              BNodevalue(i,p,14)=BNodeval(i,j,14);
                              BNodevalue(i,p,15)=1;
                              BNodevalue(i,p,16)=BNodeval(i,j,16); 
                              p=p+1;                              
                              % add step element
                              % Rotation
                              Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
                                 sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
                                 0 0 1];                           
                              Lb2 =[BNodeval(i,j,16)+s;0;0];
                              Lb2 = Rz*Lb2+[JNodevalue_i(i,3);JNodevalue_i(i,4);JNodevalue_i(i,5)]; 
                              BNodevalue(i,p,1)=BNodeval(i,j,1);
                              BNodevalue(i,p,2)=p;
                              BNodevalue(i,p,3)=Lb2(1,1);
                              BNodevalue(i,p,4)=Lb2(2,1);
                              BNodevalue(i,p,5)=Lb2(3,1);                 
                              BNodevalue(i,p,6)=JNodevalue_j(i,6);
                              BNodevalue(i,p,7)=JNodevalue_j(i,7);
                              BNodevalue(i,p,8)=JNodevalue_j(i,8);
                              BNodevalue(i,p,9)=JNodevalue_j(i,9);
                              BNodevalue(i,p,10)=Dgsb(1,2);               
                              BNodevalue(i,p,11)=JNodevalue_j(i,11);
                              BNodevalue(i,p,12)=dtsb(1,2);
                              BNodevalue(i,p,13)=hgsb(1,2);
                              BNodevalue(i,p,14)=Afillsb(1,2);        
                              BNodevalue(i,p,15)=2;
                              BNodevalue(i,p,16)=BNodeval(i,j,16)+s;
                              p=p+1; 
                              
                           elseif ( abs(L-BNodeval(i,j,16))/2 > s ) && ( Af1 >= Af2 ) % if condition 8 - 2 
                               fprintf('\n# 8 - 2')
                              % Linear interpolation
                              %--------------------
                              segLoc = [0, BNodeval(i,j,16)];
                              segLocstep = [0, BNodeval(i,j,16)-s, BNodeval(i,j,16)];                               
                              Dgs=[JNodevalue_i(i,10),BNodeval(i,j,10)];
                              dts=[JNodevalue_i(i,12),BNodeval(i,j,12)];
                              hgs=[JNodevalue_i(i,13),BNodeval(i,j,13)];
                              Afills=[JNodevalue_i(i,14),BNodeval(i,j,14)];                              
                              Dgsb=interp1(segLoc,Dgs,segLocstep);
                              dtsb=interp1(segLoc,dts,segLocstep);
                              hgsb=interp1(segLoc,hgs,segLocstep);
                              Afillsb=interp1(segLoc,Afills,segLocstep);
                              %----------------------
                              
                              % original element                
                              BNodevalue(i,p,1)=BNodeval(i,j,1);
                              BNodevalue(i,p,2)=p;
                              BNodevalue(i,p,3)=BNodeval(i,j,3);
                              BNodevalue(i,p,4)=BNodeval(i,j,4);
                              BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                              BNodevalue(i,p,6)=JNodevalue_j(i,6);
                              BNodevalue(i,p,7)=JNodevalue_j(i,7);
                              BNodevalue(i,p,8)=JNodevalue_j(i,8);
                              BNodevalue(i,p,9)=JNodevalue_j(i,9);
                              BNodevalue(i,p,10)=BNodeval(i,j,10);                 
                              BNodevalue(i,p,11)=JNodevalue_j(i,11);
                              BNodevalue(i,p,12)=BNodeval(i,j,12);
                              BNodevalue(i,p,13)=BNodeval(i,j,13);
                              BNodevalue(i,p,14)=BNodeval(i,j,14);    
                              BNodevalue(i,p,15)=1;
                              BNodevalue(i,p,16)=BNodeval(i,j,16); 
                              p=p+1;                              
                              % add step element
                              % Rotation
                              Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
                                 sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
                                 0 0 1];                           
                              Lb2 =[BNodeval(i,j,16)-s;0;0];
                              Lb2 = Rz*Lb2+[JNodevalue_i(i,3);JNodevalue_i(i,4);JNodevalue_i(i,5)]; 
                              BNodevalue(i,p,1)=BNodeval(i,j,1);
                              BNodevalue(i,p,2)=p;
                              BNodevalue(i,p,3)=Lb2(1,1);
                              BNodevalue(i,p,4)=Lb2(2,1);
                              BNodevalue(i,p,5)=Lb2(3,1);                 
                              BNodevalue(i,p,6)=BNodeval(i,j,6);
                              BNodevalue(i,p,7)=BNodeval(i,j,7);
                              BNodevalue(i,p,8)=BNodeval(i,j,8);
                              BNodevalue(i,p,9)=BNodeval(i,j,9);
                              BNodevalue(i,p,10)=Dgsb(1,2);
                              BNodevalue(i,p,11)=BNodeval(i,j,11);
                              BNodevalue(i,p,12)=dtsb(1,2);
                              BNodevalue(i,p,13)=hgsb(1,2);
                              BNodevalue(i,p,14)=Afillsb(1,2); 
                              BNodevalue(i,p,15)=2;
                              BNodevalue(i,p,16)=BNodeval(i,j,16)-s;
                              p=p+1; 
                                                           
                           end % (BNodeval(i,j,16) > 2*s )                                                 
                        end % isequal(get(pdb_step_edit,'Value'),1) % No step

                     else % if condition 4 - 3
                         fprintf('\n# 4 - 3')
                        % original element                
                        BNodevalue(i,p,1)=BNodeval(i,j,1);
                        BNodevalue(i,p,2)=p;
                        BNodevalue(i,p,3)=BNodeval(i,j,3);
                        BNodevalue(i,p,4)=BNodeval(i,j,4);
                        BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                        BNodevalue(i,p,6)=BNodeval(i,j,6);
                        BNodevalue(i,p,7)=BNodeval(i,j,7);
                        BNodevalue(i,p,8)=BNodeval(i,j,8);
                        BNodevalue(i,p,9)=BNodeval(i,j,9);
                        BNodevalue(i,p,10)=BNodeval(i,j,10);                  
                        BNodevalue(i,p,11)=BNodeval(i,j,11);
                        BNodevalue(i,p,12)=BNodeval(i,j,12);
                        BNodevalue(i,p,13)=BNodeval(i,j,13);
                        BNodevalue(i,p,14)=BNodeval(i,j,14);
                        BNodevalue(i,p,15)=1;
                        BNodevalue(i,p,16)=BNodeval(i,j,16); 
                        p=p+1;
                        
                     end % isequal(1,max(BNodeval(i,:,2)))
  
                  else % ------------------------ ~max(BNodeval)=1   % if condition 3 - 2
                      fprintf('\n# 3 - 2')
                       
                     if ~isequal(round(JNodevalue_i(i,6)*10^5)/10^5,round(BNodeval(i,j,6)*10^5)/10^5) ... 
                           || ~isequal(round(JNodevalue_i(i,7)*10^5)/10^5,round(BNodeval(i,j,7)*10^5)/10^5) ...
                           || ~isequal(round(JNodevalue_i(i,8)*10^5)/10^5,round(BNodeval(i,j,8)*10^5)/10^5) ...
                           || ~isequal(round(JNodevalue_i(i,9)*10^5)/10^5,round(BNodeval(i,j,9)*10^5)/10^5) ...
                           || ~isequal(round(JNodevalue_i(i,11)*10^5)/10^5,round(BNodeval(i,j,11)*10^5)/10^5) % if condition 9 - 1
                       fprintf('\n# 9 - 1')
                        % --------------- Calculation the difference of SC S   
                        % Section properties at each element under natural frame
                        bfb1=JNodevalue_i(i,6);bfb2=BNodeval(i,j,6);  % Bottom flange width
                        tfb1=JNodevalue_i(i,7);tfb2=BNodeval(i,j,7);  % Bottom flange thickness
                        bft1=JNodevalue_i(i,8);bft2=BNodeval(i,j,8);  % Top flange width
                        tft1=JNodevalue_i(i,9);tft2=BNodeval(i,j,9);  % Top flange thickness
                        Dg1=JNodevalue_i(i,10);Dg2=BNodeval(i,j,10);  % dw:Web depth (y-dir)
                        tw1=JNodevalue_i(i,11);tw2=BNodeval(i,j,11);  % dw:Web depth (y-dir)
                        hg1=JNodevalue_i(i,13);hg2=BNodeval(i,j,13);  % h : Distance between flange centroids

                        % Shear center
                        % Start node
                        % bottom flange centroid to shear center
                        hsb1 = (tft1.*bft1.^3.*hg1)./(tfb1.*bfb1.^3+tft1.*bft1.^3); 
                        Dsb1 = hsb1 - tfb1/2; % bottom of Web depth to shear center
                        hst1 = hg1 - hsb1;    % top flange centroid to shear center
                        Dst1 = hst1 - tft1/2;    % top of Web depth to shear center
                        % End node
                        % bottom flange centroid to shear center
                        hsb2 = (tft2.*bft2.^3.*hg2)./(tfb2.*bfb2.^3+tft2.*bft2.^3); 
                        Dsb2 = hsb2 - tfb2/2; % bottom of Web depth to shear center
                        hst2 = hg2 - hsb2;    % top flange centroid to shear center
                        Dst2 = hst2 - tft2/2;    % top of Web depth to shear center               
                        ys1=Dg1/2 - Dst1; ys2=Dg2/2 - Dst2;    % Shear center  
                        
                        s = abs(ys1-ys2); % Difference in shear center  
                        s = max(s, ( max( max(bfb1,bft1),max(bfb2,bft2) ) )/10 );
                        Af1= bfb1*tfb1+bft1*tft1+tw1;
                        Af2= bfb2*tfb2+bft2*tft2+tw2;
                        % --------------- Calculation the difference of SC E   

                        if isequal(get(pdb_step_edit,'Value'),1) % No step       % if condition 10 - 1                    
                           % original element              
                           BNodevalue(i,p,1)=BNodeval(i,j,1);
                           BNodevalue(i,p,2)=p;
                           BNodevalue(i,p,3)=BNodeval(i,j,3);
                           BNodevalue(i,p,4)=BNodeval(i,j,4);
                           BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                           BNodevalue(i,p,6)=BNodeval(i,j,6);
                           BNodevalue(i,p,7)=BNodeval(i,j,7);
                           BNodevalue(i,p,8)=BNodeval(i,j,8);
                           BNodevalue(i,p,9)=BNodeval(i,j,9);
                           BNodevalue(i,p,10)=BNodeval(i,j,10);                  
                           BNodevalue(i,p,11)=BNodeval(i,j,11);
                           BNodevalue(i,p,12)=BNodeval(i,j,12);
                           BNodevalue(i,p,13)=BNodeval(i,j,13);
                           BNodevalue(i,p,14)=BNodeval(i,j,14);                            
                           BNodevalue(i,p,15)=1;
                           BNodevalue(i,p,16)=BNodeval(i,j,15); 
                           p=p+1;
                          
                        elseif isequal(get(pdb_step_edit,'Value'),2) % left step  % if condition 10 - 2 
                            fprintf('\n# 10 - 2')

                           if (BNodeval(i,j,16)/2 > s ) && (Af1 >= Af2) % if condition 11 - 1
                               fprintf('\n# 11 - 1')
                              % Linear interpolation
                              segLoc = [0, BNodeval(i,j,16)];
                              segLocstep = [0, BNodeval(i,j,16)-s, BNodeval(i,j,16)];                               
                              Dgs=[JNodevalue_i(i,10),BNodeval(i,j,10)];
                              dts=[JNodevalue_i(i,12),BNodeval(i,j,12)];
                              hgs=[JNodevalue_i(i,13),BNodeval(i,j,13)];
                              Afills=[JNodevalue_i(i,14),BNodeval(i,j,14)];                              
                              Dgsb=interp1(segLoc,Dgs,segLocstep);
                              dtsb=interp1(segLoc,dts,segLocstep);
                              hgsb=interp1(segLoc,hgs,segLocstep);
                              Afillsb=interp1(segLoc,Afills,segLocstep);
                              
                              % original element                
                              BNodevalue(i,p,1)=BNodeval(i,j,1);
                              BNodevalue(i,p,2)=p;
                              BNodevalue(i,p,3)=BNodeval(i,j,3);
                              BNodevalue(i,p,4)=BNodeval(i,j,4);
                              BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                              BNodevalue(i,p,6)=BNodeval(i,j,6);
                              BNodevalue(i,p,7)=BNodeval(i,j,7);
                              BNodevalue(i,p,8)=BNodeval(i,j,8);
                              BNodevalue(i,p,9)=BNodeval(i,j,9);
                              BNodevalue(i,p,10)=BNodeval(i,j,10);                  
                              BNodevalue(i,p,11)=BNodeval(i,j,11);
                              BNodevalue(i,p,12)=BNodeval(i,j,12);
                              BNodevalue(i,p,13)=BNodeval(i,j,13);
                              BNodevalue(i,p,14)=BNodeval(i,j,14);
                              BNodevalue(i,p,15)=1;
                              BNodevalue(i,p,16)=BNodeval(i,j,16); 
                              p=p+1;                              
                              % add step element
                              % Rotation
                              Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
                                 sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
                                 0 0 1];                           
                              Lb2 =[BNodeval(i,j,16)-s;0;0];
                              Lb2 = Rz*Lb2+[JNodevalue_i(i,3);JNodevalue_i(i,4);JNodevalue_i(i,5)]; 
                              BNodevalue(i,p,1)=BNodeval(i,j,1);
                              BNodevalue(i,p,2)=p;
                              BNodevalue(i,p,3)=Lb2(1,1);
                              BNodevalue(i,p,4)=Lb2(2,1);
                              BNodevalue(i,p,5)=Lb2(3,1);                 
                              BNodevalue(i,p,6)=JNodevalue_i(i,6);
                              BNodevalue(i,p,7)=JNodevalue_i(i,7);
                              BNodevalue(i,p,8)=JNodevalue_i(i,8);
                              BNodevalue(i,p,9)=JNodevalue_i(i,9);
                              BNodevalue(i,p,10)=Dgsb(1,2);
                              BNodevalue(i,p,11)=JNodevalue_i(i,11);
                              BNodevalue(i,p,11)=JNodevalue_i(i,11);
                              BNodevalue(i,p,12)=dtsb(1,2);
                              BNodevalue(i,p,13)=hgsb(1,2);
                              BNodevalue(i,p,14)=Afillsb(1,2);  
                              BNodevalue(i,p,15)=2;
                              BNodevalue(i,p,16)=BNodeval(i,j,16)-s;
                              p=p+1;
                             
                           elseif (BNodeval(i,j,16)/2 > s ) && (Af1 < Af2)  % if condition 11 - 2
                               fprintf('\n# 11 - 2')
                              % Linear interpolation
                              %----------------------------
                              segLoc = [BNodeval(i,j,16), BNodeval(i,j+1,16)];
                              segLocstep = [BNodeval(i,j,16), BNodeval(i,j,16)+s, BNodeval(i,j+1,16)];                              
                              Dgs=[BNodeval(i,j,10),BNodeval(i,j+1,10)];
                              dts=[BNodeval(i,j,12),BNodeval(i,j+1,12)];
                              hgs=[BNodeval(i,j,13),BNodeval(i,j+1,13)];
                              Afills=[BNodeval(i,j,14),BNodeval(i,j+1,14)];                              
                              Dgsb=interp1(segLoc,Dgs,segLocstep);
                              dtsb=interp1(segLoc,dts,segLocstep);
                              hgsb=interp1(segLoc,hgs,segLocstep);
                              Afillsb=interp1(segLoc,Afills,segLocstep);   
                              %---------------------------
                              
                              % original element                
                              BNodevalue(i,p,1)=BNodeval(i,j,1);
                              BNodevalue(i,p,2)=p;
                              BNodevalue(i,p,3)=BNodeval(i,j,3);
                              BNodevalue(i,p,4)=BNodeval(i,j,4);
                              BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                              BNodevalue(i,p,6)=JNodevalue_i(i,6);
                              BNodevalue(i,p,7)=JNodevalue_i(i,7);
                              BNodevalue(i,p,8)=JNodevalue_i(i,8);
                              BNodevalue(i,p,9)=JNodevalue_i(i,9);
                              BNodevalue(i,p,10)=BNodeval(i,j,10);                 
                              BNodevalue(i,p,11)=JNodevalue_i(i,11);
                              BNodevalue(i,p,12)=BNodeval(i,j,12);
                              BNodevalue(i,p,13)=BNodeval(i,j,13);
                              BNodevalue(i,p,14)=BNodeval(i,j,14);
                              BNodevalue(i,p,15)=1;
                              BNodevalue(i,p,16)=BNodeval(i,j,16); 
                              p=p+1;                               
                              % add step element
                              % Rotation
                              Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
                                 sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
                                 0 0 1];                           
                              Lb2 =[BNodeval(i,j,16)+s;0;0];
                              Lb2 = Rz*Lb2+[JNodevalue_i(i,3);JNodevalue_i(i,4);JNodevalue_i(i,5)]; 
                              BNodevalue(i,p,1)=BNodeval(i,j,1);
                              BNodevalue(i,p,2)=p;
                              BNodevalue(i,p,3)=Lb2(1,1);
                              BNodevalue(i,p,4)=Lb2(2,1);
                              BNodevalue(i,p,5)=Lb2(3,1);                 
                              BNodevalue(i,p,6)=BNodeval(i,j,6);
                              BNodevalue(i,p,7)=BNodeval(i,j,7);
                              BNodevalue(i,p,8)=BNodeval(i,j,8);
                              BNodevalue(i,p,9)=BNodeval(i,j,9);
                              BNodevalue(i,p,10)=Dgsb(1,2);
                              BNodevalue(i,p,11)=BNodeval(i,j,11);
                              BNodevalue(i,p,12)=dtsb(1,2);
                              BNodevalue(i,p,13)=hgsb(1,2);
                              BNodevalue(i,p,14)=Afillsb(1,2); 
                              BNodevalue(i,p,15)=2;
                              BNodevalue(i,p,16)=BNodeval(i,j,16)+s;
                              p=p+1;
                                                             
                           end % (BNodeval(i,j,16) > 2*s )                                                 
                        end % isequal(get(pdb_step_edit,'Value'),1) % No step


                     elseif ~isequal(round(BNodeval(i,j,6)*10^5)/10^5,round(BNodeval(i,j+1,6)*10^5)/10^5) ... 
                           || ~isequal(round(BNodeval(i,j,7)*10^5)/10^5,round(BNodeval(i,j+1,7)*10^5)/10^5) ...
                           || ~isequal(round(BNodeval(i,j,8)*10^5)/10^5,round(BNodeval(i,j+1,8)*10^5)/10^5) ...
                           || ~isequal(round(BNodeval(i,j,9)*10^5)/10^5,round(BNodeval(i,j+1,9)*10^5)/10^5) ...
                           || ~isequal(round(BNodeval(i,j,11)*10^5)/10^5,round(BNodeval(i,j+1,11)*10^5)/10^5) % if condition 9 - 2
                       fprintf('\n# 9 - 2')
                        % --------------- Calculation the difference of SC S   
                        % Section properties at each element under natural frame
                        bfb1=BNodeval(i,j,6);bfb2=BNodeval(i,j+1,6);  % Bottom flange width
                        tfb1=BNodeval(i,j,7);tfb2=BNodeval(i,j+1,7);  % Bottom flange thickness
                        bft1=BNodeval(i,j,8);bft2=BNodeval(i,j+1,8);  % Top flange width
                        tft1=BNodeval(i,j,9);tft2=BNodeval(i,j+1,9);  % Top flange thickness
                        Dg1=BNodeval(i,j,10);Dg2=BNodeval(i,j+1,10);  % dw:Web depth (y-dir)
                        tw1=BNodeval(i,j,11);tw2=BNodeval(i,j+1,11);  % dw:Web depth (y-dir)
                        hg1=BNodeval(i,j,13);hg2=BNodeval(i,j+1,13);  % h : Distance between flange centroids

                        % Shear center
                        % Start node
                        % bottom flange centroid to shear center
                        hsb1 = (tft1.*bft1.^3.*hg1)./(tfb1.*bfb1.^3+tft1.*bft1.^3); 
                        Dsb1 = hsb1 - tfb1/2; % bottom of Web depth to shear center
                        hst1 = hg1 - hsb1;    % top flange centroid to shear center
                        Dst1 = hst1 - tft1/2;    % top of Web depth to shear center
                        % End node
                        % bottom flange centroid to shear center
                        hsb2 = (tft2.*bft2.^3.*hg2)./(tfb2.*bfb2.^3+tft2.*bft2.^3); 
                        Dsb2 = hsb2 - tfb2/2; % bottom of Web depth to shear center
                        hst2 = hg2 - hsb2;    % top flange centroid to shear center
                        Dst2 = hst2 - tft2/2;    % top of Web depth to shear center               
                        ys1=Dg1/2 - Dst1; ys2=Dg2/2 - Dst2;    % Shear center  

                        s = abs(ys1-ys2); % Difference in shear center  
                        s = max(s, ( max( max(bfb1,bft1),max(bfb2,bft2) ) )/10 );
                        Af1= bfb1*tfb1+bft1*tft1+tw1;
                        Af2= bfb2*tfb2+bft2*tft2+tw2; 
                        % --------------- Calculation the difference of SC E   

                        if isequal(get(pdb_step_edit,'Value'),1) % No step  % if condition 12 - 1
                            fprintf('\n# 12 - 1')
                           % original element              
                           BNodevalue(i,p,1)=BNodeval(i,j,1);
                           BNodevalue(i,p,2)=p;
                           BNodevalue(i,p,3)=BNodeval(i,j,3);
                           BNodevalue(i,p,4)=BNodeval(i,j,4);
                           BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                           BNodevalue(i,p,6)=BNodeval(i,j,6);
                           BNodevalue(i,p,7)=BNodeval(i,j,7);
                           BNodevalue(i,p,8)=BNodeval(i,j,8);
                           BNodevalue(i,p,9)=BNodeval(i,j,9);
                           BNodevalue(i,p,10)=BNodeval(i,j,10);                  
                           BNodevalue(i,p,11)=BNodeval(i,j,11);
                           BNodevalue(i,p,12)=BNodeval(i,j,12);
                           BNodevalue(i,p,13)=BNodeval(i,j,13);
                           BNodevalue(i,p,14)=BNodeval(i,j,14);
                           BNodevalue(i,p,15)=1;
                           BNodevalue(i,p,16)=BNodeval(i,j,16); 
                           p=p+1;         
                          
                        elseif isequal(get(pdb_step_edit,'Value'),2) % left step % if condition 12 -2
                            fprintf('\n# 12 - 2')
                                                                        
                           if (abs(BNodeval(i,j,16)-BNodeval(i,j+1,16))/2 > s) && ( Af1 < Af2 ) % if condition 13 - 1
                               fprintf('\n# 13 - 1')
                              % Linear interpolation
                              segLoc = [BNodeval(i,j,16), BNodeval(i,j+1,16)];
                              segLocstep = [BNodeval(i,j,16), BNodeval(i,j,16)+s, BNodeval(i,j+1,16)];                              
                              Dgs=[BNodeval(i,j,10),BNodeval(i,j+1,10)];
                              dts=[BNodeval(i,j,12),BNodeval(i,j+1,12)];
                              hgs=[BNodeval(i,j,13),BNodeval(i,j+1,13)];
                              Afills=[BNodeval(i,j,14),BNodeval(i,j+1,14)];                              
                              Dgsb=interp1(segLoc,Dgs,segLocstep);
                              dtsb=interp1(segLoc,dts,segLocstep);
                              hgsb=interp1(segLoc,hgs,segLocstep);
                              Afillsb=interp1(segLoc,Afills,segLocstep);                              
                              
                              % original element              
                              BNodevalue(i,p,1)=BNodeval(i,j,1);
                              BNodevalue(i,p,2)=p;
                              BNodevalue(i,p,3)=BNodeval(i,j,3);
                              BNodevalue(i,p,4)=BNodeval(i,j,4);
                              BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                              BNodevalue(i,p,6)=BNodeval(i,j,6);
                              BNodevalue(i,p,7)=BNodeval(i,j,7);
                              BNodevalue(i,p,8)=BNodeval(i,j,8);
                              BNodevalue(i,p,9)=BNodeval(i,j,9);
                              BNodevalue(i,p,10)=BNodeval(i,j,10);                  
                              BNodevalue(i,p,11)=BNodeval(i,j,11);
                              BNodevalue(i,p,12)=BNodeval(i,j,12);
                              BNodevalue(i,p,13)=BNodeval(i,j,13);
                              BNodevalue(i,p,14)=BNodeval(i,j,14);
                              BNodevalue(i,p,15)=1;
                              BNodevalue(i,p,16)=BNodeval(i,j,16); 
                              p=p+1;                                
                              % add step element
                              % Rotation
                              Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
                                 sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
                                 0 0 1];                              
                              Lb2 =[BNodeval(i,j,16)+s;0;0];
                              Lb2 = Rz*Lb2+[JNodevalue_i(i,3);JNodevalue_i(i,4);JNodevalue_i(i,5)]; 
                              BNodevalue(i,p,1)=BNodeval(i,j,1);
                              BNodevalue(i,p,2)=p;
                              BNodevalue(i,p,3)=Lb2(1,1);
                              BNodevalue(i,p,4)=Lb2(2,1);
                              BNodevalue(i,p,5)=Lb2(3,1);                 
                              BNodevalue(i,p,6)=BNodeval(i,j+1,6);
                              BNodevalue(i,p,7)=BNodeval(i,j+1,7);
                              BNodevalue(i,p,8)=BNodeval(i,j+1,8);
                              BNodevalue(i,p,9)=BNodeval(i,j+1,9);
                              BNodevalue(i,p,10)=Dgsb(1,2);
                              BNodevalue(i,p,11)=BNodeval(i,j+1,11);
                              BNodevalue(i,p,12)=dtsb(1,2);
                              BNodevalue(i,p,13)=hgsb(1,2);
                              BNodevalue(i,p,14)=Afillsb(1,2);  
                              BNodevalue(i,p,15)=3;
                              BNodevalue(i,p,16)=BNodeval(i,j+1,16)+s; 
                              p=p+1;   
                              
                           elseif (abs(BNodeval(i,j,16)-BNodeval(i,j+1,16))/2 > s) && ( Af1 >= Af2 ) % if condition 13 - 2
                               fprintf('\n# 13 - 2')
                              % Linear interpolation
                              %---------------------
                              segLoc = [0, BNodeval(i,j,16)];
                              segLocstep = [0, BNodeval(i,j,16)-s, BNodeval(i,j,16)];                               
                              Dgs=[JNodevalue_i(i,10),BNodeval(i,j,10)];
                              dts=[JNodevalue_i(i,12),BNodeval(i,j,12)];
                              hgs=[JNodevalue_i(i,13),BNodeval(i,j,13)];
                              Afills=[JNodevalue_i(i,14),BNodeval(i,j,14)];                              
                              Dgsb=interp1(segLoc,Dgs,segLocstep);
                              dtsb=interp1(segLoc,dts,segLocstep);
                              hgsb=interp1(segLoc,hgs,segLocstep);
                              Afillsb=interp1(segLoc,Afills,segLocstep);                            
                              %--------------------
                              
                              % original element              
                              BNodevalue(i,p,1)=BNodeval(i,j,1);
                              BNodevalue(i,p,2)=p;
                              BNodevalue(i,p,3)=BNodeval(i,j,3);
                              BNodevalue(i,p,4)=BNodeval(i,j,4);
                              BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                              BNodevalue(i,p,6)=BNodeval(i,j+1,6);
                              BNodevalue(i,p,7)=BNodeval(i,j+1,7);
                              BNodevalue(i,p,8)=BNodeval(i,j+1,8);
                              BNodevalue(i,p,9)=BNodeval(i,j+1,9);
                              BNodevalue(i,p,10)=BNodeval(i,j,10);                  
                              BNodevalue(i,p,11)=BNodeval(i,j+1,11);
                              BNodevalue(i,p,12)=BNodeval(i,j,12);
                              BNodevalue(i,p,13)=BNodeval(i,j,13);
                              BNodevalue(i,p,14)=BNodeval(i,j,14); 
                              BNodevalue(i,p,15)=1;
                              BNodevalue(i,p,16)=BNodeval(i,j,16); 
                              p=p+1;                                
                              % add step element
                              % Rotation
                              Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
                                 sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
                                 0 0 1];                              
                              Lb2 =[BNodeval(i,j,16)-s;0;0];
                              Lb2 = Rz*Lb2+[JNodevalue_i(i,3);JNodevalue_i(i,4);JNodevalue_i(i,5)]; 
                              BNodevalue(i,p,1)=BNodeval(i,j,1);
                              BNodevalue(i,p,2)=p;
                              BNodevalue(i,p,3)=Lb2(1,1);
                              BNodevalue(i,p,4)=Lb2(2,1);
                              BNodevalue(i,p,5)=Lb2(3,1);                 
                              BNodevalue(i,p,6)=BNodeval(i,j,6);
                              BNodevalue(i,p,7)=BNodeval(i,j,7);
                              BNodevalue(i,p,8)=BNodeval(i,j,8);
                              BNodevalue(i,p,9)=BNodeval(i,j,9);
                              BNodevalue(i,p,10)=Dgsb(1,2);
                              BNodevalue(i,p,11)=BNodeval(i,j,11);
                              BNodevalue(i,p,12)=dtsb(1,2);
                              BNodevalue(i,p,13)=hgsb(1,2);
                              BNodevalue(i,p,14)=Afillsb(1,2);   
                              BNodevalue(i,p,15)=3;
                              BNodevalue(i,p,16)=BNodeval(i,j+1,16)-s; 
                              p=p+1;   
                                                         
                           end % (abs(BNodeval(i,j,16)-BNodeval(i,j+1,16)) > 2*s) && ( Af1 < Af2 )
                        end  % isequal(get(pdb_step_edit,'Value'),1) % No step                      

                     else % if condition 9 - 3
                         fprintf('\n# 9 - 3')
                        % original element              
                        BNodevalue(i,p,1)=BNodeval(i,j,1);
                        BNodevalue(i,p,2)=p;
                        BNodevalue(i,p,3)=BNodeval(i,j,3);
                        BNodevalue(i,p,4)=BNodeval(i,j,4);
                        BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                        BNodevalue(i,p,6)=BNodeval(i,j,6);
                        BNodevalue(i,p,7)=BNodeval(i,j,7);
                        BNodevalue(i,p,8)=BNodeval(i,j,8);
                        BNodevalue(i,p,9)=BNodeval(i,j,9);
                        BNodevalue(i,p,10)=BNodeval(i,j,10);                  
                        BNodevalue(i,p,11)=BNodeval(i,j,11);
                        BNodevalue(i,p,12)=BNodeval(i,j,12);
                        BNodevalue(i,p,13)=BNodeval(i,j,13);
                        BNodevalue(i,p,14)=BNodeval(i,j,14);
                        BNodevalue(i,p,15)=1;
                        BNodevalue(i,p,16)=BNodeval(i,j,16); 
                        p=p+1;
                     end                     
                     
                  end % isequal(1,max(BNodeval(i,:,2)))
                  % --------------------- The first Internal Node Number E  

                  
               elseif (j > 1) && isequal(j,max(BNodeval(i,:,2))) % For the last internal node % if condition 2 - 2
                   fprintf('\n# 2 - 2')
   
                     if ~isequal(round(JNodevalue_j(i,6)*10^5)/10^5,round(BNodeval(i,j,6)*10^5)/10^5) ... 
                           || ~isequal(round(JNodevalue_j(i,7)*10^5)/10^5,round(BNodeval(i,j,7)*10^5)/10^5) ...
                           || ~isequal(round(JNodevalue_j(i,8)*10^5)/10^5,round(BNodeval(i,j,8)*10^5)/10^5) ...
                           || ~isequal(round(JNodevalue_j(i,9)*10^5)/10^5,round(BNodeval(i,j,9)*10^5)/10^5) ...
                           || ~isequal(round(JNodevalue_j(i,11)*10^5)/10^5,round(BNodeval(i,j,11)*10^5)/10^5) % if condition 14 - 1
                       fprintf('\n# 14 - 1')
                        % --------------- Calculation the difference of SC S   
                        % Section properties at each element under natural frame
                        bfb2=JNodevalue_j(i,6);bfb1=BNodeval(i,j,6);  % Bottom flange width
                        tfb2=JNodevalue_j(i,7);tfb1=BNodeval(i,j,7);  % Bottom flange thickness
                        bft2=JNodevalue_j(i,8);bft1=BNodeval(i,j,8);  % Top flange width
                        tft2=JNodevalue_j(i,9);tft1=BNodeval(i,j,9);  % Top flange thickness
                        Dg2=JNodevalue_j(i,10);Dg1=BNodeval(i,j,10);  % dw:Web depth (y-dir)
                        tw2=JNodevalue_j(i,11);tw1=BNodeval(i,j,11);  % tw:Web thickness
                        hg2=JNodevalue_j(i,13);hg1=BNodeval(i,j,13);  % h : Distance between flange centroids

                        % Shear center
                        % Start node
                        % bottom flange centroid to shear center
                        hsb1 = (tft1.*bft1.^3.*hg1)./(tfb1.*bfb1.^3+tft1.*bft1.^3); 
                        Dsb1 = hsb1 - tfb1/2; % bottom of Web depth to shear center
                        hst1 = hg1 - hsb1;    % top flange centroid to shear center
                        Dst1 = hst1 - tft1/2;    % top of Web depth to shear center
                        % End node
                        % bottom flange centroid to shear center
                        hsb2 = (tft2.*bft2.^3.*hg2)./(tfb2.*bfb2.^3+tft2.*bft2.^3); 
                        Dsb2 = hsb2 - tfb2/2; % bottom of Web depth to shear center
                        hst2 = hg2 - hsb2;    % top flange centroid to shear center
                        Dst2 = hst2 - tft2/2;    % top of Web depth to shear center               
                        ys1=Dg1/2 - Dst1; ys2=Dg2/2 - Dst2;    % Shear center  
                        
                        s = abs(ys1-ys2); % Difference in shear center  
                        s = max(s, ( max( max(bfb1,bft1),max(bfb2,bft2) ) )/10 );
                        Af1= bfb1*tfb1+bft1*tft1+tw1;
                        Af2= bfb2*tfb2+bft2*tft2+tw2;
                        
                        L = sqrt( (JNodevalue_j(i,3)-JNodevalue_i(i,3))^2 ...
                           + (JNodevalue_j(i,4)-JNodevalue_i(i,4))^2 + (JNodevalue_j(i,5)-JNodevalue_i(i,5))^2 );                         
                        % --------------- Calculation the difference of SC E   

                        if isequal(get(pdb_step_edit,'Value'),1) % No step       % if condition 15 - 1 
                            fprintf('\n# 15 - 1')
                           % original element              
                           BNodevalue(i,p,1)=BNodeval(i,j,1);
                           BNodevalue(i,p,2)=p;
                           BNodevalue(i,p,3)=BNodeval(i,j,3);
                           BNodevalue(i,p,4)=BNodeval(i,j,4);
                           BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                           BNodevalue(i,p,6)=BNodeval(i,j,6);
                           BNodevalue(i,p,7)=BNodeval(i,j,7);
                           BNodevalue(i,p,8)=BNodeval(i,j,8);
                           BNodevalue(i,p,9)=BNodeval(i,j,9);
                           BNodevalue(i,p,10)=BNodeval(i,j,10);                  
                           BNodevalue(i,p,11)=BNodeval(i,j,11);
                           BNodevalue(i,p,12)=BNodeval(i,j,12);
                           BNodevalue(i,p,13)=BNodeval(i,j,13);
                           BNodevalue(i,p,14)=BNodeval(i,j,14);
                           BNodevalue(i,p,15)=1;
                           BNodevalue(i,p,16)=BNodeval(i,j,16); 
                           p=p+1;
                           
                        elseif isequal(get(pdb_step_edit,'Value'),2) % left step     % if condition 15 - 2  
                            fprintf('\n# 15 - 2')
                       
                           if ( abs(L-BNodeval(i,j,16))/2 > s ) && ( Af1 < Af2 )    % if condition 16 - 1
                               fprintf('\n# 16 - 1')
                              % Linear interpolation
                              segLoc = [BNodeval(i,j,16), L];
                              segLocstep = [BNodeval(i,j,16), BNodeval(i,j,16)+s, L];                               
                              Dgs=[BNodeval(i,j,10),JNodevalue_j(i,10)];
                              dts=[BNodeval(i,j,12),JNodevalue_j(i,12)];
                              hgs=[BNodeval(i,j,13),JNodevalue_j(i,13)];
                              Afills=[BNodeval(i,j,14),JNodevalue_j(i,14)];                              
                              Dgsb=interp1(segLoc,Dgs,segLocstep);
                              dtsb=interp1(segLoc,dts,segLocstep);
                              hgsb=interp1(segLoc,hgs,segLocstep);
                              Afillsb=interp1(segLoc,Afills,segLocstep);                              
                              
                              % original element                
                              BNodevalue(i,p,1)=BNodeval(i,j,1);
                              BNodevalue(i,p,2)=p;
                              BNodevalue(i,p,3)=BNodeval(i,j,3);
                              BNodevalue(i,p,4)=BNodeval(i,j,4);
                              BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                              BNodevalue(i,p,6)=BNodeval(i,j,6);
                              BNodevalue(i,p,7)=BNodeval(i,j,7);
                              BNodevalue(i,p,8)=BNodeval(i,j,8);
                              BNodevalue(i,p,9)=BNodeval(i,j,9);
                              BNodevalue(i,p,10)=BNodeval(i,j,10);                  
                              BNodevalue(i,p,11)=BNodeval(i,j,11);
                              BNodevalue(i,p,12)=BNodeval(i,j,12);
                              BNodevalue(i,p,13)=BNodeval(i,j,13);
                              BNodevalue(i,p,14)=BNodeval(i,j,14);
                              BNodevalue(i,p,15)=1;
                              BNodevalue(i,p,16)=BNodeval(i,j,16); 
                              p=p+1;                               
                              % add step element
                              % Rotation
                              Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
                                 sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
                                 0 0 1];                           
                              Lb2 =[BNodeval(i,j,16)+s;0;0];
                              Lb2 = Rz*Lb2+[JNodevalue_i(i,3);JNodevalue_i(i,4);JNodevalue_i(i,5)]; 
                              BNodevalue(i,p,1)=BNodeval(i,j,1);
                              BNodevalue(i,p,2)=p;
                              BNodevalue(i,p,3)=Lb2(1,1);
                              BNodevalue(i,p,4)=Lb2(2,1);
                              BNodevalue(i,p,5)=Lb2(3,1);                 
                              BNodevalue(i,p,6)=JNodevalue_j(i,6);
                              BNodevalue(i,p,7)=JNodevalue_j(i,7);
                              BNodevalue(i,p,8)=JNodevalue_j(i,8);
                              BNodevalue(i,p,9)=JNodevalue_j(i,9);
                              BNodevalue(i,p,10)=Dgsb(1,2);                  
                              BNodevalue(i,p,11)=JNodevalue_j(i,11);
                              BNodevalue(i,p,12)=dtsb(1,2);
                              BNodevalue(i,p,13)=hgsb(1,2);
                              BNodevalue(i,p,14)=Afillsb(1,2);  
                              BNodevalue(i,p,15)=3;
                              BNodevalue(i,p,16)=BNodeval(i,j,16)+s;
                              p=p+1;
                           elseif ( abs(L-BNodeval(i,j,16))/2 > s ) && ( Af1 >= Af2 ) % if condition 16 - 2
                               fprintf('\n# 16 - 2')
                              % Linear interpolation
                              %-------------------------
                              segLoc = [BNodeval(i,j-1,16), BNodeval(i,j,16)];
                              segLocstep = [BNodeval(i,j-1,16), BNodeval(i,j,16)-s, BNodeval(i,j,16)];                               
                              Dgs=[BNodeval(i,j-1,10),BNodeval(i,j,10)];
                              dts=[BNodeval(i,j-1,12),BNodeval(i,j,12)];
                              hgs=[BNodeval(i,j-1,13),BNodeval(i,j,13)];
                              Afills=[BNodeval(i,j-1,14),BNodeval(i,j,14)];                              
                              Dgsb=interp1(segLoc,Dgs,segLocstep);
                              dtsb=interp1(segLoc,dts,segLocstep);
                              hgsb=interp1(segLoc,hgs,segLocstep);
                              Afillsb=interp1(segLoc,Afills,segLocstep);                                     
                              %-----------------------------
                              % original element                
                              BNodevalue(i,p,1)=BNodeval(i,j,1);
                              BNodevalue(i,p,2)=p;
                              BNodevalue(i,p,3)=BNodeval(i,j,3);
                              BNodevalue(i,p,4)=BNodeval(i,j,4);
                              BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                              BNodevalue(i,p,6)=JNodevalue_j(i,6);
                              BNodevalue(i,p,7)=JNodevalue_j(i,7);
                              BNodevalue(i,p,8)=JNodevalue_j(i,8);
                              BNodevalue(i,p,9)=JNodevalue_j(i,9);
                              BNodevalue(i,p,10)=BNodeval(i,j,10);                 
                              BNodevalue(i,p,11)=JNodevalue_j(i,11);
                              BNodevalue(i,p,12)=BNodeval(i,j,12);
                              BNodevalue(i,p,13)=BNodeval(i,j,13);
                              BNodevalue(i,p,14)=BNodeval(i,j,14);
                              BNodevalue(i,p,15)=1;
                              BNodevalue(i,p,16)=BNodeval(i,j,16); 
                              p=p+1;                               
                              % add step element
                              % Rotation
                              Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
                                 sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
                                 0 0 1];                           
                              Lb2 =[BNodeval(i,j,16)-s;0;0];
                              Lb2 = Rz*Lb2+[JNodevalue_i(i,3);JNodevalue_i(i,4);JNodevalue_i(i,5)]; 
%                               fprintf('\nBNodevalue before in # 16 - 2')
%                               BNodevalue
%                               fprintf('BNodeval before in # 16 - 2')
%                               BNodeval
                              BNodevalue(i,p,1)=BNodeval(i,j,1);
                              BNodevalue(i,p,2)=p;
                              BNodevalue(i,p,3)=Lb2(1,1);
                              BNodevalue(i,p,4)=Lb2(2,1);
                              BNodevalue(i,p,5)=Lb2(3,1);                 
                              BNodevalue(i,p,6)=BNodeval(i,j,6);
                              BNodevalue(i,p,7)=BNodeval(i,j,7);
                              BNodevalue(i,p,8)=BNodeval(i,j,8);
                              BNodevalue(i,p,9)=BNodeval(i,j,9);
                              BNodevalue(i,p,10)=Dgsb(1,2);
                              BNodevalue(i,p,11)=BNodeval(i,j,11);
                              BNodevalue(i,p,12)=dtsb(1,2);
                              BNodevalue(i,p,13)=hgsb(1,2);
                              BNodevalue(i,p,14)=Afillsb(1,2);  
                              BNodevalue(i,p,15)=3;
                              BNodevalue(i,p,16)=BNodeval(i,j,16)-s;
                              p=p+1;           
%                               fprintf('BNodevalue after in # 16 - 2')
%                               BNodevalue
                           end % ( abs(L-BNodeval(i,j,16)) > 2*s ) && ( Af1 < Af2 )                           
                        end % isequal(get(pdb_step_edit,'Value'),1) % No step                        
                        
                     elseif ~isequal(round(BNodeval(i,j-1,6)*10^5)/10^5,round(BNodeval(i,j,6)*10^5)/10^5) ... 
                           || ~isequal(round(BNodeval(i,j-1,7)*10^5)/10^5,round(BNodeval(i,j,7)*10^5)/10^5) ...
                           || ~isequal(round(BNodeval(i,j-1,8)*10^5)/10^5,round(BNodeval(i,j,8)*10^5)/10^5) ...
                           || ~isequal(round(BNodeval(i,j-1,9)*10^5)/10^5,round(BNodeval(i,j,9)*10^5)/10^5) ...
                           || ~isequal(round(BNodeval(i,j-1,11)*10^5)/10^5,round(BNodeval(i,j,11)*10^5)/10^5) % if condition 14 - 2
                       fprintf('\n# 14 - 2')

                        % --------------- Calculation the difference of SC S   
                        % Section properties at each element under natural frame
                        bfb1=BNodeval(i,j-1,6);bfb2=BNodeval(i,j,6);  % Bottom flange width
                        tfb1=BNodeval(i,j-1,7);tfb2=BNodeval(i,j,7);  % Bottom flange thickness
                        bft1=BNodeval(i,j-1,8);bft2=BNodeval(i,j,8);  % Top flange width
                        tft1=BNodeval(i,j-1,9);tft2=BNodeval(i,j,9);  % Top flange thickness
                        Dg1=BNodeval(i,j-1,10);Dg2=BNodeval(i,j,10);  % dw:Web depth (y-dir)
                        tw1=BNodeval(i,j-1,11);tw2=BNodeval(i,j,11);  % tw:Web thickness
                        hg1=BNodeval(i,j-1,13);hg2=BNodeval(i,j,13);  % h : Distance between flange centroids                        
                        
                        
                        % Shear center
                        % Start node
                        % bottom flange centroid to shear center
                        hsb1 = (tft1.*bft1.^3.*hg1)./(tfb1.*bfb1.^3+tft1.*bft1.^3); 
                        Dsb1 = hsb1 - tfb1/2; % bottom of Web depth to shear center
                        hst1 = hg1 - hsb1;    % top flange centroid to shear center
                        Dst1 = hst1 - tft1/2;    % top of Web depth to shear center
                        % End node
                        % bottom flange centroid to shear center
                        hsb2 = (tft2.*bft2.^3.*hg2)./(tfb2.*bfb2.^3+tft2.*bft2.^3); 
                        Dsb2 = hsb2 - tfb2/2; % bottom of Web depth to shear center
                        hst2 = hg2 - hsb2;    % top flange centroid to shear center
                        Dst2 = hst2 - tft2/2;    % top of Web depth to shear center               
                        ys1=Dg1/2 - Dst1; ys2=Dg2/2 - Dst2;    % Shear center  
                        
                        s = abs(ys1-ys2); % Difference in shear center  
                        s = max(s, ( max( max(bfb1,bft1),max(bfb2,bft2) ) )/10 );
                        Af1= bfb1*tfb1+bft1*tft1+tw1;
                        Af2= bfb2*tfb2+bft2*tft2+tw2;   
                        L = sqrt( (JNodevalue_j(i,3)-JNodevalue_i(i,3))^2 ...
                           + (JNodevalue_j(i,4)-JNodevalue_i(i,4))^2 + (JNodevalue_j(i,5)-JNodevalue_i(i,5))^2 );                           
                        % --------------- Calculation the difference of SC E   

                        if isequal(get(pdb_step_edit,'Value'),1) % No step   % if condition 17 - 1
                            fprintf('\n# 17 - 1')
                           % original element              
                           BNodevalue(i,p,1)=BNodeval(i,j,1);
                           BNodevalue(i,p,2)=p;
                           BNodevalue(i,p,3)=BNodeval(i,j,3);
                           BNodevalue(i,p,4)=BNodeval(i,j,4);
                           BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                           BNodevalue(i,p,6)=BNodeval(i,j,6);
                           BNodevalue(i,p,7)=BNodeval(i,j,7);
                           BNodevalue(i,p,8)=BNodeval(i,j,8);
                           BNodevalue(i,p,9)=BNodeval(i,j,9);
                           BNodevalue(i,p,10)=BNodeval(i,j,10);                  
                           BNodevalue(i,p,11)=BNodeval(i,j,11);
                           BNodevalue(i,p,12)=BNodeval(i,j,12);
                           BNodevalue(i,p,13)=BNodeval(i,j,13);
                           BNodevalue(i,p,14)=BNodeval(i,j,14);
                           BNodevalue(i,p,15)=1;
                           BNodevalue(i,p,16)=BNodeval(i,j,16); 
                           p=p+1;
                           
                        elseif isequal(get(pdb_step_edit,'Value'),2) % left step  % if condition 17 - 2 
                            fprintf('\n# 17 - 2')
                         
                           if (abs( BNodeval(i,j,16)-BNodeval(i,j-1,16) )/2 > s ) && (Af1 >= Af2) % if condition 18 - 1  
                               fprintf('\n# 18 - 1')
                              % Linear interpolation
                              segLoc = [BNodeval(i,j-1,16), BNodeval(i,j,16)];
                              segLocstep = [BNodeval(i,j-1,16), BNodeval(i,j,16)-s, BNodeval(i,j,16)];                               
                              Dgs=[BNodeval(i,j-1,10),BNodeval(i,j,10)];
                              dts=[BNodeval(i,j-1,12),BNodeval(i,j,12)];
                              hgs=[BNodeval(i,j-1,13),BNodeval(i,j,13)];
                              Afills=[BNodeval(i,j-1,14),BNodeval(i,j,14)];                              
                              Dgsb=interp1(segLoc,Dgs,segLocstep);
                              dtsb=interp1(segLoc,dts,segLocstep);
                              hgsb=interp1(segLoc,hgs,segLocstep);
                              Afillsb=interp1(segLoc,Afills,segLocstep);                              
                              
                              % original element                
                              BNodevalue(i,p,1)=BNodeval(i,j,1);
                              BNodevalue(i,p,2)=p;
                              BNodevalue(i,p,3)=BNodeval(i,j,3);
                              BNodevalue(i,p,4)=BNodeval(i,j,4);
                              BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                              BNodevalue(i,p,6)=BNodeval(i,j,6);
                              BNodevalue(i,p,7)=BNodeval(i,j,7);
                              BNodevalue(i,p,8)=BNodeval(i,j,8);
                              BNodevalue(i,p,9)=BNodeval(i,j,9);
                              BNodevalue(i,p,10)=BNodeval(i,j,10);                  
                              BNodevalue(i,p,11)=BNodeval(i,j,11);
                              BNodevalue(i,p,12)=BNodeval(i,j,12);
                              BNodevalue(i,p,13)=BNodeval(i,j,13);
                              BNodevalue(i,p,14)=BNodeval(i,j,14);
                              BNodevalue(i,p,15)=1;
                              BNodevalue(i,p,16)=BNodeval(i,j,16); 
                              p=p+1;                              
                              % add step element                            
                              % Rotation
                              Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
                                 sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
                                 0 0 1];                           
                              Lb2 =[BNodeval(i,j,16)-s;0;0];
                              Lb2 = Rz*Lb2+[JNodevalue_i(i,3);JNodevalue_i(i,4);JNodevalue_i(i,5)]; 
                              BNodevalue(i,p,1)=BNodeval(i,j,1);
                              BNodevalue(i,p,2)=p;
                              BNodevalue(i,p,3)=Lb2(1,1);
                              BNodevalue(i,p,4)=Lb2(2,1);
                              BNodevalue(i,p,5)=Lb2(3,1);                 
                              BNodevalue(i,p,6)=BNodeval(i,j-1,6);
                              BNodevalue(i,p,7)=BNodeval(i,j-1,7);
                              BNodevalue(i,p,8)=BNodeval(i,j-1,8);
                              BNodevalue(i,p,9)=BNodeval(i,j-1,9);
                              BNodevalue(i,p,10)=Dgsb(1,2); 
                              BNodevalue(i,p,11)=BNodeval(i,j-1,11);
                              BNodevalue(i,p,12)=dtsb(1,2);
                              BNodevalue(i,p,13)=hgsb(1,2);
                              BNodevalue(i,p,14)=Afillsb(1,2); 
                              BNodevalue(i,p,15)=2;
                              BNodevalue(i,p,16)=BNodeval(i,j,16)-s;
                              p=p+1;    
                           elseif (abs( BNodeval(i,j,16)-BNodeval(i,j-1,16) )/2 > s ) && (Af1 < Af2) % if condition 18 - 2
                               fprintf('\n# 18 - 2')
                              % Linear interpolation
                              %---------------------
                              segLoc = [BNodeval(i,j,16), L];
                              segLocstep = [BNodeval(i,j,16), BNodeval(i,j,16)+s, L];                               
                              Dgs=[BNodeval(i,j,10),JNodevalue_j(i,10)];
                              dts=[BNodeval(i,j,12),JNodevalue_j(i,12)];
                              hgs=[BNodeval(i,j,13),JNodevalue_j(i,13)];
                              Afills=[BNodeval(i,j,14),JNodevalue_j(i,14)];                              
                              Dgsb=interp1(segLoc,Dgs,segLocstep);
                              dtsb=interp1(segLoc,dts,segLocstep);
                              hgsb=interp1(segLoc,hgs,segLocstep);
                              Afillsb=interp1(segLoc,Afills,segLocstep);                                    
                              %-----------------------
                              
                              % original element                
                              BNodevalue(i,p,1)=BNodeval(i,j,1);
                              BNodevalue(i,p,2)=p;
                              BNodevalue(i,p,3)=BNodeval(i,j,3);
                              BNodevalue(i,p,4)=BNodeval(i,j,4);
                              BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                              BNodevalue(i,p,6)=BNodeval(i,j-1,6);
                              BNodevalue(i,p,7)=BNodeval(i,j-1,7);
                              BNodevalue(i,p,8)=BNodeval(i,j-1,8);
                              BNodevalue(i,p,9)=BNodeval(i,j-1,9);
                              BNodevalue(i,p,10)=BNodeval(i,j,10);
                              BNodevalue(i,p,11)=BNodeval(i,j-1,11);
                              BNodevalue(i,p,12)=BNodeval(i,j,12);
                              BNodevalue(i,p,13)=BNodeval(i,j,13);
                              BNodevalue(i,p,14)=BNodeval(i,j,14);  
                              BNodevalue(i,p,15)=1;
                              BNodevalue(i,p,16)=BNodeval(i,j,16); 
                              p=p+1;                              
                              % add step element                            
                              % Rotation
                              Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
                                 sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
                                 0 0 1];                           
                              Lb2 =[BNodeval(i,j,16)+s;0;0];
                              Lb2 = Rz*Lb2+[JNodevalue_i(i,3);JNodevalue_i(i,4);JNodevalue_i(i,5)]; 
                              BNodevalue(i,p,1)=BNodeval(i,j,1);
                              BNodevalue(i,p,2)=p;
                              BNodevalue(i,p,3)=Lb2(1,1);
                              BNodevalue(i,p,4)=Lb2(2,1);
                              BNodevalue(i,p,5)=Lb2(3,1);                 
                              BNodevalue(i,p,6)=BNodeval(i,j,6);
                              BNodevalue(i,p,7)=BNodeval(i,j,7);
                              BNodevalue(i,p,8)=BNodeval(i,j,8);
                              BNodevalue(i,p,9)=BNodeval(i,j,9);
                              BNodevalue(i,p,10)=Dgsb(1,2);
                              BNodevalue(i,p,11)=BNodeval(i,j,11);
                              BNodevalue(i,p,12)=dtsb(1,2);
                              BNodevalue(i,p,13)=hgsb(1,2);
                              BNodevalue(i,p,14)=Afillsb(1,2); 
                              BNodevalue(i,p,15)=2;
                              BNodevalue(i,p,16)=BNodeval(i,j,16)+s;
                              p=p+1;                                 
                           end % (abs( BNodeval(i,j,16)-BNodeval(i,j-1,16) ) > 2*s ) && (Af1 > Af2)                              
                        end % isequal(get(pdb_step_edit,'Value'),1) % No step                          
   
                     else % if condition 14 - 3 
                         fprintf('\n# 14 - 3')
                        % original element                
                        BNodevalue(i,p,1)=BNodeval(i,j,1);
                        BNodevalue(i,p,2)=p;
                        BNodevalue(i,p,3)=BNodeval(i,j,3);
                        BNodevalue(i,p,4)=BNodeval(i,j,4);
                        BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                        BNodevalue(i,p,6)=BNodeval(i,j,6);
                        BNodevalue(i,p,7)=BNodeval(i,j,7);
                        BNodevalue(i,p,8)=BNodeval(i,j,8);
                        BNodevalue(i,p,9)=BNodeval(i,j,9);
                        BNodevalue(i,p,10)=BNodeval(i,j,10);                  
                        BNodevalue(i,p,11)=BNodeval(i,j,11);
                        BNodevalue(i,p,12)=BNodeval(i,j,12);
                        BNodevalue(i,p,13)=BNodeval(i,j,13);
                        BNodevalue(i,p,14)=BNodeval(i,j,14);
                        BNodevalue(i,p,15)=1;
                        BNodevalue(i,p,16)=BNodeval(i,j,16); 
                        p=p+1;
                        
                     end
                  % --------------------- The last Internal Node Number E
 
               else % Other than the first & last internal nodes % if condition 2 - 3
                   fprintf('\n# 2 - 3')

                 if ~isequal(round(BNodeval(i,j-1,6)*10^5)/10^5,round(BNodeval(i,j,6)*10^5)/10^5) ... 
                        || ~isequal(round(BNodeval(i,j-1,7)*10^5)/10^5,round(BNodeval(i,j,7)*10^5)/10^5) ...
                        || ~isequal(round(BNodeval(i,j-1,8)*10^5)/10^5,round(BNodeval(i,j,8)*10^5)/10^5) ...
                        || ~isequal(round(BNodeval(i,j-1,9)*10^5)/10^5,round(BNodeval(i,j,9)*10^5)/10^5) ...
                        || ~isequal(round(BNodeval(i,j-1,11)*10^5)/10^5,round(BNodeval(i,j,11)*10^5)/10^5) % if condition 19 - 1
                    fprintf('\n# 19 - 1')

                     % --------------- Calculation the difference of SC S   
                     % Section properties at each element under natural frame
                     bfb1=BNodeval(i,j-1,6);bfb2=BNodeval(i,j,6);  % Bottom flange width
                     tfb1=BNodeval(i,j-1,7);tfb2=BNodeval(i,j,7);  % Bottom flange thickness
                     bft1=BNodeval(i,j-1,8);bft2=BNodeval(i,j,8);  % Top flange width
                     tft1=BNodeval(i,j-1,9);tft2=BNodeval(i,j,9);  % Top flange thickness
                     Dg1=BNodeval(i,j-1,10);Dg2=BNodeval(i,j,10);  % dw:Web depth (y-dir)
                     tw1=BNodeval(i,j-1,11);tw2=BNodeval(i,j,11);  % tw:Web thickness
                     hg1=BNodeval(i,j-1,13);hg2=BNodeval(i,j,13);  % h : Distance between flange centroids

                     % Shear center
                     % Start node
                     % bottom flange centroid to shear center
                     hsb1 = (tft1.*bft1.^3.*hg1)./(tfb1.*bfb1.^3+tft1.*bft1.^3); 
                     Dsb1 = hsb1 - tfb1/2; % bottom of Web depth to shear center
                     hst1 = hg1 - hsb1;    % top flange centroid to shear center
                     Dst1 = hst1 - tft1/2;    % top of Web depth to shear center
                     % End node
                     % bottom flange centroid to shear center
                     hsb2 = (tft2.*bft2.^3.*hg2)./(tfb2.*bfb2.^3+tft2.*bft2.^3); 
                     Dsb2 = hsb2 - tfb2/2; % bottom of Web depth to shear center
                     hst2 = hg2 - hsb2;    % top flange centroid to shear center
                     Dst2 = hst2 - tft2/2;    % top of Web depth to shear center               
                     ys1=Dg1/2 - Dst1; ys2=Dg2/2 - Dst2;    % Shear center  

                     s = abs(ys1-ys2); % Difference in shear center  
                     s = max(s, ( max( max(bfb1,bft1),max(bfb2,bft2) ) )/10 );
                     Af1= bfb1*tfb1+bft1*tft1+tw1;
                     Af2= bfb2*tfb2+bft2*tft2+tw2;
                     % --------------- Calculation the difference of SC E   

                     if isequal(get(pdb_step_edit,'Value'),1) % No step  % if condition 20 - 1 
                        fprintf('\n# 20 - 1')
                        % original element              
                        BNodevalue(i,p,1)=BNodeval(i,j,1);
                        BNodevalue(i,p,2)=p;
                        BNodevalue(i,p,3)=BNodeval(i,j,3);
                        BNodevalue(i,p,4)=BNodeval(i,j,4);
                        BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                        BNodevalue(i,p,6)=BNodeval(i,j,6);
                        BNodevalue(i,p,7)=BNodeval(i,j,7);
                        BNodevalue(i,p,8)=BNodeval(i,j,8);
                        BNodevalue(i,p,9)=BNodeval(i,j,9);
                        BNodevalue(i,p,10)=BNodeval(i,j,10);                  
                        BNodevalue(i,p,11)=BNodeval(i,j,11);
                        BNodevalue(i,p,12)=BNodeval(i,j,12);
                        BNodevalue(i,p,13)=BNodeval(i,j,13);
                        BNodevalue(i,p,14)=BNodeval(i,j,14);
                        BNodevalue(i,p,15)=1;
                        BNodevalue(i,p,16)=BNodeval(i,j,16); 
                        p=p+1;
                           
                     elseif isequal(get(pdb_step_edit,'Value'),2) % left step     % if condition 20 - 2
                         fprintf('\n# 20 - 2')
                     
                        if (abs(BNodeval(i,j,16)-BNodeval(i,j-1,16))/2 > s ) && (Af1 >= Af2) % if condition 21 - 1
                            fprintf('\n# 21 - 1')
                           % Linear interpolation
                           segLoc = [BNodeval(i,j-1,16), BNodeval(i,j,16)];
                           segLocstep = [BNodeval(i,j-1,16), BNodeval(i,j,16)-s, BNodeval(i,j,16)];                               
                           Dgs=[BNodeval(i,j-1,10),BNodeval(i,j,10)];
                           dts=[BNodeval(i,j-1,12),BNodeval(i,j,12)];
                           hgs=[BNodeval(i,j-1,13),BNodeval(i,j,13)];
                           Afills=[BNodeval(i,j-1,14),BNodeval(i,j,14)];                              
                           Dgsb=interp1(segLoc,Dgs,segLocstep);
                           dtsb=interp1(segLoc,dts,segLocstep);
                           hgsb=interp1(segLoc,hgs,segLocstep);
                           Afillsb=interp1(segLoc,Afills,segLocstep);                           
                           
                           % original element                
                           BNodevalue(i,p,1)=BNodeval(i,j,1);
                           BNodevalue(i,p,2)=p;
                           BNodevalue(i,p,3)=BNodeval(i,j,3);
                           BNodevalue(i,p,4)=BNodeval(i,j,4);
                           BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                           BNodevalue(i,p,6)=BNodeval(i,j,6);
                           BNodevalue(i,p,7)=BNodeval(i,j,7);
                           BNodevalue(i,p,8)=BNodeval(i,j,8);
                           BNodevalue(i,p,9)=BNodeval(i,j,9);
                           BNodevalue(i,p,10)=BNodeval(i,j,10);                  
                           BNodevalue(i,p,11)=BNodeval(i,j,11);
                           BNodevalue(i,p,12)=BNodeval(i,j,12);
                           BNodevalue(i,p,13)=BNodeval(i,j,13);
                           BNodevalue(i,p,14)=BNodeval(i,j,14);
                           BNodevalue(i,p,15)=1;
                           BNodevalue(i,p,16)=BNodeval(i,j,16); 
                           p=p+1;                                 
                           % add step element
                           % Rotation
                           Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
                              sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
                              0 0 1];
                           Lb2 =[BNodeval(i,j,16)-s;0;0];
                           Lb2 = Rz*Lb2+[JNodevalue_i(i,3);JNodevalue_i(i,4);JNodevalue_i(i,5)]; 
                           BNodevalue(i,p,1)=BNodeval(i,j,1);
                           BNodevalue(i,p,2)=p;
                           BNodevalue(i,p,3)=Lb2(1,1);
                           BNodevalue(i,p,4)=Lb2(2,1);
                           BNodevalue(i,p,5)=Lb2(3,1);                  
                           BNodevalue(i,p,6)=BNodeval(i,j-1,6);
                           BNodevalue(i,p,7)=BNodeval(i,j-1,7);
                           BNodevalue(i,p,8)=BNodeval(i,j-1,8);
                           BNodevalue(i,p,9)=BNodeval(i,j-1,9);
                           BNodevalue(i,p,10)=Dgsb(1,2);                 
                           BNodevalue(i,p,11)=BNodeval(i,j-1,11);
                           BNodevalue(i,p,12)=dtsb(1,2);
                           BNodevalue(i,p,13)=hgsb(1,2);
                           BNodevalue(i,p,14)=Afillsb(1,2);  
                           BNodevalue(i,p,15)=2;
                           BNodevalue(i,p,16)=BNodeval(i,j,16)-s;                           
                           p=p+1;    
                        elseif (abs(BNodeval(i,j,16)-BNodeval(i,j-1,16))/2 > s ) && (Af1 < Af2) % if condition 21 - 2
                            fprintf('\n# 21 - 2')
                           % Linear interpolation
                           %-------------------
                           segLoc = [BNodeval(i,j,16), BNodeval(i,j+1,16)];
                           segLocstep = [BNodeval(i,j,16), BNodeval(i,j,16)+s, BNodeval(i,j+1,16)];                               
                           Dgs=[BNodeval(i,j,10),BNodeval(i,j+1,10)];
                           dts=[BNodeval(i,j,12),BNodeval(i,j+1,12)];
                           hgs=[BNodeval(i,j,13),BNodeval(i,j+1,13)];
                           Afills=[BNodeval(i,j,14),BNodeval(i,j+1,14)];                              
                           Dgsb=interp1(segLoc,Dgs,segLocstep);
                           dtsb=interp1(segLoc,dts,segLocstep);
                           hgsb=interp1(segLoc,hgs,segLocstep);
                           Afillsb=interp1(segLoc,Afills,segLocstep);                           
                           %-------------------
                           
                           % original element                
                           BNodevalue(i,p,1)=BNodeval(i,j,1);
                           BNodevalue(i,p,2)=p;
                           BNodevalue(i,p,3)=BNodeval(i,j,3);
                           BNodevalue(i,p,4)=BNodeval(i,j,4);
                           BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                           BNodevalue(i,p,6)=BNodeval(i,j-1,6);
                           BNodevalue(i,p,7)=BNodeval(i,j-1,7);
                           BNodevalue(i,p,8)=BNodeval(i,j-1,8);
                           BNodevalue(i,p,9)=BNodeval(i,j-1,9);
                           BNodevalue(i,p,10)=BNodeval(i,j,10);                 
                           BNodevalue(i,p,11)=BNodeval(i,j-1,11);
                           BNodevalue(i,p,12)=BNodeval(i,j,12);
                           BNodevalue(i,p,13)=BNodeval(i,j,13);
                           BNodevalue(i,p,14)=BNodeval(i,j,14);
                           BNodevalue(i,p,15)=1;
                           BNodevalue(i,p,16)=BNodeval(i,j,16); 
                           p=p+1;                                 
                           % add step element
                           % Rotation
                           Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
                              sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
                              0 0 1];
                           Lb2 =[BNodeval(i,j,16)+s;0;0];
                           Lb2 = Rz*Lb2+[JNodevalue_i(i,3);JNodevalue_i(i,4);JNodevalue_i(i,5)]; 
                           BNodevalue(i,p,1)=BNodeval(i,j,1);
                           BNodevalue(i,p,2)=p;
                           BNodevalue(i,p,3)=Lb2(1,1);
                           BNodevalue(i,p,4)=Lb2(2,1);
                           BNodevalue(i,p,5)=Lb2(3,1);                  
                           BNodevalue(i,p,6)=BNodeval(i,j,6);
                           BNodevalue(i,p,7)=BNodeval(i,j,7);
                           BNodevalue(i,p,8)=BNodeval(i,j,8);
                           BNodevalue(i,p,9)=BNodeval(i,j,9);
                           BNodevalue(i,p,10)=Dgsb(1,2);                 
                           BNodevalue(i,p,11)=BNodeval(i,j,11);
                           BNodevalue(i,p,12)=dtsb(1,2);
                           BNodevalue(i,p,13)=hgsb(1,2);
                           BNodevalue(i,p,14)=Afillsb(1,2);  
                           BNodevalue(i,p,15)=2;
                           BNodevalue(i,p,16)=BNodeval(i,j,16)+s;                           
                           p=p+1;                             
                        end % (abs(BNodeval(i,j,16)-BNodeval(i,j-1,16)) > 2*s ) && (Af1 > Af2) 
                     end % isequal(get(pdb_step_edit,'Value'),1) % No step                   
                 
                 elseif ~isequal(round(BNodeval(i,j+1,6)*10^5)/10^5,round(BNodeval(i,j,6)*10^5)/10^5) ... 
                        || ~isequal(round(BNodeval(i,j+1,7)*10^5)/10^5,round(BNodeval(i,j,7)*10^5)/10^5) ...
                        || ~isequal(round(BNodeval(i,j+1,8)*10^5)/10^5,round(BNodeval(i,j,8)*10^5)/10^5) ...
                        || ~isequal(round(BNodeval(i,j+1,9)*10^5)/10^5,round(BNodeval(i,j,9)*10^5)/10^5) ...
                        || ~isequal(round(BNodeval(i,j+1,11)*10^5)/10^5,round(BNodeval(i,j,11)*10^5)/10^5) % if condition 19 - 2
                    fprintf('\n# 19 - 2')

                     % --------------- Calculation the difference of SC S   
                     % Section properties at each element under natural frame
                     bfb1=BNodeval(i,j,6);bfb2=BNodeval(i,j+1,6);  % Bottom flange width
                     tfb1=BNodeval(i,j,7);tfb2=BNodeval(i,j+1,7);  % Bottom flange thickness
                     bft1=BNodeval(i,j,8);bft2=BNodeval(i,j+1,8);  % Top flange width
                     tft1=BNodeval(i,j,9);tft2=BNodeval(i,j+1,9);  % Top flange thickness
                     Dg1=BNodeval(i,j,10);Dg2=BNodeval(i,j+1,10);  % dw:Web depth (y-dir)
                     tw1=BNodeval(i,j,11);tw2=BNodeval(i,j+1,11);  % tw:Web thickness
                     hg1=BNodeval(i,j,13);hg2=BNodeval(i,j+1,13);  % h : Distance between flange centroids

                     % Shear center
                     % Start node
                     % bottom flange centroid to shear center
                     hsb1 = (tft1.*bft1.^3.*hg1)./(tfb1.*bfb1.^3+tft1.*bft1.^3); 
                     Dsb1 = hsb1 - tfb1/2; % bottom of Web depth to shear center
                     hst1 = hg1 - hsb1;    % top flange centroid to shear center
                     Dst1 = hst1 - tft1/2;    % top of Web depth to shear center
                     % End node
                     % bottom flange centroid to shear center
                     hsb2 = (tft2.*bft2.^3.*hg2)./(tfb2.*bfb2.^3+tft2.*bft2.^3); 
                     Dsb2 = hsb2 - tfb2/2; % bottom of Web depth to shear center
                     hst2 = hg2 - hsb2;    % top flange centroid to shear center
                     Dst2 = hst2 - tft2/2;    % top of Web depth to shear center               
                     ys1=Dg1/2 - Dst1; ys2=Dg2/2 - Dst2;    % Shear center  

                     s = abs(ys1-ys2); % Difference in shear center  
                     s = max(s, ( max( max(bfb1,bft1),max(bfb2,bft2) ) )/10 );
                     Af1= bfb1*tfb1+bft1*tft1+tw1;
                     Af2= bfb2*tfb2+bft2*tft2+tw2;
                     % --------------- Calculation the difference of SC E   

                     if isequal(get(pdb_step_edit,'Value'),1) % No step  % if condition 22 - 1  
                         fprintf('\n# 22 - 1')
                        % original element              
                        BNodevalue(i,p,1)=BNodeval(i,j,1);
                        BNodevalue(i,p,2)=p;
                        BNodevalue(i,p,3)=BNodeval(i,j,3);
                        BNodevalue(i,p,4)=BNodeval(i,j,4);
                        BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                        BNodevalue(i,p,6)=BNodeval(i,j,6);
                        BNodevalue(i,p,7)=BNodeval(i,j,7);
                        BNodevalue(i,p,8)=BNodeval(i,j,8);
                        BNodevalue(i,p,9)=BNodeval(i,j,9);
                        BNodevalue(i,p,10)=BNodeval(i,j,10);                  
                        BNodevalue(i,p,11)=BNodeval(i,j,11);
                        BNodevalue(i,p,12)=BNodeval(i,j,12);
                        BNodevalue(i,p,13)=BNodeval(i,j,13);
                        BNodevalue(i,p,14)=BNodeval(i,j,14);
                        BNodevalue(i,p,15)=1;
                        BNodevalue(i,p,16)=BNodeval(i,j,16); 
                        p=p+1;
             
                     elseif isequal(get(pdb_step_edit,'Value'),2) % right step  % if condition 22 - 2
                         fprintf('\n# 22 - 2')

                        if ( abs(BNodeval(i,j+1,16)-BNodeval(i,j,16))/2 > s ) && ( Af1 < Af2 ) % if condition 23 - 1 
                            fprintf('\n# 23 - 1')
                           % Linear interpolation
                           segLoc = [BNodeval(i,j,16), BNodeval(i,j+1,16)];
                           segLocstep = [BNodeval(i,j,16), BNodeval(i,j,16)+s, BNodeval(i,j+1,16)];                               
                           Dgs=[BNodeval(i,j,10),BNodeval(i,j+1,10)];
                           dts=[BNodeval(i,j,12),BNodeval(i,j+1,12)];
                           hgs=[BNodeval(i,j,13),BNodeval(i,j+1,13)];
                           Afills=[BNodeval(i,j,14),BNodeval(i,j+1,14)];                              
                           Dgsb=interp1(segLoc,Dgs,segLocstep);
                           dtsb=interp1(segLoc,dts,segLocstep);
                           hgsb=interp1(segLoc,hgs,segLocstep);
                           Afillsb=interp1(segLoc,Afills,segLocstep);                           
                           
                           % original element                
                           BNodevalue(i,p,1)=BNodeval(i,j,1);
                           BNodevalue(i,p,2)=p;
                           BNodevalue(i,p,3)=BNodeval(i,j,3);
                           BNodevalue(i,p,4)=BNodeval(i,j,4);
                           BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                           BNodevalue(i,p,6)=BNodeval(i,j,6);
                           BNodevalue(i,p,7)=BNodeval(i,j,7);
                           BNodevalue(i,p,8)=BNodeval(i,j,8);
                           BNodevalue(i,p,9)=BNodeval(i,j,9);
                           BNodevalue(i,p,10)=BNodeval(i,j,10);                  
                           BNodevalue(i,p,11)=BNodeval(i,j,11);
                           BNodevalue(i,p,12)=BNodeval(i,j,12);
                           BNodevalue(i,p,13)=BNodeval(i,j,13);
                           BNodevalue(i,p,14)=BNodeval(i,j,14);
                           BNodevalue(i,p,15)=1;
                           BNodevalue(i,p,16)=BNodeval(i,j,16); 
                           p=p+1;                           
                           % add step element
                           % Rotation
                           Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
                              sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
                              0 0 1];
                           Lb2 =[BNodeval(i,j,16)+s;0;0];
                           Lb2 = Rz*Lb2+[JNodevalue_i(i,3);JNodevalue_i(i,4);JNodevalue_i(i,5)]; 
                           BNodevalue(i,p,1)=BNodeval(i,j,1);
                           BNodevalue(i,p,2)=p;
                           BNodevalue(i,p,3)=Lb2(1,1);
                           BNodevalue(i,p,4)=Lb2(2,1);
                           BNodevalue(i,p,5)=Lb2(3,1);                 
                           BNodevalue(i,p,6)=BNodeval(i,j+1,6);
                           BNodevalue(i,p,7)=BNodeval(i,j+1,7);
                           BNodevalue(i,p,8)=BNodeval(i,j+1,8);
                           BNodevalue(i,p,9)=BNodeval(i,j+1,9);
                           BNodevalue(i,p,10)=Dgsb(1,2);                  
                           BNodevalue(i,p,11)=BNodeval(i,j+1,11);
                           BNodevalue(i,p,12)=dtsb(1,2);
                           BNodevalue(i,p,13)=hgsb(1,2);
                           BNodevalue(i,p,14)=Afillsb(1,2);  
                           BNodevalue(i,p,15)=3;
                           BNodevalue(i,p,16)=BNodeval(i,j,16)+s;  
                           p=p+1;  
                        elseif ( abs(BNodeval(i,j+1,16)-BNodeval(i,j,16))/2 > s ) && ( Af1 >= Af2 )  % if condition 23 - 2
                            fprintf('\n# 23 - 2')
                           % Linear interpolation
                           %-----------------------
                           segLoc = [BNodeval(i,j-1,16), BNodeval(i,j,16)];
                           segLocstep = [BNodeval(i,j-1,16), BNodeval(i,j,16)-s, BNodeval(i,j,16)];                               
                           Dgs=[BNodeval(i,j-1,10),BNodeval(i,j,10)];
                           dts=[BNodeval(i,j-1,12),BNodeval(i,j,12)];
                           hgs=[BNodeval(i,j-1,13),BNodeval(i,j,13)];
                           Afills=[BNodeval(i,j-1,14),BNodeval(i,j,14)];                              
                           Dgsb=interp1(segLoc,Dgs,segLocstep);
                           dtsb=interp1(segLoc,dts,segLocstep);
                           hgsb=interp1(segLoc,hgs,segLocstep);
                           Afillsb=interp1(segLoc,Afills,segLocstep);                                 
                           %------------------------
                           
                           % original element                
                           BNodevalue(i,p,1)=BNodeval(i,j,1);
                           BNodevalue(i,p,2)=p;
                           BNodevalue(i,p,3)=BNodeval(i,j,3);
                           BNodevalue(i,p,4)=BNodeval(i,j,4);
                           BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                           BNodevalue(i,p,6)=BNodeval(i,j+1,6);
                           BNodevalue(i,p,7)=BNodeval(i,j+1,7);
                           BNodevalue(i,p,8)=BNodeval(i,j+1,8);
                           BNodevalue(i,p,9)=BNodeval(i,j+1,9);
                           BNodevalue(i,p,10)=BNodeval(i,j,10);                 
                           BNodevalue(i,p,11)=BNodeval(i,j+1,11);
                           BNodevalue(i,p,12)=BNodeval(i,j,12);
                           BNodevalue(i,p,13)=BNodeval(i,j,13);
                           BNodevalue(i,p,14)=BNodeval(i,j,14); 
                           BNodevalue(i,p,15)=1;
                           BNodevalue(i,p,16)=BNodeval(i,j,16); 
                           p=p+1;                           
                           % add step element
                           % Rotation
                           Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
                              sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
                              0 0 1];
                           Lb2 =[BNodeval(i,j,16)-s;0;0];
                           Lb2 = Rz*Lb2+[JNodevalue_i(i,3);JNodevalue_i(i,4);JNodevalue_i(i,5)]; 
                           BNodevalue(i,p,1)=BNodeval(i,j,1);
                           BNodevalue(i,p,2)=p;
                           BNodevalue(i,p,3)=Lb2(1,1);
                           BNodevalue(i,p,4)=Lb2(2,1);
                           BNodevalue(i,p,5)=Lb2(3,1);                 
                           BNodevalue(i,p,6)=BNodeval(i,j,6);
                           BNodevalue(i,p,7)=BNodeval(i,j,7);
                           BNodevalue(i,p,8)=BNodeval(i,j,8);
                           BNodevalue(i,p,9)=BNodeval(i,j,9);
                           BNodevalue(i,p,10)=Dgsb(1,2);
                           BNodevalue(i,p,11)=BNodeval(i,j,11);
                           BNodevalue(i,p,12)=dtsb(1,2);
                           BNodevalue(i,p,13)=hgsb(1,2);
                           BNodevalue(i,p,14)=Afillsb(1,2);   
                           BNodevalue(i,p,15)=3;
                           BNodevalue(i,p,16)=BNodeval(i,j,16)-s;  
                           p=p+1;                            
                        end % ( abs(BNodeval(i,j+1,16)-BNodeval(i,j,16)) > 2*s ) && ( Af1 < Af2 )                         
                     end % isequal(get(pdb_step_edit,'Value'),1) % No step

                 else % Other than the internal nodes % if condition 19 - 3
                     fprintf('\n# 19 - 3')
                     % original element                
                     BNodevalue(i,p,1)=BNodeval(i,j,1);
                     BNodevalue(i,p,2)=p;
                     BNodevalue(i,p,3)=BNodeval(i,j,3);
                     BNodevalue(i,p,4)=BNodeval(i,j,4);
                     BNodevalue(i,p,5)=BNodeval(i,j,5);                   
                     BNodevalue(i,p,6)=BNodeval(i,j,6);
                     BNodevalue(i,p,7)=BNodeval(i,j,7);
                     BNodevalue(i,p,8)=BNodeval(i,j,8);
                     BNodevalue(i,p,9)=BNodeval(i,j,9);
                     BNodevalue(i,p,10)=BNodeval(i,j,10);                  
                     BNodevalue(i,p,11)=BNodeval(i,j,11);
                     BNodevalue(i,p,12)=BNodeval(i,j,12);
                     BNodevalue(i,p,13)=BNodeval(i,j,13);
                     BNodevalue(i,p,14)=BNodeval(i,j,14);
                     BNodevalue(i,p,15)=1;
                     BNodevalue(i,p,16)=BNodeval(i,j,16); 
                     p=p+1;
                 end % Other than the internal nodes 

               end % first internal node end
               
            else % ~ coordinate % if condition 1 - 2
                fprintf('\n# 1 - 2')
               % original element      
%                fprintf('\nBNodevalue before in # 1 - 2')
%                BNodevalue
%                fprintf('BNodeval before in # 1 - 2')
%                BNodeval
               BNodevalue(i,p,1)=BNodeval(i,j,1);
               BNodevalue(i,p,2)=p;
               BNodevalue(i,p,3)=BNodeval(i,j,3);
               BNodevalue(i,p,4)=BNodeval(i,j,4);
               BNodevalue(i,p,5)=BNodeval(i,j,5);                   
               BNodevalue(i,p,6)=BNodeval(i,j,6);
               BNodevalue(i,p,7)=BNodeval(i,j,7);
               BNodevalue(i,p,8)=BNodeval(i,j,8);
               BNodevalue(i,p,9)=BNodeval(i,j,9);
               BNodevalue(i,p,10)=BNodeval(i,j,10);                  
               BNodevalue(i,p,11)=BNodeval(i,j,11);
               BNodevalue(i,p,12)=BNodeval(i,j,12);
               BNodevalue(i,p,13)=BNodeval(i,j,13);
               BNodevalue(i,p,14)=BNodeval(i,j,14);
               BNodevalue(i,p,15)=BNodeval(i,j,15);
               BNodevalue(i,p,16)=BNodeval(i,j,16);
               p=p+1;     
               
            end % ~ coordinate end

            % ------------------------------- Internal Node Number E
            
         end % for end
      end % No Bracing end
      
   end % for end    
   % ********************************************************** ADD STEP E 
   
   % *********************************************************** Sorting S 
   L0 = BNodevalue; % Initial data Set
   % Distance from i node
   for i = 1:mem
      if ~isequal(max(BNodevalue(i,:,2)),0) % No Bracing
         for j = 1:max(BNodevalue(i,:,2))
            dX0(j,1) = JNodevalue_i(i,3)-BNodevalue(i,j,3);
            dY0(j,1) = JNodevalue_i(i,4)-BNodevalue(i,j,4);
            dZ0(j,1) = JNodevalue_i(i,5)-BNodevalue(i,j,5);           
            L0(i,j,16) = sqrt( ( dX0(j,1) )^2 +( dY0(j,1) )^2+( dZ0(j,1) )^2  ) ;
         end
      end
   end  
%    fprintf('L0')
%    L0
   % Sort whole columns with respect to distance from i node
   L1=[];BNodevalueOrder=[];
   
   for i = 1:mem    
      if isequal(max(BNodevalue(i,:,2)),0) % No Bracing
%          for n=1:max(BNodevalue(:,:,2))
            BNodevalueOrder(i,1,1) = L0(i,1,1);
            BNodevalueOrder(i,1,2) = L0(i,1,2);
%          end
      else
         for j = 1:max(BNodevalue(i,:,2))
            L1(j,:) =  L0(i,j,:);   
         end
         L1 = sortrows(L1,16);
%          fprintf('segm code L1')
%          L1
         for j = 1:max(BNodevalue(i,:,2))
            for k = 1:16
               BNodevalueOrder(i,j,k) = L1(j,k);
            end  
         end        
         L1(:,:)=[];
      end
   end
%    fprintf('BNodevalueorder at last')
%    BNodevalueOrder
   % Reset BNodevalue Using Sorted BNodevalueOrder
   BNodevalue=BNodevalueOrder;
   % *********************************************************** Sorting E   




end % if JNodevalue end

