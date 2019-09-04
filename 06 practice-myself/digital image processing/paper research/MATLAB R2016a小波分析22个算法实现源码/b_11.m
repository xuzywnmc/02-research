 clear all;
x=-2:0.01:2;
y1=3*x.*sin(x.^3);
y2=3*(x+1).*cos(x.^2);
plot(x,y1,'r',x,y2,'-.');
