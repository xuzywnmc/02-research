N1=10;dt=1;       %采样点数和采样间隔
n1=0:N1-1;t1=n1*dt;  %时间序列
x=cos(2*pi*0.24*t1)+cos(2*pi*.26*t1);  %原始信号
subplot(2,3,1);stem(t1,x); hold on;
plot([0 10],[0 0]);   %绘制横轴
title('信号x(n), n=0-9');xlabel('时间/s')
Y1=fft(x);magY1=abs(Y1);
f1=n1/(N1*dt);
subplot(2,3,4);plot(f1(1:N1/2),magY1(1:N1/2)*2/N1);%Nyquist频率前的振幅
xlim([0 0.5]);
title('10个数据点信号的FFT');
xlabel('频率/Hz')

N3=100;dt=1;                     %采用10个数据点和90个零点的情况
n3=0:N3-1;t3=n3*dt;
x=cos(2*.24*pi*t1)+cos(2*0.26*pi*t1);   
y3=[x(1:10) zeros(1,90)];
subplot(2,3,2);stem(t3,y3);
title('含有90个零的100个数据点信号');xlabel('时间/s')
Y3=fft(y3);magY3=abs(Y3);
f=n3/(N3*dt);
subplot(2,3,5);plot(f(1:N3/2),magY3(1:N3/2)*2/N3);
xlim([0 0.5]);
title('含有90个零的100个数据点的FFT');xlabel('频率/Hz')
n=0:N3;t=n*dt;    %采用100个数据点的情况
x=cos(2*0.24*pi*t)+cos(2*0.26*pi*t);
subplot(2,3,3);stem(t,x);
title('信号x(n), n=0-99');xlabel('时间/s')
X=fft(x);magX=abs(X);
f=n/(N3*dt);
subplot(2,3,6);plot(f(1:N3/2),magX(1:N3/2)*2/N3);
xlim([0 0.5]);
title('100个数据点信号的FFT');xlabel('频率/Hz')
