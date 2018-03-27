function    [RNCc,Nshe1,Nshe2,DUP1,DUP2,NCc,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Mhe1,Mhe2,Bhg,Thg,CSg,Mhg,BNC1,BNC2,FEL,error]=SABRE2LBCODE(JNodevalue,...
   Massemble,JNodevalue_i,JNodevalue_j,Rval,BNodevalue,SNodevalue,...
   RNCc,Nshe1,Nshe2,DUP1,DUP2,NCc,LNC,LUEC,PNC,BNC,BNC1,BNC2,FEL,Bhe1,Bhe2,The1,The2,SGhe1,SGhe2,Mhe1,Mhe2,Bhg,Thg,CSg,Mhg,LabType,pt_title_name,axesm,vstm)
% Developed by Woo Yong Jeong.
% Date : 07/01/2013.
% ------------------------------------------------------------------------
% --------------     Conditions & Node generator        ------------------
% ------------------------------------------------------------------------
error=0;

if ~isempty(JNodevalue)&& ~isempty(Massemble) && ~isempty(BNodevalue)...
      && ~isempty(JNodevalue_i) && ~isempty(JNodevalue_j)  ...
      && ~isempty(SNodevalue)
  
   xn = sum(sum(SNodevalue(:,:,3)));   % Total number of Elements
   mem=length(Massemble(:,1));         % Total number of members     
   smem=max(SNodevalue(:,1,1));
   for i = 1:mem
      if  smem < mem
         error=error+1;
      else
         snu(i,1)=max(SNodevalue(i,:,2));
         bnu(i,1)=max(BNodevalue(i,:,2))+1;
         if ~isequal(snu(i,1),bnu(i,1))
            error=error+1;
         end
      end
   end

if ~isequal(error,0)
   set(pt_title_name,'String','Please Assign materials & subdivide Element(s)')
   set(pt_title_name,'Visible','on')   
else
   % Sassemble Assemble including Member & Bracing
   % Sassemble : Nodal Points
   for k = 1:14
      for i = 1:mem
      Sassemble(i,1,k) =JNodevalue_i(i,k);
      if isequal(max(BNodevalue(i,:,2)),0) % No Bracing
      else
         for j = 1:max(BNodevalue(i,:,2))
            Sassemble(i,j+1,k) = BNodevalue(i,j,k);
         end
      end
      Sassemble(i,max(BNodevalue(i,:,2))+2,k) =JNodevalue_j(i,k);
      end
   end
   % *********************************************** Njbode
   q = 1; r = 1;
   for i = 1:mem   
      Njbode(q,1)=r;
      Njbode(q,2)=Sassemble(i,1,1);
      Njbode(q,3)=Sassemble(i,1,3);
      Njbode(q,4)=Sassemble(i,1,4);
      Njbode(q,5)=Sassemble(i,1,5);
      Njbode(q,6)=Sassemble(i,1,6);
      Njbode(q,7)=Sassemble(i,1,7);
      Njbode(q,8)=Sassemble(i,1,8);
      Njbode(q,9)=Sassemble(i,1,9);
      Njbode(q,10)=Sassemble(i,1,10);
      Njbode(q,11)=Sassemble(i,1,11);
      Njbode(q,12)=Sassemble(i,1,12);
      Njbode(q,13)=Sassemble(i,1,13);
      Njbode(q,14)=Sassemble(i,1,14);
      Njbode(q,15)=q; 
      for j = 1:max(SNodevalue(i,:,2))   
         Njbode(q+j,1)=Njbode(q+j-1,1)+SNodevalue(i,j,3);
         Njbode(q+j,2)=Sassemble(i,j+1,1);
         Njbode(q+j,3)=Sassemble(i,j+1,3);
         Njbode(q+j,4)=Sassemble(i,j+1,4);
         Njbode(q+j,5)=Sassemble(i,j+1,5);
         Njbode(q+j,6)=Sassemble(i,j+1,6);
         Njbode(q+j,7)=Sassemble(i,j+1,7);
         Njbode(q+j,8)=Sassemble(i,j+1,8);
         Njbode(q+j,9)=Sassemble(i,j+1,9);
         Njbode(q+j,10)=Sassemble(i,j+1,10);
         Njbode(q+j,11)=Sassemble(i,j+1,11);
         Njbode(q+j,12)=Sassemble(i,j+1,12);
         Njbode(q+j,13)=Sassemble(i,j+1,13);
         Njbode(q+j,14)=Sassemble(i,j+1,14);
         Njbode(q+j,15)=q+j;  
      end
      r = sum(SNodevalue(i,:,3))+r;
      q = max(SNodevalue(i,:,2))+q+1;  
   end

   % *********************************************** NC with Duplication
   nodep=[];xgp=[];ygp=[];zgp=[];bfbp=[];bftp=[];tfbp=[];
   tftp=[];dp=[];twp=[];dwp=[];hp=[];Afilp=[];
   q = 0;
   for i =1:mem
      for j = 1:max(SNodevalue(i,:,2)) 
         nodes=[Njbode(q+j,1);Njbode(q+j+1,1)];
         xgs=[Njbode(q+j,3);Njbode(q+j+1,3)]; 
         ygs=[Njbode(q+j,4);Njbode(q+j+1,4)];
         zgs=[Njbode(q+j,5);Njbode(q+j+1,5)];
         bfbs=[Njbode(q+j,6);Njbode(q+j+1,6)]; 
         tfbs=[Njbode(q+j,7);Njbode(q+j+1,7)];
         bfts=[Njbode(q+j,8);Njbode(q+j+1,8)];   
         tfts=[Njbode(q+j,9);Njbode(q+j+1,9)]; 
         dws=[Njbode(q+j,10);Njbode(q+j+1,10)];
         tws=[Njbode(q+j,11);Njbode(q+j+1,11)]; 
         ds=[Njbode(q+j,12);Njbode(q+j+1,12)];
         hs=[Njbode(q+j,13);Njbode(q+j+1,13)]; 
         Afil=[Njbode(q+j,14);Njbode(q+j+1,14)]; 
         
         % linear interpolation
         if isequal(j,max(SNodevalue(i,:,2)))
            nodesb=interp1(nodes,nodes,(Njbode(q+j,1):Njbode(q+j+1,1))');
            xgsb=interp1(nodes,xgs,(Njbode(q+j,1):Njbode(q+j+1,1))');
            ygsb=interp1(nodes,ygs,(Njbode(q+j,1):Njbode(q+j+1,1))');
            zgsb=interp1(nodes,zgs,(Njbode(q+j,1):Njbode(q+j+1,1))'); 
            bfbsb=interp1(nodes,bfbs,(Njbode(q+j,1):Njbode(q+j+1,1))');
            tfbsb=interp1(nodes,tfbs,(Njbode(q+j,1):Njbode(q+j+1,1))');
            bftsb=interp1(nodes,bfts,(Njbode(q+j,1):Njbode(q+j+1,1))'); 
            tftsb=interp1(nodes,tfts,(Njbode(q+j,1):Njbode(q+j+1,1))');
            dwsb=interp1(nodes,dws,(Njbode(q+j,1):Njbode(q+j+1,1))');
            twsb=interp1(nodes,tws,(Njbode(q+j,1):Njbode(q+j+1,1))');  
            dsb=interp1(nodes,ds,(Njbode(q+j,1):Njbode(q+j+1,1))');
            hsb=interp1(nodes,hs,(Njbode(q+j,1):Njbode(q+j+1,1))');
            Afilb=interp1(nodes,Afil,(Njbode(q+j,1):Njbode(q+j+1,1))');
         else            
            nodesb=interp1(nodes,nodes,(Njbode(q+j,1):(Njbode(q+j+1,1))-1)');
            xgsb=interp1(nodes,xgs,(Njbode(q+j,1):(Njbode(q+j+1,1))-1)');
            ygsb=interp1(nodes,ygs,(Njbode(q+j,1):(Njbode(q+j+1,1))-1)');
            zgsb=interp1(nodes,zgs,(Njbode(q+j,1):(Njbode(q+j+1,1))-1)');
            bfbsb=interp1(nodes,bfbs,(Njbode(q+j,1):(Njbode(q+j+1,1))-1)');
            tfbsb=interp1(nodes,tfbs,(Njbode(q+j,1):(Njbode(q+j+1,1))-1)');
            bftsb=interp1(nodes,bfts,(Njbode(q+j,1):(Njbode(q+j+1,1))-1)'); 
            tftsb=interp1(nodes,tfts,(Njbode(q+j,1):(Njbode(q+j+1,1))-1)');
            dwsb=interp1(nodes,dws,(Njbode(q+j,1):(Njbode(q+j+1,1))-1)');
            twsb=interp1(nodes,tws,(Njbode(q+j,1):(Njbode(q+j+1,1))-1)'); 
            dsb=interp1(nodes,ds,(Njbode(q+j,1):(Njbode(q+j+1,1))-1)');
            hsb=interp1(nodes,hs,(Njbode(q+j,1):(Njbode(q+j+1,1))-1)');
            Afilb=interp1(nodes,Afil,(Njbode(q+j,1):(Njbode(q+j+1,1))-1)');
         end          
               
         nodenum = [nodep;nodesb];
         nodep=nodenum;
         xgnum = [xgp;xgsb];
         xgp=xgnum;
         ygnum = [ygp;ygsb];
         ygp=ygnum; 
         zgnum = [zgp;zgsb];
         zgp=zgnum;   
         bfbnum = [bfbp;bfbsb];
         bfbp=bfbnum;
         tfbnum = [tfbp;tfbsb];
         tfbp=tfbnum;           
         bftnum = [bftp;bftsb];
         bftp=bftnum; 
         tftnum = [tftp;tftsb];
         tftp=tftnum;
         dwnum = [dwp;dwsb];
         dwp=dwnum; 
         twnum = [twp;twsb];
         twp=twnum;  
         dnum = [dp;dsb];
         dp=dnum;
         hnum = [hp;hsb];
         hp=hnum;
         Afilnum = [Afilp;Afilb];
         Afilp=Afilnum;         
      end
      q = max(SNodevalue(i,:,2))+q+1;  
     
   end
   % integer
   nodenum = round(nodenum);
   NC =[nodenum,xgnum,ygnum,zgnum,bfbnum,tfbnum,bftnum,tftnum,dwnum,twnum,dnum,hnum,Afilnum];  

   % *********************************************** NCa
   % Set duplated nodes as zeros.
   q = 0;NCa=[];
%    SNodevalue
   for i=1:mem  
      for j=1:sum(SNodevalue(i,:,3))+1        
         if isequal(i,1)
             fprintf('\n## if 1\n')
            NCa(j+q,1)=NC(j+q,1);
            NCa(j+q,2)=NC(j+q,2);
            NCa(j+q,3)=NC(j+q,3);
            NCa(j+q,4)=NC(j+q,4);
            NCa(j+q,5)=NC(j+q,5);
            NCa(j+q,6)=NC(j+q,6);
            NCa(j+q,7)=NC(j+q,7);
            NCa(j+q,8)=NC(j+q,8);
            NCa(j+q,9)=NC(j+q,9);
            NCa(j+q,10)=NC(j+q,10);
            NCa(j+q,11)=NC(j+q,11);
            NCa(j+q,12)=NC(j+q,12);
            NCa(j+q,13)=NC(j+q,13);
            NCa(j+q,14)=0;
            NCa(j+q,15)=0;
            NCa(j+q,16)=0;
            
            mn = length(NCa(:,1));
         else
             fprintf('\n## else 1\n')
            if isequal(j,1)
                fprintf('\n## if 2\n')
               for n = 1:mn                 
                  if isequal(NCa(n,2),NC(j+q,2)) ...
                        && isequal(NCa(n,3),NC(j+q,3)) ...
                        && isequal(NCa(n,4),NC(j+q,4)) && isequal(NCa(n,14),0)  
                    fprintf('\n## if 3\n')
                     NCa(j+q,1)=0;
                     NCa(j+q,2)=0;
                     NCa(j+q,3)=0;
                     NCa(j+q,4)=0;
                     NCa(j+q,5)=0;
                     NCa(j+q,6)=0;
                     NCa(j+q,7)=0;
                     NCa(j+q,8)=0; 
                     NCa(j+q,9)=0;
                     NCa(j+q,10)=0;                     
                     NCa(j+q,11)=0;
                     NCa(j+q,12)=0;
                     NCa(j+q,13)=0;
                     NCa(j+q,14)=n; 
                     NCa(j+q,15)=i;
                     NCa(j+q,16)=j;
                     break; % Stop loof if satisfy the creterian.
       
                  else
                      fprintf('\n## else 3\n')
                     NCa(j+q,1)=NC(j+q,1);
                     NCa(j+q,2)=NC(j+q,2);
                     NCa(j+q,3)=NC(j+q,3);
                     NCa(j+q,4)=NC(j+q,4);
                     NCa(j+q,5)=NC(j+q,5);
                     NCa(j+q,6)=NC(j+q,6);
                     NCa(j+q,7)=NC(j+q,7);
                     NCa(j+q,8)=NC(j+q,8);
                     NCa(j+q,9)=NC(j+q,9);
                     NCa(j+q,10)=NC(j+q,10);
                     NCa(j+q,11)=NC(j+q,11);
                     NCa(j+q,12)=NC(j+q,12);
                     NCa(j+q,13)=NC(j+q,13);
                     NCa(j+q,14)=0;
                     NCa(j+q,15)=0;
                     NCa(j+q,16)=0;                     

                  end   
               end   
            elseif isequal(j,sum(SNodevalue(i,:,3))+1)
%                 fprintf('\n## elif 2\n')
%                 mn
               for n = 1:mn
                  if isequal(NCa(n,2),NC(j+q,2)) ...
                        && isequal(NCa(n,3),NC(j+q,3)) ... 
                        && isequal(NCa(n,4),NC(j+q,4)) && isequal(NCa(n,14),0)   
                    fprintf('\n## if 4\n')
                     NCa(j+q,1)=0;
                     NCa(j+q,2)=0;
                     NCa(j+q,3)=0;
                     NCa(j+q,4)=0;
                     NCa(j+q,5)=0;
                     NCa(j+q,6)=0;
                     NCa(j+q,7)=0;
                     NCa(j+q,8)=0; 
                     NCa(j+q,9)=0;
                     NCa(j+q,10)=0;                     
                     NCa(j+q,11)=0;
                     NCa(j+q,12)=0;
                     NCa(j+q,13)=0;
                     NCa(j+q,14)=n;
                     NCa(j+q,15)=i;
                     NCa(j+q,16)=j;
                     
                     break;
                  
                  else
                      fprintf('\n## else 4\n')
                     NCa(j+q,1)=NC(j+q,1);
                     NCa(j+q,2)=NC(j+q,2);
                     NCa(j+q,3)=NC(j+q,3);
                     NCa(j+q,4)=NC(j+q,4);
                     NCa(j+q,5)=NC(j+q,5);
                     NCa(j+q,6)=NC(j+q,6);
                     NCa(j+q,7)=NC(j+q,7);
                     NCa(j+q,8)=NC(j+q,8);
                     NCa(j+q,9)=NC(j+q,9);
                     NCa(j+q,10)=NC(j+q,10);
                     NCa(j+q,11)=NC(j+q,11);
                     NCa(j+q,12)=NC(j+q,12);
                     NCa(j+q,13)=NC(j+q,13);
                     NCa(j+q,14)=0;
                     NCa(j+q,15)=0;
                     NCa(j+q,16)=0;                     

                  end 
               end   
            else
                fprintf('\n## else 2\n')
               NCa(j+q,1)=NC(j+q,1);
               NCa(j+q,2)=NC(j+q,2);
               NCa(j+q,3)=NC(j+q,3);
               NCa(j+q,4)=NC(j+q,4);
               NCa(j+q,5)=NC(j+q,5);
               NCa(j+q,6)=NC(j+q,6);
               NCa(j+q,7)=NC(j+q,7);
               NCa(j+q,8)=NC(j+q,8);
               NCa(j+q,9)=NC(j+q,9);
               NCa(j+q,10)=NC(j+q,10);
               NCa(j+q,11)=NC(j+q,11);
               NCa(j+q,12)=NC(j+q,12);
               NCa(j+q,13)=NC(j+q,13);
               NCa(j+q,14)=0;
               NCa(j+q,15)=0;
               NCa(j+q,16)=0;               
               
            end % if end
         end % if end   
      end % for j end
      mn = length(NCa(:,1)); 
      q = sum(SNodevalue(i,:,3))+q+1;
   end % for i end
%    NCa

   % *********************************************** NCb & NCc 
   % Node data without duplication
   r=1;
   for i = 1:length(NCa(:,1))
      if ~isequal(NCa(i,1),0)
         NCb(r,1)=r;
         NCb(r,2)=NCa(i,2);
         NCb(r,3)=NCa(i,3);
         NCb(r,4)=NCa(i,4);
         NCb(r,5)=NCa(i,5);
         NCb(r,6)=NCa(i,6);
         NCb(r,7)=NCa(i,7);
         NCb(r,8)=NCa(i,8);
         NCb(r,9)=NCa(i,9);
         NCb(r,10)=NCa(i,10);
         NCb(r,11)=NCa(i,11);
         NCb(r,12)=NCa(i,12);
         NCb(r,13)=NCa(i,13);
         r=r+1;
      end
   end
   NCc = NCb;
   NCb
   % *********************************************** DUP with Duplication 
   DUP=[];
   for i=1:length(NC(:,1))   
      for j=1:length(NCc(:,1))      
         if isequal(NC(i,2),NCc(j,2)) && isequal(NC(i,3),NCc(j,3)) ...
               && isequal(NC(i,4),NCc(j,4))
            DUP(i,1)=i;
            DUP(i,2) = NCc(j,1);
            DUP(i,3) = NCc(j,2);
            DUP(i,4) = NCc(j,3);
            DUP(i,5) = NCc(j,4);
            DUP(i,6) = NCc(j,5);
            DUP(i,7) = NCc(j,6);
            DUP(i,8) = NCc(j,7);
            DUP(i,9) = NCc(j,8);
            DUP(i,10) = NCc(j,9);
            DUP(i,11) = NCc(j,10);
            DUP(i,12) = NCc(j,11);
            DUP(i,13) = NCc(j,12); 
            DUP(i,14) = NCc(j,13); 
         end         
      end      
   end
   DUP

   % *********************************************** DUP1 & DUP2
   q = 0;r=0;DUP1=[];DUP2=[];
   for i=1:mem  
      for j=1:sum(SNodevalue(i,:,3))
         % i node
         DUP1(j+r,1) = j+r; 
         DUP1(j+r,2) = DUP(j+q,2);
         DUP1(j+r,3) = NC(j+q,2); 
         DUP1(j+r,4) = NC(j+q,3);         
         DUP1(j+r,5) = NC(j+q,4);
         DUP1(j+r,6) = NC(j+q,5); 
         DUP1(j+r,7) = NC(j+q,6);          
         DUP1(j+r,8) = NC(j+q,7);
         DUP1(j+r,9) = NC(j+q,8); 
         DUP1(j+r,10) = NC(j+q,9);
         DUP1(j+r,11) = NC(j+q,10);         
         DUP1(j+r,12) = NC(j+q,11);
         DUP1(j+r,13) = NC(j+q,12); 
         DUP1(j+r,14) = NC(j+q,13); 
         
          % j node
         DUP2(j+r,1) = j+r; 
         DUP2(j+r,2) = DUP(j+q+1,2);
         DUP2(j+r,3) = NC(j+q+1,2); 
         DUP2(j+r,4) = NC(j+q+1,3);         
         DUP2(j+r,5) = NC(j+q+1,4);
         DUP2(j+r,6) = NC(j+q+1,5); 
         DUP2(j+r,7) = NC(j+q+1,6);          
         DUP2(j+r,8) = NC(j+q+1,7);
         DUP2(j+r,9) = NC(j+q+1,8); 
         DUP2(j+r,10) = NC(j+q+1,9);
         DUP2(j+r,11) = NC(j+q+1,10);         
         DUP2(j+r,12) = NC(j+q+1,11);
         DUP2(j+r,13) = NC(j+q+1,12);
         DUP2(j+r,14) = NC(j+q+1,13);

      end % for j end
      q = sum(SNodevalue(i,:,3))+q+1;
      r = sum(SNodevalue(i,:,3))+r;
   end % for i end      
   
%    DUP1
%    DUP2

% ------------------------------------------------------------------------
% ----------------------      Model generation       ---------------------
% ------------------------------------------------------------------------
% Nodes for each element (# ele, #node start, #node end)
MI=[DUP1(:,1),DUP1(:,2),DUP2(:,2)];

% Global frame coordinates at each element.
% Start node : node(1) and end node : node(2) for each element
xg1=DUP1(:,3);xg2=DUP2(:,3);  % element length : xg1(start) xg2(end)
yg1=DUP1(:,4);yg2=DUP2(:,4);  % element length : xg1(start) xg2(end)
zg1=DUP1(:,5);zg2=DUP2(:,5);  % element length : xg1(start) xg2(end)

% Section properties at each element under natural frame
bfb1=DUP1(:,6);bfb2=DUP2(:,6);  % Bottom flange width
tfb1=DUP1(:,7);tfb2=DUP2(:,7);  % Bottom flange thickness
bft1=DUP1(:,8);bft2=DUP2(:,8);  % Top flange width
tft1=DUP1(:,9);tft2=DUP2(:,9);  % Top flange thickness
Dg1=DUP1(:,10);Dg2=DUP2(:,10);  % dw:Web depth (y-dir)
tw1=DUP1(:,11);tw2=DUP2(:,11);  % dw:Web depth (y-dir)
hg1=DUP1(:,13);hg2=DUP2(:,13);  % h : Distance between flange centroids
% -------------------------- Geometric dimension of Cross-section : P299 S
% Mid-web depth 
Dt1=Dg1/2;        Dt2=Dg2/2;        % top of Web depth to mid web depth
Db1=Dt1;          Db2=Dt2;          % bottom of Web depth to mid web depth
ht1=Dt1+tft1/2;   ht2=Dt2+tft2/2;   % top flange centroid to mid web depth
hb1=Db1 + tfb1/2; hb2=Db2 + tfb2/2; % bottom flange centroid to mid web depth

% Shear center
% Start node
% bottom flange centroid to shear center
hsb1 = (tft1.*bft1.^3.*hg1)./(tfb1.*bfb1.^3+tft1.*bft1.^3); 
Dsb1 = hsb1 - tfb1/2; % bottom of Web depth to shear center
hst1 = hg1 - hsb1;    % top flange centroid to shear center
Dst1 = hst1 - tft1/2; % top of Web depth to shear center
% End node
% bottom flange centroid to shear center
hsb2 = (tft2.*bft2.^3.*hg2)./(tfb2.*bfb2.^3+tft2.*bft2.^3); 
Dsb2 = hsb2 - tfb2/2; % bottom of Web depth to shear center
hst2 = hg2 - hsb2;    % top flange centroid to shear center
Dst2 = hst2 - tft2/2;    % top of Web depth to shear center

% Centroid Axis ; ytbar = top flange to centroid
% Start node
Ag1 =  tft1.*bft1 + tw1.*Dg1  + tfb1.*bfb1;
ytbar1 = ( bft1.*tft1.*tft1/2+tw1.*Dg1.*(tft1+Dg1/2)+ bfb1.*tfb1.*(tft1+Dg1+tfb1/2) )./Ag1;
Dct1 = ytbar1 - tft1;   % top of Web depth to centroid
Dcb1 = Dg1 - Dct1;      % bottom of Web depth to centroid
hct1 = ytbar1 - tft1/2; % top flange centroid to centroid
hcb1 = hg1 - hct1;      % bottom flange centroid to centroid
% End node
Ag2 =  tft2.*bft2 + tw2.*Dg2  + tfb2.*bfb2;
ytbar2 = ( bft2.*tft2.*tft2/2+tw2.*Dg2.*(tft2+Dg2/2)+ bfb2.*tfb2.*(tft2+Dg2+tfb2/2) )./Ag2;
Dct2 = ytbar2 - tft2;   % top of Web depth to centroid
Dcb2 = Dg2 - Dct2;      % bottom of Web depth to centroid
hct2 = ytbar2 - tft2/2; % top flange centroid to centroid
hcb2 = hg2 - hct2;      % bottom flange centroid to centroid
CSD1 = hct1-hst1;
CSD2 = hct2-hst2;
% -------------------------- Geometric dimension of Cross-section : P299 E

% *** Global frame angle for each element without considering shear center
q = 0; alpharef = zeros(xn,2);    
for i = 1:mem
   for j=1:sum(SNodevalue(i,:,3))          
      opp = JNodevalue_j(i,4)-JNodevalue_i(i,4);  % element depth in y-dir
      adj = JNodevalue_j(i,3)-JNodevalue_i(i,3);  % element length in x-dir         
      alpharef(q+j,1)=MI(q+j,1);
      alpharef(q+j,2)=atan2(opp,adj); % Only global frame angle      
   end
 q = sum(SNodevalue(i,:,3))+q;
end

% Calculate Initial Member x-dir Nodal Coordinates for Each Member
[MemLength]=InitialEleLengthRendering(xg1,yg1,zg1,xg2,yg2,zg2,SNodevalue);

q = 0; val1=zeros(xn,1);
for i = 1:mem
   for j=1:sum(SNodevalue(i,:,3))
      val1(q+j,1) = Rval(i,2); % Rval : reference axis
   end
 q = sum(SNodevalue(i,:,3))+q;
end

NTshe1=zeros(xn,4);NTshe2=zeros(xn,4);
segnum(1,1)=0;          % (Start node number - 1) for each member
ys1=zeros(xn,1);ys2=zeros(xn,1);
for i = 1:mem
   switch Rval(i,2) 
      
      case 1                                    % mid-web depth; Rval=1
         
         for k = 1:sum(SNodevalue(i,:,3))
            ys1(k+segnum(i,1),1)=Dg1(k+segnum(i,1),1)/2 - Dst1(k+segnum(i,1),1); 
            ys2(k+segnum(i,1),1)=Dg2(k+segnum(i,1),1)/2 - Dst2(k+segnum(i,1),1);    % Shear center
            if isequal(k+segnum(i,1),segnum(i,1)+1)
               NTshe1(k+segnum(i,1),1)=k+segnum(i,1);
               NTshe2(k+segnum(i,1),1)=k+segnum(i,1);
               NTshe1(k+segnum(i,1),2)=0;
               NTshe2(k+segnum(i,1),2)=MemLength(k+segnum(i,1),1);
               NTshe1(k+segnum(i,1),3)=ys1(k+segnum(i,1),1);
               NTshe2(k+segnum(i,1),3)=ys2(k+segnum(i,1),1);
               NTshe1(k+segnum(i,1),4)=zg1(k+segnum(i,1),1);
               NTshe2(k+segnum(i,1),4)=zg2(k+segnum(i,1),1);
            else
               NTshe1(k+segnum(i,1),1)=k+segnum(i,1);
               NTshe2(k+segnum(i,1),1)=k+segnum(i,1);
               NTshe1(k+segnum(i,1),2)=MemLength(k+segnum(i,1)-1,1);
               NTshe2(k+segnum(i,1),2)=MemLength(k+segnum(i,1),1);
               NTshe1(k+segnum(i,1),3)=ys1(k+segnum(i,1),1);
               NTshe2(k+segnum(i,1),3)=ys2(k+segnum(i,1),1);
               NTshe1(k+segnum(i,1),4)=zg1(k+segnum(i,1),1);
               NTshe2(k+segnum(i,1),4)=zg2(k+segnum(i,1),1);
            end
         end      

      case 2                                 % top of web; val = 2
         
         for k = 1:sum(SNodevalue(i,:,3))
            ys1(k+segnum(i,1),1)=-Dst1(k+segnum(i,1),1);
            ys2(k+segnum(i,1),1)=-Dst2(k+segnum(i,1),1);                % Shear center
            if isequal(k+segnum(i,1),segnum(i,1)+1)
               NTshe1(k+segnum(i,1),1)=k+segnum(i,1);
               NTshe2(k+segnum(i,1),1)=k+segnum(i,1);
               NTshe1(k+segnum(i,1),2)=0;
               NTshe2(k+segnum(i,1),2)=MemLength(k+segnum(i,1),1);
               NTshe1(k+segnum(i,1),3)=ys1(k+segnum(i,1),1);
               NTshe2(k+segnum(i,1),3)=ys2(k+segnum(i,1),1);
               NTshe1(k+segnum(i,1),4)=zg1(k+segnum(i,1),1);
               NTshe2(k+segnum(i,1),4)=zg2(k+segnum(i,1),1);
            else
               NTshe1(k+segnum(i,1),1)=k+segnum(i,1);
               NTshe2(k+segnum(i,1),1)=k+segnum(i,1);
               NTshe1(k+segnum(i,1),2)=MemLength(k+segnum(i,1)-1,1);
               NTshe2(k+segnum(i,1),2)=MemLength(k+segnum(i,1),1);
               NTshe1(k+segnum(i,1),3)=ys1(k+segnum(i,1),1);
               NTshe2(k+segnum(i,1),3)=ys2(k+segnum(i,1),1);
               NTshe1(k+segnum(i,1),4)=zg1(k+segnum(i,1),1);
               NTshe2(k+segnum(i,1),4)=zg2(k+segnum(i,1),1);
            end
         end        
         
      case 3                              % bottom of web; val = 3
         
         for k = 1:sum(SNodevalue(i,:,3))
            ys1(k+segnum(i,1),1)=Dsb1(k+segnum(i,1),1); 
            ys2(k+segnum(i,1),1)=Dsb2(k+segnum(i,1),1);              % Shear center
            if isequal(k+segnum(i,1),segnum(i,1)+1)
               NTshe1(k+segnum(i,1),1)=k+segnum(i,1);
               NTshe2(k+segnum(i,1),1)=k+segnum(i,1);
               NTshe1(k+segnum(i,1),2)=0;
               NTshe2(k+segnum(i,1),2)=MemLength(k+segnum(i,1),1);
               NTshe1(k+segnum(i,1),3)=ys1(k+segnum(i,1),1);
               NTshe2(k+segnum(i,1),3)=ys2(k+segnum(i,1),1);
               NTshe1(k+segnum(i,1),4)=zg1(k+segnum(i,1),1);
               NTshe2(k+segnum(i,1),4)=zg2(k+segnum(i,1),1);
            else
               NTshe1(k+segnum(i,1),1)=k+segnum(i,1);
               NTshe2(k+segnum(i,1),1)=k+segnum(i,1);
               NTshe1(k+segnum(i,1),2)=MemLength(k+segnum(i,1)-1,1);
               NTshe2(k+segnum(i,1),2)=MemLength(k+segnum(i,1),1);
               NTshe1(k+segnum(i,1),3)=ys1(k+segnum(i,1),1);
               NTshe2(k+segnum(i,1),3)=ys2(k+segnum(i,1),1);
               NTshe1(k+segnum(i,1),4)=zg1(k+segnum(i,1),1);
               NTshe2(k+segnum(i,1),4)=zg2(k+segnum(i,1),1);
            end
         end
   end 
   segnum(i+1,1) = segnum(i,1) + sum(SNodevalue(i,:,3));
end   

% Preallocationg
taper1 = zeros(xn,3); taper2 = zeros(xn,3);
for n = 1:xn
[tap1,tap2]=TapedEleLength(NTshe1(n,2),NTshe1(n,3),NTshe1(n,4), ...
   NTshe2(n,2),NTshe2(n,3),NTshe2(n,4),alpharef(n,2));
taper1(n,:)=tap1; % Which is the same as xg.
taper2(n,:)=tap2; % Which is the same as yg.
end  

% Starting Node for each member
segnum(1,1)=0;    % (Start node number - 1) for each member
NG1=zeros(xn,3);NG2=zeros(xn,3);
for i = 1:mem
   for k = 1:sum(SNodevalue(i,:,3))            
      NG1(k+segnum(i,1),1)=DUP1(segnum(i,1)+1,3);
      NG2(k+segnum(i,1),1)=DUP1(segnum(i,1)+1,3);
      NG1(k+segnum(i,1),2)=DUP1(segnum(i,1)+1,4);
      NG2(k+segnum(i,1),2)=DUP1(segnum(i,1)+1,4);
      NG1(k+segnum(i,1),3)=DUP1(segnum(i,1)+1,5);
      NG2(k+segnum(i,1),3)=DUP1(segnum(i,1)+1,5);
   end
   segnum(i+1,1) = segnum(i,1) + sum(SNodevalue(i,:,3));
end

% ******************************************************
% Global frame nodal coordinates w.r.t Shear center
% Original Shear Center
Nshe1 = [];Nshe2 = [];
Nshe1(:,1)=taper1(:,1)+NG1(:,1);
Nshe2(:,1)=taper2(:,1)+NG2(:,1);
Nshe1(:,2)=taper1(:,2)+NG1(:,2);
Nshe2(:,2)=taper2(:,2)+NG2(:,2);
Nshe1(:,3)=taper1(:,3)+NG1(:,3);
Nshe2(:,3)=taper2(:,3)+NG2(:,3);

% Initial Global frame nodal coordinates w.r.t Shear center
xg1=Nshe1(:,1);
yg1=Nshe1(:,2);
zg1=Nshe1(:,3);
xg2=Nshe2(:,1);
yg2=Nshe2(:,2);
zg2=Nshe2(:,3);

SNshe1=Nshe1;
SNshe2=Nshe2;

% ------------------------------------------------------------------------
% -------     Update Intersection Nodes for shear cneter      ------------
% ------------------------------------------------------------------------
r=0; PP=zeros(mem,7);
% PP=[member, start el, end el, 
%     node1 for start el, node2 for start el,node1 for end el, node2 for end el] 
for i = 1:mem
   for j = 1:sum(SNodevalue(i,:,3))      
      PP(i,1)=i;             
      if isequal(j,1)
         PP(i,2)=r+j;
         PP(i,4)=MI(r+j,2);
         PP(i,5)=MI(r+j,3);
      elseif isequal(j,sum(SNodevalue(i,:,3)))
         PP(i,3)=r+j;
         PP(i,6)=MI(r+j,2);
         PP(i,7)=MI(r+j,3);            
      end
   end
   r = r+sum(SNodevalue(i,:,3));
end

%-------------------------------------------
r=0;
for i=1:mem
   q=0;
   if isequal(sum(SNodevalue(i,:,3)),1)   
      for j=1:mem
         if isequal(sum(SNodevalue(j,:,3)),1)
            if ~isequal(i,j)
               if isequal(PP(i,4),PP(j,4)) %start node j=1     
                  x1 = xg1(r+1,1); y1 = yg1(r+1,1);
                  x2 = xg2(r+1,1); y2 = yg2(r+1,1);
                  x3 = xg1(q+1,1); y3 = yg1(q+1,1);
                  x4 = xg2(q+1,1); y4 = yg2(q+1,1);   
                  Px1 = (x1*y2-y1*x2)*(x3-x4)-(x1-x2)*(x3*y4-y3*x4);
                  Py1 = (x1*y2-y1*x2)*(y3-y4)-(y1-y2)*(x3*y4-y3*x4);
                  Pxy1 = ((x1-x2)*(y3-y4)-(y1-y2)*(x3-x4));
                  if isequal(round(abs(Pxy1)),0)
                     Px = x3;
                     Py = y3;
                  else
                     Px = Px1/Pxy1;
                     Py = Py1/Pxy1;              
                  end
                  for k = 1:xn
                     if isequal(x3,xg1(k,1)) && isequal(y3,yg1(k,1))
                        xg1(k,1)=Px; yg1(k,1)=Py; 
                     elseif isequal(x3,xg2(k,1)) && isequal(y3,yg2(k,1))
                        xg2(k,1)=Px; yg2(k,1)=Py;                   
                     end
                  end
               %---                  
               elseif isequal(PP(i,4),PP(j,5))      
                  x1 = xg1(r+1,1); y1 = yg1(r+1,1);
                  x2 = xg2(r+1,1); y2 = yg2(r+1,1);
                  x3 = xg1(q+ sum(SNodevalue(j,:,3)),1); y3 = yg1(q+ sum(SNodevalue(j,:,3)),1);
                  x4 = xg2(q+ sum(SNodevalue(j,:,3)),1); y4 = yg2(q+ sum(SNodevalue(j,:,3)),1);           
                  Px1 = (x1*y2-y1*x2)*(x3-x4)-(x1-x2)*(x3*y4-y3*x4);
                  Py1 = (x1*y2-y1*x2)*(y3-y4)-(y1-y2)*(x3*y4-y3*x4);
                  Pxy1 = ((x1-x2)*(y3-y4)-(y1-y2)*(x3-x4));
                  if isequal(round(abs(Pxy1)),0)
                     Px = x4;
                     Py = y4;
                  else
                     Px = Px1/Pxy1;
                     Py = Py1/Pxy1;              
                  end
                  for k = 1:xn
                     if isequal(x4,xg1(k,1)) && isequal(y4,yg1(k,1))
                        xg1(k,1)=Px; yg1(k,1)=Py; 
                     elseif isequal(x4,xg2(k,1)) && isequal(y4,yg2(k,1))
                        xg2(k,1)=Px; yg2(k,1)=Py;                   
                     end
                  end            

               elseif isequal(PP(i,5),PP(j,4)) %end node j=sum(SNodevalue(i,:,3))              
                  x1 = xg1(r+sum(SNodevalue(i,:,3)),1); y1 = yg1(r+sum(SNodevalue(i,:,3)),1);
                  x2 = xg2(r+sum(SNodevalue(i,:,3)),1); y2 = yg2(r+sum(SNodevalue(i,:,3)),1);
                  x3 = xg1(q+1,1); y3 = yg1(q+1,1);
                  x4 = xg2(q+1,1); y4 = yg2(q+1,1);   
                  Px1 = (x1*y2-y1*x2)*(x3-x4)-(x1-x2)*(x3*y4-y3*x4);
                  Py1 = (x1*y2-y1*x2)*(y3-y4)-(y1-y2)*(x3*y4-y3*x4);
                  Pxy1 = ((x1-x2)*(y3-y4)-(y1-y2)*(x3-x4));
                  if isequal(round(abs(Pxy1)),0)
                     Px = x3;
                     Py = y3;
                  else
                     Px = Px1/Pxy1;
                     Py = Py1/Pxy1;              
                  end
                  for k = 1:xn
                     if isequal(x3,xg1(k,1)) && isequal(y3,yg1(k,1))
                        xg1(k,1)=Px; yg1(k,1)=Py; 
                     elseif isequal(x3,xg2(k,1)) && isequal(y3,yg2(k,1))
                        xg2(k,1)=Px; yg2(k,1)=Py;                   
                     end
                  end            

               elseif isequal(PP(i,5),PP(j,5))
                  x1 = xg1(r+sum(SNodevalue(i,:,3)),1); y1 = yg1(r+sum(SNodevalue(i,:,3)),1);
                  x2 = xg2(r+sum(SNodevalue(i,:,3)),1); y2 = yg2(r+sum(SNodevalue(i,:,3)),1);
                  x3 = xg1(q+ sum(SNodevalue(j,:,3)),1); y3 = yg1(q+ sum(SNodevalue(j,:,3)),1);
                  x4 = xg2(q+ sum(SNodevalue(j,:,3)),1); y4 = yg2(q+ sum(SNodevalue(j,:,3)),1);             
                  Px1 = (x1*y2-y1*x2)*(x3-x4)-(x1-x2)*(x3*y4-y3*x4);
                  Py1 = (x1*y2-y1*x2)*(y3-y4)-(y1-y2)*(x3*y4-y3*x4);
                  Pxy1 = ((x1-x2)*(y3-y4)-(y1-y2)*(x3-x4));
                  if isequal(round(abs(Pxy1)),0)
                     Px = x4;
                     Py = y4;
                  else
                     Px = Px1/Pxy1;
                     Py = Py1/Pxy1;               
                  end
                  for k = 1:xn
                     if isequal(x4,xg1(k,1)) && isequal(y4,yg1(k,1))
                        xg1(k,1)=Px; yg1(k,1)=Py; 
                     elseif isequal(x4,xg2(k,1)) && isequal(y4,yg2(k,1))
                        xg2(k,1)=Px; yg2(k,1)=Py;                   
                     end
                  end               
               %---              
               end % isequal(PP(i,4),PP(j,4)) %start node j=1 
            end % ~isequal(i,j)
            
         else
            if ~isequal(i,j)
               if isequal(PP(i,4),PP(j,4)) %start node j=1     
                  x1 = xg1(r+1,1); y1 = yg1(r+1,1);
                  x2 = xg2(r+1,1); y2 = yg2(r+1,1);
                  x3 = xg1(q+1,1); y3 = yg1(q+1,1);
                  x4 = xg2(q+1,1); y4 = yg2(q+1,1);   
                  Px1 = (x1*y2-y1*x2)*(x3-x4)-(x1-x2)*(x3*y4-y3*x4);
                  Py1 = (x1*y2-y1*x2)*(y3-y4)-(y1-y2)*(x3*y4-y3*x4);
                  Pxy1 = ((x1-x2)*(y3-y4)-(y1-y2)*(x3-x4));
                  if isequal(round(abs(Pxy1)),0)
                     Px = x3;
                     Py = y3;
                  else
                     Px = Px1/Pxy1;
                     Py = Py1/Pxy1;               
                  end
                  for k = 1:xn
                     if isequal(x3,xg1(k,1)) && isequal(y3,yg1(k,1))
                        xg1(k,1)=Px; yg1(k,1)=Py; 
                     elseif isequal(x3,xg2(k,1)) && isequal(y3,yg2(k,1))
                        xg2(k,1)=Px; yg2(k,1)=Py;                   
                     end
                  end

               elseif isequal(PP(i,4),PP(j,7))         
                  x1 = xg1(r+1,1); y1 = yg1(r+1,1);
                  x2 = xg2(r+1,1); y2 = yg2(r+1,1);
                  x3 = xg1(q+ sum(SNodevalue(j,:,3)),1); y3 = yg1(q+ sum(SNodevalue(j,:,3)),1);
                  x4 = xg2(q+ sum(SNodevalue(j,:,3)),1); y4 = yg2(q+ sum(SNodevalue(j,:,3)),1);           
                  Px1 = (x1*y2-y1*x2)*(x3-x4)-(x1-x2)*(x3*y4-y3*x4);
                  Py1 = (x1*y2-y1*x2)*(y3-y4)-(y1-y2)*(x3*y4-y3*x4);
                  Pxy1 = ((x1-x2)*(y3-y4)-(y1-y2)*(x3-x4));
                  if isequal(round(abs(Pxy1)),0)
                     Px = x4;
                     Py = y4;
                  else
                     Px = Px1/Pxy1;
                     Py = Py1/Pxy1;             
                  end
                  for k = 1:xn
                     if isequal(x4,xg1(k,1)) && isequal(y4,yg1(k,1))
                        xg1(k,1)=Px; yg1(k,1)=Py; 
                     elseif isequal(x4,xg2(k,1)) && isequal(y4,yg2(k,1))
                        xg2(k,1)=Px; yg2(k,1)=Py;                   
                     end
                  end
               %----
               elseif isequal(PP(i,5),PP(j,4)) %end node j=sum(SNodevalue(i,:,3))              
                  x1 = xg1(r+sum(SNodevalue(i,:,3)),1); y1 = yg1(r+sum(SNodevalue(i,:,3)),1);
                  x2 = xg2(r+sum(SNodevalue(i,:,3)),1); y2 = yg2(r+sum(SNodevalue(i,:,3)),1);
                  x3 = xg1(q+1,1); y3 = yg1(q+1,1);
                  x4 = xg2(q+1,1); y4 = yg2(q+1,1);   
                  Px1 = (x1*y2-y1*x2)*(x3-x4)-(x1-x2)*(x3*y4-y3*x4);
                  Py1 = (x1*y2-y1*x2)*(y3-y4)-(y1-y2)*(x3*y4-y3*x4);
                  Pxy1 = ((x1-x2)*(y3-y4)-(y1-y2)*(x3-x4));
                  if isequal(round(abs(Pxy1)),0)
                     Px = x3;
                     Py = y3;
                  else
                     Px = Px1/Pxy1;
                     Py = Py1/Pxy1;              
                  end
                  for k = 1:xn
                     if isequal(x3,xg1(k,1)) && isequal(y3,yg1(k,1))
                        xg1(k,1)=Px; yg1(k,1)=Py; 
                     elseif isequal(x3,xg2(k,1)) && isequal(y3,yg2(k,1))
                        xg2(k,1)=Px; yg2(k,1)=Py;                   
                     end
                  end            

               elseif isequal(PP(i,5),PP(j,7))
                  x1 = xg1(r+sum(SNodevalue(i,:,3)),1); y1 = yg1(r+sum(SNodevalue(i,:,3)),1);
                  x2 = xg2(r+sum(SNodevalue(i,:,3)),1); y2 = yg2(r+sum(SNodevalue(i,:,3)),1);
                  x3 = xg1(q+ sum(SNodevalue(j,:,3)),1); y3 = yg1(q+ sum(SNodevalue(j,:,3)),1);
                  x4 = xg2(q+ sum(SNodevalue(j,:,3)),1); y4 = yg2(q+ sum(SNodevalue(j,:,3)),1);             
                  Px1 = (x1*y2-y1*x2)*(x3-x4)-(x1-x2)*(x3*y4-y3*x4);
                  Py1 = (x1*y2-y1*x2)*(y3-y4)-(y1-y2)*(x3*y4-y3*x4);
                  Pxy1 = ((x1-x2)*(y3-y4)-(y1-y2)*(x3-x4));
                  if isequal(round(abs(Pxy1)),0)
                     Px = x4;
                     Py = y4;
                  else
                     Px = Px1/Pxy1;
                     Py = Py1/Pxy1;               
                  end
                  for k = 1:xn
                     if isequal(x4,xg1(k,1)) && isequal(y4,yg1(k,1))
                        xg1(k,1)=Px; yg1(k,1)=Py; 
                     elseif isequal(x4,xg2(k,1)) && isequal(y4,yg2(k,1))
                        xg2(k,1)=Px; yg2(k,1)=Py;                   
                     end
                  end                           
               %----
               end % isequal(PP(i,4),PP(j,4)) %start node j=1  
            end % ~isequal(i,j)
            
         end
         q = q+ sum(SNodevalue(j,:,3));
      end      
   else
      q = 0;
      for j=1:mem
         if isequal(sum(SNodevalue(j,:,3)),1)
            if ~isequal(i,j)
               if isequal(PP(i,4),PP(j,4)) %start node j=1   
                  x1 = xg1(r+1,1); y1 = yg1(r+1,1);
                  x2 = xg2(r+1,1); y2 = yg2(r+1,1);
                  x3 = xg1(q+1,1); y3 = yg1(q+1,1);
                  x4 = xg2(q+1,1); y4 = yg2(q+1,1);   
                  Px1 = (x1*y2-y1*x2)*(x3-x4)-(x1-x2)*(x3*y4-y3*x4);
                  Py1 = (x1*y2-y1*x2)*(y3-y4)-(y1-y2)*(x3*y4-y3*x4);
                  Pxy1 = ((x1-x2)*(y3-y4)-(y1-y2)*(x3-x4));
                  if isequal(round(abs(Pxy1)),0)
                     Px = x3;
                     Py = y3;
                  else
                     Px = Px1/Pxy1;
                     Py = Py1/Pxy1;               
                  end
                  for k = 1:xn
                     if isequal(x3,xg1(k,1)) && isequal(y3,yg1(k,1))
                        xg1(k,1)=Px; yg1(k,1)=Py; 
                     elseif isequal(x3,xg2(k,1)) && isequal(y3,yg2(k,1))
                        xg2(k,1)=Px; yg2(k,1)=Py;                   
                     end
                  end
               % ----   
               elseif isequal(PP(i,4),PP(j,5))      
                  x1 = xg1(r+1,1); y1 = yg1(r+1,1);
                  x2 = xg2(r+1,1); y2 = yg2(r+1,1);
                  x3 = xg1(q+ sum(SNodevalue(j,:,3)),1); y3 = yg1(q+ sum(SNodevalue(j,:,3)),1);
                  x4 = xg2(q+ sum(SNodevalue(j,:,3)),1); y4 = yg2(q+ sum(SNodevalue(j,:,3)),1);           
                  Px1 = (x1*y2-y1*x2)*(x3-x4)-(x1-x2)*(x3*y4-y3*x4);
                  Py1 = (x1*y2-y1*x2)*(y3-y4)-(y1-y2)*(x3*y4-y3*x4);
                  Pxy1 = ((x1-x2)*(y3-y4)-(y1-y2)*(x3-x4));
                  if isequal(round(abs(Pxy1)),0)
                     Px = x4;
                     Py = y4;
                  else
                     Px = Px1/Pxy1;
                     Py = Py1/Pxy1;              
                  end
                  for k = 1:xn
                     if isequal(x4,xg1(k,1)) && isequal(y4,yg1(k,1))
                        xg1(k,1)=Px; yg1(k,1)=Py; 
                     elseif isequal(x4,xg2(k,1)) && isequal(y4,yg2(k,1))
                        xg2(k,1)=Px; yg2(k,1)=Py;                   
                     end
                  end                      
               %-----     

                elseif isequal(PP(i,7),PP(j,4)) %end node j=sum(SNodevalue(i,:,3))               
                  x1 = xg1(r+sum(SNodevalue(i,:,3)),1); y1 = yg1(r+sum(SNodevalue(i,:,3)),1);
                  x2 = xg2(r+sum(SNodevalue(i,:,3)),1); y2 = yg2(r+sum(SNodevalue(i,:,3)),1);
                  x3 = xg1(q+1,1); y3 = yg1(q+1,1);
                  x4 = xg2(q+1,1); y4 = yg2(q+1,1);   
                  Px1 = (x1*y2-y1*x2)*(x3-x4)-(x1-x2)*(x3*y4-y3*x4);
                  Py1 = (x1*y2-y1*x2)*(y3-y4)-(y1-y2)*(x3*y4-y3*x4);
                  Pxy1 = ((x1-x2)*(y3-y4)-(y1-y2)*(x3-x4));
                  if isequal(round(abs(Pxy1)),0)
                     Px = x3;
                     Py = y3;
                  else
                     Px = Px1/Pxy1;
                     Py = Py1/Pxy1;             
                  end
                  for k = 1:xn
                     if isequal(x3,xg1(k,1)) && isequal(y3,yg1(k,1))
                        xg1(k,1)=Px; yg1(k,1)=Py; 
                     elseif isequal(x3,xg2(k,1)) && isequal(y3,yg2(k,1))
                        xg2(k,1)=Px; yg2(k,1)=Py;                   
                     end
                  end
               % ----                 
               elseif isequal(PP(i,7),PP(j,5))
                  x1 = xg1(r+sum(SNodevalue(i,:,3)),1); y1 = yg1(r+sum(SNodevalue(i,:,3)),1);
                  x2 = xg2(r+sum(SNodevalue(i,:,3)),1); y2 = yg2(r+sum(SNodevalue(i,:,3)),1);
                  x3 = xg1(q+ sum(SNodevalue(j,:,3)),1); y3 = yg1(q+ sum(SNodevalue(j,:,3)),1);
                  x4 = xg2(q+ sum(SNodevalue(j,:,3)),1); y4 = yg2(q+ sum(SNodevalue(j,:,3)),1);             
                  Px1 = (x1*y2-y1*x2)*(x3-x4)-(x1-x2)*(x3*y4-y3*x4);
                  Py1 = (x1*y2-y1*x2)*(y3-y4)-(y1-y2)*(x3*y4-y3*x4);
                  Pxy1 = ((x1-x2)*(y3-y4)-(y1-y2)*(x3-x4));
                  if isequal(round(abs(Pxy1)),0)
                     Px = x4;
                     Py = y4;
                  else
                     Px = Px1/Pxy1;
                     Py = Py1/Pxy1;               
                  end
                  for k = 1:xn
                     if isequal(x4,xg1(k,1)) && isequal(y4,yg1(k,1))
                        xg1(k,1)=Px; yg1(k,1)=Py; 
                     elseif isequal(x4,xg2(k,1)) && isequal(y4,yg2(k,1))
                        xg2(k,1)=Px; yg2(k,1)=Py;                   
                     end
                  end                    
               %-----           
                  
               end % isequal(PP(i,4),PP(j,4)) %start node j=1
            end  % ~isequal(i,j)        
         else
   
            if ~isequal(i,j)
               if isequal(PP(i,4),PP(j,4)) %start node j=1 
                  x1 = xg1(r+1,1); y1 = yg1(r+1,1);
                  x2 = xg2(r+1,1); y2 = yg2(r+1,1);
                  x3 = xg1(q+1,1); y3 = yg1(q+1,1);
                  x4 = xg2(q+1,1); y4 = yg2(q+1,1);   
                  Px1 = (x1*y2-y1*x2)*(x3-x4)-(x1-x2)*(x3*y4-y3*x4);
                  Py1 = (x1*y2-y1*x2)*(y3-y4)-(y1-y2)*(x3*y4-y3*x4);
                  Pxy1 = ((x1-x2)*(y3-y4)-(y1-y2)*(x3-x4));
                  if isequal(round(abs(Pxy1)),0)
                     Px = x3;
                     Py = y3;
                  else
                     Px = Px1/Pxy1;
                     Py = Py1/Pxy1;               
                  end
                  for k = 1:xn
                     if isequal(x3,xg1(k,1)) && isequal(y3,yg1(k,1))
                        xg1(k,1)=Px; yg1(k,1)=Py; 
                     elseif isequal(x3,xg2(k,1)) && isequal(y3,yg2(k,1))
                        xg2(k,1)=Px; yg2(k,1)=Py;                   
                     end
                  end

               elseif isequal(PP(i,4),PP(j,7))      
                  x1 = xg1(r+1,1); y1 = yg1(r+1,1);
                  x2 = xg2(r+1,1); y2 = yg2(r+1,1);
                  x3 = xg1(q+ sum(SNodevalue(j,:,3)),1); y3 = yg1(q+ sum(SNodevalue(j,:,3)),1);
                  x4 = xg2(q+ sum(SNodevalue(j,:,3)),1); y4 = yg2(q+ sum(SNodevalue(j,:,3)),1);           
                  Px1 = (x1*y2-y1*x2)*(x3-x4)-(x1-x2)*(x3*y4-y3*x4);
                  Py1 = (x1*y2-y1*x2)*(y3-y4)-(y1-y2)*(x3*y4-y3*x4);
                  Pxy1 = ((x1-x2)*(y3-y4)-(y1-y2)*(x3-x4));
                  if isequal(round(abs(Pxy1)),0)
                     Px = x4;
                     Py = y4;
                  else
                     Px = Px1/Pxy1;
                     Py = Py1/Pxy1;              
                  end
                  for k = 1:xn
                     if isequal(x4,xg1(k,1)) && isequal(y4,yg1(k,1))
                        xg1(k,1)=Px; yg1(k,1)=Py; 
                     elseif isequal(x4,xg2(k,1)) && isequal(y4,yg2(k,1))
                        xg2(k,1)=Px; yg2(k,1)=Py;                   
                     end
                  end            

               elseif isequal(PP(i,7),PP(j,4)) %end node j=sum(SNodevalue(i,:,3))              
                  x1 = xg1(r+sum(SNodevalue(i,:,3)),1); y1 = yg1(r+sum(SNodevalue(i,:,3)),1);
                  x2 = xg2(r+sum(SNodevalue(i,:,3)),1); y2 = yg2(r+sum(SNodevalue(i,:,3)),1);
                  x3 = xg1(q+1,1); y3 = yg1(q+1,1);
                  x4 = xg2(q+1,1); y4 = yg2(q+1,1);   
                  Px1 = (x1*y2-y1*x2)*(x3-x4)-(x1-x2)*(x3*y4-y3*x4);
                  Py1 = (x1*y2-y1*x2)*(y3-y4)-(y1-y2)*(x3*y4-y3*x4);
                  Pxy1 = ((x1-x2)*(y3-y4)-(y1-y2)*(x3-x4));
                  if isequal(round(abs(Pxy1)),0)
                     Px = x3;
                     Py = y3;
                  else
                     Px = Px1/Pxy1;
                     Py = Py1/Pxy1;              
                  end
                  for k = 1:xn
                     if isequal(x3,xg1(k,1)) && isequal(y3,yg1(k,1))
                        xg1(k,1)=Px; yg1(k,1)=Py; 
                     elseif isequal(x3,xg2(k,1)) && isequal(y3,yg2(k,1))
                        xg2(k,1)=Px; yg2(k,1)=Py;                   
                     end
                  end            

               elseif isequal(PP(i,7),PP(j,7))
                  x1 = xg1(r+sum(SNodevalue(i,:,3)),1); y1 = yg1(r+sum(SNodevalue(i,:,3)),1);
                  x2 = xg2(r+sum(SNodevalue(i,:,3)),1); y2 = yg2(r+sum(SNodevalue(i,:,3)),1);
                  x3 = xg1(q+ sum(SNodevalue(j,:,3)),1); y3 = yg1(q+ sum(SNodevalue(j,:,3)),1);
                  x4 = xg2(q+ sum(SNodevalue(j,:,3)),1); y4 = yg2(q+ sum(SNodevalue(j,:,3)),1);             
                  Px1 = (x1*y2-y1*x2)*(x3-x4)-(x1-x2)*(x3*y4-y3*x4);
                  Py1 = (x1*y2-y1*x2)*(y3-y4)-(y1-y2)*(x3*y4-y3*x4);
                  Pxy1 = ((x1-x2)*(y3-y4)-(y1-y2)*(x3-x4));
                  if isequal(round(abs(Pxy1)),0)
                     Px = x4;
                     Py = y4;
                  else
                     Px = Px1/Pxy1;
                     Py = Py1/Pxy1;               
                  end
                  for k = 1:xn
                     if isequal(x4,xg1(k,1)) && isequal(y4,yg1(k,1))
                        xg1(k,1)=Px; yg1(k,1)=Py; 
                     elseif isequal(x4,xg2(k,1)) && isequal(y4,yg2(k,1))
                        xg2(k,1)=Px; yg2(k,1)=Py;                   
                     end
                  end            

               end
            end            
 
         end
         q = q+ sum(SNodevalue(j,:,3));
      end  
   end
   r = r+sum(SNodevalue(i,:,3)); 
end
%-------------------------------------------

% ------------------------------------------------------------------------
% ----------       Update Shear center  W.r.t intersections     ----------
% ------------------------------------------------------------------------
% Updated Shear center w.r.t intersections.
Nshe1(:,1)=xg1(:,1);
Nshe2(:,1)=xg2(:,1);
Nshe1(:,2)=yg1(:,1);
Nshe2(:,2)=yg2(:,1);
Nshe1(:,3)=zg1(:,1);
Nshe2(:,3)=zg2(:,1);

for i=1:xn
   Nshe1(i,4) =DUP1(i,6);
   Nshe1(i,5) =DUP1(i,7);
   Nshe1(i,6) =DUP1(i,8);
   Nshe1(i,7) =DUP1(i,9);
   Nshe1(i,8) =DUP1(i,10);
   Nshe1(i,9) =DUP1(i,11);
   Nshe1(i,10) =DUP1(i,12);
   Nshe1(i,11) =DUP1(i,13);
   Nshe1(i,12) =DUP1(i,14);
   
   Nshe2(i,4) =DUP2(i,6);
   Nshe2(i,5) =DUP2(i,7);
   Nshe2(i,6) =DUP2(i,8);
   Nshe2(i,7) =DUP2(i,9);
   Nshe2(i,8) =DUP2(i,10);
   Nshe2(i,9) =DUP2(i,11);
   Nshe2(i,10) =DUP2(i,12);
   Nshe2(i,11) =DUP2(i,13);
   Nshe2(i,12) =DUP2(i,14);   
end

% Calculate Initial Member x-dir Nodal Coordinates for Each Member
[SheMemLength]=InitialEleLengthRendering(SNshe1(:,1),SNshe1(:,2),SNshe1(:,3),SNshe2(:,1),SNshe2(:,2),SNshe2(:,3),SNodevalue);
[NsheMemLength]=InitialEleLengthRendering(Nshe1(:,1),Nshe1(:,2),Nshe1(:,3),Nshe2(:,1),Nshe2(:,2),Nshe2(:,3),SNodevalue);

melei=1; melej=0;
for i = 1:mem 
   
   melej = melej+sum(SNodevalue(i,:,3));

   if SheMemLength(melei,1) >= NsheMemLength(melei,1)
      
      segLoc = [0, SheMemLength(melei,1)];
      segLocstep = [0, (SheMemLength(melei,1)-NsheMemLength(melei,1)), SheMemLength(melei,1)];   
      bfbs=[DUP1(melei,6),DUP2(melei,6)];
      tfbs=[DUP1(melei,7),DUP2(melei,7)];
      bfts=[DUP1(melei,8),DUP2(melei,8)];
      tfts=[DUP1(melei,9),DUP2(melei,9)];
      Dgs=[DUP1(melei,10),DUP2(melei,10)];
      tws=[DUP1(melei,11),DUP2(melei,11)];     
      tdgs=[DUP1(melei,12),DUP2(melei,12)];
      hgs=[DUP1(melei,13),DUP2(melei,13)];
      Afs=[DUP1(melei,14),DUP2(melei,14)];
      
      bfbsb=interp1(segLoc,bfbs,segLocstep);
      tfbsb=interp1(segLoc,tfbs,segLocstep); 
      bftsb=interp1(segLoc,bfts,segLocstep); 
      tftsb=interp1(segLoc,tfts,segLocstep);
      Dgsb=interp1(segLoc,Dgs,segLocstep); 
      twsb=interp1(segLoc,tws,segLocstep);
      tdgsb=interp1(segLoc,tdgs,segLocstep); 
      hgsb=interp1(segLoc,hgs,segLocstep);
      Afsb=interp1(segLoc,Afs,segLocstep);

      Nshe1(melei,4) = bfbsb(1,2);
      Nshe1(melei,5) = tfbsb(1,2);
      Nshe1(melei,6) = bftsb(1,2);
      Nshe1(melei,7) = tftsb(1,2);
      Nshe1(melei,8) = Dgsb(1,2);
      Nshe1(melei,9) = twsb(1,2);
      Nshe1(melei,10) = tdgsb(1,2);
      Nshe1(melei,11) = hgsb(1,2);
      Nshe1(melei,12) = Afsb(1,2);
      
   elseif SheMemLength(melei,1) < NsheMemLength(melei,1)
      
      segLoc = [0, SheMemLength(melei,1)];
      segLocstep = [(SheMemLength(melei,1)-NsheMemLength(melei,1)), 0, SheMemLength(melei,1)];                          

      bfbs=[DUP1(melei,6),DUP2(melei,6)];
      tfbs=[DUP1(melei,7),DUP2(melei,7)];
      bfts=[DUP1(melei,8),DUP2(melei,8)];
      tfts=[DUP1(melei,9),DUP2(melei,9)];
      Dgs=[DUP1(melei,10),DUP2(melei,10)];
      tws=[DUP1(melei,11),DUP2(melei,11)];     
      tdgs=[DUP1(melei,12),DUP2(melei,12)];
      hgs=[DUP1(melei,13),DUP2(melei,13)];
      Afs=[DUP1(melei,14),DUP2(melei,14)];
      
      bfbsb=interp1(segLoc,bfbs,segLocstep,'linear','extrap');
      tfbsb=interp1(segLoc,tfbs,segLocstep,'linear','extrap');
      bftsb=interp1(segLoc,bfts,segLocstep,'linear','extrap');
      tftsb=interp1(segLoc,tfts,segLocstep,'linear','extrap');
      Dgsb=interp1(segLoc,Dgs,segLocstep,'linear','extrap'); 
      twsb=interp1(segLoc,tws,segLocstep,'linear','extrap'); 
      tdgsb=interp1(segLoc,tdgs,segLocstep,'linear','extrap'); 
      hgsb=interp1(segLoc,hgs,segLocstep,'linear','extrap');
      Afsb=interp1(segLoc,Afs,segLocstep,'linear','extrap');     

      Nshe1(melei,4) = bfbsb(1,1);
      Nshe1(melei,5) = tfbsb(1,1);
      Nshe1(melei,6) = bftsb(1,1);
      Nshe1(melei,7) = tftsb(1,1);
      Nshe1(melei,8) = Dgsb(1,1);
      Nshe1(melei,9) = twsb(1,1);
      Nshe1(melei,10) = tdgsb(1,1);
      Nshe1(melei,11) = hgsb(1,1);
      Nshe1(melei,12) = Afsb(1,1);      
      
   end
   
   if isequal(melei,melej)

      if SheMemLength(melei,1) >= NsheMemLength(melei,1)

         segLoc = [0, SheMemLength(melei,1)];
         segLocstep = [0, (SheMemLength(melei,1)-NsheMemLength(melei,1)), SheMemLength(melei,1)];   
         bfbs=[DUP1(melei,6),DUP2(melei,6)];
         tfbs=[DUP1(melei,7),DUP2(melei,7)];
         bfts=[DUP1(melei,8),DUP2(melei,8)];
         tfts=[DUP1(melei,9),DUP2(melei,9)];
         Dgs=[DUP1(melei,10),DUP2(melei,10)];
         tws=[DUP1(melei,11),DUP2(melei,11)];     
         tdgs=[DUP1(melei,12),DUP2(melei,12)];
         hgs=[DUP1(melei,13),DUP2(melei,13)];
         Afs=[DUP1(melei,14),DUP2(melei,14)];

         bfbsb=interp1(segLoc,bfbs,segLocstep);
         tfbsb=interp1(segLoc,tfbs,segLocstep); 
         bftsb=interp1(segLoc,bfts,segLocstep); 
         tftsb=interp1(segLoc,tfts,segLocstep);
         Dgsb=interp1(segLoc,Dgs,segLocstep); 
         twsb=interp1(segLoc,tws,segLocstep);
         tdgsb=interp1(segLoc,tdgs,segLocstep); 
         hgsb=interp1(segLoc,hgs,segLocstep);
         Afsb=interp1(segLoc,Afs,segLocstep);

         Nshe2(melej,4) = bfbsb(1,3);
         Nshe2(melej,5) = tfbsb(1,3);
         Nshe2(melej,6) = bftsb(1,3);
         Nshe2(melej,7) = tftsb(1,3);
         Nshe2(melej,8) = Dgsb(1,3);
         Nshe2(melej,9) = twsb(1,3);
         Nshe2(melej,10) = tdgsb(1,3);
         Nshe2(melej,11) = hgsb(1,3);
         Nshe2(melej,12) = Afsb(1,3);           
  
      elseif SheMemLength(melei,1) < NsheMemLength(melei,1)

         segLoc = [0, SheMemLength(melei,1)];
         segLocstep = [(SheMemLength(melei,1)-NsheMemLength(melei,1)), 0, SheMemLength(melei,1)];                          

         bfbs=[DUP1(melei,6),DUP2(melei,6)];
         tfbs=[DUP1(melei,7),DUP2(melei,7)];
         bfts=[DUP1(melei,8),DUP2(melei,8)];
         tfts=[DUP1(melei,9),DUP2(melei,9)];
         Dgs=[DUP1(melei,10),DUP2(melei,10)];
         tws=[DUP1(melei,11),DUP2(melei,11)];     
         tdgs=[DUP1(melei,12),DUP2(melei,12)];
         hgs=[DUP1(melei,13),DUP2(melei,13)];
         Afs=[DUP1(melei,14),DUP2(melei,14)];

         bfbsb=interp1(segLoc,bfbs,segLocstep,'linear','extrap');
         tfbsb=interp1(segLoc,tfbs,segLocstep,'linear','extrap');
         bftsb=interp1(segLoc,bfts,segLocstep,'linear','extrap');
         tftsb=interp1(segLoc,tfts,segLocstep,'linear','extrap');
         Dgsb=interp1(segLoc,Dgs,segLocstep,'linear','extrap'); 
         twsb=interp1(segLoc,tws,segLocstep,'linear','extrap'); 
         tdgsb=interp1(segLoc,tdgs,segLocstep,'linear','extrap'); 
         hgsb=interp1(segLoc,hgs,segLocstep,'linear','extrap');
         Afsb=interp1(segLoc,Afs,segLocstep,'linear','extrap');     

         Nshe2(melej,4) = bfbsb(1,3);
         Nshe2(melej,5) = tfbsb(1,3);
         Nshe2(melej,6) = bftsb(1,3);
         Nshe2(melej,7) = tftsb(1,3);
         Nshe2(melej,8) = Dgsb(1,3);
         Nshe2(melej,9) = twsb(1,3);
         Nshe2(melej,10) = tdgsb(1,3);
         Nshe2(melej,11) = hgsb(1,3);
         Nshe2(melej,12) = Afsb(1,3);      
      end            
      
   else
      if (SheMemLength(melej,1) - SheMemLength(melej-1,1)) >= (NsheMemLength(melej,1) - NsheMemLength(melej-1,1) )

         segLoc = [0, (SheMemLength(melej,1) - SheMemLength(melej-1,1))];
         segLocstep = [0,  (NsheMemLength(melej,1) - NsheMemLength(melej-1,1) ), (SheMemLength(melej,1) - SheMemLength(melej-1,1))];                   
         bfbs=[DUP1(melej,6),DUP2(melej,6)];
         tfbs=[DUP1(melej,7),DUP2(melej,7)];
         bfts=[DUP1(melej,8),DUP2(melej,8)];
         tfts=[DUP1(melej,9),DUP2(melej,9)];
         Dgs=[DUP1(melej,10),DUP2(melej,10)];
         tws=[DUP1(melej,11),DUP2(melej,11)];     
         tdgs=[DUP1(melej,12),DUP2(melej,12)];
         hgs=[DUP1(melej,13),DUP2(melej,13)];
         Afs=[DUP1(melej,14),DUP2(melej,14)];

         bfbsb=interp1(segLoc,bfbs,segLocstep);
         tfbsb=interp1(segLoc,tfbs,segLocstep); 
         bftsb=interp1(segLoc,bfts,segLocstep); 
         tftsb=interp1(segLoc,tfts,segLocstep); 
         Dgsb=interp1(segLoc,Dgs,segLocstep); 
         twsb=interp1(segLoc,tws,segLocstep); 
         tdgsb=interp1(segLoc,tdgs,segLocstep); 
         hgsb=interp1(segLoc,hgs,segLocstep); 
         Afsb=interp1(segLoc,Afs,segLocstep);      

         Nshe2(melej,4) = bfbsb(1,2);
         Nshe2(melej,5) = tfbsb(1,2);
         Nshe2(melej,6) = bftsb(1,2);
         Nshe2(melej,7) = tftsb(1,2);
         Nshe2(melej,8) = Dgsb(1,2);
         Nshe2(melej,9) = twsb(1,2);
         Nshe2(melej,10) = tdgsb(1,2);
         Nshe2(melej,11) = hgsb(1,2);
         Nshe2(melej,12) = Afsb(1,2);      

      elseif SheMemLength(melej,1) < NsheMemLength(melej,1)

         segLoc = [SheMemLength(melej-1,1), SheMemLength(melej,1)];
         segLocstep = [SheMemLength(melej-1,1), SheMemLength(melej,1),  NsheMemLength(melej,1)];      
         bfbs=[DUP2(melej-1,6),DUP2(melej,6)];
         tfbs=[DUP2(melej-1,7),DUP2(melej,7)];
         bfts=[DUP2(melej-1,8),DUP2(melej,8)];
         tfts=[DUP2(melej-1,9),DUP2(melej,9)];
         Dgs=[DUP2(melej-1,10),DUP2(melej,10)];
         tws=[DUP2(melej-1,11),DUP2(melej,11)];     
         tdgs=[DUP2(melej-1,12),DUP2(melej,12)];
         hgs=[DUP2(melej-1,13),DUP2(melej,13)];
         Afs=[DUP2(melej-1,14),DUP2(melej,14)];

         bfbsb=interp1(segLoc,bfbs,segLocstep,'linear','extrap');
         tfbsb=interp1(segLoc,tfbs,segLocstep,'linear','extrap');
         bftsb=interp1(segLoc,bfts,segLocstep,'linear','extrap'); 
         tftsb=interp1(segLoc,tfts,segLocstep,'linear','extrap'); 
         Dgsb=interp1(segLoc,Dgs,segLocstep,'linear','extrap');
         twsb=interp1(segLoc,tws,segLocstep,'linear','extrap'); 
         tdgsb=interp1(segLoc,tdgs,segLocstep,'linear','extrap'); 
         hgsb=interp1(segLoc,hgs,segLocstep,'linear','extrap'); 
         Afsb=interp1(segLoc,Afs,segLocstep,'linear','extrap');      

         Nshe2(melej,4) = bfbsb(1,3);
         Nshe2(melej,5) = tfbsb(1,3);
         Nshe2(melej,6) = bftsb(1,3);
         Nshe2(melej,7) = tftsb(1,3);
         Nshe2(melej,8) = Dgsb(1,3);
         Nshe2(melej,9) = twsb(1,3);
         Nshe2(melej,10) = tdgsb(1,3);
         Nshe2(melej,11) = hgsb(1,3);
         Nshe2(melej,12) = Afsb(1,3);           
      end   
   end % end isequal(melei,melej)
   melei = melei+sum(SNodevalue(i,:,3));
end   

% ------------------------------------------------------------------------
% ----------------      Updated Tapered Angle       ----------------------
% ------------------------------------------------------------------------
% ********** Global frame angle for each element considering shear center
alphatap = zeros(xn,2);
for i=1:xn
    opp = yg2(i,1)-yg1(i,1);  % element depth in y-dir
    adj = xg2(i,1)-xg1(i,1);  % element length in x-dir         
    alphatap(i,1)=MI(i,1);
    alphatap(i,2)=atan2(opp,adj);     % Global frame angle + Tapered Angle
end 

% ------------------------------------------------------------------------
% ---------      Updated NCc w.r.t. shear center      --------------------
% ------------------------------------------------------------------------
% ******************************************************* RNC (Updated NC)
q=0;r=0;
for i = 1:mem
   for j = 1:sum(SNodevalue(i,:,3))
      if isequal(j,sum(SNodevalue(i,:,3))) 
         RNC(q+j,1) = r+j;
         RNC(q+j,2) = Nshe1(r+j,1);
         RNC(q+j,3) = Nshe1(r+j,2);
         RNC(q+j,4) = Nshe1(r+j,3);
         
         RNC(q+j+1,1) = r+j+1;
         RNC(q+j+1,2) = Nshe2(r+j,1);
         RNC(q+j+1,3) = Nshe2(r+j,2);
         RNC(q+j+1,4) = Nshe2(r+j,3);
      else
         RNC(q+j,1) = r+j;
         RNC(q+j,2) = Nshe1(r+j,1);
         RNC(q+j,3) = Nshe1(r+j,2);
         RNC(q+j,4) = Nshe1(r+j,3);
      end
   end
   q=q+sum(SNodevalue(i,:,3))+1;
   r=r+sum(SNodevalue(i,:,3));
end

for i=1:length(RNC(:,1))
   for j = 5:length(NC(1,:))
      RNC(i,j)=NC(i,j);
   end
end

% ***************************************************** RNCa (Updated NCa)
for i=1:length(NCa(:,1))
   if isequal(NCa(i,1),0)
      RNCa(i,1)=NCa(i,1);
      RNCa(i,2)=NCa(i,2);
      RNCa(i,3)=NCa(i,3);
      RNCa(i,4)=NCa(i,4);
      RNCa(i,5)=NCa(i,5);
      RNCa(i,6)=NCa(i,6);
      RNCa(i,7)=NCa(i,7);
      RNCa(i,8)=NCa(i,8);
      RNCa(i,9)=NCa(i,9);
      RNCa(i,10)=NCa(i,10);
      RNCa(i,11)=NCa(i,11);
      RNCa(i,12)=NCa(i,12);
      RNCa(i,13)=NCa(i,13);
      RNCa(i,14)=NCa(i,14);
      RNCa(i,15)=NCa(i,15);
      RNCa(i,16)=NCa(i,16);      
  
   else
      RNCa(i,1)=RNC(i,1);
      RNCa(i,2)=RNC(i,2);
      RNCa(i,3)=RNC(i,3);
      RNCa(i,4)=RNC(i,4);
      RNCa(i,5)=RNC(i,5);
      RNCa(i,6)=RNC(i,6);
      RNCa(i,7)=RNC(i,7);
      RNCa(i,8)=RNC(i,8);
      RNCa(i,9)=RNC(i,9);
      RNCa(i,10)=RNC(i,10);
      RNCa(i,11)=RNC(i,11);
      RNCa(i,12)=RNC(i,12);
      RNCa(i,13)=RNC(i,13);
      RNCa(i,14)=0;
      RNCa(i,15)=0;
      RNCa(i,16)=0;      
      
   end
end
%    q = 0;RNCa=[];
%    for i=1:mem  
%       for j=1:sum(SNodevalue(i,:,3))+1        
%          if isequal(i,1)
%             RNCa(j+q,1)=RNC(j+q,1);
%             RNCa(j+q,2)=RNC(j+q,2);
%             RNCa(j+q,3)=RNC(j+q,3);
%             RNCa(j+q,4)=RNC(j+q,4);
%             RNCa(j+q,5)=RNC(j+q,5);
%             RNCa(j+q,6)=RNC(j+q,6);
%             RNCa(j+q,7)=RNC(j+q,7);
%             RNCa(j+q,8)=RNC(j+q,8);
%             RNCa(j+q,9)=RNC(j+q,9);
%             RNCa(j+q,10)=RNC(j+q,10);
%             RNCa(j+q,11)=RNC(j+q,11);
%             RNCa(j+q,12)=RNC(j+q,12);
%             RNCa(j+q,13)=RNC(j+q,13);
%             RNCa(j+q,14)=0;
%             RNCa(j+q,15)=0;
%             RNCa(j+q,16)=0;
%             
%             mn = length(RNCa(:,1));
%          else
%             if isequal(j,1)
%                for n = 1:mn                 
%                   if isequal(round(RNCa(n,2)*10^4)/10^4,round(RNC(j+q,2)*10^4)/10^4) ...
%                         && isequal(round(RNCa(n,3)*10^4)/10^4,round(RNC(j+q,3)*10^4)/10^4) ...
%                         && isequal(round(RNCa(n,4)*10^4)/10^4,round(RNC(j+q,4)*10^4)/10^4)  && isequal(RNCa(n,14),0) 
%                      RNCa(j+q,1)=0;
%                      RNCa(j+q,2)=0;
%                      RNCa(j+q,3)=0;
%                      RNCa(j+q,4)=0;
%                      RNCa(j+q,5)=0;
%                      RNCa(j+q,6)=0;
%                      RNCa(j+q,7)=0;
%                      RNCa(j+q,8)=0; 
%                      RNCa(j+q,9)=0;
%                      RNCa(j+q,10)=0;                     
%                      RNCa(j+q,11)=0;
%                      RNCa(j+q,12)=0;
%                      RNCa(j+q,13)=0;
%                      RNCa(j+q,14)=n; 
%                      RNCa(j+q,15)=i;
%                      RNCa(j+q,16)=j;
%                      break; % Stop loof if satisfy the creterian.
%        
%                   else
%                      RNCa(j+q,1)=RNC(j+q,1);
%                      RNCa(j+q,2)=RNC(j+q,2);
%                      RNCa(j+q,3)=RNC(j+q,3);
%                      RNCa(j+q,4)=RNC(j+q,4);
%                      RNCa(j+q,5)=RNC(j+q,5);
%                      RNCa(j+q,6)=RNC(j+q,6);
%                      RNCa(j+q,7)=RNC(j+q,7);
%                      RNCa(j+q,8)=RNC(j+q,8);
%                      RNCa(j+q,9)=RNC(j+q,9);
%                      RNCa(j+q,10)=RNC(j+q,10);
%                      RNCa(j+q,11)=RNC(j+q,11);
%                      RNCa(j+q,12)=RNC(j+q,12);
%                      RNCa(j+q,13)=RNC(j+q,13);
%                      RNCa(j+q,14)=0;
%                      RNCa(j+q,15)=0;
%                      RNCa(j+q,16)=0;                     
% 
%                   end   
%                end   
%             elseif isequal(j,sum(SNodevalue(i,:,3))+1)
%                for n = 1:mn
%                   if isequal(round(RNCa(n,2)*10^4)/10^4,round(RNC(j+q,2)*10^4)/10^4) ...
%                         && isequal(round(RNCa(n,3)*10^4)/10^4,round(RNC(j+q,3)*10^4)/10^4) ... 
%                         && isequal(round(RNCa(n,4)*10^4)/10^4,round(RNC(j+q,4)*10^4)/10^4)  && isequal(RNCa(n,14),0)               
%                      RNCa(j+q,1)=0;
%                      RNCa(j+q,2)=0;
%                      RNCa(j+q,3)=0;
%                      RNCa(j+q,4)=0;
%                      RNCa(j+q,5)=0;
%                      RNCa(j+q,6)=0;
%                      RNCa(j+q,7)=0;
%                      RNCa(j+q,8)=0; 
%                      RNCa(j+q,9)=0;
%                      RNCa(j+q,10)=0;                     
%                      RNCa(j+q,11)=0;
%                      RNCa(j+q,12)=0;
%                      RNCa(j+q,13)=0;
%                      RNCa(j+q,14)=n;
%                      RNCa(j+q,15)=i;
%                      RNCa(j+q,16)=j;
%                      
%                      break;
%                   
%                   else
%                      RNCa(j+q,1)=RNC(j+q,1);
%                      RNCa(j+q,2)=RNC(j+q,2);
%                      RNCa(j+q,3)=RNC(j+q,3);
%                      RNCa(j+q,4)=RNC(j+q,4);
%                      RNCa(j+q,5)=RNC(j+q,5);
%                      RNCa(j+q,6)=RNC(j+q,6);
%                      RNCa(j+q,7)=RNC(j+q,7);
%                      RNCa(j+q,8)=RNC(j+q,8);
%                      RNCa(j+q,9)=RNC(j+q,9);
%                      RNCa(j+q,10)=RNC(j+q,10);
%                      RNCa(j+q,11)=RNC(j+q,11);
%                      RNCa(j+q,12)=RNC(j+q,12);
%                      RNCa(j+q,13)=RNC(j+q,13);
%                      RNCa(j+q,14)=0;
%                      RNCa(j+q,15)=0;
%                      RNCa(j+q,16)=0;                     
% 
%                   end 
%                end   
%             else
%                RNCa(j+q,1)=RNC(j+q,1);
%                RNCa(j+q,2)=RNC(j+q,2);
%                RNCa(j+q,3)=RNC(j+q,3);
%                RNCa(j+q,4)=RNC(j+q,4);
%                RNCa(j+q,5)=RNC(j+q,5);
%                RNCa(j+q,6)=RNC(j+q,6);
%                RNCa(j+q,7)=RNC(j+q,7);
%                RNCa(j+q,8)=RNC(j+q,8);
%                RNCa(j+q,9)=RNC(j+q,9);
%                RNCa(j+q,10)=RNC(j+q,10);
%                RNCa(j+q,11)=RNC(j+q,11);
%                RNCa(j+q,12)=RNC(j+q,12);
%                RNCa(j+q,13)=RNC(j+q,13);
%                RNCa(j+q,14)=0;
%                RNCa(j+q,15)=0;
%                RNCa(j+q,16)=0;               
%                
%             end % if end
%          end % if end   
%       end % for j end
%       mn = length(RNCa(:,1)); 
%       q = sum(SNodevalue(i,:,3))+q+1;
%    end % for i end

   % ***************************************************** RNCb (Updated NCb)   
   % Node data without duplication
   r=1;
   for i = 1:length(RNCa(:,1))
      if ~isequal(RNCa(i,1),0)
         RNCb(r,1)=r;
         RNCb(r,2)=RNCa(i,2);
         RNCb(r,3)=RNCa(i,3);
         RNCb(r,4)=RNCa(i,4);
         RNCb(r,5)=RNCa(i,5);
         RNCb(r,6)=RNCa(i,6);
         RNCb(r,7)=RNCa(i,7);
         RNCb(r,8)=RNCa(i,8);
         RNCb(r,9)=RNCa(i,9);
         RNCb(r,10)=RNCa(i,10);
         RNCb(r,11)=RNCa(i,11);
         RNCb(r,12)=RNCa(i,12);
         RNCb(r,13)=RNCa(i,13);
         r=r+1;
      end
   end

% ------------------------------------------------------------------------
% ------     Updated NCc w.r.t. intersection of shear center      --------
% ------------------------------------------------------------------------ 
% ***************************************************** RNCc (Updated NCc) 
   RNCc = RNCb;

   % ---------------------------------------------------------------------
   % ----------------    Plot Loading Nodal Points       -----------------
   % ---------------------------------------------------------------------  
   Sa=max(max(max(JNodevalue_i(:,6)),max(JNodevalue_i(:,8))));
   Evalue = [];
   for i = 1:xn 
      Evalue(1,1) = Nshe1(i,1);
      Evalue(2,1) = Nshe2(i,1);
      Evalue(1,2) = Nshe1(i,2);
      Evalue(2,2) = Nshe2(i,2);
      Evalue(1,3) = Nshe1(i,3);
      Evalue(2,3) = Nshe2(i,3);   
      % plot shear center line
      if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
        plot3(axesm,Evalue(:,1),-Evalue(:,3)-Sa*0.005,Evalue(:,2),'Color',[0.4 0.4 0.4],'Tag',...
         'NsheL','HitTest','off','PickableParts','none');
        hold on;
      elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background 
        plot3(axesm,Evalue(:,1),-Evalue(:,3)-Sa*0.005,Evalue(:,2),'Color','y','Tag',...
         'NsheL','HitTest','off','PickableParts','none');
        hold on;          
      end
   end

   % ------------------------------------------------------------------------
   % ---------      Reference & Shear Center Line       ---------------------
   % ------------------------------------------------------------------------
   % Hide title
   set(pt_title_name,'Visible','off')

   Evalue = [];
   for i = 1:xn 
      Rz=[cos(alpharef(i,2)) -sin(alpharef(i,2)) 0; ...
      sin(alpharef(i,2)) cos(alpharef(i,2)) 0; ...
      0 0 1];

      switch val1(i,1)

      case 1
         % *************************** Rotation
         % bottom flage start node
         SN1=[0 (-Db1(i,1)) (zg1(i,1)+bfb1(i,1)/2)];      
         SN2=[0 (-Db1(i,1)) (zg1(i,1)+0)];     
         SN3=[0 (-Db1(i,1)) (zg1(i,1)-bfb1(i,1)/2)];
         % top flage start node
         SN5=[0 Dt1(i,1) (zg1(i,1)+bft1(i,1)/2)];
         SN6=[0 Dt1(i,1) (zg1(i,1)+0)];
         SN7=[0 Dt1(i,1) (zg1(i,1)-bft1(i,1)/2)];
         % bottom flage end node
         SN8=[0 (-Db2(i,1)) (zg2(i,1)+bfb2(i,1)/2)];
         SN9=[0 (-Db2(i,1)) (zg2(i,1)+0)];
         SN10=[0 (-Db2(i,1)) (zg2(i,1)-bfb2(i,1)/2)];
         % top flage end node
         SN12=[0 Dt2(i,1) (zg2(i,1)+bft2(i,1)/2)];
         SN13=[0 Dt2(i,1) (zg2(i,1)+0)];
         SN14=[0 Dt2(i,1) (zg2(i,1)-bft2(i,1)/2)];
         % *************************** Global Rotation
         SN1=Rz*SN1';
         SN2=Rz*SN2';
         SN3=Rz*SN3'; 
         SN5=Rz*SN5';
         SN6=Rz*SN6';
         SN7=Rz*SN7'; 
         SN8=Rz*SN8';
         SN9=Rz*SN9';
         SN10=Rz*SN10'; 
         SN12=Rz*SN12'; 
         SN13=Rz*SN13';
         SN14=Rz*SN14';  


      case 2     
         % *************************** Rotation
         % bottom flage start node
         SN1=[0 (-Dg1(i,1)) (zg1(i,1)+bfb1(i,1)/2)];  
         SN2=[0 (-Dg1(i,1)) (zg1(i,1)+0)];    
         SN3=[0 (-Dg1(i,1)) (zg1(i,1)-bfb1(i,1)/2)];
         % top flage start node
         SN5=[0 0 (zg1(i,1)+bft1(i,1)/2)];
         SN6=[0 0 (zg1(i,1)+0)]; 
         SN7=[0 0 (zg1(i,1)-bft1(i,1)/2)];
         % bottom flage end node
         SN8=[0 (-Dg2(i,1)) (zg2(i,1)+bfb2(i,1)/2)];
         SN9=[0 (-Dg2(i,1)) (zg2(i,1)+0)];
         SN10=[0 (-Dg2(i,1)) (zg2(i,1)-bfb2(i,1)/2)];
         % top flage end node
         SN12=[0 0 (zg2(i,1)+bft2(i,1)/2)];
         SN13=[0 0 (zg2(i,1)+0)];
         SN14=[0 0 (zg2(i,1)-bft2(i,1)/2)];
         % *************************** Global Rotation
         SN1=Rz*SN1';
         SN2=Rz*SN2';
         SN3=Rz*SN3'; 
         SN5=Rz*SN5';
         SN6=Rz*SN6';
         SN7=Rz*SN7'; 
         SN8=Rz*SN8';
         SN9=Rz*SN9';
         SN10=Rz*SN10'; 
         SN12=Rz*SN12'; 
         SN13=Rz*SN13';
         SN14=Rz*SN14';         

      case 3
         % *************************** Rotation
         % bottom flage start node
         SN1=[0 (0) (zg1(i,1)+bfb1(i,1)/2)];
         SN2=[0 (0) (zg1(i,1)+0)];    
         SN3=[0 (0) (zg1(i,1)-bfb1(i,1)/2)];
         % top flage start node
         SN5=[0 Dg1(i,1) (zg1(i,1)+bft1(i,1)/2)];
         SN6=[0 Dg1(i,1) (zg1(i,1)+0)];
         SN7=[0 Dg1(i,1) (zg1(i,1)-bft1(i,1)/2)];
         % bottom flage end node
         SN8=[0 (0) (zg2(i,1)+bfb2(i,1)/2)];
         SN9=[0 (0) (zg2(i,1)+0)];
         SN10=[0 (0) (zg2(i,1)-bfb2(i,1)/2)];
         % top flage end node
         SN12=[0 Dg2(i,1) (zg2(i,1)+bft2(i,1)/2)];
         SN13=[0 Dg2(i,1) (zg2(i,1)+0)];
         SN14=[0 Dg2(i,1) (zg2(i,1)-bft2(i,1)/2)];    
         % *************************** Global Rotation
         SN1=Rz*SN1';
         SN2=Rz*SN2';
         SN3=Rz*SN3'; 
         SN5=Rz*SN5';
         SN6=Rz*SN6';
         SN7=Rz*SN7'; 
         SN8=Rz*SN8';
         SN9=Rz*SN9';
         SN10=Rz*SN10'; 
         SN12=Rz*SN12'; 
         SN13=Rz*SN13';
         SN14=Rz*SN14';  

      end % Switch end
      % bottom flage start node
      CSN1(:,i)=SN1;
      CSN2(:,i)=SN2;
      CSN3(:,i)=SN3;
      % top flage start node
      CSN5(:,i)=SN5;
      CSN6(:,i)=SN6;
      CSN7(:,i)=SN7;
      % bottom flage end node
      CSN8(:,i)=SN8;
      CSN9(:,i)=SN9;
      CSN10(:,i)=SN10;
      % top flage end node
      CSN12(:,i)=SN12;
      CSN13(:,i)=SN13;
      CSN14(:,i)=SN14;   


   end  % for end

   xrmax=max(max(max(abs(CSN2(1,:))),max(abs(CSN6(1,:)))),max(max(abs(CSN9(1,:))),max(abs(CSN13(1,:)))));
   yrmax=max(max(max(abs(CSN2(2,:))),max(abs(CSN6(2,:)))),max(max(abs(CSN9(2,:))),max(abs(CSN13(2,:)))));   

   % ********************************************** Plot Coordnate Axes S
   if ~isempty(RNCc)  

      xabs = abs(min(RNCc(:,2))-max(RNCc(:,2)));
      yabs = abs(min(RNCc(:,3))-max(RNCc(:,3)));
      zabs = abs(min(-RNCc(:,4))-max(-RNCc(:,4))); 
      
      xabs = max(max(abs(min(RNCc(:,2))), abs(max(RNCc(:,2)))),xabs);
      yabs = max(max(abs(min(RNCc(:,3))), abs(max(RNCc(:,3)))),yabs);
      zabs = max(max(abs(min(-RNCc(:,4))), abs(max(-RNCc(:,4)))),zabs);
      
      xmin = min(min(RNCc(:,2)),0)-1-0.1*xabs;
      xmax = max(max(RNCc(:,2)),0)+1+0.1*xabs;

      ymin = min(min(RNCc(:,3)),0)-1-0.1*yabs;
      ymax = max(max(RNCc(:,3)),0)+1+0.1*yabs;
      
      zmin = min(min(-RNCc(:,4)),0)-1-0.1*zabs;
      zmax = max(max(-RNCc(:,4)),0)+1+0.1*zabs;
      
      mbfb = max(RNCc(:,5));
      mtfb = max(RNCc(:,6));
      mbft = max(RNCc(:,7));
      mtft = max(RNCc(:,8));
      mDg = max(RNCc(:,9));

      bf = max(mbfb,mbft);

      for i = 1:length(Massemble(:,1))
         switch Rval(i,2) 

            case 1                           % mid-web depth; Rval=1
               ydt=mDg/2+2*mtft; 
               ydb=mDg/2+2*mtfb;    % Shear center         

            case 2                           % top of web; Rval = 2
               ydt=0+2*mtft; 
               ydb=mDg+2*mtfb;    % Shear center           

            case 3                           % bottom of web; Rval = 3
               ydt=mDg+2*mtft; 
               ydb=0+2*mtfb;    % Shear center

         end
      end

      if xabs < ydt*3
         if xmax < ydt*2
            xmax=max( xmax,ydt*2 )+1+0.1*xabs;
         end

         if xmin > -ydb*2
            xmin=min(xmin,-ydb*2)-1-0.1*xabs;
         end            
      end

      if yabs < ydt*3
         if ymax < ydt*2
            ymax=max( ymax,ydt*2 )+1+0.1*yabs;
         end

         if ymin > -ydb*2
            ymin=min(ymin,-ydb*2)-1-0.1*yabs;
         end 
      end

      if zabs < bf*2           
         if zmax < bf
            zmax=max( zmax,bf )+1+0.1*zabs;
         end

         if zmin > -bf
            zmin=min(zmin,-bf)-1-0.1*zabs; 
         end
      end
      
   else
      mDg=0;
      xabs = abs(min(JNodevalue(:,2))-max(JNodevalue(:,2)));
      yabs = abs(min(JNodevalue(:,3))-max(JNodevalue(:,3)));
      zabs = abs(min(-JNodevalue(:,4))-max(-JNodevalue(:,4)));

      xabs = max(max(abs(min(JNodevalue(:,2))), abs(max(JNodevalue(:,2)))),xabs);
      yabs = max(max(abs(min(JNodevalue(:,3))), abs(max(JNodevalue(:,3)))),yabs);
      zabs = max(max(abs(min(-JNodevalue(:,4))), abs(max(-JNodevalue(:,4)))),zabs);
      
      xmin = min(min(JNodevalue(:,2)),0)-1-0.1*xabs;
      xmax = max(max(JNodevalue(:,2)),0)+1+0.1*xabs;

      ymin = min(min(JNodevalue(:,3)),0)-1-0.1*yabs;
      ymax = max(max(JNodevalue(:,3)),0)+1+0.1*yabs; 

      zmin = min(min(-JNodevalue(:,4)),0)-1-0.1*zabs;
      zmax = max(max(-JNodevalue(:,4)),0)+1+0.1*zabs; 

   end

   xa=max( max(max(abs(xmax-xmin),abs(ymax-ymin)),abs(zmax-zmin))/18,mDg); 
   
%    xmax=max(xmax+0.5*xa,xa)+xrmax;
%    ymax=max(ymax+0.5*xa,xa)+yrmax;
%    zmax=max(zmax+0.5*xa,xa);
% 
%    xmin=min(xmin-xa*0.4,-xa*0.8)-xrmax;
%    ymin=min(ymin-xa*0.4,-xa*0.8)-yrmax;
%    zmin=min(zmin-xa*0.4,-xa*0.8);

   xmax=max(xmax+0.5*xa,xa);
   ymax=max(ymax+0.5*xa,xa);
   zmax=max(zmax+0.5*xa,xa);

   xmin=min(xmin-xa*0.4,-xa*0.8);
   ymin=min(ymin-xa*0.4,-xa*0.8);
   zmin=min(zmin-xa*0.4,-xa*0.8);
   
   delete(findobj('Tag','axis'));
   if isequal(LabType(1,3),0)
   if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background   
      plot3(axesm,[0 xa*0.8],[0,0],[0,0],'Color','k','linewidth',1,'Tag','axis','HitTest','off','PickableParts','none');
      hold on;
      plot3(axesm,[0 0],[0,-xa*0.8],[0,0],'Color','k','linewidth',1,'Tag','axis','HitTest','off','PickableParts','none');
      hold on; 
      plot3(axesm,[0 0],[0,0],[0,xa*0.8],'Color','k','linewidth',1,'Tag','axis','HitTest','off','PickableParts','none');
      hold on;      
      text(xa*0.9,0,0,'X','FontSize',11,'Tag','axis','HitTest','off','Color','k','PickableParts','none');
      text(0,-xa*0.9,0,'Z','FontSize',11,'Tag','axis','HitTest','off','Color','k','PickableParts','none');
      text(0,0,xa*0.9,'Y','FontSize',11,'Tag','axis','HitTest','off','Color','k','PickableParts','none');     
   elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background 
      plot3(axesm,[0 xa*0.8],[0,0],[0,0],'Color','w','linewidth',1,'Tag','axis','HitTest','off','PickableParts','none');
      hold on;
      plot3(axesm,[0 0],[0,-xa*0.8],[0,0],'Color','w','linewidth',1,'Tag','axis','HitTest','off','PickableParts','none');
      hold on; 
      plot3(axesm,[0 0],[0,0],[0,xa*0.8],'Color','w','linewidth',1,'Tag','axis','HitTest','off','PickableParts','none');
      hold on;      
      text(xa*0.9,0,0,'X','FontSize',11,'Tag','axis','HitTest','off','Color','w','PickableParts','none');
      text(0,-xa*0.9,0,'Z','FontSize',11,'Tag','axis','HitTest','off','Color','w','PickableParts','none');
      text(0,0,xa*0.9,'Y','FontSize',11,'Tag','axis','HitTest','off','Color','w','PickableParts','none');  
   end     
   end
%    set(axesm,'xlim',[xmin xmax],'ylim',[zmin zmax],'zlim',[ymin ymax])     
   % ********************************************** Plot Coordnate Axes E

   % ---------------------------------------------------------------------
   % --------------        Element global angle       --------------------
   % --------------------------------------------------------------------- 
   % bottom flange centroid to shear center
   % Start node
   Dsbg1=hsb1+tfb1/2 ;
   Dstg1=hst1+tft1/2 ;
   Dmg1 = hst1-tft1/2-Dg1/2;
   % End node
   Dsbg2=hsb2+tfb2/2 ;
   Dstg2=hst2+tft2/2 ;
   Dmg2 = hst2-tft2/2-Dg2/2;
   
   Ratio_D=max(max(hg1),max(hg2));  
   
   for i = 1:xn 
      Rz=[cos(alphatap(i,2)) -sin(alphatap(i,2)) 0; ...
      sin(alphatap(i,2)) cos(alphatap(i,2)) 0; ...
      0 0 1];
   
      Bh1=[0,-Dsbg1(i,1),0]; Bh1=Rz*Bh1'; Bhe1(i,:)=Bh1';
      Bh2=[0,-Dsbg2(i,1),0]; Bh2=Rz*Bh2'; Bhe2(i,:)=Bh2';      
      
      Th1=[0,Dstg1(i,1),0]; Th1=Rz*Th1'; The1(i,:)=Th1';
      Th2=[0,Dstg2(i,1),0]; Th2=Rz*Th2'; The2(i,:)=Th2'; 
      
      Sh1=[0,-CSD1(i,1),0]; Sh1=Rz*Sh1'; SGhe1(i,:)=Sh1';
      Sh2=[0,-CSD2(i,1),0]; Sh2=Rz*Sh2'; SGhe2(i,:)=Sh2';  
      
      Mh1=[0,Dmg1(i,1),0]; Mh1=Rz*Mh1'; Mhe1(i,:)=Mh1';
      Mh2=[0,Dmg2(i,1),0]; Mh2=Rz*Mh2'; Mhe2(i,:)=Mh2';        
   end
   
   % ---------------------------------------------------------------------
   % -------------------        Nodal global angle       -----------------
   % ---------------------------------------------------------------------    
%    NC =[nodenum,xgnum,ygnum,zgnum,bfbnum,tfbnum,bftnum,tftnum,dwnum,twnum,dnum,hnum];
   bfbg=RNCc(:,5); tfbg=RNCc(:,6); bftg=RNCc(:,7); tftg=RNCc(:,8); hg=RNCc(:,12);
   % bottom flange centroid to shear center
   hsbg = (tftg.*bftg.^3.*hg)./(tfbg.*bfbg.^3+tftg.*bftg.^3); 
   hstg = hg - hsbg;    % top flange centroid to shear center 
   Dsbg=hsbg+tfbg/2 +xa*0.01;
   Dstg=hstg+tftg/2 +xa*0.01;
   MWsbg=hsbg-tfbg/2-(hg-(tftg+tfbg)/2)/2;
   MWstg=hstg-tftg/2-(hg-(tftg+tfbg)/2)/2;   
   % Centroid Axis ; ytbar = top flange to centroid
   Dgg=RNCc(:,9); twg=RNCc(:,10);
   Agg =  tftg.*bftg + twg.*Dgg  + tfbg.*bfbg;
   ytbarg = ( bftg.*tftg.*tftg/2+twg.*Dgg.*(tftg+Dgg/2)+ bfbg.*tfbg.*(tftg+Dgg+tfbg/2) )./Agg;
   Dctg = ytbarg - tftg;   % top of Web depth to centroid
   Dcbg = Dgg - Dctg;      % bottom of Web depth to centroid
   hctg = ytbarg - tftg/2; % top flange centroid to centroid
   hcbg = hg - hctg;      % bottom flange centroid to centroid
   % Difference between shear center and centroid from top flange centroid  
   CSD = hstg-hctg;
   
    AJ=[Massemble(:,2);Massemble(:,3)];
   for i=1:length(JNodevalue(:,1))
      p=0;
      for j=1:length(AJ(:,1))
         if isequal(i,AJ(j,1))
            DJ(i,1)=i;
            DJ(i,2)=p;
            p=p+1;
         end
      end      
   end
 
   p=1;DJnode=[];
   for i=1:length(DJ(:,1))
      if ~isequal(DJ(i,2),0)
         DJnode(p,1)=p;
         DJnode(p,2)=JNodevalue(i,2);
         DJnode(p,3)=JNodevalue(i,3);
         DJnode(p,4)=JNodevalue(i,4);
         p=p+1;
      end
   end
   
   if ~isempty(DJnode)
      for j=1:length(DUP1(:,1))
         for i=1:length(DJnode(:,1))
            if isequal(DJnode(i,2),DUP1(j,3)) && isequal(DJnode(i,3),DUP1(j,4)) ...
                  && isequal(DJnode(i,4),DUP1(j,5))
               alpharef1(j,1)= j;
               alpharef1(j,2)= DUP1(j,2);
               alpharef1(j,3)= 10;
               break;
            else
               alpharef1(j,1)= j;
               alpharef1(j,2)= DUP1(j,2);
               alpharef1(j,3)= alpharef(j,2);           
            end     
         end
      end

      for j=1:length(DUP2(:,1))
         for i=1:length(DJnode(:,1))
            if isequal(DJnode(i,2),DUP2(j,3)) && isequal(DJnode(i,3),DUP2(j,4)) ...
                  && isequal(DJnode(i,4),DUP2(j,5))
               alpharef2(j,1)= j;
               alpharef2(j,2)= DUP2(j,2);
               alpharef2(j,3)= 10;
               break;
            else
               alpharef2(j,1)= j;
               alpharef2(j,2)= DUP2(j,2);
               alpharef2(j,3)= alpharef(j,2);           
            end         
         end
      end      

      for i=1:length(NCc(:,1))
         for j=1:length(alpharef1(:,1))
            if isequal(i,alpharef1(j,2))
               alphanode(i,1)=i;
               alphanode(i,2)=alpharef1(j,3);
               break;
            elseif isequal(i,alpharef2(j,2))
               alphanode(i,1)=i;
               alphanode(i,2)=alpharef2(j,3);            
               break;
            end

         end            
      end
   else
      
      for i=1:length(NCc(:,1))
         if isequal(i,length(NCc(:,1)))
            alphanode(i,1)=i;
            alphanode(i,2)=alpharef(length(NCc(:,1))-1,2);             
         else
            alphanode(i,1)=i;
            alphanode(i,2)=alpharef(i,2);  
         end
      end      
      
   end

   for i = 1:length(NCc(:,1)) 
      if ~isequal(alphanode(i,2),10)
         Rz=[cos(alphanode(i,2)) -sin(alphanode(i,2)) 0; ...
         sin(alphanode(i,2)) cos(alphanode(i,2)) 0; ...
         0 0 1];

         Bh=[0,-Dsbg(i,1),0]; Bh=Rz*Bh'; Bhg(i,:)=Bh';    
         Th=[0,Dstg(i,1),0]; Th=Rz*Th'; Thg(i,:)=Th'; 
         CS=[0,CSD(i,1),0]; CS=Rz*CS'; CSg(i,:)=CS';  
         Mh=[0,MWstg(i,1),0]; Mh=Rz*Mh'; Mhg(i,:)=Mh';        
      else
         Bh=[0,0,0]; Bhg(i,:)=Bh;    
         Th=[0,0,0]; Thg(i,:)=Th;    
         CS=[0,0,0]; CSg(i,:)=CS;
         Mh=[0,0,0]; Mhg(i,:)=Mh;         
      end
      
   end    

   lt=1.35; % Line thickness
   xb=7;    % Markersize Fixities
   xs=9;    % Markersize Shear Panel
   xd=7;    % Markersize Grounded Spring
   xf=6;    % Markersize Flexure
   % ---------------------------------------------------------------------
   % -------------------        Plot Point Load       --------------------
   % ---------------------------------------------------------------------   
   prd = xa*0.4;
   dp1=xa*0.01;
   dp2=xa*0.8;   
   if isequal(xa,mDg)
%       dps = 1.4;
      dps = xa*0.1;
   else
      dps = xa*0.14;   
   end

   t = linspace(0,3*pi/2,10000);
   x = xa*0.4*cos(t);                  
   y = xa*0.4*sin(t);   
   z = 0*sin(t);
   t1 = linspace(-pi/2,2*pi/2,10000);
   x1 = xa*0.4*cos(t1);                  
   y1 = xa*0.4*sin(t1);   
   % Drawing Loading Nodal points
   if isempty(RNCc) || isempty(LNC)
   else
      if isequal(LabType(1,9),0)
      for i=1:length(RNCc(:,1))
         if ~isequal(LNC(i,5),0) % Force x-axis
            if isequal(LNC(i,13),1) || isequal(LNC(i,13),0) % Shear center
               if LNC(i,5) < 0
                  plot3(axesm,[(RNCc(i,2)+dp1), (RNCc(i,2)+dp2)],[RNCc(i,4),RNCc(i,4)],[RNCc(i,3),RNCc(i,3)],...
                     'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+dp1,RNCc(i,4),RNCc(i,3); RNCc(i,2)+dp1,RNCc(i,4),RNCc(i,3); ...
                     RNCc(i,2)+dp1,RNCc(i,4),RNCc(i,3); RNCc(i,2)+dp1,RNCc(i,4),RNCc(i,3)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;
               elseif LNC(i,5) > 0
                  plot3(axesm,[(RNCc(i,2)-dp1), (RNCc(i,2)-dp2)],[RNCc(i,4),RNCc(i,4)],[RNCc(i,3),RNCc(i,3)],...
                     'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                   
                  Sco = [RNCc(i,2)-dp1,RNCc(i,4),RNCc(i,3); RNCc(i,2)-dp1,RNCc(i,4),RNCc(i,3); ...
                     RNCc(i,2)-dp1,RNCc(i,4),RNCc(i,3); RNCc(i,2)-dp1,RNCc(i,4),RNCc(i,3)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                        
               end    
            elseif isequal(LNC(i,13),2) % Top flange
               if LNC(i,5) < 0
                  plot3(axesm,[(RNCc(i,2)+dp1+Thg(i,1)), (RNCc(i,2)+dp2+Thg(i,1))],...
                     [RNCc(i,4)+Thg(i,3),RNCc(i,4)+Thg(i,3)],[RNCc(i,3)+Thg(i,2),RNCc(i,3)+Thg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+dp1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+dp1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)+dp1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+dp1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                    
               elseif LNC(i,5) > 0
                  plot3(axesm,[(RNCc(i,2)-dp1+Thg(i,1)), (RNCc(i,2)-dp2+Thg(i,1))],...
                     [RNCc(i,4)+Thg(i,3),RNCc(i,4)+Thg(i,3)],[RNCc(i,3)+Thg(i,2),RNCc(i,3)+Thg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)-dp1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-dp1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)-dp1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-dp1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                               
               end     
            elseif isequal(LNC(i,13),3) % bottom flange
               if LNC(i,5) < 0
                  plot3(axesm,[(RNCc(i,2)+dp1+Bhg(i,1)), (RNCc(i,2)+dp2+Bhg(i,1))],...
                     [RNCc(i,4)+Bhg(i,3),RNCc(i,4)+Bhg(i,3)],[RNCc(i,3)+Bhg(i,2),RNCc(i,3)+Bhg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+dp1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+dp1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)+dp1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+dp1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                    
               elseif LNC(i,5) > 0
                  plot3(axesm,[(RNCc(i,2)-dp1+Bhg(i,1)), (RNCc(i,2)-dp2+Bhg(i,1))],...
                     [RNCc(i,4)+Bhg(i,3),RNCc(i,4)+Bhg(i,3)],[RNCc(i,3)+Bhg(i,2),RNCc(i,3)+Bhg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                     
                  Sco = [RNCc(i,2)-dp1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-dp1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)-dp1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-dp1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                               
               end   
            elseif isequal(LNC(i,13),4) % Centroid
               if LNC(i,5) < 0
                  plot3(axesm,[(RNCc(i,2)+dp1+CSg(i,1)), (RNCc(i,2)+dp2+CSg(i,1))],...
                     [RNCc(i,4)+CSg(i,3),RNCc(i,4)+CSg(i,3)],[RNCc(i,3)+CSg(i,2),RNCc(i,3)+CSg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+dp1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+dp1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)+dp1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+dp1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                    
               elseif LNC(i,5) > 0
                  plot3(axesm,[(RNCc(i,2)-dp1+CSg(i,1)), (RNCc(i,2)-dp2+CSg(i,1))],...
                     [RNCc(i,4)+CSg(i,3),RNCc(i,4)+CSg(i,3)],[RNCc(i,3)+CSg(i,2),RNCc(i,3)+CSg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                     
                  Sco = [RNCc(i,2)-dp1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-dp1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)-dp1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-dp1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                               
               end
            elseif isequal(LNC(i,13),5) % Mid-Web
               if LNC(i,5) < 0
                  plot3(axesm,[(RNCc(i,2)+dp1+Mhg(i,1)), (RNCc(i,2)+dp2+Mhg(i,1))],...
                     [RNCc(i,4)+Mhg(i,3),RNCc(i,4)+Mhg(i,3)],[RNCc(i,3)+Mhg(i,2),RNCc(i,3)+Mhg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+dp1+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+dp1+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2); ...
                     RNCc(i,2)+dp1+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+dp1+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                    
               elseif LNC(i,5) > 0
                  plot3(axesm,[(RNCc(i,2)-dp1+Mhg(i,1)), (RNCc(i,2)-dp2+Mhg(i,1))],...
                     [RNCc(i,4)+Mhg(i,3),RNCc(i,4)+Mhg(i,3)],[RNCc(i,3)+Mhg(i,2),RNCc(i,3)+Mhg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)-dp1+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)-dp1+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2); ...
                     RNCc(i,2)-dp1+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)-dp1+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                               
               end                
            end    
         end
       
         if ~isequal(LNC(i,6),0) % Force y-axis
            if isequal(LNC(i,13),1) || isequal(LNC(i,13),0) % Shear center
               if LNC(i,6) < 0
                  plot3(axesm,[RNCc(i,2),RNCc(i,2) ],[RNCc(i,4),RNCc(i,4)],[(RNCc(i,3)+dp1),(RNCc(i,3)+dp2)],...
                     'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                   
                  Sco = [RNCc(i,2),RNCc(i,4),RNCc(i,3)+dp1; RNCc(i,2),RNCc(i,4),RNCc(i,3)+dp1; ...
                     RNCc(i,2),RNCc(i,4),RNCc(i,3)+dp1; RNCc(i,2),RNCc(i,4),RNCc(i,3)+dp1];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                  
               elseif LNC(i,6) > 0
                  plot3(axesm,[RNCc(i,2),RNCc(i,2) ],[RNCc(i,4),RNCc(i,4)],[(RNCc(i,3)-dp1),(RNCc(i,3)-dp2)],...
                     'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                   
                  Sco = [RNCc(i,2),RNCc(i,4),RNCc(i,3)-dp1; RNCc(i,2),RNCc(i,4),RNCc(i,3)-dp1; ...
                     RNCc(i,2),RNCc(i,4),RNCc(i,3)-dp1; RNCc(i,2),RNCc(i,4),RNCc(i,3)-dp1];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;            
               end 
            elseif isequal(LNC(i,13),2) % Top flange 
               if LNC(i,6) < 0
                  plot3(axesm,[RNCc(i,2)+Thg(i,1),RNCc(i,2)+Thg(i,1) ],[RNCc(i,4)+Thg(i,3),RNCc(i,4)+Thg(i,3)],...
                     [(RNCc(i,3)+dp1+Thg(i,2)),(RNCc(i,3)+dp2+Thg(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+dp1+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+dp1+Thg(i,2); ...
                     RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+dp1+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+dp1+Thg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                  
               elseif LNC(i,6) > 0
                  plot3(axesm,[RNCc(i,2)+Thg(i,1),RNCc(i,2)+Thg(i,1) ],[RNCc(i,4)+Thg(i,3),RNCc(i,4)+Thg(i,3)],...
                     [(RNCc(i,3)-dp1+Thg(i,2)),(RNCc(i,3)-dp2+Thg(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                      
                  Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-dp1+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-dp1+Thg(i,2); ...
                     RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-dp1+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-dp1+Thg(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;            
               end                  
            elseif isequal(LNC(i,13),3) % Bottom flange
               if LNC(i,6) < 0
                  plot3(axesm,[RNCc(i,2)+Bhg(i,1),RNCc(i,2)+Bhg(i,1) ],[RNCc(i,4)+Bhg(i,3),RNCc(i,4)+Bhg(i,3)],...
                     [(RNCc(i,3)+dp1+Bhg(i,2)),(RNCc(i,3)+dp2+Bhg(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                   
                  Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+dp1+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+dp1+Bhg(i,2); ...
                     RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+dp1+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+dp1+Bhg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                  
               elseif LNC(i,6) > 0
                  plot3(axesm,[RNCc(i,2)+Bhg(i,1),RNCc(i,2)+Bhg(i,1) ],[RNCc(i,4)+Bhg(i,3),RNCc(i,4)+Bhg(i,3)],...
                     [(RNCc(i,3)-dp1+Bhg(i,2)),(RNCc(i,3)-dp2+Bhg(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                          
                  Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-dp1+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-dp1+Bhg(i,2); ...
                     RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-dp1+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-dp1+Bhg(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;            
               end 
            elseif isequal(LNC(i,13),4) % Centroid
               if LNC(i,6) < 0
                  plot3(axesm,[RNCc(i,2)+CSg(i,1),RNCc(i,2)+CSg(i,1) ],[RNCc(i,4)+CSg(i,3),RNCc(i,4)+CSg(i,3)],...
                     [(RNCc(i,3)+dp1+CSg(i,2)),(RNCc(i,3)+dp2+CSg(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                   
                  Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+dp1+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+dp1+CSg(i,2); ...
                     RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+dp1+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+dp1+CSg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                  
               elseif LNC(i,6) > 0
                  plot3(axesm,[RNCc(i,2)+CSg(i,1),RNCc(i,2)+CSg(i,1) ],[RNCc(i,4)+CSg(i,3),RNCc(i,4)+CSg(i,3)],...
                     [(RNCc(i,3)-dp1+CSg(i,2)),(RNCc(i,3)-dp2+CSg(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                          
                  Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-dp1+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-dp1+CSg(i,2); ...
                     RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-dp1+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-dp1+CSg(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;            
               end 
            elseif isequal(LNC(i,13),5) % Mid-Web 
               if LNC(i,6) < 0
                  plot3(axesm,[RNCc(i,2)+Mhg(i,1),RNCc(i,2)+Mhg(i,1) ],[RNCc(i,4)+Mhg(i,3),RNCc(i,4)+Mhg(i,3)],...
                     [(RNCc(i,3)+dp1+Mhg(i,2)),(RNCc(i,3)+dp2+Mhg(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+dp1+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+dp1+Mhg(i,2); ...
                     RNCc(i,2)+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+dp1+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+dp1+Mhg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                  
               elseif LNC(i,6) > 0
                  plot3(axesm,[RNCc(i,2)+Mhg(i,1),RNCc(i,2)+Mhg(i,1) ],[RNCc(i,4)+Mhg(i,3),RNCc(i,4)+Mhg(i,3)],...
                     [(RNCc(i,3)-dp1+Mhg(i,2)),(RNCc(i,3)-dp2+Mhg(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                      
                  Sco = [RNCc(i,2)+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)-dp1+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)-dp1+Mhg(i,2); ...
                     RNCc(i,2)+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)-dp1+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)-dp1+Mhg(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;            
               end               
            end
         end

         if ~isequal(LNC(i,7),0) % Force z-axis  
            if isequal(LNC(i,13),1) || isequal(LNC(i,13),0) % Shear center
               if LNC(i,7) > 0
                  plot3(axesm,[RNCc(i,2),RNCc(i,2) ],[(RNCc(i,4)+dp1),(RNCc(i,4)+dp2)],[RNCc(i,3),RNCc(i,3)],...
                     'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                   
                  Sco = [RNCc(i,2),RNCc(i,4)+dp1,RNCc(i,3); RNCc(i,2),RNCc(i,4)+dp1,RNCc(i,3); ...
                     RNCc(i,2),RNCc(i,4)+dp1,RNCc(i,3); RNCc(i,2),RNCc(i,4)+dp1,RNCc(i,3)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                   
               elseif LNC(i,7) < 0
                  plot3(axesm,[RNCc(i,2),RNCc(i,2) ],[(RNCc(i,4)-dp1),(RNCc(i,4)-dp2)],[RNCc(i,3),RNCc(i,3)],...
                     'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                   
                  Sco = [RNCc(i,2),RNCc(i,4)-dp1,RNCc(i,3); RNCc(i,2),RNCc(i,4)-dp1,RNCc(i,3); ...
                     RNCc(i,2),RNCc(i,4)-dp1,RNCc(i,3); RNCc(i,2),RNCc(i,4)-dp1,RNCc(i,3)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;            
               end 
            elseif isequal(LNC(i,13),2) % Top flange        
               if LNC(i,7) > 0
                  plot3(axesm,[RNCc(i,2)+Thg(i,1),RNCc(i,2)+Thg(i,1) ],[(RNCc(i,4)+dp1+Thg(i,3)),(RNCc(i,4)+dp2+Thg(i,3))],...
                     [RNCc(i,3)+Thg(i,2),RNCc(i,3)+Thg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on; 
                  Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)+dp1+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+dp1+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)+Thg(i,1),RNCc(i,4)+dp1+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+dp1+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                   
               elseif LNC(i,7) < 0
                  plot3(axesm,[RNCc(i,2)+Thg(i,1),RNCc(i,2)+Thg(i,1) ],[(RNCc(i,4)-dp1+Thg(i,3)),(RNCc(i,4)-dp2+Thg(i,3))],...
                     [RNCc(i,3)+Thg(i,2),RNCc(i,3)+Thg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on; 
                  Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)-dp1+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)-dp1+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)+Thg(i,1),RNCc(i,4)-dp1+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)-dp1+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;              
               end  
            elseif isequal(LNC(i,13),3) % Bottom flange
               if LNC(i,7) > 0
                  plot3(axesm,[RNCc(i,2)+Bhg(i,1),RNCc(i,2)+Bhg(i,1) ],[(RNCc(i,4)+dp1+Bhg(i,3)),(RNCc(i,4)+dp2+Bhg(i,3))],...
                     [RNCc(i,3)+Bhg(i,2),RNCc(i,3)+Bhg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on; 
                  Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)+dp1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+dp1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)+Bhg(i,1),RNCc(i,4)+dp1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+dp1+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                   
               elseif LNC(i,7) < 0
                  plot3(axesm,[RNCc(i,2)+Bhg(i,1),RNCc(i,2)+Bhg(i,1) ],[(RNCc(i,4)-dp1+Bhg(i,3)),(RNCc(i,4)-dp2+Bhg(i,3))],...
                     [RNCc(i,3)+Bhg(i,2),RNCc(i,3)+Bhg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on; 
                  Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)-dp1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)-dp1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)+Bhg(i,1),RNCc(i,4)-dp1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)-dp1+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;              
               end  
            elseif isequal(LNC(i,13),4) % Centroid
               if LNC(i,7) > 0
                  plot3(axesm,[RNCc(i,2)+CSg(i,1),RNCc(i,2)+CSg(i,1) ],[(RNCc(i,4)+dp1+CSg(i,3)),(RNCc(i,4)+dp2+CSg(i,3))],...
                     [RNCc(i,3)+CSg(i,2),RNCc(i,3)+CSg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on; 
                  Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)+dp1+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+dp1+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)+CSg(i,1),RNCc(i,4)+dp1+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+dp1+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                   
               elseif LNC(i,7) < 0
                  plot3(axesm,[RNCc(i,2)+CSg(i,1),RNCc(i,2)+CSg(i,1) ],[(RNCc(i,4)-dp1+CSg(i,3)),(RNCc(i,4)-dp2+CSg(i,3))],...
                     [RNCc(i,3)+CSg(i,2),RNCc(i,3)+CSg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on; 
                  Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)-dp1+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)-dp1+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)+CSg(i,1),RNCc(i,4)-dp1+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)-dp1+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;              
               end 
            elseif isequal(LNC(i,13),5) % Mid-Web        
               if LNC(i,7) > 0
                  plot3(axesm,[RNCc(i,2)+Mhg(i,1),RNCc(i,2)+Mhg(i,1) ],[(RNCc(i,4)+dp1+Mhg(i,3)),(RNCc(i,4)+dp2+Mhg(i,3))],...
                     [RNCc(i,3)+Mhg(i,2),RNCc(i,3)+Mhg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on; 
                  Sco = [RNCc(i,2)+Mhg(i,1),RNCc(i,4)+dp1+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)+dp1+Mhg(i,3),RNCc(i,3)+Mhg(i,2); ...
                     RNCc(i,2)+Mhg(i,1),RNCc(i,4)+dp1+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)+dp1+Mhg(i,3),RNCc(i,3)+Mhg(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                   
               elseif LNC(i,7) < 0
                  plot3(axesm,[RNCc(i,2)+Mhg(i,1),RNCc(i,2)+Mhg(i,1) ],[(RNCc(i,4)-dp1+Mhg(i,3)),(RNCc(i,4)-dp2+Mhg(i,3))],...
                     [RNCc(i,3)+Mhg(i,2),RNCc(i,3)+Mhg(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on; 
                  Sco = [RNCc(i,2)+Mhg(i,1),RNCc(i,4)-dp1+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)-dp1+Mhg(i,3),RNCc(i,3)+Mhg(i,2); ...
                     RNCc(i,2)+Mhg(i,1),RNCc(i,4)-dp1+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)-dp1+Mhg(i,3),RNCc(i,3)+Mhg(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;              
               end                
            end
         end
         
         if ~isequal(LNC(i,8),0) % Torsion
            if isequal(LNC(i,13),1) || isequal(LNC(i,13),0) % Shear center
               plot3(axesm,z+RNCc(i,2),x+RNCc(i,4),y+RNCc(i,3),'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               if LNC(i,8) > 0
                  Sco = [RNCc(i,2),RNCc(i,4),RNCc(i,3)-prd; RNCc(i,2),RNCc(i,4),RNCc(i,3)-prd; ...
                     RNCc(i,2),RNCc(i,4),RNCc(i,3)-prd; RNCc(i,2),RNCc(i,4),RNCc(i,3)-prd];
                  Nro = [0,-sqrt(2),-sqrt(2)/2; 0,0,0; 0,-sqrt(2),sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                    
               elseif LNC(i,8) < 0
                  Sco = [RNCc(i,2),RNCc(i,4)+prd,RNCc(i,3); RNCc(i,2),RNCc(i,4)+prd,RNCc(i,3); ...
                     RNCc(i,2),RNCc(i,4)+prd,RNCc(i,3); RNCc(i,2),RNCc(i,4)+prd,RNCc(i,3)];
                  Nro = [0,-sqrt(2)/2,sqrt(2); 0,0,0; 0,sqrt(2)/2,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;            
               end    
            elseif isequal(LNC(i,13),2) % Top flange
                plot3(axesm,z+RNCc(i,2)+Thg(i,1),x+RNCc(i,4)+Thg(i,3),y+RNCc(i,3)+Thg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               if LNC(i,8) > 0
                  Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-prd+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-prd+Thg(i,2); ...
                     RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-prd+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-prd+Thg(i,2)];
                  Nro = [0,-sqrt(2),-sqrt(2)/2; 0,0,0; 0,-sqrt(2),sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                    
               elseif LNC(i,8) < 0
                  Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)+prd+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+prd+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)+Thg(i,1),RNCc(i,4)+prd+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+prd+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [0,-sqrt(2)/2,sqrt(2); 0,0,0; 0,sqrt(2)/2,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                              
               end  
            elseif isequal(LNC(i,13),3) % Bottom flange
                plot3(axesm,z+RNCc(i,2)+Bhg(i,1),x+RNCc(i,4)+Bhg(i,3),y+RNCc(i,3)+Bhg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               if LNC(i,8) > 0
                  Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-prd+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-prd+Bhg(i,2); ...
                     RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-prd+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-prd+Bhg(i,2)];
                  Nro = [0,-sqrt(2),-sqrt(2)/2; 0,0,0; 0,-sqrt(2),sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
               elseif LNC(i,8) < 0
                  Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)+prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)+Bhg(i,1),RNCc(i,4)+prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [0,-sqrt(2)/2,sqrt(2); 0,0,0; 0,sqrt(2)/2,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;           
               end   
            elseif isequal(LNC(i,13),4) % Centroid
                plot3(axesm,z+RNCc(i,2)+CSg(i,1),x+RNCc(i,4)+CSg(i,3),y+RNCc(i,3)+CSg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               if LNC(i,8) > 0
                  Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-prd+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-prd+CSg(i,2); ...
                     RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-prd+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-prd+CSg(i,2)];
                  Nro = [0,-sqrt(2),-sqrt(2)/2; 0,0,0; 0,-sqrt(2),sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
               elseif LNC(i,8) < 0
                  Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)+prd+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+prd+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)+CSg(i,1),RNCc(i,4)+prd+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+prd+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [0,-sqrt(2)/2,sqrt(2); 0,0,0; 0,sqrt(2)/2,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;           
               end 
            elseif isequal(LNC(i,13),5) % Mid-Web
                plot3(axesm,z+RNCc(i,2)+Mhg(i,1),x+RNCc(i,4)+Mhg(i,3),y+RNCc(i,3)+Mhg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               if LNC(i,8) > 0
                  Sco = [RNCc(i,2)+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)-prd+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)-prd+Mhg(i,2); ...
                     RNCc(i,2)+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)-prd+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)-prd+Mhg(i,2)];
                  Nro = [0,-sqrt(2),-sqrt(2)/2; 0,0,0; 0,-sqrt(2),sqrt(2)/2; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                    
               elseif LNC(i,8) < 0
                  Sco = [RNCc(i,2)+Mhg(i,1),RNCc(i,4)+prd+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)+prd+Mhg(i,3),RNCc(i,3)+Mhg(i,2); ...
                     RNCc(i,2)+Mhg(i,1),RNCc(i,4)+prd+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)+prd+Mhg(i,3),RNCc(i,3)+Mhg(i,2)];
                  Nro = [0,-sqrt(2)/2,sqrt(2); 0,0,0; 0,sqrt(2)/2,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                              
               end               
            end
         end

         if ~isequal(LNC(i,9),0) % Moment y-axis
            if isequal(LNC(i,13),1) || isequal(LNC(i,13),0) % Shear center
               if LNC(i,9) > 0
                  plot3(axesm,x+RNCc(i,2),y+RNCc(i,4),z+RNCc(i,3),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2),RNCc(i,4)-prd,RNCc(i,3); RNCc(i,2),RNCc(i,4)-prd,RNCc(i,3); ...
                     RNCc(i,2),RNCc(i,4)-prd,RNCc(i,3); RNCc(i,2),RNCc(i,4)-prd,RNCc(i,3)];
                  Nro = [-sqrt(2),-sqrt(2)/2,0; 0,0,0; -sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                      
               elseif LNC(i,9) < 0
                  plot3(axesm,x1+RNCc(i,2),y1+RNCc(i,4),z+RNCc(i,3),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2),RNCc(i,4)-prd,RNCc(i,3); RNCc(i,2),RNCc(i,4)-prd,RNCc(i,3); ...
                     RNCc(i,2),RNCc(i,4)-prd,RNCc(i,3); RNCc(i,2),RNCc(i,4)-prd,RNCc(i,3)];
                  Nro = [sqrt(2),-sqrt(2)/2,0; 0,0,0; sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                              
               end 
            elseif isequal(LNC(i,13),2) % Top flange
               if LNC(i,9) > 0
                  plot3(axesm,x+RNCc(i,2)+Thg(i,1),y+RNCc(i,4)+Thg(i,3),z+RNCc(i,3)+Thg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)-prd+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)-prd+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)+Thg(i,1),RNCc(i,4)-prd+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)-prd+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [-sqrt(2),-sqrt(2)/2,0; 0,0,0; -sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                     
               elseif LNC(i,9) < 0
                  plot3(axesm,x1+RNCc(i,2)+Thg(i,1),y1+RNCc(i,4)+Thg(i,3),z+RNCc(i,3)+Thg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                   
                  Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)-prd+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)-prd+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)+Thg(i,1),RNCc(i,4)-prd+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)-prd+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [sqrt(2),-sqrt(2)/2,0; 0,0,0; sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;             
               end                
            elseif isequal(LNC(i,13),3) % Bottom flange
               if LNC(i,9) > 0
                  plot3(axesm,x+RNCc(i,2)+Bhg(i,1),y+RNCc(i,4)+Bhg(i,3),z+RNCc(i,3)+Bhg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)-prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)-prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)+Bhg(i,1),RNCc(i,4)-prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)-prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [-sqrt(2),-sqrt(2)/2,0; 0,0,0; -sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
               elseif LNC(i,9) < 0
                  plot3(axesm,x1+RNCc(i,2)+Bhg(i,1),y1+RNCc(i,4)+Bhg(i,3),z+RNCc(i,3)+Bhg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                    
                  Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)-prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)-prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)+Bhg(i,1),RNCc(i,4)-prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)-prd+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [sqrt(2),-sqrt(2)/2,0; 0,0,0; sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;           
               end   
            elseif isequal(LNC(i,13),4) % Centroid
               if LNC(i,9) > 0
                  plot3(axesm,x+RNCc(i,2)+CSg(i,1),y+RNCc(i,4)+CSg(i,3),z+RNCc(i,3)+CSg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)-prd+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)-prd+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)+CSg(i,1),RNCc(i,4)-prd+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)-prd+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [-sqrt(2),-sqrt(2)/2,0; 0,0,0; -sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
               elseif LNC(i,9) < 0
                  plot3(axesm,x1+RNCc(i,2)+CSg(i,1),y1+RNCc(i,4)+CSg(i,3),z+RNCc(i,3)+CSg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                    
                  Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)-prd+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)-prd+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)+CSg(i,1),RNCc(i,4)-prd+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)-prd+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [sqrt(2),-sqrt(2)/2,0; 0,0,0; sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;           
               end  
            elseif isequal(LNC(i,13),5) % Mid-Web
               if LNC(i,9) > 0
                  plot3(axesm,x+RNCc(i,2)+Mhg(i,1),y+RNCc(i,4)+Mhg(i,3),z+RNCc(i,3)+Mhg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+Mhg(i,1),RNCc(i,4)-prd+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)-prd+Mhg(i,3),RNCc(i,3)+Mhg(i,2); ...
                     RNCc(i,2)+Mhg(i,1),RNCc(i,4)-prd+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)-prd+Mhg(i,3),RNCc(i,3)+Mhg(i,2)];
                  Nro = [-sqrt(2),-sqrt(2)/2,0; 0,0,0; -sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                     
               elseif LNC(i,9) < 0
                  plot3(axesm,x1+RNCc(i,2)+Mhg(i,1),y1+RNCc(i,4)+Mhg(i,3),z+RNCc(i,3)+Mhg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                   
                  Sco = [RNCc(i,2)+Mhg(i,1),RNCc(i,4)-prd+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)-prd+Mhg(i,3),RNCc(i,3)+Mhg(i,2); ...
                     RNCc(i,2)+Mhg(i,1),RNCc(i,4)-prd+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+Mhg(i,1),RNCc(i,4)-prd+Mhg(i,3),RNCc(i,3)+Mhg(i,2)];
                  Nro = [sqrt(2),-sqrt(2)/2,0; 0,0,0; sqrt(2),sqrt(2)/2,0; 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;             
               end                
            end 
         end

         if ~isequal(LNC(i,10),0) % Moment z-axis
            if isequal(LNC(i,13),1) || isequal(LNC(i,13),0) % Shear center
               if LNC(i,10) > 0
                  plot3(axesm,x1+RNCc(i,2),z+RNCc(i,4),y1+RNCc(i,3),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                    
                  Sco = [RNCc(i,2)-prd,RNCc(i,4),RNCc(i,3); RNCc(i,2)-prd,RNCc(i,4),RNCc(i,3); ...
                     RNCc(i,2)-prd,RNCc(i,4),RNCc(i,3); RNCc(i,2)-prd,RNCc(i,4),RNCc(i,3)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                    
               elseif LNC(i,10) < 0
                  plot3(axesm,x+RNCc(i,2),z+RNCc(i,4),y+RNCc(i,3),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+prd,RNCc(i,4),RNCc(i,3); RNCc(i,2)+prd,RNCc(i,4),RNCc(i,3); ...
                     RNCc(i,2)+prd,RNCc(i,4),RNCc(i,3); RNCc(i,2)+prd,RNCc(i,4),RNCc(i,3)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;             
               end              
            elseif isequal(LNC(i,13),2) % Top flange
               if LNC(i,10) > 0
                  plot3(axesm,x1+RNCc(i,2)+Thg(i,1),z+RNCc(i,4)+Thg(i,3),y1+RNCc(i,3)+Thg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                    
                  Sco = [RNCc(i,2)-prd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-prd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)-prd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-prd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
               elseif LNC(i,10) < 0
                  plot3(axesm,x+RNCc(i,2)+Thg(i,1),z+RNCc(i,4)+Thg(i,3),y+RNCc(i,3)+Thg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+prd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+prd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                     RNCc(i,2)+prd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+prd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;            
               end   
            elseif isequal(LNC(i,13),3) % Bottom flange
               if LNC(i,10) > 0
                  plot3(axesm,x1+RNCc(i,2)+Bhg(i,1),z+RNCc(i,4)+Bhg(i,3),y1+RNCc(i,3)+Bhg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                    
                  Sco = [RNCc(i,2)-prd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-prd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)-prd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-prd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
               elseif LNC(i,10) < 0
                  plot3(axesm,x+RNCc(i,2)+Bhg(i,1),z+RNCc(i,4)+Bhg(i,3),y+RNCc(i,3)+Bhg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+prd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+prd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                     RNCc(i,2)+prd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+prd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;            
               end    
            elseif isequal(LNC(i,13),4) % Centroid
               if LNC(i,10) > 0
                  plot3(axesm,x1+RNCc(i,2)+CSg(i,1),z+RNCc(i,4)+CSg(i,3),y1+RNCc(i,3)+CSg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                    
                  Sco = [RNCc(i,2)-prd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-prd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)-prd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-prd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
               elseif LNC(i,10) < 0
                  plot3(axesm,x+RNCc(i,2)+CSg(i,1),z+RNCc(i,4)+CSg(i,3),y+RNCc(i,3)+CSg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+prd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+prd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                     RNCc(i,2)+prd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+prd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;            
               end 
            elseif isequal(LNC(i,13),5) % Top flange
               if LNC(i,10) > 0
                  plot3(axesm,x1+RNCc(i,2)+Mhg(i,1),z+RNCc(i,4)+Mhg(i,3),y1+RNCc(i,3)+Mhg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                    
                  Sco = [RNCc(i,2)-prd+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)-prd+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2); ...
                     RNCc(i,2)-prd+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)-prd+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
               elseif LNC(i,10) < 0
                  plot3(axesm,x+RNCc(i,2)+Mhg(i,1),z+RNCc(i,4)+Mhg(i,3),y+RNCc(i,3)+Mhg(i,2),'HitTest','off','Color',[0.5 0.8 0.2],...
                     'Tag',['LNC',num2str(i)],'linewidth',lt,'PickableParts','none');
                  hold on;                  
                  Sco = [RNCc(i,2)+prd+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+prd+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2); ...
                     RNCc(i,2)+prd+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2); RNCc(i,2)+prd+Mhg(i,1),RNCc(i,4)+Mhg(i,3),RNCc(i,3)+Mhg(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps;                  
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LNC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;            
               end                
            end
         end               
      end
      else
         for i=1:length(RNCc(:,1))
            delete(findobj('Tag',['LNC',num2str(i)])); 
         end            
      end % LabType(1,9)
   end      

   % ---------------------------------------------------------------------
   % ----------------      Plot Distributed Load      --------------------
   % ---------------------------------------------------------------------       
   du1=xa*0.01;
   du2=xa*0.6;   
   if isequal(xa,mDg)
      dps = xa*0.1;
   else
      dps = xa*0.14;   
   end   
   % Drawing Loading Nodal points
   if isempty(DUP1) || isempty(LUEC)
   else
      if isequal(LabType(1,10),0)
      for i=1:length(DUP1(:,1))
         if ~isequal(LUEC(i,5),0) % Distributed load x-axis
            if isequal(LUEC(i,17),1) || isequal(LUEC(i,17),0) % Shear center         
               plot3(axesm,[(Nshe1(i,1)+du1),(Nshe1(i,1)+du2)],[Nshe1(i,3),Nshe1(i,3) ],[Nshe1(i,2),Nshe1(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,[(Nshe2(i,1)+du1),(Nshe2(i,1)+du2)],[Nshe2(i,3),Nshe2(i,3) ],[Nshe2(i,2),Nshe2(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;            
               plot3(axesm,[(Nshe1(i,1)+du2),(Nshe2(i,1)+du2) ],[Nshe1(i,3),Nshe2(i,3)],[Nshe1(i,2),Nshe2(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               if LUEC(i,5) < 0
                  Sco = [Nshe1(i,1)+du1,Nshe1(i,3),Nshe1(i,2); Nshe1(i,1)+du1,Nshe1(i,3),Nshe1(i,2); ...
                     Nshe1(i,1)+du1,Nshe1(i,3),Nshe1(i,2); Nshe1(i,1)+du1,Nshe1(i,3),Nshe1(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+du1,Nshe2(i,3),Nshe2(i,2); Nshe2(i,1)+du1,Nshe2(i,3),Nshe2(i,2); ...
                     Nshe2(i,1)+du1,Nshe2(i,3),Nshe2(i,2); Nshe2(i,1)+du1,Nshe2(i,3),Nshe2(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                                
               elseif LUEC(i,5) > 0
                  Sco = [Nshe1(i,1)+du2,Nshe1(i,3),Nshe1(i,2); Nshe1(i,1)+du2,Nshe1(i,3),Nshe1(i,2); ...
                     Nshe1(i,1)+du2,Nshe1(i,3),Nshe1(i,2); Nshe1(i,1)+du2,Nshe1(i,3),Nshe1(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+du2,Nshe2(i,3),Nshe2(i,2); Nshe2(i,1)+du2,Nshe2(i,3),Nshe2(i,2); ...
                     Nshe2(i,1)+du2,Nshe2(i,3),Nshe2(i,2); Nshe2(i,1)+du2,Nshe2(i,3),Nshe2(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                                   
               end 

            elseif isequal(LUEC(i,17),2) % Top flange          
               plot3(axesm,[(Nshe1(i,1)+du1+The1(i,1)),(Nshe1(i,1)+du2+The1(i,1))],...
                  [Nshe1(i,3)+The1(i,3),Nshe1(i,3)+The1(i,3) ],[Nshe1(i,2)+The1(i,2),Nshe1(i,2)+The1(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,[(Nshe2(i,1)+du1+The2(i,1)),(Nshe2(i,1)+du2+The2(i,1))],...
                  [Nshe2(i,3)+The2(i,3),Nshe2(i,3)+The2(i,3) ],[Nshe2(i,2)+The2(i,2),Nshe2(i,2)+The2(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;            
               plot3(axesm,[(Nshe1(i,1)+du2+The1(i,1)),(Nshe2(i,1)+du2+The2(i,1)) ],...
                  [Nshe1(i,3)+The1(i,3),Nshe2(i,3)+The2(i,3)],[Nshe1(i,2)+The1(i,2),Nshe2(i,2)+The2(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               if LUEC(i,5) < 0
                  Sco = [Nshe1(i,1)+du1+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+The1(i,2); Nshe1(i,1)+du1+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+The1(i,2); ...
                     Nshe1(i,1)+du1+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+The1(i,2); Nshe1(i,1)+du1+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+The1(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+du1+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+The2(i,2); Nshe2(i,1)+du1+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+The2(i,2); ...
                     Nshe2(i,1)+du1+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+The2(i,2); Nshe2(i,1)+du1+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+The2(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                                                   
               elseif LUEC(i,5) > 0
                  Sco = [Nshe1(i,1)+du2+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+The1(i,2); Nshe1(i,1)+du2+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+The1(i,2); ...
                     Nshe1(i,1)+du2+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+The1(i,2); Nshe1(i,1)+du2+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+The1(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+du2+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+The2(i,2); Nshe2(i,1)+du2+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+The2(i,2); ...
                     Nshe2(i,1)+du2+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+The2(i,2); Nshe2(i,1)+du2+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+The2(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                   
               end
               
            elseif isequal(LUEC(i,17),3) % Bottom flange              
               plot3(axesm,[(Nshe1(i,1)+du1+Bhe1(i,1)),(Nshe1(i,1)+du2+Bhe1(i,1))],...
                  [Nshe1(i,3)+Bhe1(i,3),Nshe1(i,3)+Bhe1(i,3) ],[Nshe1(i,2)+Bhe1(i,2),Nshe1(i,2)+Bhe1(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,[(Nshe2(i,1)+du1+Bhe2(i,1)),(Nshe2(i,1)+du2+Bhe2(i,1))],...
                  [Nshe2(i,3)+Bhe2(i,3),Nshe2(i,3)+Bhe2(i,3) ],[Nshe2(i,2)+Bhe2(i,2),Nshe2(i,2)+Bhe2(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;            
               plot3(axesm,[(Nshe1(i,1)+du2+Bhe1(i,1)),(Nshe2(i,1)+du2+Bhe2(i,1)) ],...
                  [Nshe1(i,3)+Bhe1(i,3),Nshe2(i,3)+Bhe2(i,3)],[Nshe1(i,2)+Bhe1(i,2),Nshe2(i,2)+Bhe2(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               if LUEC(i,5) < 0
                  Sco = [Nshe1(i,1)+du1+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2); Nshe1(i,1)+du1+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2); ...
                     Nshe1(i,1)+du1+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2); Nshe1(i,1)+du1+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+du1+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2); Nshe2(i,1)+du1+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2); ...
                     Nshe2(i,1)+du1+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2); Nshe2(i,1)+du1+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                              
               elseif LUEC(i,5) > 0
                  Sco = [Nshe1(i,1)+du2+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2); Nshe1(i,1)+du2+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2); ...
                     Nshe1(i,1)+du2+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2); Nshe1(i,1)+du2+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+du2+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2); Nshe2(i,1)+du2+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2); ...
                     Nshe2(i,1)+du2+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2); Nshe2(i,1)+du2+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                               
               end   
            elseif isequal(LUEC(i,17),4) % Centroid              
               plot3(axesm,[(Nshe1(i,1)+du1+SGhe1(i,1)),(Nshe1(i,1)+du2+SGhe1(i,1))],...
                  [Nshe1(i,3)+SGhe1(i,3),Nshe1(i,3)+SGhe1(i,3) ],[Nshe1(i,2)+SGhe1(i,2),Nshe1(i,2)+SGhe1(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,[(Nshe2(i,1)+du1+SGhe2(i,1)),(Nshe2(i,1)+du2+SGhe2(i,1))],...
                  [Nshe2(i,3)+SGhe2(i,3),Nshe2(i,3)+SGhe2(i,3) ],[Nshe2(i,2)+SGhe2(i,2),Nshe2(i,2)+SGhe2(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;            
               plot3(axesm,[(Nshe1(i,1)+du2+SGhe1(i,1)),(Nshe2(i,1)+du2+SGhe2(i,1)) ],...
                  [Nshe1(i,3)+SGhe1(i,3),Nshe2(i,3)+SGhe2(i,3)],[Nshe1(i,2)+SGhe1(i,2),Nshe2(i,2)+SGhe2(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               if LUEC(i,5) < 0
                  Sco = [Nshe1(i,1)+du1+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2); Nshe1(i,1)+du1+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2); ...
                     Nshe1(i,1)+du1+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2); Nshe1(i,1)+du1+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+du1+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2); Nshe2(i,1)+du1+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2); ...
                     Nshe2(i,1)+du1+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2); Nshe2(i,1)+du1+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                              
               elseif LUEC(i,5) > 0
                  Sco = [Nshe1(i,1)+du2+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2); Nshe1(i,1)+du2+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2); ...
                     Nshe1(i,1)+du2+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2); Nshe1(i,1)+du2+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+du2+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2); Nshe2(i,1)+du2+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2); ...
                     Nshe2(i,1)+du2+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2); Nshe2(i,1)+du2+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                               
               end     
            elseif isequal(LUEC(i,17),5) % Mid-Web              
               plot3(axesm,[(Nshe1(i,1)+du1+Mhe1(i,1)),(Nshe1(i,1)+du2+Mhe1(i,1))],...
                  [Nshe1(i,3)+Mhe1(i,3),Nshe1(i,3)+Mhe1(i,3) ],[Nshe1(i,2)+Mhe1(i,2),Nshe1(i,2)+Mhe1(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,[(Nshe2(i,1)+du1+Mhe2(i,1)),(Nshe2(i,1)+du2+Mhe2(i,1))],...
                  [Nshe2(i,3)+Mhe2(i,3),Nshe2(i,3)+Mhe2(i,3) ],[Nshe2(i,2)+Mhe2(i,2),Nshe2(i,2)+Mhe2(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;            
               plot3(axesm,[(Nshe1(i,1)+du2+Mhe1(i,1)),(Nshe2(i,1)+du2+Mhe2(i,1)) ],...
                  [Nshe1(i,3)+Mhe1(i,3),Nshe2(i,3)+Mhe2(i,3)],[Nshe1(i,2)+Mhe1(i,2),Nshe2(i,2)+Mhe2(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               if LUEC(i,5) < 0
                  Sco = [Nshe1(i,1)+du1+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2); Nshe1(i,1)+du1+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2); ...
                     Nshe1(i,1)+du1+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2); Nshe1(i,1)+du1+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+du1+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2); Nshe2(i,1)+du1+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2); ...
                     Nshe2(i,1)+du1+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2); Nshe2(i,1)+du1+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2)];
                  Nro = [sqrt(2),0,-sqrt(2)/2; 0,0,0; sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                              
               elseif LUEC(i,5) > 0
                  Sco = [Nshe1(i,1)+du2+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2); Nshe1(i,1)+du2+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2); ...
                     Nshe1(i,1)+du2+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2); Nshe1(i,1)+du2+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+du2+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2); Nshe2(i,1)+du2+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2); ...
                     Nshe2(i,1)+du2+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2); Nshe2(i,1)+du2+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2)];
                  Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                               
               end                
            end
         end
 
         if ~isequal(LUEC(i,6),0) % Distributed load y-axis
            if isequal(LUEC(i,17),1) || isequal(LUEC(i,17),0) % Shear Center
               plot3(axesm,[Nshe1(i,1),Nshe1(i,1) ],[Nshe1(i,3),Nshe1(i,3)],[(Nshe1(i,2)+du1),(Nshe1(i,2)+du2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,[Nshe2(i,1),Nshe2(i,1) ],[Nshe2(i,3),Nshe2(i,3)],[(Nshe2(i,2)+du1),(Nshe2(i,2)+du2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,[Nshe1(i,1),Nshe2(i,1) ],[Nshe1(i,3),Nshe2(i,3)],[(Nshe1(i,2)+du2),(Nshe2(i,2)+du2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               if LUEC(i,6) < 0
                  Sco = [Nshe1(i,1),Nshe1(i,3),Nshe1(i,2)+du1; Nshe1(i,1),Nshe1(i,3),Nshe1(i,2)+du1; ...
                     Nshe1(i,1),Nshe1(i,3),Nshe1(i,2)+du1; Nshe1(i,1),Nshe1(i,3),Nshe1(i,2)+du1];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1),Nshe2(i,3),Nshe2(i,2)+du1; Nshe2(i,1),Nshe2(i,3),Nshe2(i,2)+du1; ...
                     Nshe2(i,1),Nshe2(i,3),Nshe2(i,2)+du1; Nshe2(i,1),Nshe2(i,3),Nshe2(i,2)+du1];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                   
             
               elseif LUEC(i,6) > 0
                  Sco = [Nshe1(i,1),Nshe1(i,3),Nshe1(i,2)+du2; Nshe1(i,1),Nshe1(i,3),Nshe1(i,2)+du2; ...
                     Nshe1(i,1),Nshe1(i,3),Nshe1(i,2)+du2; Nshe1(i,1),Nshe1(i,3),Nshe1(i,2)+du2];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1),Nshe2(i,3),Nshe2(i,2)+du2; Nshe2(i,1),Nshe2(i,3),Nshe2(i,2)+du2; ...
                     Nshe2(i,1),Nshe2(i,3),Nshe2(i,2)+du2; Nshe2(i,1),Nshe2(i,3),Nshe2(i,2)+du2];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                
               end  
   
            elseif isequal(LUEC(i,17),2) % Top flange
               plot3(axesm,[Nshe1(i,1)+The1(i,1),Nshe1(i,1)+The1(i,1) ],[Nshe1(i,3)+The1(i,3),Nshe1(i,3)+The1(i,3)],...
                  [(Nshe1(i,2)+du1+The1(i,2)),(Nshe1(i,2)+du2+The1(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,[Nshe2(i,1)+The2(i,1),Nshe2(i,1)+The2(i,1) ],[Nshe2(i,3)+The2(i,3),Nshe2(i,3)+The2(i,3)],...
                  [(Nshe2(i,2)+du1+The2(i,2)),(Nshe2(i,2)+du2+The2(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,[Nshe1(i,1)+The1(i,1),Nshe2(i,1)+The2(i,1)],[Nshe1(i,3)+The1(i,3),Nshe2(i,3)+The2(i,3)],...
                  [(Nshe1(i,2)+du2+The1(i,2)),(Nshe2(i,2)+du2+The2(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                               
               if LUEC(i,6) < 0
                  Sco = [Nshe1(i,1)+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+du1+The1(i,2); Nshe1(i,1)+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+du1+The1(i,2); ...
                     Nshe1(i,1)+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+du1+The1(i,2); Nshe1(i,1)+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+du1+The1(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+du1+The2(i,2); Nshe2(i,1)+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+du1+The2(i,2); ...
                     Nshe2(i,1)+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+du1+The2(i,2); Nshe2(i,1)+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+du1+The2(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                
               elseif LUEC(i,6) > 0
                  Sco = [Nshe1(i,1)+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+du2+The1(i,2); Nshe1(i,1)+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+du2+The1(i,2); ...
                     Nshe1(i,1)+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+du2+The1(i,2); Nshe1(i,1)+The1(i,1),Nshe1(i,3)+The1(i,3),Nshe1(i,2)+du2+The1(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+du2+The2(i,2); Nshe2(i,1)+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+du2+The2(i,2); ...
                     Nshe2(i,1)+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+du2+The2(i,2); Nshe2(i,1)+The2(i,1),Nshe2(i,3)+The2(i,3),Nshe2(i,2)+du2+The2(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                 
               end                 
               
            elseif isequal(LUEC(i,17),3) % Bottom flange
               plot3(axesm,[Nshe1(i,1)+Bhe1(i,1),Nshe1(i,1)+Bhe1(i,1) ],[Nshe1(i,3)+Bhe1(i,3),Nshe1(i,3)+Bhe1(i,3)],...
                  [(Nshe1(i,2)+du1+Bhe1(i,2)),(Nshe1(i,2)+du2+Bhe1(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,[Nshe2(i,1)+Bhe2(i,1),Nshe2(i,1)+Bhe2(i,1) ],[Nshe2(i,3)+Bhe2(i,3),Nshe2(i,3)+Bhe2(i,3)],...
                  [(Nshe2(i,2)+du1+Bhe2(i,2)),(Nshe2(i,2)+du2+Bhe2(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,[Nshe1(i,1)+Bhe1(i,1),Nshe2(i,1)+Bhe2(i,1)],[Nshe1(i,3)+Bhe1(i,3),Nshe2(i,3)+Bhe2(i,3)],...
                  [(Nshe1(i,2)+du2+Bhe1(i,2)),(Nshe2(i,2)+du2+Bhe2(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               if LUEC(i,6) < 0
                  Sco = [Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+du1+Bhe1(i,2); Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+du1+Bhe1(i,2); ...
                     Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+du1+Bhe1(i,2); Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+du1+Bhe1(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+du1+Bhe2(i,2); Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+du1+Bhe2(i,2); ...
                     Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+du1+Bhe2(i,2); Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+du1+Bhe2(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                
               elseif LUEC(i,6) > 0
                  Sco = [Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+du2+Bhe1(i,2); Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+du2+Bhe1(i,2); ...
                     Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+du2+Bhe1(i,2); Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+Bhe1(i,3),Nshe1(i,2)+du2+Bhe1(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+du2+Bhe2(i,2); Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+du2+Bhe2(i,2); ...
                     Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+du2+Bhe2(i,2); Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+Bhe2(i,3),Nshe2(i,2)+du2+Bhe2(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                 
               end    
               
            elseif isequal(LUEC(i,17),4) % Centroid
               plot3(axesm,[Nshe1(i,1)+SGhe1(i,1),Nshe1(i,1)+SGhe1(i,1) ],[Nshe1(i,3)+SGhe1(i,3),Nshe1(i,3)+SGhe1(i,3)],...
                  [(Nshe1(i,2)+du1+SGhe1(i,2)),(Nshe1(i,2)+du2+SGhe1(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,[Nshe2(i,1)+SGhe2(i,1),Nshe2(i,1)+SGhe2(i,1) ],[Nshe2(i,3)+SGhe2(i,3),Nshe2(i,3)+SGhe2(i,3)],...
                  [(Nshe2(i,2)+du1+SGhe2(i,2)),(Nshe2(i,2)+du2+SGhe2(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,[Nshe1(i,1)+SGhe1(i,1),Nshe2(i,1)+SGhe2(i,1)],[Nshe1(i,3)+SGhe1(i,3),Nshe2(i,3)+SGhe2(i,3)],...
                  [(Nshe1(i,2)+du2+SGhe1(i,2)),(Nshe2(i,2)+du2+SGhe2(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               if LUEC(i,6) < 0
                  Sco = [Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+du1+SGhe1(i,2); Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+du1+SGhe1(i,2); ...
                     Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+du1+SGhe1(i,2); Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+du1+SGhe1(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+du1+SGhe2(i,2); Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+du1+SGhe2(i,2); ...
                     Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+du1+SGhe2(i,2); Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+du1+SGhe2(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                
               elseif LUEC(i,6) > 0
                  Sco = [Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+du2+SGhe1(i,2); Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+du2+SGhe1(i,2); ...
                     Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+du2+SGhe1(i,2); Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+SGhe1(i,3),Nshe1(i,2)+du2+SGhe1(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+du2+SGhe2(i,2); Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+du2+SGhe2(i,2); ...
                     Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+du2+SGhe2(i,2); Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+SGhe2(i,3),Nshe2(i,2)+du2+SGhe2(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                 
               end   
            elseif isequal(LUEC(i,17),5) % Mid-Web
               plot3(axesm,[Nshe1(i,1)+Mhe1(i,1),Nshe1(i,1)+Mhe1(i,1) ],[Nshe1(i,3)+Mhe1(i,3),Nshe1(i,3)+Mhe1(i,3)],...
                  [(Nshe1(i,2)+du1+Mhe1(i,2)),(Nshe1(i,2)+du2+Mhe1(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,[Nshe2(i,1)+Mhe2(i,1),Nshe2(i,1)+Mhe2(i,1) ],[Nshe2(i,3)+Mhe2(i,3),Nshe2(i,3)+Mhe2(i,3)],...
                  [(Nshe2(i,2)+du1+Mhe2(i,2)),(Nshe2(i,2)+du2+Mhe2(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,[Nshe1(i,1)+Mhe1(i,1),Nshe2(i,1)+Mhe2(i,1)],[Nshe1(i,3)+Mhe1(i,3),Nshe2(i,3)+Mhe2(i,3)],...
                  [(Nshe1(i,2)+du2+Mhe1(i,2)),(Nshe2(i,2)+du2+Mhe2(i,2))],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               if LUEC(i,6) < 0
                  Sco = [Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+du1+Mhe1(i,2); Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+du1+Mhe1(i,2); ...
                     Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+du1+Mhe1(i,2); Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+du1+Mhe1(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+du1+Mhe2(i,2); Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+du1+Mhe2(i,2); ...
                     Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+du1+Mhe2(i,2); Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+du1+Mhe2(i,2)];
                  Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                
               elseif LUEC(i,6) > 0
                  Sco = [Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+du2+Mhe1(i,2); Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+du2+Mhe1(i,2); ...
                     Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+du2+Mhe1(i,2); Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+Mhe1(i,3),Nshe1(i,2)+du2+Mhe1(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+du2+Mhe2(i,2); Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+du2+Mhe2(i,2); ...
                     Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+du2+Mhe2(i,2); Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+Mhe2(i,3),Nshe2(i,2)+du2+Mhe2(i,2)];
                  Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                 
               end               
            end
         end

         if ~isequal(LUEC(i,7),0)   % Distributed load z-axis
            if isequal(LUEC(i,17),1) || isequal(LUEC(i,17),0) % Shear center
               plot3(axesm,[Nshe1(i,1),Nshe1(i,1) ],[(Nshe1(i,3)+du1),(Nshe1(i,3)+du2)],[Nshe1(i,2),Nshe1(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               plot3(axesm,[Nshe2(i,1),Nshe2(i,1) ],[(Nshe2(i,3)+du1),(Nshe2(i,3)+du2)],[Nshe2(i,2),Nshe2(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               plot3(axesm,[Nshe1(i,1),Nshe2(i,1) ],[(Nshe1(i,3)+du2),(Nshe2(i,3)+du2)],[Nshe1(i,2),Nshe2(i,2)],...
                  'HitTest','off','Color',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;  
               if LUEC(i,7) > 0
                  Sco = [Nshe1(i,1),Nshe1(i,3)+du1,Nshe1(i,2); Nshe1(i,1),Nshe1(i,3)+du1,Nshe1(i,2); ...
                     Nshe1(i,1),Nshe1(i,3)+du1,Nshe1(i,2); Nshe1(i,1),Nshe1(i,3)+du1,Nshe1(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1),Nshe2(i,3)+du1,Nshe2(i,2); Nshe2(i,1),Nshe2(i,3)+du1,Nshe2(i,2); ...
                     Nshe2(i,1),Nshe2(i,3)+du1,Nshe2(i,2); Nshe2(i,1),Nshe2(i,3)+du1,Nshe2(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                    
             
               elseif LUEC(i,7) < 0
                  Sco = [Nshe1(i,1),Nshe1(i,3)+du2,Nshe1(i,2); Nshe1(i,1),Nshe1(i,3)+du2,Nshe1(i,2); ...
                     Nshe1(i,1),Nshe1(i,3)+du2,Nshe1(i,2); Nshe1(i,1),Nshe1(i,3)+du2,Nshe1(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1),Nshe2(i,3)+du2,Nshe2(i,2); Nshe2(i,1),Nshe2(i,3)+du2,Nshe2(i,2); ...
                     Nshe2(i,1),Nshe2(i,3)+du2,Nshe2(i,2); Nshe2(i,1),Nshe2(i,3)+du2,Nshe2(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                 
               end 
 
            elseif isequal(LUEC(i,17),2) % Top flange
               plot3(axesm,[Nshe1(i,1)+The1(i,1),Nshe1(i,1)+The1(i,1) ],[(Nshe1(i,3)+du1+The1(i,3)),...
                  (Nshe1(i,3)+du2+The1(i,3))],[Nshe1(i,2)+The1(i,2),Nshe1(i,2)+The1(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               plot3(axesm,[Nshe2(i,1)+The2(i,1),Nshe2(i,1)+The2(i,1) ],[(Nshe2(i,3)+du1+The2(i,3)),...
                  (Nshe2(i,3)+du2+The2(i,3))],[Nshe2(i,2)+The2(i,2),Nshe2(i,2)+The2(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               plot3(axesm,[Nshe1(i,1)+The1(i,1),Nshe2(i,1)+The2(i,1) ],[(Nshe1(i,3)+du2+The1(i,3)),...
                  (Nshe2(i,3)+du2+The2(i,3))],[Nshe1(i,2)+The1(i,2),Nshe2(i,2)+The2(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;  
               if LUEC(i,7) > 0
                  Sco = [Nshe1(i,1)+The1(i,1),Nshe1(i,3)+du1+The1(i,3),Nshe1(i,2)+The1(i,2); Nshe1(i,1)+The1(i,1),Nshe1(i,3)+du1+The1(i,3),Nshe1(i,2)+The1(i,2); ...
                     Nshe1(i,1)+The1(i,1),Nshe1(i,3)+du1+The1(i,3),Nshe1(i,2)+The1(i,2); Nshe1(i,1)+The1(i,1),Nshe1(i,3)+du1+The1(i,3),Nshe1(i,2)+The1(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+The2(i,1),Nshe2(i,3)+du1+The2(i,3),Nshe2(i,2)+The2(i,2); Nshe2(i,1)+The2(i,1),Nshe2(i,3)+du1+The2(i,3),Nshe2(i,2)+The2(i,2); ...
                     Nshe2(i,1)+The2(i,1),Nshe2(i,3)+du1+The2(i,3),Nshe2(i,2)+The2(i,2); Nshe2(i,1)+The2(i,1),Nshe2(i,3)+du1+The2(i,3),Nshe2(i,2)+The2(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                 
               elseif LUEC(i,7) < 0
                  Sco = [Nshe1(i,1)+The1(i,1),Nshe1(i,3)+du2+The1(i,3),Nshe1(i,2)+The1(i,2); Nshe1(i,1)+The1(i,1),Nshe1(i,3)+du2+The1(i,3),Nshe1(i,2)+The1(i,2); ...
                     Nshe1(i,1)+The1(i,1),Nshe1(i,3)+du2+The1(i,3),Nshe1(i,2)+The1(i,2); Nshe1(i,1)+The1(i,1),Nshe1(i,3)+du2+The1(i,3),Nshe1(i,2)+The1(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+The2(i,1),Nshe2(i,3)+du2+The2(i,3),Nshe2(i,2)+The2(i,2); Nshe2(i,1)+The2(i,1),Nshe2(i,3)+du2+The2(i,3),Nshe2(i,2)+The2(i,2); ...
                     Nshe2(i,1)+The2(i,1),Nshe2(i,3)+du2+The2(i,3),Nshe2(i,2)+The2(i,2); Nshe2(i,1)+The2(i,1),Nshe2(i,3)+du2+The2(i,3),Nshe2(i,2)+The2(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;              
               end 
               
            elseif isequal(LUEC(i,17),3) % Bottom flange
               plot3(axesm,[Nshe1(i,1)+Bhe1(i,1),Nshe1(i,1)+Bhe1(i,1) ],[(Nshe1(i,3)+du1+Bhe1(i,3)),...
                  (Nshe1(i,3)+du2+Bhe1(i,3))],[Nshe1(i,2)+Bhe1(i,2),Nshe1(i,2)+Bhe1(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               plot3(axesm,[Nshe2(i,1)+Bhe2(i,1),Nshe2(i,1)+Bhe2(i,1) ],[(Nshe2(i,3)+du1+Bhe2(i,3)),...
                  (Nshe2(i,3)+du2+Bhe2(i,3))],[Nshe2(i,2)+Bhe2(i,2),Nshe2(i,2)+Bhe2(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               plot3(axesm,[Nshe1(i,1)+Bhe1(i,1),Nshe2(i,1)+Bhe2(i,1) ],[(Nshe1(i,3)+du2+Bhe1(i,3)),...
                  (Nshe2(i,3)+du2+Bhe2(i,3))],[Nshe1(i,2)+Bhe1(i,2),Nshe2(i,2)+Bhe2(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;  
               if LUEC(i,7) > 0
                  Sco = [Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+du1+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2); Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+du1+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2); ...
                     Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+du1+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2); Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+du1+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+du1+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2); Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+du1+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2); ...
                     Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+du1+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2); Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+du1+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                 
               elseif LUEC(i,7) < 0
                  Sco = [Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+du2+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2); Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+du2+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2); ...
                     Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+du2+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2); Nshe1(i,1)+Bhe1(i,1),Nshe1(i,3)+du2+Bhe1(i,3),Nshe1(i,2)+Bhe1(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+du2+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2); Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+du2+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2); ...
                     Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+du2+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2); Nshe2(i,1)+Bhe2(i,1),Nshe2(i,3)+du2+Bhe2(i,3),Nshe2(i,2)+Bhe2(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;              
               end                
 
            elseif isequal(LUEC(i,17),4) % Centorid
               plot3(axesm,[Nshe1(i,1)+SGhe1(i,1),Nshe1(i,1)+SGhe1(i,1) ],[(Nshe1(i,3)+du1+SGhe1(i,3)),...
                  (Nshe1(i,3)+du2+SGhe1(i,3))],[Nshe1(i,2)+SGhe1(i,2),Nshe1(i,2)+SGhe1(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               plot3(axesm,[Nshe2(i,1)+SGhe2(i,1),Nshe2(i,1)+SGhe2(i,1) ],[(Nshe2(i,3)+du1+SGhe2(i,3)),...
                  (Nshe2(i,3)+du2+SGhe2(i,3))],[Nshe2(i,2)+SGhe2(i,2),Nshe2(i,2)+SGhe2(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               plot3(axesm,[Nshe1(i,1)+SGhe1(i,1),Nshe2(i,1)+SGhe2(i,1) ],[(Nshe1(i,3)+du2+SGhe1(i,3)),...
                  (Nshe2(i,3)+du2+SGhe2(i,3))],[Nshe1(i,2)+SGhe1(i,2),Nshe2(i,2)+SGhe2(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;  
               if LUEC(i,7) > 0
                  Sco = [Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+du1+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2); Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+du1+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2); ...
                     Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+du1+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2); Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+du1+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+du1+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2); Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+du1+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2); ...
                     Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+du1+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2); Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+du1+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                 
               elseif LUEC(i,7) < 0
                  Sco = [Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+du2+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2); Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+du2+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2); ...
                     Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+du2+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2); Nshe1(i,1)+SGhe1(i,1),Nshe1(i,3)+du2+SGhe1(i,3),Nshe1(i,2)+SGhe1(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+du2+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2); Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+du2+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2); ...
                     Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+du2+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2); Nshe2(i,1)+SGhe2(i,1),Nshe2(i,3)+du2+SGhe2(i,3),Nshe2(i,2)+SGhe2(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;              
               end   
            elseif isequal(LUEC(i,17),5) % Web-Dep
               plot3(axesm,[Nshe1(i,1)+Mhe1(i,1),Nshe1(i,1)+Mhe1(i,1) ],[(Nshe1(i,3)+du1+Mhe1(i,3)),...
                  (Nshe1(i,3)+du2+Mhe1(i,3))],[Nshe1(i,2)+Mhe1(i,2),Nshe1(i,2)+Mhe1(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               plot3(axesm,[Nshe2(i,1)+Mhe2(i,1),Nshe2(i,1)+Mhe2(i,1) ],[(Nshe2(i,3)+du1+Mhe2(i,3)),...
                  (Nshe2(i,3)+du2+Mhe2(i,3))],[Nshe2(i,2)+Mhe2(i,2),Nshe2(i,2)+Mhe2(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               plot3(axesm,[Nshe1(i,1)+Mhe1(i,1),Nshe2(i,1)+Mhe2(i,1) ],[(Nshe1(i,3)+du2+Mhe1(i,3)),...
                  (Nshe2(i,3)+du2+Mhe2(i,3))],[Nshe1(i,2)+Mhe1(i,2),Nshe2(i,2)+Mhe2(i,2)],'HitTest','off','Color',[0.5 0.8 0.2],...
                  'Tag',['LUEC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;  
               if LUEC(i,7) > 0
                  Sco = [Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+du1+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2); Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+du1+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2); ...
                     Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+du1+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2); Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+du1+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+du1+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2); Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+du1+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2); ...
                     Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+du1+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2); Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+du1+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2)];
                  Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;                                 
               elseif LUEC(i,7) < 0
                  Sco = [Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+du2+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2); Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+du2+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2); ...
                     Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+du2+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2); Nshe1(i,1)+Mhe1(i,1),Nshe1(i,3)+du2+Mhe1(i,3),Nshe1(i,2)+Mhe1(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on; 
                  
                  Sco = [Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+du2+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2); Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+du2+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2); ...
                     Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+du2+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2); Nshe2(i,1)+Mhe2(i,1),Nshe2(i,3)+du2+Mhe2(i,3),Nshe2(i,2)+Mhe2(i,2)];
                  Nro = [-sqrt(2)/2,-sqrt(2),0; 0,0,0; sqrt(2)/2,-sqrt(2),0; 0,0,0]*dps; 
                  Aro = Sco+Nro;                  
                  [Ax,Ay,Az]=Arrow(Aro);
                  surf(axesm,Ax,Ay,Az,'FaceColor',[0.5 0.8 0.2],'EdgeColor',[0.5 0.8 0.2],'Tag',['LUEC',num2str(i)],'HitTest','off','PickableParts','none'); 
                  hold on;              
               end                  
            end
         end
         
      end
      else
         for i=1:length(DUP1(:,1))
            delete(findobj('Tag',['LUEC',num2str(i)])); 
         end         
      end % LabType(1,10)
   end               

   % ---------------------------------------------------------------------
   % ----------        Plot Boundary Conditions       --------------------
   % ---------------------------------------------------------------------     
   frd = xa*0.4;
   df1=xa*0.01;
   df2=xa*0.8;   
   if isequal(xa,mDg)
      dfs = xa*0.09; 
   else
      dfs = xa*0.13;   
   end
   t = linspace(0,3*pi/2,10000);
   x = xa*0.4*cos(t);                  
   y = xa*0.4*sin(t);   
   z = 0*sin(t);
   t1 = linspace(-pi/2,2*pi/2,10000);
   x1 = xa*0.4*cos(t1);                  
   y1 = xa*0.4*sin(t1);    
   % Drawing Loading Nodal points
   if isempty(RNCc) || isempty(PNC)
   else
      if isequal(LabType(1,5),0)
      for i=1:length(RNCc(:,1))
         if ~isequal(PNC(i,5),0) % Fixed x-axis
            if isequal(PNC(i,13),1) || isequal(PNC(i,13),0) % Shear center 
               plot3(axesm,[(RNCc(i,2)-df1), (RNCc(i,2)-df2)],[RNCc(i,4),RNCc(i,4)],[RNCc(i,3),RNCc(i,3)],...
                  'HitTest','off','Color','m','Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                   
               Sco = [RNCc(i,2)-df1,RNCc(i,4),RNCc(i,3); RNCc(i,2)-df1,RNCc(i,4),RNCc(i,3); ...
                  RNCc(i,2)-df1,RNCc(i,4),RNCc(i,3); RNCc(i,2)-df1,RNCc(i,4),RNCc(i,3)];
               Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                                
            elseif isequal(PNC(i,13),2) % Top flange 
               plot3(axesm,[(RNCc(i,2)-df1+Thg(i,1)), (RNCc(i,2)-df2+Thg(i,1))],...
                  [RNCc(i,4)+Thg(i,3),RNCc(i,4)+Thg(i,3)],[RNCc(i,3)+Thg(i,2),RNCc(i,3)+Thg(i,2)],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                  
               Sco = [RNCc(i,2)-df1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-df1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                  RNCc(i,2)-df1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-df1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2)];
               Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                
             elseif isequal(PNC(i,13),3) % Bottom flange   
               plot3(axesm,[(RNCc(i,2)-df1+Bhg(i,1)), (RNCc(i,2)-df2+Bhg(i,1))],...
                  [RNCc(i,4)+Bhg(i,3),RNCc(i,4)+Bhg(i,3)],[RNCc(i,3)+Bhg(i,2),RNCc(i,3)+Bhg(i,2)],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                     
               Sco = [RNCc(i,2)-df1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-df1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                  RNCc(i,2)-df1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-df1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
               Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;    
             elseif isequal(PNC(i,13),4) % Centroid   
               plot3(axesm,[(RNCc(i,2)-df1+CSg(i,1)), (RNCc(i,2)-df2+CSg(i,1))],...
                  [RNCc(i,4)+CSg(i,3),RNCc(i,4)+CSg(i,3)],[RNCc(i,3)+CSg(i,2),RNCc(i,3)+CSg(i,2)],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                     
               Sco = [RNCc(i,2)-df1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-df1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                  RNCc(i,2)-df1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-df1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2)];
               Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                
            end
         end

         if ~isequal(PNC(i,6),0) % Fixed y-axis
            if isequal(PNC(i,13),1) || isequal(PNC(i,13),0) % Shear center 
               plot3(axesm,[RNCc(i,2),RNCc(i,2) ],[RNCc(i,4),RNCc(i,4)],[(RNCc(i,3)-df1),(RNCc(i,3)-df2)],...
                  'HitTest','off','Color','m','Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                   
               Sco = [RNCc(i,2),RNCc(i,4),RNCc(i,3)-df1; RNCc(i,2),RNCc(i,4),RNCc(i,3)-df1; ...
                  RNCc(i,2),RNCc(i,4),RNCc(i,3)-df1; RNCc(i,2),RNCc(i,4),RNCc(i,3)-df1];
               Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dfs; 
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                          
            elseif isequal(PNC(i,13),2) % Top flange    
               plot3(axesm,[RNCc(i,2)+Thg(i,1),RNCc(i,2)+Thg(i,1) ],[RNCc(i,4)+Thg(i,3),RNCc(i,4)+Thg(i,3)],...
                  [(RNCc(i,3)-df1+Thg(i,2)),(RNCc(i,3)-df2+Thg(i,2))],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                      
               Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-df1+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-df1+Thg(i,2); ...
                  RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-df1+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-df1+Thg(i,2)];
               Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dfs; 
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                 
            elseif isequal(PNC(i,13),3) % Bottom flange   
               plot3(axesm,[RNCc(i,2)+Bhg(i,1),RNCc(i,2)+Bhg(i,1) ],[RNCc(i,4)+Bhg(i,3),RNCc(i,4)+Bhg(i,3)],...
                  [(RNCc(i,3)-df1+Bhg(i,2)),(RNCc(i,3)-df2+Bhg(i,2))],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                          
               Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-df1+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-df1+Bhg(i,2); ...
                  RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-df1+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-df1+Bhg(i,2)];
               Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dfs; 
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;   
            elseif isequal(PNC(i,13),4) % Centroid   
               plot3(axesm,[RNCc(i,2)+CSg(i,1),RNCc(i,2)+CSg(i,1) ],[RNCc(i,4)+CSg(i,3),RNCc(i,4)+CSg(i,3)],...
                  [(RNCc(i,3)-df1+CSg(i,2)),(RNCc(i,3)-df2+CSg(i,2))],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                          
               Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-df1+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-df1+CSg(i,2); ...
                  RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-df1+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-df1+CSg(i,2)];
               Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dfs; 
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                  
            end 
         end

         if ~isequal(PNC(i,7),0) % Fixed z-axis 
            if isequal(PNC(i,13),1) || isequal(PNC(i,13),0)  % Shear center 
               plot3(axesm,[RNCc(i,2),RNCc(i,2) ],[(RNCc(i,4)+df1),(RNCc(i,4)+df2)],[RNCc(i,3),RNCc(i,3)],...
                  'HitTest','off','Color','m','Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                   
               Sco = [RNCc(i,2),RNCc(i,4)+df1,RNCc(i,3); RNCc(i,2),RNCc(i,4)+df1,RNCc(i,3); ...
                  RNCc(i,2),RNCc(i,4)+df1,RNCc(i,3); RNCc(i,2),RNCc(i,4)+df1,RNCc(i,3)];
               Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                   
            elseif isequal(PNC(i,13),2) % Top flange
               plot3(axesm,[RNCc(i,2)+Thg(i,1),RNCc(i,2)+Thg(i,1) ],[(RNCc(i,4)+df1+Thg(i,3)),(RNCc(i,4)+df2+Thg(i,3))],...
                  [RNCc(i,3)+Thg(i,2),RNCc(i,3)+Thg(i,2)],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)+df1+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+df1+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                  RNCc(i,2)+Thg(i,1),RNCc(i,4)+df1+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+df1+Thg(i,3),RNCc(i,3)+Thg(i,2)];
               Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                 
            elseif isequal(PNC(i,13),3) % Bottom flange
               plot3(axesm,[RNCc(i,2)+Bhg(i,1),RNCc(i,2)+Bhg(i,1) ],[(RNCc(i,4)+df1+Bhg(i,3)),(RNCc(i,4)+df2+Bhg(i,3))],...
                  [RNCc(i,3)+Bhg(i,2),RNCc(i,3)+Bhg(i,2)],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)+df1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+df1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                  RNCc(i,2)+Bhg(i,1),RNCc(i,4)+df1+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+df1+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
               Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;   
            elseif isequal(PNC(i,13),4) % Centroid
               plot3(axesm,[RNCc(i,2)+CSg(i,1),RNCc(i,2)+CSg(i,1) ],[(RNCc(i,4)+df1+CSg(i,3)),(RNCc(i,4)+df2+CSg(i,3))],...
                  [RNCc(i,3)+CSg(i,2),RNCc(i,3)+CSg(i,2)],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)+df1+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+df1+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                  RNCc(i,2)+CSg(i,1),RNCc(i,4)+df1+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+df1+CSg(i,3),RNCc(i,3)+CSg(i,2)];
               Nro = [-sqrt(2)/2,sqrt(2),0; 0,0,0; sqrt(2)/2,sqrt(2),0; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                
            end
         end

         if ~isequal(PNC(i,8),0) % Fixed Torsion
            if isequal(PNC(i,13),1) || isequal(PNC(i,13),0) % Shear center
               plot3(axesm,z+RNCc(i,2),x+RNCc(i,4),y+RNCc(i,3),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                 
               Sco = [RNCc(i,2),RNCc(i,4),RNCc(i,3)-frd; RNCc(i,2),RNCc(i,4),RNCc(i,3)-frd; ...
                  RNCc(i,2),RNCc(i,4),RNCc(i,3)-frd; RNCc(i,2),RNCc(i,4),RNCc(i,3)-frd]; 
               Nro = [0,-sqrt(2),-sqrt(2)/2; 0,0,0; 0,-sqrt(2),sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on; 
                  
            elseif isequal(PNC(i,13),2) % Top flange
               plot3(axesm,z+RNCc(i,2)+Thg(i,1),x+RNCc(i,4)+Thg(i,3),y+RNCc(i,3)+Thg(i,2),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-frd+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-frd+Thg(i,2); ...
                  RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-frd+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-frd+Thg(i,2)];    
               Nro = [0,-sqrt(2),-sqrt(2)/2; 0,0,0; 0,-sqrt(2),sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;   
               
            elseif isequal(PNC(i,13),3) % Bottom flange
               plot3(axesm,z+RNCc(i,2)+Bhg(i,1),x+RNCc(i,4)+Bhg(i,3),y+RNCc(i,3)+Bhg(i,2),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-frd+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-frd+Bhg(i,2); ...
                  RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-frd+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-frd+Bhg(i,2)];  
               Nro = [0,-sqrt(2),-sqrt(2)/2; 0,0,0; 0,-sqrt(2),sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;       
               
            elseif isequal(PNC(i,13),4) % Centroid
               plot3(axesm,z+RNCc(i,2)+CSg(i,1),x+RNCc(i,4)+CSg(i,3),y+RNCc(i,3)+CSg(i,2),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-frd+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-frd+CSg(i,2); ...
                  RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-frd+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-frd+CSg(i,2)];  
               Nro = [0,-sqrt(2),-sqrt(2)/2; 0,0,0; 0,-sqrt(2),sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                
            end
         end

         if ~isequal(PNC(i,9),0) % Fixed Moment y-axis
            if isequal(PNC(i,13),1) || isequal(PNC(i,13),0) % Shear center
               plot3(axesm,x+RNCc(i,2),y+RNCc(i,4),z+RNCc(i,3),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                
               Sco = [RNCc(i,2),RNCc(i,4)-frd,RNCc(i,3); RNCc(i,2),RNCc(i,4)-frd,RNCc(i,3); ...
                  RNCc(i,2),RNCc(i,4)-frd,RNCc(i,3); RNCc(i,2),RNCc(i,4)-frd,RNCc(i,3)];
               Nro = [-sqrt(2),-sqrt(2)/2,0; 0,0,0; -sqrt(2),sqrt(2)/2,0; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;  
            elseif isequal(PNC(i,13),2) % Top flange
               plot3(axesm,x+RNCc(i,2)+Thg(i,1),y+RNCc(i,4)+Thg(i,3),z+RNCc(i,3)+Thg(i,2),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                   
               Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)-frd+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)-frd+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                  RNCc(i,2)+Thg(i,1),RNCc(i,4)-frd+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)-frd+Thg(i,3),RNCc(i,3)+Thg(i,2)];
               Nro = [-sqrt(2),-sqrt(2)/2,0; 0,0,0; -sqrt(2),sqrt(2)/2,0; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;  
            elseif isequal(PNC(i,13),3) % Bottom flange
               plot3(axesm,x+RNCc(i,2)+Bhg(i,1),y+RNCc(i,4)+Bhg(i,3),z+RNCc(i,3)+Bhg(i,2),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                    
               Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)-frd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)-frd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                  RNCc(i,2)+Bhg(i,1),RNCc(i,4)-frd+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)-frd+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
               Nro = [-sqrt(2),-sqrt(2)/2,0; 0,0,0; -sqrt(2),sqrt(2)/2,0; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;     
            elseif isequal(PNC(i,13),4) % Centroid
               plot3(axesm,x+RNCc(i,2)+CSg(i,1),y+RNCc(i,4)+CSg(i,3),z+RNCc(i,3)+CSg(i,2),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                    
               Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)-frd+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)-frd+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                  RNCc(i,2)+CSg(i,1),RNCc(i,4)-frd+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)-frd+CSg(i,3),RNCc(i,3)+CSg(i,2)];
               Nro = [-sqrt(2),-sqrt(2)/2,0; 0,0,0; -sqrt(2),sqrt(2)/2,0; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                
            end
         end
         
         if ~isequal(PNC(i,10),0) % Moment z-axis
            if isequal(PNC(i,13),1) || isequal(PNC(i,13),0) % Shear center
               plot3(axesm,x1+RNCc(i,2),z+RNCc(i,4),y1+RNCc(i,3),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                    
               Sco = [RNCc(i,2)-frd,RNCc(i,4),RNCc(i,3); RNCc(i,2)-frd,RNCc(i,4),RNCc(i,3); ...
                  RNCc(i,2)-frd,RNCc(i,4),RNCc(i,3); RNCc(i,2)-frd,RNCc(i,4),RNCc(i,3)];
               Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;   
            elseif isequal(PNC(i,13),2) % Top flange
               plot3(axesm,x1+RNCc(i,2)+Thg(i,1),z+RNCc(i,4)+Thg(i,3),y1+RNCc(i,3)+Thg(i,2),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                    
               Sco = [RNCc(i,2)-frd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-frd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                  RNCc(i,2)-frd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-frd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2)];
               Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on; 
            elseif isequal(PNC(i,13),3) % Bottom flange
               plot3(axesm,x1+RNCc(i,2)+Bhg(i,1),z+RNCc(i,4)+Bhg(i,3),y1+RNCc(i,3)+Bhg(i,2),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                    
               Sco = [RNCc(i,2)-frd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-frd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                  RNCc(i,2)-frd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-frd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
               Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;    
            elseif isequal(PNC(i,13),4) % Centroid
               plot3(axesm,x1+RNCc(i,2)+CSg(i,1),z+RNCc(i,4)+CSg(i,3),y1+RNCc(i,3)+CSg(i,2),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                    
               Sco = [RNCc(i,2)-frd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-frd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                  RNCc(i,2)-frd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-frd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2)];
               Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                 
            end
         end 
         if ~isequal(PNC(i,11),0)        
            plot3(axesm,RNCc(i,2),RNCc(i,4)+df1,RNCc(i,3),'MarkerFaceColor','m',...
               'HitTest','off','Marker','square','Color','m','MarkerSize',xb*1.25,'Tag',['PNC',num2str(i)],'PickableParts','none');
            hold on;            
         end             
      end
      elseif isequal(LabType(1,5),2)
      for i=1:length(RNCc(:,1))
         if ~isequal(PNC(i,5),0) % Fixed x-axis
            if isequal(PNC(i,13),1) || isequal(PNC(i,13),0) % Shear center 
               plot3(axesm,[(RNCc(i,2)-df1), (RNCc(i,2)-df2)],[RNCc(i,4),RNCc(i,4)],[RNCc(i,3),RNCc(i,3)],...
                  'HitTest','off','Color','m','Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                   
               Sco = [RNCc(i,2)-df1,RNCc(i,4),RNCc(i,3); RNCc(i,2)-df1,RNCc(i,4),RNCc(i,3); ...
                  RNCc(i,2)-df1,RNCc(i,4),RNCc(i,3); RNCc(i,2)-df1,RNCc(i,4),RNCc(i,3)];
               Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                                
            elseif isequal(PNC(i,13),2) % Top flange 
               plot3(axesm,[(RNCc(i,2)-df1+Thg(i,1)), (RNCc(i,2)-df2+Thg(i,1))],...
                  [RNCc(i,4)+Thg(i,3),RNCc(i,4)+Thg(i,3)],[RNCc(i,3)+Thg(i,2),RNCc(i,3)+Thg(i,2)],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                  
               Sco = [RNCc(i,2)-df1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-df1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                  RNCc(i,2)-df1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-df1+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2)];
               Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                
             elseif isequal(PNC(i,13),3) % Bottom flange   
               plot3(axesm,[(RNCc(i,2)-df1+Bhg(i,1)), (RNCc(i,2)-df2+Bhg(i,1))],...
                  [RNCc(i,4)+Bhg(i,3),RNCc(i,4)+Bhg(i,3)],[RNCc(i,3)+Bhg(i,2),RNCc(i,3)+Bhg(i,2)],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                     
               Sco = [RNCc(i,2)-df1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-df1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                  RNCc(i,2)-df1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-df1+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
               Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;    
             elseif isequal(PNC(i,13),4) % Centroid   
               plot3(axesm,[(RNCc(i,2)-df1+CSg(i,1)), (RNCc(i,2)-df2+CSg(i,1))],...
                  [RNCc(i,4)+CSg(i,3),RNCc(i,4)+CSg(i,3)],[RNCc(i,3)+CSg(i,2),RNCc(i,3)+CSg(i,2)],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                     
               Sco = [RNCc(i,2)-df1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-df1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                  RNCc(i,2)-df1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-df1+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2)];
               Nro = [-sqrt(2),0,-sqrt(2)/2; 0,0,0; -sqrt(2),0,sqrt(2)/2; 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                
            end
         end

         if ~isequal(PNC(i,6),0) % Fixed y-axis
            if isequal(PNC(i,13),1) || isequal(PNC(i,13),0) % Shear center 
               plot3(axesm,[RNCc(i,2),RNCc(i,2) ],[RNCc(i,4),RNCc(i,4)],[(RNCc(i,3)-df1),(RNCc(i,3)-df2)],...
                  'HitTest','off','Color','m','Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                   
               Sco = [RNCc(i,2),RNCc(i,4),RNCc(i,3)-df1; RNCc(i,2),RNCc(i,4),RNCc(i,3)-df1; ...
                  RNCc(i,2),RNCc(i,4),RNCc(i,3)-df1; RNCc(i,2),RNCc(i,4),RNCc(i,3)-df1];
               Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dfs; 
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                          
            elseif isequal(PNC(i,13),2) % Top flange    
               plot3(axesm,[RNCc(i,2)+Thg(i,1),RNCc(i,2)+Thg(i,1) ],[RNCc(i,4)+Thg(i,3),RNCc(i,4)+Thg(i,3)],...
                  [(RNCc(i,3)-df1+Thg(i,2)),(RNCc(i,3)-df2+Thg(i,2))],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                      
               Sco = [RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-df1+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-df1+Thg(i,2); ...
                  RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-df1+Thg(i,2); RNCc(i,2)+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)-df1+Thg(i,2)];
               Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dfs; 
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                 
            elseif isequal(PNC(i,13),3) % Bottom flange   
               plot3(axesm,[RNCc(i,2)+Bhg(i,1),RNCc(i,2)+Bhg(i,1) ],[RNCc(i,4)+Bhg(i,3),RNCc(i,4)+Bhg(i,3)],...
                  [(RNCc(i,3)-df1+Bhg(i,2)),(RNCc(i,3)-df2+Bhg(i,2))],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                          
               Sco = [RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-df1+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-df1+Bhg(i,2); ...
                  RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-df1+Bhg(i,2); RNCc(i,2)+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)-df1+Bhg(i,2)];
               Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dfs; 
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;   
            elseif isequal(PNC(i,13),4) % Centroid   
               plot3(axesm,[RNCc(i,2)+CSg(i,1),RNCc(i,2)+CSg(i,1) ],[RNCc(i,4)+CSg(i,3),RNCc(i,4)+CSg(i,3)],...
                  [(RNCc(i,3)-df1+CSg(i,2)),(RNCc(i,3)-df2+CSg(i,2))],'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                          
               Sco = [RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-df1+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-df1+CSg(i,2); ...
                  RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-df1+CSg(i,2); RNCc(i,2)+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)-df1+CSg(i,2)];
               Nro = [-sqrt(2)/2,0,-sqrt(2); 0,0,0; sqrt(2)/2,0,-sqrt(2); 0,0,0]*dfs; 
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                  
            end 
         end
         
         if ~isequal(PNC(i,10),0) % Moment z-axis
            if isequal(PNC(i,13),1) || isequal(PNC(i,13),0) % Shear center
               plot3(axesm,x1+RNCc(i,2),z+RNCc(i,4),y1+RNCc(i,3),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                    
               Sco = [RNCc(i,2)-frd,RNCc(i,4),RNCc(i,3); RNCc(i,2)-frd,RNCc(i,4),RNCc(i,3); ...
                  RNCc(i,2)-frd,RNCc(i,4),RNCc(i,3); RNCc(i,2)-frd,RNCc(i,4),RNCc(i,3)];
               Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;   
            elseif isequal(PNC(i,13),2) % Top flange
               plot3(axesm,x1+RNCc(i,2)+Thg(i,1),z+RNCc(i,4)+Thg(i,3),y1+RNCc(i,3)+Thg(i,2),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                    
               Sco = [RNCc(i,2)-frd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-frd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); ...
                  RNCc(i,2)-frd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2); RNCc(i,2)-frd+Thg(i,1),RNCc(i,4)+Thg(i,3),RNCc(i,3)+Thg(i,2)];
               Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on; 
            elseif isequal(PNC(i,13),3) % Bottom flange
               plot3(axesm,x1+RNCc(i,2)+Bhg(i,1),z+RNCc(i,4)+Bhg(i,3),y1+RNCc(i,3)+Bhg(i,2),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                    
               Sco = [RNCc(i,2)-frd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-frd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); ...
                  RNCc(i,2)-frd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2); RNCc(i,2)-frd+Bhg(i,1),RNCc(i,4)+Bhg(i,3),RNCc(i,3)+Bhg(i,2)];
               Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;    
            elseif isequal(PNC(i,13),4) % Centroid
               plot3(axesm,x1+RNCc(i,2)+CSg(i,1),z+RNCc(i,4)+CSg(i,3),y1+RNCc(i,3)+CSg(i,2),'HitTest','off','Color','m',...
                  'Tag',['PNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                    
               Sco = [RNCc(i,2)-frd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-frd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); ...
                  RNCc(i,2)-frd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2); RNCc(i,2)-frd+CSg(i,1),RNCc(i,4)+CSg(i,3),RNCc(i,3)+CSg(i,2)];
               Nro = [-sqrt(2)/2,0,sqrt(2); 0,0,0; sqrt(2)/2,0,sqrt(2); 0,0,0]*dfs;                  
               Aro = Sco+Nro;                  
               [Ax,Ay,Az]=Arrow(Aro);
               surf(axesm,Ax,Ay,Az,'FaceColor','m','EdgeColor','m','Tag',['PNC',num2str(i)],'HitTest','off','PickableParts','none'); 
               hold on;                 
            end
         end            
      end       
      else
         for i=1:length(RNCc(:,1))
            delete(findobj('Tag',['PNC',num2str(i)])); 
         end          
      end % LabType(1,5)
   end      

   
   % ---------------------------------------------------------------------
   % ----------            Plot Shear Panel           --------------------
   % --------------------------------------------------------------------- 
   % Drawing Loading Nodal points
   if isempty(RNCc) || isempty(BNC1)
   else
      if isequal(LabType(1,6),0)
      % Reset coordinate
      for i=1:length(BNC1(:,1))
         BNC1(i,3) = RNCc(BNC1(i,2),2);
         BNC1(i,4) = RNCc(BNC1(i,2),3);
         BNC1(i,5) = RNCc(BNC1(i,2),4);    
         
         BNC2(i,3) = RNCc(BNC2(i,2),2);
         BNC2(i,4) = RNCc(BNC2(i,2),3);
         BNC2(i,5) = RNCc(BNC2(i,2),4);          
      end

      for i=1:length(BNC1(:,1))
        for j=1:length(DUP1(:,1))
            if isequal(BNC1(i,2),DUP1(j,2)) && isequal(round(BNC1(i,3)*10^6)/10^6,round(Nshe1(j,1)*10^6)/10^6) ...
                  && isequal(round(BNC1(i,4)*10^6)/10^6,round(Nshe1(j,2)*10^6)/10^6) && isequal(round(BNC1(i,5)*10^6)/10^6,round(Nshe1(j,3)*10^6)/10^6)
               BNC1(i,11)=j;
            end
            if isequal(BNC2(i,2),DUP2(j,2)) && isequal(round(BNC2(i,3)*10^6)/10^6,round(Nshe2(j,1)*10^6)/10^6) ...
                  && isequal(round(BNC2(i,4)*10^6)/10^6,round(Nshe2(j,2)*10^6)/10^6) && isequal(round(BNC2(i,5)*10^6)/10^6,round(Nshe2(j,3)*10^6)/10^6)
               BNC2(i,11)=j;                             
            end
        end              
      end     
      
      for i=1:(length(BNC1(:,1)))

         if isequal(abs(BNC1(i,2)-BNC2(i,2)),1)
            if ~isequal(BNC1(i,8),0) 
               if isequal(BNC1(i,9),1) || isequal(BNC1(i,9),0) % Top flange
                  plot3(axesm,[BNC1(i,3)+The1(BNC1(i,11),1),BNC1(i,3)+The1(BNC1(i,11),1) ],[BNC1(i,5)+The1(BNC1(i,11),3),BNC1(i,5)+xa*0.5+The1(BNC1(i,11),3)],...
                     [BNC1(i,4)+The1(BNC1(i,11),2),BNC1(i,4)+The1(BNC1(i,11),2)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;
                  plot3(axesm,[BNC2(i,3)+The2(BNC2(i,11),1),BNC2(i,3)+The2(BNC2(i,11),1) ],[BNC2(i,5)+The2(BNC2(i,11),3),BNC2(i,5)+xa*0.5+The2(BNC2(i,11),3)],...
                     [BNC2(i,4)+The2(BNC2(i,11),2),BNC2(i,4)+The2(BNC2(i,11),2)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;               
                  plot3(axesm,[BNC1(i,3)+The1(BNC1(i,11),1),BNC2(i,3)+The2(BNC2(i,11),1) ],[BNC1(i,5)+xa*0.5+The1(BNC1(i,11),3),BNC2(i,5)+xa*0.5+The2(BNC2(i,11),3) ],...
                     [BNC1(i,4)+The1(BNC1(i,11),2),BNC2(i,4)+The2(BNC2(i,11),2)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;                   
                  plot3(axesm,( (BNC1(i,3)+The1(BNC1(i,11),1)+BNC2(i,3)+The2(BNC2(i,11),1))/2 ),( (BNC1(i,5)+The1(BNC1(i,11),3)+BNC2(i,5)+The2(BNC2(i,11),3))/2 + xa*0.5),...
                     ( (BNC1(i,4)+The1(BNC1(i,11),2)+BNC2(i,4)+The2(BNC2(i,11),2))/2 ),'MarkerFaceColor',[0.8 0.2 0],...
                     'HitTest','on','Marker','diamond','Color',[0.8 0.2 0],'MarkerSize',xs,'Tag',['ShearP',num2str(i)]);
                  hold on; 

               elseif isequal(BNC1(i,9),2) 
                  plot3(axesm,[BNC1(i,3),BNC1(i,3) ],[BNC1(i,5),BNC1(i,5)+xa*0.5],...
                     [BNC1(i,4),BNC1(i,4)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;
                  plot3(axesm,[BNC2(i,3),BNC2(i,3) ],[BNC2(i,5),BNC2(i,5)+xa*0.5],...
                     [BNC2(i,4),BNC2(i,4)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;               
                  plot3(axesm,[BNC1(i,3),BNC2(i,3) ],[BNC1(i,5)+xa*0.5,BNC2(i,5)+xa*0.5 ],...
                     [BNC1(i,4),BNC2(i,4)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;                   
                  plot3(axesm,( (BNC1(i,3)+BNC2(i,3))/2 ),( (BNC1(i,5)+BNC2(i,5))/2 + xa*0.5),...
                     ( (BNC1(i,4)+BNC2(i,4))/2 ),'MarkerFaceColor',[0.8 0.2 0],...
                     'HitTest','on','Marker','diamond','Color',[0.8 0.2 0],'MarkerSize',xs,'Tag',['ShearP',num2str(i)]);
                  hold on;            
                  
               elseif isequal(BNC1(i,9),3) % Bottom flange
                  plot3(axesm,[BNC1(i,3)+Bhe1(BNC1(i,11),1),BNC1(i,3)+Bhe1(BNC1(i,11),1) ],[BNC1(i,5)+Bhe1(BNC1(i,11),3),BNC1(i,5)+xa*0.5+Bhe1(BNC1(i,11),3)],...
                     [BNC1(i,4)+Bhe1(BNC1(i,11),2),BNC1(i,4)+Bhe1(BNC1(i,11),2)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;
                  plot3(axesm,[BNC2(i,3)+Bhe2(BNC2(i,11),1),BNC2(i,3)+Bhe2(BNC2(i,11),1) ],[BNC2(i,5)+Bhe2(BNC2(i,11),3),BNC2(i,5)+xa*0.5+Bhe2(BNC2(i,11),3)],...
                     [BNC2(i,4)+Bhe2(BNC2(i,11),2),BNC2(i,4)+Bhe2(BNC2(i,11),2)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;               
                  plot3(axesm,[BNC1(i,3)+Bhe1(BNC1(i,11),1),BNC2(i,3)+Bhe1(BNC1(i,11),1) ],[BNC1(i,5)+xa*0.5+Bhe1(BNC1(i,11),3),BNC2(i,5)+xa*0.5+Bhe1(BNC1(i,11),3) ],...
                     [BNC1(i,4)+Bhe1(BNC1(i,11),2),BNC2(i,4)+Bhe1(BNC1(i,11),2)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;                   
                  plot3(axesm,( (BNC1(i,3)+Bhe1(BNC1(i,11),1)+BNC2(i,3)+Bhe2(BNC2(i,11),1))/2 ),( (BNC1(i,5)+Bhe1(BNC1(i,11),3)+BNC2(i,5)+Bhe2(BNC2(i,11),3))/2 + xa*0.5),...
                     ( (BNC1(i,4)+Bhe1(BNC1(i,11),2)+BNC2(i,4)+Bhe2(BNC2(i,11),2))/2 ),'MarkerFaceColor',[0.8 0.2 0],...
                     'HitTest','on','Marker','diamond','Color',[0.8 0.2 0],'MarkerSize',xs,'Tag',['ShearP',num2str(i)]);
                  hold on;                   
               end
            end
    
         elseif abs(BNC1(i,2)-BNC2(i,2)) > 1

            if ~isequal(BNC1(i,8),0) 
                
               if isequal(BNC1(i,9),1) || isequal(BNC1(i,9),0) % Top flange
                  plot3(axesm,[BNC1(i,3)+The1(BNC1(i,11),1),BNC1(i,3)+The1(BNC1(i,11),1) ],[BNC1(i,5)+The1(BNC1(i,11),3),BNC1(i,5)+xa+The1(BNC1(i,11),3)],...
                     [BNC1(i,4)+The1(BNC1(i,11),2),BNC1(i,4)+The1(BNC1(i,11),2)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;
                  plot3(axesm,[BNC2(i,3)+The2(BNC2(i,11),1),BNC2(i,3)+The2(BNC2(i,11),1) ],[BNC2(i,5)+The2(BNC2(i,11),3),BNC2(i,5)+xa+The2(BNC2(i,11),3)],...
                     [BNC2(i,4)+The2(BNC2(i,11),2),BNC2(i,4)+The2(BNC2(i,11),2)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;               
                  plot3(axesm,[BNC1(i,3)+The1(BNC1(i,11),1),BNC2(i,3)+The2(BNC2(i,11),1) ],[BNC1(i,5)+xa+The1(BNC1(i,11),3),BNC2(i,5)+xa+The2(BNC2(i,11),3)],...
                     [BNC1(i,4)+The1(BNC1(i,11),2),BNC2(i,4)+The2(BNC2(i,11),2)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;                   
                  plot3(axesm,( (BNC1(i,3)+The1(BNC1(i,11),1)+BNC2(i,3)+The2(BNC2(i,11),1))/2 ),( (BNC1(i,5)+The1(BNC1(i,11),3)+BNC2(i,5)+The2(BNC2(i,11),3))/2 + xa),...
                     ( (BNC1(i,4)+The1(BNC1(i,11),2)+BNC2(i,4)+The2(BNC2(i,11),2))/2 ),'MarkerFaceColor',[0.8 0.2 0],...
                     'HitTest','off','Marker','diamond','Color',[0.8 0.2 0],'MarkerSize',xs,'Tag',['ShearP',num2str(i)]);
                  hold on; 
     
                elseif isequal(BNC1(i,9),2) 
                  plot3(axesm,[BNC1(i,3),BNC1(i,3) ],[BNC1(i,5),BNC1(i,5)+xa],...
                     [BNC1(i,4),BNC1(i,4)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;
                  plot3(axesm,[BNC2(i,3),BNC2(i,3) ],[BNC2(i,5),BNC2(i,5)+xa],...
                     [BNC2(i,4),BNC2(i,4)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;               
                  plot3(axesm,[BNC1(i,3),BNC2(i,3) ],[BNC1(i,5)+xa,BNC2(i,5)+xa],...
                     [BNC1(i,4),BNC2(i,4)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;                   
                  plot3(axesm,( (BNC1(i,3)+BNC2(i,3))/2 ),( (BNC1(i,5)+BNC2(i,5))/2 + xa),...
                     ( (BNC1(i,4)+BNC2(i,4))/2 ),'MarkerFaceColor',[0.8 0.2 0],...
                     'HitTest','off','Marker','diamond','Color',[0.8 0.2 0],'MarkerSize',xs,'Tag',['ShearP',num2str(i)]);
                  hold on; 
               
                elseif isequal(BNC1(i,9),3) % Bottom flange
                  plot3(axesm,[BNC1(i,3)+Bhe1(BNC1(i,11),1),BNC1(i,3)+Bhe1(BNC1(i,11),1) ],[BNC1(i,5)+Bhe1(BNC1(i,11),3),BNC1(i,5)+xa+Bhe1(BNC1(i,11),3)],...
                     [BNC1(i,4)+Bhe1(BNC1(i,11),2),BNC1(i,4)+Bhe1(BNC1(i,11),2)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;
                  plot3(axesm,[BNC2(i,3)+Bhe2(BNC2(i,11),1),BNC2(i,3)+Bhe2(BNC2(i,11),1) ],[BNC2(i,5)+Bhe2(BNC2(i,11),3),BNC2(i,5)+xa+Bhe2(BNC2(i,11),3)],...
                     [BNC2(i,4)+Bhe2(BNC2(i,11),2),BNC2(i,4)+Bhe2(BNC2(i,11),2)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;               
                  plot3(axesm,[BNC1(i,3)+Bhe1(BNC1(i,11),1),BNC2(i,3)+Bhe2(BNC2(i,11),1) ],[BNC1(i,5)+xa+Bhe1(BNC1(i,11),3),BNC2(i,5)+xa+Bhe2(BNC2(i,11),3)],...
                     [BNC1(i,4)+Bhe1(BNC1(i,11),2),BNC2(i,4)+Bhe2(BNC2(i,11),2)],'HitTest','off','Color',[0.8 0.2 0],...
                     'Tag',['ShearP',num2str(i)],'PickableParts','none');
                  hold on;                   
                  plot3(axesm,( (BNC1(i,3)+Bhe1(BNC1(i,11),1)+BNC2(i,3)+Bhe2(BNC2(i,11),1))/2 ),( (BNC1(i,5)+Bhe1(BNC1(i,11),3)+BNC2(i,5)+Bhe2(BNC2(i,11),3))/2 + xa),...
                     ( (BNC1(i,4)+Bhe1(BNC1(i,11),2)+BNC2(i,4)+Bhe2(BNC2(i,11),2))/2 ),'MarkerFaceColor',[0.8 0.2 0],...
                     'HitTest','off','Marker','diamond','Color',[0.8 0.2 0],'MarkerSize',xs,'Tag',['ShearP',num2str(i)]);
                  hold on;                  

               end
   
            end
         
         end

      end
      else
         for i=1:(length(BNC1(:,1)))
            delete(findobj('Tag',['ShearP',num2str(i)])); 
         end         
      end % LabType(1,6)
   end 

   % ---------------------------------------------------------------------
   % ----------          Plot Discrete Grounded       --------------------
   % ---------------------------------------------------------------------  
   dgd1=xa*0.08;
   dgd2=xa*0.5;  
   dgd3=xa*0.2;
   dgd4=-xa*0.007;

   t = linspace(0,3*pi/2,10000);
   x = xa*0.4*cos(t);                  
   y = xa*0.4*sin(t);
   z = 0*sin(t);   
   
   t1 = linspace(0,4*pi/2,10000);
   x1 = xa*0.3*cos(t1);                  
   y1 = xa*0.3*sin(t1);
   z1 = 0*sin(t1);    
   
   t2 = linspace(0,4*pi/2,10000);
   x2 = xa*0.2*cos(t2);                  
   y2 = xa*0.2*sin(t2);
   z2 = 0*sin(t2); 

   % Drawing Loading Nodal points
   if isempty(RNCc) || isempty(BNC)
   else
      if isequal(LabType(1,7),0)
      for i=1:length(RNCc(:,1))
         if ~isequal(BNC(i,5),0) % Grounded Spring x-axis
            if isequal(BNC(i,13),1) || isequal(BNC(i,13),0) % Shear center
               plot3(axesm,[(RNCc(i,2)+dgd1), (RNCc(i,2)+dgd2)],...
                  [RNCc(i,4)+dgd4,RNCc(i,4)+dgd4],[RNCc(i,3),RNCc(i,3)],'HitTest','off','Color',[0.7 0.3 0],...
                  'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');                        
               hold on;            
               plot3(axesm,RNCc(i,2)+dgd3,RNCc(i,4)+dgd4,RNCc(i,3),'MarkerFaceColor',[0.7 0.3 0],...
                  'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['BNC',num2str(i)],'PickableParts','none');
               hold on;  
            elseif isequal(BNC(i,13),2) % Top flange 
               plot3(axesm,[(RNCc(i,2)+dgd1+Thg(i,1)), (RNCc(i,2)+dgd2+Thg(i,1))],...
                  [RNCc(i,4)+dgd4+Thg(i,3),RNCc(i,4)+dgd4+Thg(i,3)],[RNCc(i,3)+Thg(i,2),RNCc(i,3)+Thg(i,2)],'HitTest','off','Color',[0.7 0.3 0],...
                  'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');                        
               hold on;            
               plot3(axesm,RNCc(i,2)+dgd3+Thg(i,1),RNCc(i,4)+dgd4+Thg(i,3),RNCc(i,3)+Thg(i,2),'MarkerFaceColor',[0.7 0.3 0],...
                  'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['BNC',num2str(i)],'PickableParts','none');
               hold on; 
            elseif isequal(BNC(i,13),3) % Bottom flange 
               plot3(axesm,[(RNCc(i,2)+dgd1+Bhg(i,1)), (RNCc(i,2)+dgd2+Bhg(i,1))],...
                  [RNCc(i,4)+dgd4+Bhg(i,3),RNCc(i,4)+dgd4+Bhg(i,3)],[RNCc(i,3)+Bhg(i,2),RNCc(i,3)+Bhg(i,2)],'HitTest','off','Color',[0.7 0.3 0],...
                  'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');                        
               hold on;            

               plot3(axesm,RNCc(i,2)+dgd3+Bhg(i,1),RNCc(i,4)+dgd4+Bhg(i,3),RNCc(i,3)+Bhg(i,2),'MarkerFaceColor',[0.7 0.3 0],...
                  'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['BNC',num2str(i)],'PickableParts','none');
               hold on;                
            end
         end
  
         if ~isequal(BNC(i,6),0) % Grounded Spring y-axis
            if isequal(BNC(i,13),1) || isequal(BNC(i,13),0) % Shear center
               plot3(axesm,[RNCc(i,2),RNCc(i,2) ],[RNCc(i,4)+dgd4,RNCc(i,4)+dgd4],...
                  [(RNCc(i,3)+dgd1),(RNCc(i,3)+dgd2)],'HitTest','off','Color',[0.7 0.3 0],...
                  'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;            
               plot3(axesm,RNCc(i,2),RNCc(i,4)+dgd4,RNCc(i,3)+dgd3,'MarkerFaceColor',[0.7 0.3 0],...
                  'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['BNC',num2str(i)],'PickableParts','none');
               hold on;
            elseif isequal(BNC(i,13),2) % Top flange 
               plot3(axesm,[RNCc(i,2)+Thg(i,1),RNCc(i,2)+Thg(i,1) ],[RNCc(i,4)+dgd4+Thg(i,3),RNCc(i,4)+dgd4+Thg(i,3)],...
                  [(RNCc(i,3)+dgd1+Thg(i,2)),(RNCc(i,3)+dgd2+Thg(i,2))],'HitTest','off','Color',[0.7 0.3 0],...
                  'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;            
               plot3(axesm,RNCc(i,2)+Thg(i,1),RNCc(i,4)+dgd4+Thg(i,3),RNCc(i,3)+dgd3+Thg(i,2),'MarkerFaceColor',[0.7 0.3 0],...
                  'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['BNC',num2str(i)],'PickableParts','none');
               hold on;
            elseif isequal(BNC(i,13),3) % Bottom flange 
               plot3(axesm,[RNCc(i,2)+Bhg(i,1),RNCc(i,2)+Bhg(i,1) ],[RNCc(i,4)+dgd4+Bhg(i,3),RNCc(i,4)+dgd4+Bhg(i,3)],...
                  [(RNCc(i,3)+dgd1+Bhg(i,2)),(RNCc(i,3)+dgd2+Bhg(i,2))],'HitTest','off','Color',[0.7 0.3 0],...
                  'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;            
               plot3(axesm,RNCc(i,2)+Bhg(i,1),RNCc(i,4)+dgd4+Bhg(i,3),RNCc(i,3)+dgd3+Bhg(i,2),'MarkerFaceColor',[0.7 0.3 0],...
                  'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['BNC',num2str(i)],'PickableParts','none');
               hold on;               
            end
         end

         if ~isequal(BNC(i,7),0) % Grounded Spring z-axis
            if isequal(BNC(i,13),1) || isequal(BNC(i,13),0) % Shear center
               plot3(axesm,[RNCc(i,2),RNCc(i,2) ],[(RNCc(i,4)+dgd1),(RNCc(i,4)+dgd2)],...
                  [RNCc(i,3),RNCc(i,3)],'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             

               plot3(axesm,RNCc(i,2),RNCc(i,4)+dgd3,RNCc(i,3),'MarkerFaceColor',[0.7 0.3 0],...
                  'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['BNC',num2str(i)],'PickableParts','none');
               hold on;  
            elseif isequal(BNC(i,13),2) % Top flange 
               plot3(axesm,[RNCc(i,2)+Thg(i,1),RNCc(i,2)+Thg(i,1) ],[(RNCc(i,4)+dgd1+Thg(i,3)),(RNCc(i,4)+dgd2+Thg(i,3))],...
                  [RNCc(i,3)+Thg(i,2),RNCc(i,3)+Thg(i,2)],'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               plot3(axesm,RNCc(i,2)+Thg(i,1),RNCc(i,4)+dgd3+Thg(i,3),RNCc(i,3)+Thg(i,2),'MarkerFaceColor',[0.7 0.3 0],...
                  'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['BNC',num2str(i)],'PickableParts','none');
               hold on; 
            elseif isequal(BNC(i,13),3) % Bottom flange 
               plot3(axesm,[RNCc(i,2)+Bhg(i,1),RNCc(i,2)+Bhg(i,1) ],[(RNCc(i,4)+dgd1+Bhg(i,3)),(RNCc(i,4)+dgd2+Bhg(i,3))],...
                  [RNCc(i,3)+Bhg(i,2),RNCc(i,3)+Bhg(i,2)],'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
               plot3(axesm,RNCc(i,2)+Bhg(i,1),RNCc(i,4)+dgd3+Bhg(i,3),RNCc(i,3)+Bhg(i,2),'MarkerFaceColor',[0.7 0.3 0],...
                  'HitTest','off','Marker','*','Color',[0.7 0.3 0],'MarkerSize',xd,'Tag',['BNC',num2str(i)],'PickableParts','none');
               hold on;                
            end
         end
       
         if ~isequal(BNC(i,8),0) % Grounded Moment Spring x-axis
            if isequal(BNC(i,13),1) || isequal(BNC(i,13),0) % Shear center
               plot3(axesm,z+RNCc(i,2),x+RNCc(i,4),y+RNCc(i,3),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,z1+RNCc(i,2),x1+RNCc(i,4),y1+RNCc(i,3),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,z2+RNCc(i,2),x2+RNCc(i,4),y2+RNCc(i,3),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
            elseif isequal(BNC(i,13),2) % Top flange 
               plot3(axesm,z+RNCc(i,2)+Thg(i,1),x+RNCc(i,4)+Thg(i,3),y+RNCc(i,3)+Thg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,z1+RNCc(i,2)+Thg(i,1),x1+RNCc(i,4)+Thg(i,3),y1+RNCc(i,3)+Thg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,z2+RNCc(i,2)+Thg(i,1),x2+RNCc(i,4)+Thg(i,3),y2+RNCc(i,3)+Thg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
            elseif isequal(BNC(i,13),3) % Bottom flange 
               plot3(axesm,z+RNCc(i,2)+Bhg(i,1),x+RNCc(i,4)+Bhg(i,3),y+RNCc(i,3)+Bhg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,z1+RNCc(i,2)+Bhg(i,1),x1+RNCc(i,4)+Bhg(i,3),y1+RNCc(i,3)+Bhg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,z2+RNCc(i,2)+Bhg(i,1),x2+RNCc(i,4)+Bhg(i,3),y2+RNCc(i,3)+Bhg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                
            end
         end
         
         if ~isequal(BNC(i,9),0) % Grounded Moment Spring y-axis
            if isequal(BNC(i,13),1) || isequal(BNC(i,13),0) % Shear center
               plot3(axesm,x+RNCc(i,2),y+RNCc(i,4),z+RNCc(i,3),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,x1+RNCc(i,2),y1+RNCc(i,4),z1+RNCc(i,3),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,x2+RNCc(i,2),y2+RNCc(i,4),z2+RNCc(i,3),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;   
            elseif isequal(BNC(i,13),2) % Top flange 
               plot3(axesm,x+RNCc(i,2)+Thg(i,1),y+RNCc(i,4)+Thg(i,3),z+RNCc(i,3)+Thg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,x1+RNCc(i,2)+Thg(i,1),y1+RNCc(i,4)+Thg(i,3),z1+RNCc(i,3)+Thg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,x2+RNCc(i,2)+Thg(i,1),y2+RNCc(i,4)+Thg(i,3),z2+RNCc(i,3)+Thg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
            elseif isequal(BNC(i,13),3) % Bottom flange 
               plot3(axesm,x+RNCc(i,2)+Bhg(i,1),y+RNCc(i,4)+Bhg(i,3),z+RNCc(i,3)+Bhg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,x1+RNCc(i,2)+Bhg(i,1),y1+RNCc(i,4)+Bhg(i,3),z1+RNCc(i,3)+Bhg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,x2+RNCc(i,2)+Bhg(i,1),y2+RNCc(i,4)+Bhg(i,3),z2+RNCc(i,3)+Bhg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;               
            end
         end
         
         if ~isequal(BNC(i,10),0) % Grounded Moment Spring z-axis
            if isequal(BNC(i,13),1) || isequal(BNC(i,13),0) % Shear center
               plot3(axesm,x+RNCc(i,2),z+RNCc(i,4),y+RNCc(i,3),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,x1+RNCc(i,2),z1+RNCc(i,4),y1+RNCc(i,3),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,x2+RNCc(i,2),z2+RNCc(i,4),y2+RNCc(i,3),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;  
            elseif isequal(BNC(i,13),2) % Top flange
               plot3(axesm,x+RNCc(i,2)+Thg(i,1),z+RNCc(i,4)+Thg(i,3),y+RNCc(i,3)+Thg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,x1+RNCc(i,2)+Thg(i,1),z1+RNCc(i,4)+Thg(i,3),y1+RNCc(i,3)+Thg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,x2+RNCc(i,2)+Thg(i,1),z2+RNCc(i,4)+Thg(i,3),y2+RNCc(i,3)+Thg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
            elseif isequal(BNC(i,13),3) % Bottom flange
               plot3(axesm,x+RNCc(i,2)+Bhg(i,1),z+RNCc(i,4)+Bhg(i,3),y+RNCc(i,3)+Bhg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;
               plot3(axesm,x1+RNCc(i,2)+Bhg(i,1),z1+RNCc(i,4)+Bhg(i,3),y1+RNCc(i,3)+Bhg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on; 
               plot3(axesm,x2+RNCc(i,2)+Bhg(i,1),z2+RNCc(i,4)+Bhg(i,3),y2+RNCc(i,3)+Bhg(i,2),...
                  'HitTest','off','Color',[0.7 0.3 0],'Tag',['BNC',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;                
            end
         end         
      end
      else
         for i=1:length(RNCc(:,1))
            delete(findobj('Tag',['BNC',num2str(i)])); 
         end           
      end % LabType(1,7)
   end         
 
   % ---------------------------------------------------------------------
   % ----------              Plot Flexure             --------------------
   % --------------------------------------------------------------------- 
   % Nodes for each element (# ele, #node start, #node end)
   MI=[DUP1(:,1),DUP1(:,2),DUP2(:,2)];

   % Global frame coordinates at each element.
   % Start node : node(1) and end node : node(2) for each element
   xg1=Nshe1(:,1);xg2=Nshe2(:,1);  % element length : xg1(start) xg2(end)
   yg1=Nshe1(:,2);yg2=Nshe2(:,2);  % element length : xg1(start) xg2(end)
   zg1=Nshe1(:,3);zg2=Nshe2(:,3);  % element length : xg1(start) xg2(end)
   xn=length(MI(:,1));
   % Calculate Initial Element Length for longitudianl direction.
   [DX]=InitialEleLength(xn,xg1,yg1,zg1,xg2,yg2,zg2);   
   
   xl=min(max(RNCc(:,11)),min(min(DX(:,1))/10,xa*0.25));
   FPe1=zeros(xn,3);FPe2=zeros(xn,3);
   for i = 1:xn 
      Rz=[cos(alphatap(i,2)) -sin(alphatap(i,2)) 0; ...
      sin(alphatap(i,2)) cos(alphatap(i,2)) 0; ...
      0 0 1];
   
      FP1=[xl,0,0]; FP1=Rz*FP1'; FPe1(i,:)=FP1';
      FP2=[-xl,0,0]; FP2=Rz*FP2'; FPe2(i,:)=FP2';             
   end   

   % Drawing Loading Nodal points
   if isempty(Nshe1) || isempty(FEL)
   else 
      if isequal(LabType(1,8),0)
      for i=1:length(MI(:,1))
         
         if isequal(FEL(i,2),2)
               plot3(axesm,Nshe1(i,1)+FPe1(i,1),Nshe1(i,3)+FPe1(i,3),Nshe1(i,2)+FPe1(i,2),...
                  'HitTest','off','Marker','d','Color',[0.7 0.5 0],'MarkerSize',xf,'Tag',['FELi',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
         end
         
         if isequal(FEL(i,3),2)
               plot3(axesm,Nshe2(i,1)+FPe2(i,1),Nshe2(i,3)+FPe2(i,3),Nshe2(i,2)+FPe2(i,2),...
                  'HitTest','off','Marker','d','Color',[0.7 0.5 0],'MarkerSize',xf,'Tag',['FELj',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
         end
             
         if isequal(FEL(i,4),2)
               plot3(axesm,Nshe1(i,1)+FPe1(i,1),Nshe1(i,3)+FPe1(i,3),Nshe1(i,2)+FPe1(i,2),...
                  'HitTest','off','Marker','o','Color',[0 0.5 0.7],'MarkerSize',xf,'Tag',['FELi',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
         end
         
         if isequal(FEL(i,5),2)
               plot3(axesm,Nshe2(i,1)+FPe2(i,1),Nshe2(i,3)+FPe2(i,3),Nshe2(i,2)+FPe2(i,2),...
                  'HitTest','off','Marker','o','Color',[0 0.5 0.7],'MarkerSize',xf,'Tag',['FELj',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
         end

         if isequal(FEL(i,6),2)
               plot3(axesm,Nshe1(i,1)+FPe1(i,1),Nshe1(i,3)+FPe1(i,3),Nshe1(i,2)+FPe1(i,2),...
                  'HitTest','off','Marker','o','Color',[0.7 0.5 0],'MarkerSize',xf,'Tag',['FELi',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
         end
         
         if isequal(FEL(i,7),2)
               plot3(axesm,Nshe2(i,1)+FPe2(i,1),Nshe2(i,3)+FPe2(i,3),Nshe2(i,2)+FPe2(i,2),...
                  'HitTest','off','Marker','o','Color',[0.7 0.5 0],'MarkerSize',xf,'Tag',['FELj',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
         end

         if isequal(FEL(i,8),2)
               plot3(axesm,Nshe1(i,1)+FPe1(i,1),Nshe1(i,3)+FPe1(i,3),Nshe1(i,2)+FPe1(i,2),...
                  'HitTest','off','Marker','square','Color',[0.7 0.5 0],'MarkerSize',xf*2,'Tag',['FELi',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
         end
         
         if isequal(FEL(i,9),2)
               plot3(axesm,Nshe2(i,1)+FPe2(i,1),Nshe2(i,3)+FPe2(i,3),Nshe2(i,2)+FPe2(i,2),...
                  'HitTest','off','Marker','square','Color',[0.7 0.5 0],'MarkerSize',xf*2,'Tag',['FELj',num2str(i)],'linewidth',lt,'PickableParts','none');
               hold on;             
         end
         
      end
      else
         for i=1:length(MI(:,1))
            delete(findobj('Tag',['FELi',num2str(i)])); 
            delete(findobj('Tag',['FELj',num2str(i)])); 
         end              
      end % LabType(1,8)
   end   
   

   Ta=max(max(max(JNodevalue_i(:,6)),max(JNodevalue_i(:,8))));
   % Drawing Nodal Points
   if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
      for i = 1:length(RNCc(:,1))
         plot3(axesm,RNCc(i,2),-RNCc(i,4)-Ta*0.01,RNCc(i,3),...
            'Marker','.','Color',[0 0.5 1],'MarkerSize',12,'Tag',['RNCc',num2str(i)]);
         hold on;
      end     
   elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background
      for i = 1:length(RNCc(:,1))
         plot3(axesm,RNCc(i,2),-RNCc(i,4)-Ta*0.01,RNCc(i,3),...
            'Marker','.','Color','w','MarkerSize',12,'Tag',['RNCc',num2str(i)]);
         hold on;
      end  
   end
    if ~isempty(Nshe1)
       % ---------------------------------------------------------------------
       % ----------------    Plot Loading Nodal Points       -----------------
       % ---------------------------------------------------------------------    
       Evalue = [];
       for i = 1:xn 
          Evalue(1,1) = Nshe1(i,1);
          Evalue(2,1) = Nshe2(i,1);
          Evalue(1,2) = Nshe1(i,2);
          Evalue(2,2) = Nshe2(i,2);
          Evalue(1,3) = Nshe1(i,3);
          Evalue(2,3) = Nshe2(i,3); 
          if isequal(strcmp(get(vstm,'Checked'),'on'),1) % white background
             % Texting Member
             text(sum(Evalue(:,1))/2,-sum(Evalue(:,3))/2-Ta*0.02,sum(Evalue(:,2))/2,['E',num2str(i)],...
                'VerticalAlignment','bottom','Tag','EF','Color','k','Visible','off');
             hold on;
             Evalue = [];
          elseif isequal(strcmp(get(vstm,'Checked'),'on'),0) % black background
             % Texting Member
             text(sum(Evalue(:,1))/2,-sum(Evalue(:,3))/2-Ta*0.02,sum(Evalue(:,2))/2,['E',num2str(i)],...
                'VerticalAlignment','bottom','Tag','EF','Color','w','Visible','off');
             hold on;
             Evalue = [];
          end
             
       end   

    end   
   
   
end % Error
  
end % if JNodevalue end 

% az = 0; el = 0; view(az, el);
% axis manual;   
% set(axesm,'Visible','off','Units','normalized','DataAspectRatio',[1 1 1]) 
% set( gca, 'Units', 'normalized', 'Position', [0 0 0.9 1] );

