dt=0.02;N=512;
n=0:N-1; t=n*dt; f=n/(N*dt);   %时间序列及频率序列
f1=3; f2=10;   %信号的频率成分
x=.5*sin(2*pi*f1*t)+cos(2*pi*f2*t);
subplot(2,2,1), plot(t,x);    %绘制原来的信号
title('原始信号的时间域');xlabel('时间/s');
y=fft(x);      %对原信号作FFT变换
subplot(2,2,2), plot(f, abs(y)*2/N)   %绘制原信号的振幅谱
xlabel('频率/Hz'), ylabel('振幅')
xlim([0 50]);title('原始振幅谱')
f1=8;f2=15;    %要滤去频率的上限和下限
yy=zeros(1,length(y));  %设置与y相同元素的数组
for m=0:N-1   %将频率落在该频率范围及其大于Nyquist频率的波滤去
   if(m/(N*dt)>f1&m/(N*dt)<f2)...   %小于Nyquist频率的滤波范围
|(m/(N*dt)>(1/dt-f2)&m/(N*dt)<(1/dt-f1))  %大于Nyquist频率的滤波范围
%1/dt为一个频率周期
      yy(m+1)=0.;       %置在此频率范围内的振动振幅为零
   else
      yy(m+1)=y(m+1);     %其余频率范围的振动振幅不变
   end
end
subplot(2,2,4),plot(f,abs(yy)*2/N)    %绘制滤波后的振幅谱
xlim([0 50]);xlabel('频率/Hz');ylabel('振幅')
gstext=sprintf('自 %4.1f -%4.1f Hz 的频率被滤除',f1,f2); %将滤波范围显示作为标题
title(gstext)
subplot(2,2,3),plot(t,real(ifft(yy)))   %绘制滤波后的数据运用ifft变换回时间域并绘图。
title('通过IFFT回到时间域');
xlabel('时间/s');
