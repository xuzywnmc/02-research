clear all                       %将工作空间中的所有变量清除
N=256;dt=0.02;                 %数据的个数和采样间隔
n=0:N-1;t=n*dt;                 %序号序列和时间序列
x=sin(2*pi*t)+0.5*sin(2*pi*5*t);   %信号加得到的合成信号
m=floor(N/2)+1;       %分解a,b的最大序号值，为分解的N/2个参数再加参数a0
%floor函数为向下取整
a=zeros(1,m);b=zeros(1,m);    %产生a,b两个为零的序列
for k=0:m-1
    for ii=0:N-1
        a(k+1)=a(k+1)+2/N*x(ii+1)*cos(2*pi*k*ii/N);   %  
        b(k+1)=b(k+1)+2/N*x(ii+1)*sin(2*pi*k*ii/N);   %  
   %MATLAB中的数组序号只能从1开始。
    end
    c(k+1)=sqrt(a(k+1).^2+b(k+1).^2);   % 
end
subplot(2,1,1),plot(t,x);title('原始信号'),xlabel('时间/s')    %绘出时间域信号
subplot(2,1,2),plot((0:m-1)/(N*dt),c)   %绘出频率域信号
title('Fourier变换'),xlabel('频率/Hz'),ylabel('振幅')
