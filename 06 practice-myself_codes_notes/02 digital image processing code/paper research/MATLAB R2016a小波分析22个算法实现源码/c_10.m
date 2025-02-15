R=0.02;t=-2:R:2;
f=heaviside(t+1)-heaviside(t-1);
    f1=f.*exp(-j*20*t);
f2=f.*exp(j*20*t);
W1=2*pi*5;
N=500;k=-N:N;W=k*W1/N;
F1=f1*exp(-j*t'*W)*R;
F2=f2*exp(-j*t'*W)*R;
F1=real(F1);
F2=real(F2);
subplot(121);
plot(W,F1);
xlabel('w');
ylabel('F1(jw)');
title('F(w)���Ƶ�w=20����Ƶ��F1(jw)');
subplot(122);
plot(W,F2);
xlabel('w');
ylabel('F2(jw)');
title('F(w)���Ƶ�w=20����Ƶ��F2(jw)');
