function [KtBB,KggBB] = assemble1(KtBB,KggBB,Kts,Kggs,MI,n)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
for j=1:14     
    for m = 1:14
            
            row = (MI(n,1+ceil(j/7))-1)*7+j-7*(ceil(j/7)-1);
            col = (MI(n,1+ceil(m/7))-1)*7+m-7*(ceil(m/7)-1);

            KtBB(row,col)= KtBB(row,col)+ Kts(j,m);

    end
end

for j=1:14      
    for m = 1:14
            
            row = (MI(n,1+ceil(j/7))-1)*7+j-7*(ceil(j/7)-1);
            col = (MI(n,1+ceil(m/7))-1)*7+m-7*(ceil(m/7)-1);

            KggBB(row,col)= KggBB(row,col)+ Kggs(j,m);

    end
end



