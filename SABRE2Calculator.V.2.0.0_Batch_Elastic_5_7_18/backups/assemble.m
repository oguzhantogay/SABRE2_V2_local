function [K,Fint,DFG] = assemble(K,Fint,DFG,Kg,Qg,DG,MI,xn)
for j=1:14       
    for m = 1:14          
            row = (MI(xn,1+ceil(j/7))-1)*7+j-7*(ceil(j/7)-1);
            col = (MI(xn,1+ceil(m/7))-1)*7+m-7*(ceil(m/7)-1);
            K(row,col)= K(row,col)+ Kg(j,m);                 
    end
end

for j=1:14
        row = (MI(xn,1+ceil(j/7))-1)*7+j-7*(ceil(j/7)-1);
        Fint(row,1)= Fint(row,1)+ Qg(j,1);  
end   

for j=1:14
        row = (MI(xn,1+ceil(j/7))-1)*7+j-7*(ceil(j/7)-1);
        DFG(row,1)= DFG(row,1)+ DG(j,1); 
end