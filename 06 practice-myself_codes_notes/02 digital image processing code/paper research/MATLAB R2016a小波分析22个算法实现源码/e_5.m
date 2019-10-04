clf;
fs=100;N=128; %采样频率和数据个数
n=0:N-1;t=n/fs;   %时间序列
x=sin(2*pi*40*t)+sin(2*pi*15*t);  %时间域信号
subplot(2,2,1),plot(t,x);xlabel('时间/s');
ylabel('x');title('原始信号');
grid on;

y=fft(x,N);   %Fourier变换
mag=abs(y);   %得到振幅谱
f=n*fs/N;   %频率序列
subplot(2,2,2),
plot(f(1:N/2),mag(1:N/2)*2/N);   %绘制Nyquist频率前的振幅
xlabel('频率/Hz');ylabel('振幅');
title('原始信号的快速Fourier变换');grid on;
xifft=ifft(y);    %进行Fourier逆变换
realx=real(xifft);  %求取Fourier逆变换的实部
ti=[0:length(xifft)-1]/fs;   %Fourier逆变换的时间序列
subplot(2,2,3),plot(ti,realx);
xlabel('时间/s');ylabel('x');
title('运用Fourier逆变换得到的信号');grid on;

yif=fft(xifft,N);  %将Fourier逆变换得到的时间域信号进行Fourier变换
mag=abs(yif);
f=[0:length(y)-1]'*fs/length(y);  %频率序列
subplot(2,2,4),plot(f(1:N/2),mag(1:N/2)*2/N);%绘制Nyquist频率前的振幅
xlabel('频率/Hz');ylabel('振幅');
title('运用IFFT得到信号的快速Fourier变换');grid on;
