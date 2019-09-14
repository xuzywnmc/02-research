N=100;dt=1;   %数据个数与采样间隔
n = 0:N-1;t=n*dt;   %时间序列值
x = cos(pi*t/2);    %正弦信号
k = 0:N-1; f =k/(N*dt);        %频率序列值 
X = dfs(x,N);    %  求解正弦信号的Fourier变换
realX=real(X);    %取X的实部
imagX=imag(X);    %取X的虚部
Xrealshft=cirshftt(realX,10,N);  %将X的实部信号移位10
Ximagshft=cirshftt(imagX,10,N); %将X的虚部信号移位10
Y=idfs(Xrealshft+j*Ximagshft,N); %将移位后信号结合为复数进行逆变换
subplot(2,2,1),plot(t,real(Y));ylim([-1 1])  %Y的实部
xlabel('时间/s')
title('移位后信号频率域的实部')
subplot(2,2,2),plot(t,imag(Y));   %绘出Y的虚部
xlabel('时间/s')
title('移位后信号频率域的虚部')
subplot(2,2,3),plot(t,x.*real(exp(j*2*pi*n*10/N))); %绘x(n) 的实部
xlabel('时间/s')
title('x*exp(j*2*pi*n*10/N)的Fourier变换的实部')
subplot(2,2,4),plot(t,x.*imag(exp(j*2*pi*n*10/N)));%绘x(n) 的虚部
xlabel('时间/s')
title(' x*exp(j*2*pi*n*10/N) 的Fourier变换的虚部')

