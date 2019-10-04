%生成正弦信号
N=1000;
t=1:N;
x=sin(0.03*t);
%加噪声
load noissin;
ns=noissin;
%显示波形
subplot(3,1,1);
plot(t,x);
title('(a)原始信号');
ylabel('幅值 A');
subplot(3,1,2);
plot(ns);
title('(b)含噪信号');
ylabel('幅值 A');
%小波消噪
xd=wden(ns,'minimaxi','s','one',5,'db3');
subplot(3,1,3);
plot(xd);
title('(c)消噪信号');
ylabel('幅值 A');
