load zdsud.dat;                          %读取数据序列
x=zdsud;
dt=0.02; N=length(x);  %由于数据的采样间隔0.02秒
n=0:N-1;t=n*dt;f=n/(N*dt);   %时间序列和频率序列
y=fft(x);   
f1=0.6;f2=1.8;    %要滤去频率的上限和下限
yy=zeros(size(y));  %设置与y相同元素的数组
for m=0:N-1   %将未在频率范围内的振动滤去
   if(m/(N*dt)>f1&m/(N*dt)<f2)...   %小于Nyquist频率的保留频率范围
|(m/(N*dt)>(1/dt-f2)&m/(N*dt)<(1/dt-f1))  %大于Nyquist频率的保留频率范围
      yy(m+1)= y(m+1);       %保留频率范围内的振动振幅不变
   else
      yy(m+1)=0.;     %其余频率范围的振动振幅为零
   end
 end
subplot(2,1,1),plot(t,zdsud);        %绘制原始值序列
xlabel('时间/s'),title('原始信号')
grid on; 
subplot(2,1,2),plot(t,real(ifft(yy))) %绘制滤波后的数据运用ifft变换回时间域并绘图。
title('FFT滤波后的信号图');
xlabel('时间/s')
grid on;
