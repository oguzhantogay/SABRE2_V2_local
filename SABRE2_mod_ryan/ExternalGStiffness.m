function [Kext1,Kext2]=ExternalGStiffness(Zetaavg,Zeta1,Zeta2,Eta1,Eta2,L,Qino)
% Developed by Woo Yong Jeong.
% Date : 12/01/2012.
% from natural frame
P = Qino(1);
T = Qino(6);
My1 = Qino(4);
Mz1 = Qino(3);
My2 = Qino(8);
Mz2 = Qino(7);

Vy = -(Mz1+Mz2)./L;
Vz = (My1+My2)./L;

Kext1=zeros(14,14);
Kext2=zeros(14,14);
% Kext1 matrix

Kext1(2,1) =-Vy/L;
Kext1(2,8) =Vy/L;

Kext1(3,1) =-Vz/L;
Kext1(3,8) =Vz/L;

Kext1(9,1) =Vy/L;
Kext1(9,8) =-Vy/L;

Kext1(10,1) =Vz/L;
Kext1(10,8) =-Vz/L;

% Kext2 matrix
Kext2(1,2) =-Vy/L;
Kext2(1,3) =-Vz/L;
Kext2(1,9) =Vy/L;
Kext2(1,10) =Vz/L;

Kext2(2,2) =P/L;
Kext2(2,3) =Vz*Zetaavg/L;
Kext2(2,4) =Vz*Eta1/2;
Kext2(2,5) =-Vz*Zeta1/2;
Kext2(2,9) =-P/L;
Kext2(2,10) =-Vz*Zetaavg/L;
Kext2(2,11) =Vz*Eta2/2;
Kext2(2,12) =-Vz*Zeta2/2;

Kext2(3,3) =(-Vy*Zetaavg+P)/L;
Kext2(3,4) =-Vy*Eta1/2;
Kext2(3,5) =Vy*Zeta1/2;
Kext2(3,10) =(Vy*Zetaavg-P)/L;
Kext2(3,11) =-Vy*Eta2/2;
Kext2(3,12) =Vy*Zeta2/2;

Kext2(4,2) = My1/L;
Kext2(4,3) = Mz1/L;
Kext2(4,9) = -My1/L;
Kext2(4,10) = -Mz1/L;

Kext2(5,2) = T/L;
Kext2(5,3) = -Mz1*Zetaavg/L;
Kext2(5,4) = -Mz1*Eta1/2;
Kext2(5,5) = Mz1*Zeta1/2;
Kext2(5,9) = -T/L;
Kext2(5,10) = Mz1*Zetaavg/L;
Kext2(5,11) = -Mz1*Eta2/2;
Kext2(5,12) = Mz1*Zeta2/2;

Kext2(6,3) = (My1*Zetaavg+T)/L;
Kext2(6,4) = My1*Eta1/2;
Kext2(6,5) = -My1*Zeta1/2;
Kext2(6,10) = (-My1*Zetaavg-T)/L;
Kext2(6,11) = My1*Eta2/2;
Kext2(6,12) = -My1*Zeta2/2;


Kext2(8,2) =Vy/L;
Kext2(8,3) =Vz/L;
Kext2(8,9) =-Vy/L;
Kext2(8,10) =-Vz/L;

Kext2(9,2) =-P/L;
Kext2(9,3) =-Vz*Zetaavg/L;
Kext2(9,4) =-Vz*Eta1/2;
Kext2(9,5) =Vz*Zeta1/2;
Kext2(9,9) =P/L;
Kext2(9,10) =Vz*Zetaavg/L;
Kext2(9,11) =-Vz*Eta2/2;
Kext2(9,12) =Vz*Zeta2/2;

Kext2(10,3) =(Vy*Zetaavg-P)/L;
Kext2(10,4) =Vy*Eta1/2;
Kext2(10,5) =-Vy*Zeta1/2;
Kext2(10,10) =(-Vy*Zetaavg+P)/L;
Kext2(10,11) =Vy*Eta2/2;
Kext2(10,12) =-Vy*Zeta2/2;

Kext2(11,2) = My2/L;
Kext2(11,3) = Mz2/L;
Kext2(11,9) = -My2/L;
Kext2(11,10) = -Mz2/L;

Kext2(12,2) = -T/L;
Kext2(12,3) = -Mz2*Zetaavg/L;
Kext2(12,4) = -Mz2*Eta1/2;
Kext2(12,5) = Mz2*Zeta1/2;
Kext2(12,9) = T/L;
Kext2(12,10) = Mz2*Zetaavg/L;
Kext2(12,11) = -Mz2*Eta2/2;
Kext2(12,12) = Mz2*Zeta2/2;

Kext2(13,3) = (My2*Zetaavg-T)/L;
Kext2(13,4) = My2*Eta1/2;
Kext2(13,5) = -My2*Zeta1/2;
Kext2(13,10) = (-My2*Zetaavg+T)/L;
Kext2(13,11) = My2*Eta2/2;
Kext2(13,12) = -My2*Zeta2/2;



























