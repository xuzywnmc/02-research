clf;
fs=1000;N=1024;   %����Ƶ�ʺ����ݵ���
n=0:N-1;t=n/fs;   %ʱ������
f1=50;f2=120;   %�źŵ�Ƶ�ʳɷ�
x=sin(2*pi*f1*t)+2*sin(2*pi*f2*t);   %�������ź�
x=x+2*randn(1,length(t));  %�����������ź�
y=fft(x,N);            %�Ժ��������źŽ���Fourier�任
mag=abs(y);     %�õ����ֵ
f=n*fs/N;   %��ʵƵ������
subplot(2,1,1),plot(f(1:N/2),mag(1:N/2)*2/N); %���NyquistƵ��֮ǰ�����
xlabel('Ƶ��/Hz');
ylabel('���');title('N=1024');grid on;
x=sin(2*pi*f1*t)+2*sin(2*pi*f2*t);  %�������ź�
y=fft(x,N);     %���������źŽ��п���Fourier�任
mag=abs(y);    %��ȡ���
f=n*fs/N;   %��ʵƵ������
subplot(2,1,2),plot(f(1:N/2),mag(1:N/2)*2/N); %���NyquistƵ��֮ǰ�����
xlabel('Ƶ��/Hz');
ylabel('���');title('N=1024����������');grid on;
