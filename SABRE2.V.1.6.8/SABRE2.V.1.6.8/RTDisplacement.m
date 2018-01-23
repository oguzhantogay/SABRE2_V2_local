function [du,RTsuppt]=RTDisplacement(dus,nDOF,BC)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
% start with all DOF free ( = 0 )
RTsuppt = zeros(nDOF,1);

RTsuppt(1,1)=BC(1,1);
for i = 1:nDOF-1
     RTsuppt(i+1,1) = RTsuppt(i)+BC(i+1,1) ;
end

% start with all DOF free ( = 0 )
du = zeros(nDOF,1);
for i = 1:nDOF
   
    if BC(i,1)== 1
        du(i,1) = 0;
    else
        du(i,1) = dus(i- RTsuppt(i),1);
    end
        
end

