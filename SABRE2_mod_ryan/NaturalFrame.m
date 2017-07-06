function [theta1xn,theta1zn,theta1yn,theta2xn,theta2zn,theta2yn,theta1xpn,theta2xpn] = NaturalFrame(t1,t2,t3,u1,u2,u3,e1,e2,e3,beta1xp,beta2xp)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
% asin radian; asind degree
% Page 32
theta1xn = asin(0.5*(-t3'*e2+t2'*e3));
theta1zn = asin(0.5*(-t2'*e1+e2'*t1));
theta1yn = -asin(0.5*(-t3'*e1+e3'*t1));
theta2xn = asin(0.5*(-u3'*e2+u2'*e3));
theta2zn = asin(0.5*(-u2'*e1+e2'*u1));
theta2yn = -asin(0.5*(-u3'*e1+e3'*u1));
theta1xpn = beta1xp;
theta2xpn = beta2xp;

