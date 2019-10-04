clear all;
t=2*pi*(0:20)/20;
y=cos(t).*exp(-0.5*t);
stem(t,y,'r');
hold on;
stairs(t,y,'r');
