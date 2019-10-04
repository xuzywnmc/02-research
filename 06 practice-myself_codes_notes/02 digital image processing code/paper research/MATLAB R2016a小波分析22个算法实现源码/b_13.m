clear all;
x1=-2:0.01:2;
y1=3*x1.*sin(x1.^3);
x2=0:0.01:4;
y2=3*(x2+1).*cos(x2.^2);
[AX,H1,H2]=plotyy(x1,y1,x2,y2);
set(H1,'LineStyle','--')
set(H2,'LineStyle',':')
