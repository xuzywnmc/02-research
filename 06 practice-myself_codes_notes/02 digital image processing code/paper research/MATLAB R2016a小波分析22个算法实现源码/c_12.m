N=100;dt=1;   %���ݵ������������
n = 0:N-1; t=n*dt;  %ʱ������
x = sin(2*pi*0.1*t)+0.5*cos(2*pi*0.2*t);  %�����ź�
xe=0.5*cos(2*pi*0.2*t);     %�ź��е�ż��������
xo=sin(2*pi*0.1*t);      %�ź��е��溯������
k = 0:N-1; f=k/(N*dt);    %Ƶ������
X = dfs(x,N);    % ���źŽ���Fourier�任
XE = dfs(xe,N);  % ���ź�ż�������ֽ���Fourier�任
XO = dfs(xo,N); % ���ź�ż�������ֽ���Fourier�任
XR=real(X);    %��ȡ�ź�Fourier�任��ʵ��
XI=imag(X);    %��ȡ�ź�Fourier�任���鲿
subplot(2,2,1); plot(f,XR*2/N); grid on;   %����ź�Fourier�任��ʵ��
xlabel('Ƶ��/Hz'); ylabel('Re(X)');
title('�ź�Fourier�任��ʵ��')
subplot(2,2,2); plot(f,XI*2/N); grid on; %����ź�Fourier�任���鲿
xlabel('Ƶ��/Hz'); ylabel('Im(X)');
title('�ź�Fourier�任���鲿')
subplot(2,2,3); plot(f,real(XE)*2/N); grid on;%����ź�ż��������Fourier�任��ʵ��
xlabel('Ƶ��/Hz'); ylabel('XE');
title('�ź�ż�������ֵ�Fourier�任')
subplot(2,2,4); plot(f,imag(XO)*2/N);grid on;%����ź��溯������Fourier�任���鲿
xlabel('Ƶ��/Hz'); ylabel('XO');
title('�ź��溯�����ֵ�Fourier�任')
