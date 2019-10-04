N=100;dt=1;   %数据点数及采样间隔
n = 0:N-1; t=n*dt;  %时间序列
x = sin(2*pi*0.1*t)+0.5*cos(2*pi*0.2*t);  %数据信号
xe=0.5*cos(2*pi*0.2*t);     %信号中的偶函数部分
xo=sin(2*pi*0.1*t);      %信号中的奇函数部分
k = 0:N-1; f=k/(N*dt);    %频率序列
X = dfs(x,N);    % 对信号进行Fourier变换
XE = dfs(xe,N);  % 对信号偶函数部分进行Fourier变换
XO = dfs(xo,N); % 对信号偶函数部分进行Fourier变换
XR=real(X);    %提取信号Fourier变换的实部
XI=imag(X);    %提取信号Fourier变换的虚部
subplot(2,2,1); plot(f,XR*2/N); grid on;   %绘出信号Fourier变换的实部
xlabel('频率/Hz'); ylabel('Re(X)');
title('信号Fourier变换的实部')
subplot(2,2,2); plot(f,XI*2/N); grid on; %绘出信号Fourier变换的虚部
xlabel('频率/Hz'); ylabel('Im(X)');
title('信号Fourier变换的虚部')
subplot(2,2,3); plot(f,real(XE)*2/N); grid on;%绘出信号偶函数部分Fourier变换的实部
xlabel('频率/Hz'); ylabel('XE');
title('信号偶函数部分的Fourier变换')
subplot(2,2,4); plot(f,imag(XO)*2/N);grid on;%绘出信号奇函数部分Fourier变换的虚部
xlabel('频率/Hz'); ylabel('XO');
title('信号奇函数部分的Fourier变换')
