clf
load w9497d;   %加载观测数据
x=w9497d;
dt=1; N=length(x);  %由于数据的采样间隔为天
n=0:N-1;t=n*dt;f=n/(N*dt);   %时间序列和频率序列
subplot(2,1,1),plot(n/365.25,x); %以年为单位给出记录数据随时间的变化,1年有365.25天
xlabel('时间/年');
title('电导率数据');
ylabel('MS/CM');
y=fft(x);   
f1=0.0;f2=0.005;    %要滤去频率的上限和下限,即去掉频率范围为0~0.005天-1
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
subplot(2,1,2),plot(n/365.25,real(ifft(yy))) %绘制滤波后的数据运用ifft变换回时间域并绘图。
title('滤波后的逆Fourier输出');
ylabel('MS/CM');
xlabel('时间/年')
