function [RNCc]=SABRE2NCODE(JNodevalue,Massemble,...
      BNodevalue,JNodevalue_i,JNodevalue_j,SNodevalue,RNCc,Rval)

if ~isempty(JNodevalue)&& ~isempty(Massemble) && ~isempty(BNodevalue)...
      && ~isempty(JNodevalue_i) && ~isempty(JNodevalue_j)  ...
      && ~isempty(SNodevalue)
   xn = sum(sum(SNodevalue(:,:,3)));   % Total number of Elements
   mem=length(Massemble(:,1));         % Total number of members   
   % Sassemble Assemble including Member & Bracing
   % Sassemble : Nodal Points
   for k = 1:13
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
      Njbode(q,14)=q; 
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
         Njbode(q+j,14)=q+j;  
      end
      r = sum(SNodevalue(i,:,3))+r;
      q = max(SNodevalue(i,:,2))+q+1;  
   end

   % *********************************************** NC
   nodep=[];xgp=[];ygp=[];zgp=[];bfbp=[];bftp=[];tfbp=[];
   tftp=[];dp=[];twp=[];dwp=[];hp=[];
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
      end
      q = max(SNodevalue(i,:,2))+q+1;  
     
   end
   % integer
   nodenum = round(nodenum);
   NC =[nodenum,xgnum,ygnum,zgnum,bfbnum,tfbnum,bftnum,tftnum,dwnum,twnum,dnum,hnum];  

   % *********************************************** NCa
   q = 0;NCa=[];
   for i=1:mem  
      for j=1:sum(SNodevalue(i,:,3))+1        
         if isequal(i,1)
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
            NCa(j+q,13)=0;
            NCa(j+q,14)=0;
            NCa(j+q,15)=0;
            
            mn = length(NCa(:,1));
         else
            if isequal(j,1)
               for n = 1:mn                 
                  if isequal(NCa(n,2),NC(j+q,2)) ...
                        && isequal(NCa(n,3),NC(j+q,3)) ...
                        && isequal(NCa(n,4),NC(j+q,4))  
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
                     NCa(j+q,13)=n; 
                     NCa(j+q,14)=i;
                     NCa(j+q,15)=j;
                     break; % Stop loof if satisfy the creterian.
       
                  else
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
                     NCa(j+q,13)=0;
                     NCa(j+q,14)=0;
                     NCa(j+q,15)=0;                     

                  end   
               end   
            elseif isequal(j,sum(SNodevalue(i,:,3))+1)
               for n = 1:mn
                  if isequal(NCa(n,2),NC(j+q,2)) ...
                        && isequal(NCa(n,3),NC(j+q,3)) ... 
                        && isequal(NCa(n,4),NC(j+q,4))               
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
                     NCa(j+q,13)=n;
                     NCa(j+q,14)=i;
                     NCa(j+q,15)=j;
                     
                     break;
                  
                  else
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
                     NCa(j+q,13)=0;
                     NCa(j+q,14)=0;
                     NCa(j+q,15)=0;                     

                  end 
               end   
            else
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
               NCa(j+q,13)=0;
               NCa(j+q,14)=0;
               NCa(j+q,15)=0;               
               
            end % if end
         end % if end   
      end % for j end
      mn = length(NCa(:,1)); 
      q = sum(SNodevalue(i,:,3))+q+1;
   end % for i end
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
         r=r+1;
      end
   end
   NCc = NCb;
   % *********************************************** DUP  
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
         end         
      end      
   end

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

      end % for j end
      q = sum(SNodevalue(i,:,3))+q+1;
      r = sum(SNodevalue(i,:,3))+r;
   end % for i end      

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
% -------------------------- Geometric dimension of Cross-section : P299 E

% *** Global frame angle for each element without considering shear center
alpharef = zeros(xn,2);    
for i=1:xn
    opp = yg2(i,1)-yg1(i,1);  % element depth in y-dir
    adj = xg2(i,1)-xg1(i,1);  % element length in x-dir         
    alpharef(i,1)=MI(i,1);
    alpharef(i,2)=atan2(opp,adj); % Only global frame angle
end 

% Calculate Initial Member x-dir Nodal Coordinates for Each Member
[MemLength]=InitialEleLengthRendering(xg1,yg1,zg1,xg2,yg2,zg2,SNodevalue);

q = 0; val1=zeros(xn,1);
for i = 1:mem
   for j=1:sum(SNodevalue(i,:,3))+1
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

MemLength1=NTshe1(:,2);MemLength2=NTshe2(:,2);
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

% ------------------------------------------------------------------------
% -------     Update Intersection Nodes for shear cneter      ------------
% ------------------------------------------------------------------------
r=0;
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
Nshe1(:,1)=round(xg1(:,1)*10^11)/10^11;
Nshe2(:,1)=round(xg2(:,1)*10^11)/10^11;
Nshe1(:,2)=round(yg1(:,1)*10^11)/10^11;
Nshe2(:,2)=round(yg2(:,1)*10^11)/10^11;
Nshe1(:,3)=round(zg1(:,1)*10^11)/10^11;
Nshe2(:,3)=round(zg2(:,1)*10^11)/10^11;

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
%             RNCa(j+q,13)=0;
%             RNCa(j+q,14)=0;
%             RNCa(j+q,15)=0;
%             
%             mn = length(RNCa(:,1));
%          else
%             if isequal(j,1)
%                for n = 1:mn                 
%                   if isequal(round(RNCa(n,2)*10^9)/10^9,round(RNC(j+q,2)*10^9)/10^9) ...
%                         && isequal(round(RNCa(n,3)*10^9)/10^9,round(RNC(j+q,3)*10^9)/10^9) ...
%                         && isequal(round(RNCa(n,4)*10^9)/10^9,round(RNC(j+q,4)*10^9)/10^9)  
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
%                      RNCa(j+q,13)=n; 
%                      RNCa(j+q,14)=i;
%                      RNCa(j+q,15)=j;
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
%                      RNCa(j+q,13)=0;
%                      RNCa(j+q,14)=0;
%                      RNCa(j+q,15)=0;                     
% 
%                   end   
%                end   
%             elseif isequal(j,sum(SNodevalue(i,:,3))+1)
%                for n = 1:mn
%                   if isequal(round(RNCa(n,2)*10^9)/10^9,round(RNC(j+q,2)*10^9)/10^9) ...
%                         && isequal(round(RNCa(n,3)*10^9)/10^9,round(RNC(j+q,3)*10^9)/10^9) ... 
%                         && isequal(round(RNCa(n,4)*10^9)/10^9,round(RNC(j+q,4)*10^9)/10^9)               
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
%                      RNCa(j+q,13)=n;
%                      RNCa(j+q,14)=i;
%                      RNCa(j+q,15)=j;
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
%                      RNCa(j+q,13)=0;
%                      RNCa(j+q,14)=0;
%                      RNCa(j+q,15)=0;                     
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
%                RNCa(j+q,13)=0;
%                RNCa(j+q,14)=0;
%                RNCa(j+q,15)=0;               
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
         r=r+1;
      end
   end

% ------------------------------------------------------------------------
% ------     Updated NCc w.r.t. intersection of shear center      --------
% ------------------------------------------------------------------------ 
% ***************************************************** RNCc (Updated NCc) 
   RNCc = RNCb;
   
end % if JNodevalue end  
 