function [KtBB] = assemble_Kg(KtBB,Kts,Member_data,member,element,Material_data)
add=0;
if member>1
    for i=1:member-1
    add=add+7*(Material_data(1,i)-1);                                       % add size counts from prevous members 
    end
end
for j=1:14    
    row = (Member_data(1+ceil(j/7),member)-1)*7+j-7*(ceil(j/7)-1)+7*(element-1)+add;
    for m = 1:14   
    col = (Member_data(1+ceil(m/7),member)-1)*7+m-7*(ceil(m/7)-1)+7*(element-1)+add;
    KtBB(row,col)= KtBB(row,col)+ Kts(j,m);
    end
end