clear all   %清除内存所有变量
close all    %关闭所有打开的图形窗口
N=200;dt=4/N; %数据点数和采样间隔
for n=1:N    %得到方波信号
    if (n*dt>=2)
        x(n)=0.8;
    else
        x(n)=-0.8;
    end
end
figure(1)   %打开第一个图形窗口，绘制原始信号及其Fourier分析系数
subplot(2,1,1),plot((1:N)*dt,x),hold on;
plot((1:N)*dt,zeros(1,N),'k'),xlabel('时间/s')
title('原始信号')
a=zeros(1,N);b=zeros(1,N);
nn=floor(N/2)+1;
for k=0:nn-1
    a(k+1)=0;
    b(k+1)=0;
    for ii=0:N-1
        a(k+1)=a(k+1)+2/N*x(ii+1)*cos(2*pi*k*ii/N);  %求解Fourier系数
        b(k+1)=b(k+1)+2/N*x(ii+1)*sin(2*pi*k*ii/N);
    end
    c(k+1)=sqrt(a(k+1).^2+b(k+1).^2);
end
subplot(2,1,2),plot((0:nn-1)/(N*dt),c);title('Fourier变换')
xlabel('频率/Hz'),ylabel('振幅') %绘制振幅谱
m=input('输入谐波最大阶数?');   %输入最大k值
if(m>(floor(N/2)+1))  %如果最大k值大于Nyquist频率对应的点数，则显示出错信息
    error('谐波最大阶数必须小于Nyquist频率对应的阶数.')
end
if(mod(N,2)~=1)a(nn)=a(nn)/2; end   %此时b(nn)为零，a(nn)减半
for ii=0:N-1    %合成信号
    xx(ii+1)=a(1)/2;
    for k=1:m
        xx(ii+1)=xx(ii+1)+a(k+1)*cos(2*pi*k*ii/N)+b(k+1)*sin(2*pi*k*ii/N);
    end
end
figure(2)    %打开第二个图形窗口，绘制合成信号图
plot((1:N)*dt,xx,(0:N-1)*dt,x)    %绘制合成信号和方波图形便于比较
hold on
plot((1:N)*dt,zeros(1,N),'k'),xlabel('时间/s')   %绘出横轴
title('合成信号')
