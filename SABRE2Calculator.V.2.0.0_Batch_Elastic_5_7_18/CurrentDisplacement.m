function [unew]=CurrentDisplacement(ucur,N,nodedof)
for i = 1:N
    for j = 1:nodedof
        if abs( ucur(j+(i-1)*nodedof,1) )<= 1.2246e-16
            unew(i,j) = 0;
        else
            unew(i,j) = ucur(j+(i-1)*nodedof,1);
        end
    end
end
