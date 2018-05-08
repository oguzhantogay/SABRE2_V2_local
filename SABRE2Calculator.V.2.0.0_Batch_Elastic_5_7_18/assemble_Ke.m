function [KtBB,Fint] = assemble_Ke(KtBB,Kts,Member_data,...
    nmember,element,Material_data,Fint,Loading_data)
add=0;
if nmember>1
    for i=1:nmember-1
    add=add+7*(Material_data(1,i)-1);                                       % add size counts from prevous members 
    end
end
for j=1:14    
    row = (Member_data(1+ceil(j/7),nmember)-1)*7+j-7*(ceil(j/7)-1)+7*(element-1)+add;
    for m = 1:14   
    col = (Member_data(1+ceil(m/7),nmember)-1)*7+m-7*(ceil(m/7)-1)+7*(element-1)+add;
    KtBB(row,col)= KtBB(row,col)+ Kts(j,m);
    end
end

if element == 1
  for i=1:6
      if ~isequal(round(Loading_data(i,Member_data(2,nmember)),10),0.0000000000)
          Fint(add+7*(element-1)+i+7*(nmember-1),1)=Loading_data(i,Member_data(2,nmember));
      end         
  end
end
if element == Material_data(1,nmember)
  for i=1:6
      if ~isequal(round(Loading_data(i,Member_data(3,nmember)),10),0.0000000000)
            Fint(add+7*(element)+i+7*(nmember-1),1)=Loading_data(i,Member_data(3,nmember));
      end         
  end
end