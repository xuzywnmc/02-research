clc;clear;
%%  1.正弦波定义
%这个程序和哈工大硕士论文程序是一致的
f1=50;  %  频率1
f2=100; %  频率2
fs=2*(f1+f2);  %  采样频率
Ts=1/fs;  %  采样间隔
N=120;    %  采样点数
n=1:N;
y=sin(2*pi*f1*n*Ts)+sin(2*pi*f2*n*Ts);  %  正弦波混合
figure(1)
plot(y);
title('两个正弦信号')
figure(2)
stem(abs(fft(y)));
%abs(x)函数是对数组元素进行绝对值处理的函数
%对于复数x=a+b*i，有abs(x)=sqrt(a2+b2)
title('两信号频谱')
%%  2.小波滤波器谱分析
h=wfilters('db30','l');  %  低通
%'db30'说的是滤波器系数 指的是陡峭程度
g=wfilters('db30','h');  %  高通
h=[h,zeros(1,N-length(h))];  %  补零（圆周卷积，且增大分辨率变于观察）
g=[g,zeros(1,N-length(g))];  %  补零（圆周卷积，且增大分辨率变于观察）
figure(3);
stem(abs(fft(h)));
title('低通滤波器图')
figure(4);
stem(abs(fft(g)));
title('高通滤波器图')
%%  3.MALLET分解算法(圆周卷积的快速傅里叶变换实现)
sig1=ifft(fft(y).*fft(h));  %  低通(低频分量)
sig2=ifft(fft(y).*fft(g));  %  高通(高频分量)
figure(5);  %  信号图
subplot(2,1,1)
plot(real(sig1));
title('分解信号1')
subplot(2,1,2)
plot(real(sig2));
title('分解信号2')
figure(6);  %  频谱图
subplot(2,1,1)
stem(abs(fft(sig1)));
title('分解信号1频谱')
subplot(2,1,2)
stem(abs(fft(sig2)));
title('分解信号2频谱')
%%  4.MALLET重构算法
sig1=dyaddown(sig1); %  2抽取
sig2=dyaddown(sig2); %  2抽取
sig1=dyadup(sig1);   %  2插值
sig2=dyadup(sig2);   %  2插值
sig1=sig1(1,[1:N]);  %  去掉最后一个零
sig2=sig2(1,[1:N]);  %  去掉最后一个零
hr=h(end:-1:1);         %  重构低通
gr=g(end:-1:1);         %  重构高通
hr=circshift(hr',1)';   %  位置调整圆周右移一位
gr=circshift(gr',1)';   %  位置调整圆周右移一位
sig1=ifft(fft(hr).*fft(sig1));  %  低频
sig2=ifft(fft(gr).*fft(sig2));  %  高频
sig=sig1+sig2; %  源信号
%%  5.比较
figure(7);
subplot(2,1,1)
plot(real(sig1));
title('重构低频信号');
subplot(2,1,2)
plot(real(sig2));
title('重构高频信号');
figure(8);
subplot(2,1,1)
stem(abs(fft(sig1)));
title('重构低频信号频谱');
subplot(2,1,2)
stem(abs(fft(sig2)));
title('重构高频信号频谱');
figure(9)
plot(real(sig),'r','linewidth',2);
hold on;
plot(y);
legend('重构信号','原始信号')
title('重构信号与原始信号比较')