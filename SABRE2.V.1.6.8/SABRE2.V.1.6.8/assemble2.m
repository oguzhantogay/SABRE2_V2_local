function [Fint] = assemble2(Fint,Qg,MI,n)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
for j=1:14
    
        row = (MI(n,1+ceil(j/7))-1)*7+j-7*(ceil(j/7)-1);
    
        Fint(row,1)= Fint(row,1)+ Qg(j,1);
            
end   
