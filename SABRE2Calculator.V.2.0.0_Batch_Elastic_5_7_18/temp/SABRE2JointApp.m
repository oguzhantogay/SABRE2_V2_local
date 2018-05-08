function [JNodevalue]=SABRE2JointApp(Geometry_data)
njnode = 1;
% ************************************************************************
% ********     JNodevalue=[njnode jcoordx jcoordy jcoordz]          ******
% ************************************************************************
% Joint 1
JNodevalue(njnode,1)=njnode;
JNodevalue(njnode,2)=Geometry_data(1,1);
JNodevalue(njnode,3)=0;
JNodevalue(njnode,4)=0;   
% Joint 2
JNodevalue(njnode+1,1)=njnode+1;
JNodevalue(njnode+1,2)=Geometry_data(1,end);
JNodevalue(njnode+1,3)=0;
JNodevalue(njnode+1,4)=0;     






