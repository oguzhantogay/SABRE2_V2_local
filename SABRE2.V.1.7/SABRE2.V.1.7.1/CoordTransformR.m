function [Ge]=CoordTransformR(e1,e2,e3)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
eo1 = [1; 0; 0];
eo2 = [0; 1; 0];
eo3 = [0; 0; 1];
Eo=[eo1,eo2,eo3];  
E=[e1,e2,e3];

Ge1 = [Eo, zeros(3,3);zeros(3,3),E];
Ge2 = zeros(6,6);
Ge = [Ge1,zeros(6,1),Ge2,zeros(6,1);zeros(1,6),1,zeros(1,6),0; ...
    Ge2,zeros(6,1),Ge1,zeros(6,1);zeros(1,6),0,zeros(1,6),1];