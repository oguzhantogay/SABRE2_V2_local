function [Ge]=CoordTransform(e1,e2,e3)
E=[e1,e2,e3];

Ge1 = [E, zeros(3,3);zeros(3,3),E];
Ge2 = zeros(6,6);
Ge = [Ge1,zeros(6,1),Ge2,zeros(6,1);zeros(1,6),1,zeros(1,6),0; ...
    Ge2,zeros(6,1),Ge1,zeros(6,1);zeros(1,6),0,zeros(1,6),1];