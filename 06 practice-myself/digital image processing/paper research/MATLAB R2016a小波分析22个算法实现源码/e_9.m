load hns.dat ;                           %��ȡ��������
Xt=hns;                                 %�����ݸ�ֵ������
Fs=50;                                   %�趨������ ��λ(Hz)
dt=1/Fs;                                 %�������� ��λ(s)
N=length(Xt);                            %�õ����еĳ���
Xf=fft(Xt);                              %���źŽ��п���Fourier�任(FFT)

figure(1)
subplot(2,1,1),plot([0:N-1]/Fs,Xt);        %����ԭʼֵ����
xlabel('ʱ��/s'),title('ʱ����');
grid on;

subplot(2,1,2),plot([0:N-1]/(N*dt),abs(Xf)*2/N);%�����źŵ������
xlabel('Ƶ��/Hz'),title('��Ƶͼ');
ylabel('���');
xlim([0 2]);           %Ƶ����ֻ����2HzƵ��֮ǰ�Ĳ���
grid on;


figure(2)
load hns1.dat ;                           %��ȡ��������
Xt=hns1;                                 %�����ݸ�ֵ������
Fs=50;                                   %�趨������ ��λ(Hz)
dt=1/Fs;                                 %�������� ��λ(s)
N=length(Xt);                            %�õ����еĳ���
Xf=fft(Xt);                              %���źŽ��п���Fourier�任(FFT)

subplot(2,1,1),plot([0:N-1]/Fs,Xt);        %����ԭʼֵ����
xlabel('ʱ��/s'),title('ʱ����');
grid on;

subplot(2,1,2),plot([0:N-1]/(N*dt),abs(Xf)*2/N);%�����źŵ������
xlabel('Ƶ��/Hz'),title('��Ƶͼ');
ylabel(' ���');
xlim([0 2]);                          %Ƶ����ֻ����2HzƵ��֮ǰ�Ĳ���
grid on;

figure(3)
load hns2.dat ;                           %��ȡ��������
Xt=hns2;                                 %�����ݸ�ֵ������
Fs=50;                                   %�趨������ ��λ(Hz)
dt=1/Fs;                                 %�������� ��λ(s)
N=length(Xt);                            %�õ����еĳ���
Xf=fft(Xt);                              %���źŽ��п���Fourier�任(FFT)

subplot(2,1,1),plot([0:N-1]/Fs,Xt);        %����ԭʼֵ����
xlabel('ʱ��/s'),title('ʱ����');
grid on;

subplot(2,1,2),plot([0:N-1]/(N*dt),abs(Xf)*2/N);%�����źŵ������
xlabel('Ƶ��/Hz'),title('��Ƶͼ');
ylabel('���');
xlim([0 2]);                          %Ƶ����ֻ����2Hz֮ǰ�Ĳ���
grid on;

figure(4)
load hns3.dat ;                           %��ȡ��������
Xt=hns3;                                 %�����ݸ�ֵ������
Fs=50;                                   %�趨������ ��λ(Hz)
dt=1/Fs;                                 %�������� ��λ(s)
N=length(Xt);                            %�õ����еĳ���
Xf=fft(Xt);                              %���źŽ��п���Fourier�任(FFT)

subplot(2,1,1),plot([0:N-1]/Fs,Xt);        %����ԭʼֵ����
xlabel('ʱ��/s'),title('ʱ����');
grid on;

subplot(2,1,2),plot([0:N-1]/(N*dt),abs(Xf)*2/N);%�����źŵ������
xlabel('Ƶ��/Hz'),title('��Ƶͼ');
ylabel('���');
xlim([0 2]);                          %Ƶ����ֻ����2HzƵ��֮ǰ�Ĳ���
grid on;
