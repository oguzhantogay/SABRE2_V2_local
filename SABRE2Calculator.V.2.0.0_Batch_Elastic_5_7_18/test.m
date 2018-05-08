clc; clear
A1=[1 2 3 4 5 6 7 8 9]';
A=[10 20 30 40]';
insert=[2 3 5 6]';
for i =1:size(insert,1)
    A1 = [A1(1:insert(i,1),1); A(i,1); A1(insert(i,1)+1:end,1)];            %insert
end
A1