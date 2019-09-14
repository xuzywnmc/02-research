dt=0.02;N=512;
n=0:N-1; t=n*dt; f=n/(N*dt);   %ʱ�����м�Ƶ������
f1=3; f2=10;   %�źŵ�Ƶ�ʳɷ�
x=.5*sin(2*pi*f1*t)+cos(2*pi*f2*t);
subplot(2,2,1), plot(t,x);    %����ԭ�����ź�
title('ԭʼ�źŵ�ʱ����');xlabel('ʱ��/s');
y=fft(x);      %��ԭ�ź���FFT�任
subplot(2,2,2), plot(f, abs(y)*2/N)   %����ԭ�źŵ������
xlabel('Ƶ��/Hz'), ylabel('���')
xlim([0 50]);title('ԭʼ�����')
f1=8;f2=15;    %Ҫ��ȥƵ�ʵ����޺�����
yy=zeros(1,length(y));  %������y��ͬԪ�ص�����
for m=0:N-1   %��Ƶ�����ڸ�Ƶ�ʷ�Χ�������NyquistƵ�ʵĲ���ȥ
   if(m/(N*dt)>f1&m/(N*dt)<f2)...   %С��NyquistƵ�ʵ��˲���Χ
|(m/(N*dt)>(1/dt-f2)&m/(N*dt)<(1/dt-f1))  %����NyquistƵ�ʵ��˲���Χ
%1/dtΪһ��Ƶ������
      yy(m+1)=0.;       %���ڴ�Ƶ�ʷ�Χ�ڵ������Ϊ��
   else
      yy(m+1)=y(m+1);     %����Ƶ�ʷ�Χ�����������
   end
end
subplot(2,2,4),plot(f,abs(yy)*2/N)    %�����˲���������
xlim([0 50]);xlabel('Ƶ��/Hz');ylabel('���')
gstext=sprintf('�� %4.1f -%4.1f Hz ��Ƶ�ʱ��˳�',f1,f2); %���˲���Χ��ʾ��Ϊ����
title(gstext)
subplot(2,2,3),plot(t,real(ifft(yy)))   %�����˲������������ifft�任��ʱ���򲢻�ͼ��
title('ͨ��IFFT�ص�ʱ����');
xlabel('ʱ��/s');
