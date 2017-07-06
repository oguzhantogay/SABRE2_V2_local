function [du_iter]=IterativeDisplacement(du1s,nDOF,BC,RTsuppt)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
% RTsuppt(1)=BC(1,1);
% for i = 1:nDOF-1
%      RTsuppt(i+1,1) = RTsuppt(i)+BC(i+1,1) ;
% end


for i = 1:nDOF
   
    if BC(i,1)== 1
        du_iter(i,1) = 0;
    else
        du_iter(i,1) = du1s(i- RTsuppt(i),1);
    end
        
end

