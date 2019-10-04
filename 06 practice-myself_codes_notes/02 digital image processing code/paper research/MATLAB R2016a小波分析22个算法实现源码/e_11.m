load zdsud.dat;                          %��ȡ��������
x=zdsud;
dt=0.02; N=length(x);  %�������ݵĲ������0.02��
n=0:N-1;t=n*dt;f=n/(N*dt);   %ʱ�����к�Ƶ������
y=fft(x);   
f1=0.6;f2=1.8;    %Ҫ��ȥƵ�ʵ����޺�����
yy=zeros(size(y));  %������y��ͬԪ�ص�����
for m=0:N-1   %��δ��Ƶ�ʷ�Χ�ڵ�����ȥ
   if(m/(N*dt)>f1&m/(N*dt)<f2)...   %С��NyquistƵ�ʵı���Ƶ�ʷ�Χ
|(m/(N*dt)>(1/dt-f2)&m/(N*dt)<(1/dt-f1))  %����NyquistƵ�ʵı���Ƶ�ʷ�Χ
      yy(m+1)= y(m+1);       %����Ƶ�ʷ�Χ�ڵ����������
   else
      yy(m+1)=0.;     %����Ƶ�ʷ�Χ�������Ϊ��
   end
 end
subplot(2,1,1),plot(t,zdsud);        %����ԭʼֵ����
xlabel('ʱ��/s'),title('ԭʼ�ź�')
grid on; 
subplot(2,1,2),plot(t,real(ifft(yy))) %�����˲������������ifft�任��ʱ���򲢻�ͼ��
title('FFT�˲�����ź�ͼ');
xlabel('ʱ��/s')
grid on;
