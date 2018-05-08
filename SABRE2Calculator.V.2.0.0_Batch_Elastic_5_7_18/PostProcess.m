function []=PostProcess(gamma_out,filename,gammma)   
gamma   = num2str(gammma,'%10.2f ');
fprintf(gamma_out,[filename,' ',gamma,'\n']);
% Cb_out      = fopen(strcat(fullfile(outpath,'Cb.txt')),'wt');               % Output file is opened.  
% Moment_out  = fopen(strcat(fullfile(outpath,'Mz.txt')),'wt');               % Output file is opened.
% end
% for i=1:size(Mz,1)
%      for j=1:size(Mz,2)
%          stress(1,size(Mz,2)*(i-1)+j)=gammma*Mz(i,j)*yc(i,j)/Ix(i,j);
%          momentzz(1,size(Mz,2)*(i-1)+j)=-Mz(i,j);
%          ccc(1,size(Mz,2)*(i-1)+j)=yc(i,j);
%          Ixx(1,size(Mz,2)*(i-1)+j)=Ix(i,j);
%          rtt(1,size(Mz,2)*(i-1)+j)=rt(i,j);
%          shearcenter(1,size(Mz,2)*(i-1)+j)=Shear_center(i,j);
%      end
%  end
%  f_all=abs(momentzz.*ccc./Ixx);
%  Lb=JNodevalue(2,2);
%  F_cr=29000*pi()^2./(Lb./rtt).^2;
%  stress_ratio=f_all./F_cr;
%  stress_ratio_max=max(stress_ratio);
%  stress_ratio_start=stress_ratio(1,1);
%  stress_ratio_end=stress_ratio(1,end);
%  SC_first=shearcenter(1,1); SC_last=shearcenter(1,end);
%  SC_mid=shearcenter(1,size(shearcenter,2)/2);
%  SC_line=SC_first+(SC_last-SC_first)/Lb*(kink_location);
%  SC_offset=SC_line-SC_mid;        
%  gaussian_point = [0 0.172673165 0.5 0.827326835 1.0];                      %gaussian-labato 5 pt ordinates
%  for i=1:size(Mz,1)
%      for j=1:size(Mz,2)
%          x_length=xg2(i,1)-xg1(i,1);
%          x_coord(1,size(Mz,2)*(i-1)+j)=xg1(i,1)+gaussian_point(j)*x_length;
%      end
%  end
%  A_quarter=x_coord(1,end)/4;B_quarter=x_coord(1,end)/2;C_quarter=x_coord(1,end)*3/4;
%  for i=1:size(x_coord,2)
%          A_Mz(1,i)=abs(x_coord(1,i)-A_quarter);
%          B_Mz(1,i)=abs(x_coord(1,i)-B_quarter);
%          C_Mz(1,i)=abs(x_coord(1,i)-C_quarter);
%  end
%  Min_A=min(A_Mz);Min_B=min(B_Mz);Min_C=min(C_Mz);
%  for i=1:size(x_coord,2)
%      if A_Mz(1,i)==Min_A
%         Mz_A=momentzz(1,i);
%         SxA=Ixx(1,i)/ccc(1,i);
%         F_cr(1,i);
%         f_all(1,i);
%         stress_ratio_A=stress_ratio(1,i);
%      end
%      if B_Mz(1,i)==Min_B
%         Mz_B=momentzz(1,i); 
%         SxB=Ixx(1,i)/ccc(1,i);
%         F_cr(1,i);
%         f_all(1,i);
%         stress_ratio_B=stress_ratio(1,i);
%      end
%      if C_Mz(1,i)==Min_C
%         Mz_C=momentzz(1,i); 
%         SxC=Ixx(1,i)/ccc(1,i);
%         F_cr(1,i);
%         f_all(1,i);
%         stress_ratio_C=stress_ratio(1,i);
%      end             
%  end         
%  Mz_max=max(abs(momentzz));
%  Cb_temp=4*stress_ratio_max/((stress_ratio_max^2+4*stress_ratio_A^2+7*stress_ratio_B^2+4*stress_ratio_C^2)^.5);      
%  Cb_val=num2str(Cb_temp,'%7.5f ');
%  Mz_A_print = num2str(Mz_A, '%7.8f ');
%  Mz_B_print = num2str(Mz_B, '%7.8f ');
%  Mz_C_print = num2str(Mz_C, '%7.8f ');
%  Mz_max_print = num2str(Mz_max, '%7.8f ');
%  fprintf(Cb_out,[filename,' ',Cb_val,'\n']);
%  fprintf(Moment_out,[filename,' ',Mz_A_print,' ',Mz_B_print,' ',Mz_C_print,' ',Mz_max_print,'\n']);
