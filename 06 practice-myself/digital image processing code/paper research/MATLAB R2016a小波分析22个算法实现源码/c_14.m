R=0.05;t=-2:R:2;
f=heaviside(t+1)-heaviside(t-1);
subplot(321)
plot(t,f)
xlabel('t');
ylabel('f(t)');
y=R*conv(f,f);
n=-4:R:4;
subplot(322);
plot(n,y);
xlabel('t');
ylabel('y(t)=f(t)*f(t)');
axis([-3 3 -1 3]);
W1=2*pi*5;
N=200;
k=-N:N;
W=k*W1/N;
F=f*exp(-j*t'*W)*R;
F=real(F);
Y=y*exp(-j*n'*W)*R;
Y=real(Y);
F1=F.*F
subplot(323);
plot(W,F);
xlabel('w');
ylabel('F(jw)');
subplot(324);
plot(W,F1);
xlabel('w');
ylabel('F(jw).F(jw)');
axis([-20 20 0 4]);
subplot(325);
plot(W,Y);
xlabel('w');
ylabel('Y(jw)');
axis([-20 20 0 4]);
