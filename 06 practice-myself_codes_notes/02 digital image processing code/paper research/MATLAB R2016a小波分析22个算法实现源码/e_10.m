%�����ı����ݣ����Ƶ���ʱ�������߼�Ƶ�׷���ͼ              
load zdsud.dat;                          %��ȡ��������
Xt=zdsud;                                %�����ݸ�ֵ������ 
Fs=50;                                   %�趨������ ��λ(Hz)
dt=1/Fs;                                 %�������� ��λ(s)
N=length(Xt);                            %�õ����еĳ���
Xf=fft(Xt);                              %���źŽ��п���Fourier�任(FFT)
figure(1)
subplot(2,1,1),plot([0:N-1]/Fs,zdsud);        %����ԭʼֵ����
xlabel('ʱ��/s');
title('ԭʼ���𲨼�¼');
grid on;

subplot(2,1,2),plot([0:N-1]/(N*dt),abs(Xf)*2/N);%�����źŵ������
xlabel(' Ƶ��/Hz'),
title('��Ƶͼ');
ylabel('���');
xlim([0 Fs/2]);                          %Ƶ����ֻ����NyquistƵ��֮ǰ�Ĳ���
grid on;
