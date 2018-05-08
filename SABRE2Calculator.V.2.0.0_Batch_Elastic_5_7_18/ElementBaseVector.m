function [e1,e2,e3,Zetaavg,Zeta1,Zeta2,Eta1,Eta2] = ElementBaseVector(dX,dY,dZ,t2,u2,L,alphatap)
Rz=[cos(-alphatap) -sin(-alphatap) 0; ...
    sin(-alphatap)  cos(-alphatap) 0; ...
                 0               0 1];
e1 = zeros(3,1);
e1(1) = dX/L;
e1(2) = dY/L;
e1(3) = dZ/L;

% Global Frame to Element Frame
e1=Rz*e1; Yavg = (t2+u2)/2;
e3L = cross(e1,Yavg); Yavgy = sqrt( e3L(1)^2 + e3L(2)^2 + e3L(3)^2);
e3 = e3L/Yavgy;
e2 = -cross(e1,e3);

Zetaavg = Yavg(1)/Yavgy;
Zeta1 = t2(1)/Yavgy;
Zeta2 = u2(1)/Yavgy;

Eta1 = t2(2)/Yavgy;
Eta2 = u2(2)/Yavgy;