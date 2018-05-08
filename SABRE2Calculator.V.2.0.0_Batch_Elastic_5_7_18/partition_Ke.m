function [KeFF,Fff,fixed] = partition_Ke(KeBB,BC_data,Member_data,...
    Material_data,Fint)
BCcount = sum(sum(BC_data(2:8,:))); fixed=zeros(BCcount,1); count=0;
for member=1:size(Member_data,2)
    add=0;
    if member>1
        for i=1:member-1
        add=add+7*(Material_data(1,i)-1);                                      
        end
    end
    for node=1:Material_data(1,member)
       if node == 1
          for i=1:7
              if BC_data(i+1,Member_data(2,member)) == 1 
                  count=count+1;
                  fixed(count,1) = add+7*(node-1)+i;
              end         
          end
       end
       if node == Material_data(1,member) && member==size(Member_data,2)
          for i=1:7
              if BC_data(i+1,Member_data(3,member)) == 1
                    count=count+1;
                    fixed(count,1) = 7*(node*member)+i;
              end         
          end
       end
    end
end
KeBB(fixed(:,1),:)=[];
KeBB(:,fixed(:,1))=[];
Fint(fixed(:,1),:)=[];
KeFF=KeBB;
Fff=Fint;


% % 
% % if nmember>1
% %     for i=2:nmember
% %         for j=1:Material_data(1,i)
% %             for k=1:7
% %             if BC_data(k+1,i)==1
% %                 add=add+7*(Material_data(1,i)-1);                               % add size counts from prevous members 
% %             end
% %             end
% %         end
% %     end
% % end