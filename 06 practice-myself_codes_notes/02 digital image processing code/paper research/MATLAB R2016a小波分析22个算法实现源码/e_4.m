clf;
fs=1000;N=1024;   %采样频率和数据点数
n=0:N-1;t=n/fs;   %时间序列
f1=50;f2=120;   %信号的频率成分
x=sin(2*pi*f1*t)+2*sin(2*pi*f2*t);   %无噪声信号
x=x+2*randn(1,length(t));  %含有噪声的信号
y=fft(x,N);            %对含有噪声信号进行Fourier变换
mag=abs(y);     %得到振幅值
f=n*fs/N;   %真实频率序列
subplot(2,1,1),plot(f(1:N/2),mag(1:N/2)*2/N); %绘出Nyquist频率之前的振幅
xlabel('频率/Hz');
ylabel('振幅');title('N=1024');grid on;
x=sin(2*pi*f1*t)+2*sin(2*pi*f2*t);  %无噪声信号
y=fft(x,N);     %对无噪声信号进行快速Fourier变换
mag=abs(y);    %求取振幅
f=n*fs/N;   %真实频率序列
subplot(2,1,2),plot(f(1:N/2),mag(1:N/2)*2/N); %绘出Nyquist频率之前的振幅
xlabel('频率/Hz');
ylabel('振幅');title('N=1024（无噪声）');grid on;
