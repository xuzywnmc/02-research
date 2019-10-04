clf;
fs=100;N=128; %����Ƶ�ʺ����ݸ���
n=0:N-1;t=n/fs;   %ʱ������
x=sin(2*pi*40*t)+sin(2*pi*15*t);  %ʱ�����ź�
subplot(2,2,1),plot(t,x);xlabel('ʱ��/s');
ylabel('x');title('ԭʼ�ź�');
grid on;

y=fft(x,N);   %Fourier�任
mag=abs(y);   %�õ������
f=n*fs/N;   %Ƶ������
subplot(2,2,2),
plot(f(1:N/2),mag(1:N/2)*2/N);   %����NyquistƵ��ǰ�����
xlabel('Ƶ��/Hz');ylabel('���');
title('ԭʼ�źŵĿ���Fourier�任');grid on;
xifft=ifft(y);    %����Fourier��任
realx=real(xifft);  %��ȡFourier��任��ʵ��
ti=[0:length(xifft)-1]/fs;   %Fourier��任��ʱ������
subplot(2,2,3),plot(ti,realx);
xlabel('ʱ��/s');ylabel('x');
title('����Fourier��任�õ����ź�');grid on;

yif=fft(xifft,N);  %��Fourier��任�õ���ʱ�����źŽ���Fourier�任
mag=abs(yif);
f=[0:length(y)-1]'*fs/length(y);  %Ƶ������
subplot(2,2,4),plot(f(1:N/2),mag(1:N/2)*2/N);%����NyquistƵ��ǰ�����
xlabel('Ƶ��/Hz');ylabel('���');
title('����IFFT�õ��źŵĿ���Fourier�任');grid on;
