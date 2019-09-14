clear all                       %�������ռ��е����б������
N=256;dt=0.02;                 %���ݵĸ����Ͳ������
n=0:N-1;t=n*dt;                 %������к�ʱ������
x=sin(2*pi*t)+0.5*sin(2*pi*5*t);   %�źżӵõ��ĺϳ��ź�
m=floor(N/2)+1;       %�ֽ�a,b��������ֵ��Ϊ�ֽ��N/2�������ټӲ���a0
%floor����Ϊ����ȡ��
a=zeros(1,m);b=zeros(1,m);    %����a,b����Ϊ�������
for k=0:m-1
    for ii=0:N-1
        a(k+1)=a(k+1)+2/N*x(ii+1)*cos(2*pi*k*ii/N);   %  
        b(k+1)=b(k+1)+2/N*x(ii+1)*sin(2*pi*k*ii/N);   %  
   %MATLAB�е��������ֻ�ܴ�1��ʼ��
    end
    c(k+1)=sqrt(a(k+1).^2+b(k+1).^2);   % 
end
subplot(2,1,1),plot(t,x);title('ԭʼ�ź�'),xlabel('ʱ��/s')    %���ʱ�����ź�
subplot(2,1,2),plot((0:m-1)/(N*dt),c)   %���Ƶ�����ź�
title('Fourier�任'),xlabel('Ƶ��/Hz'),ylabel('���')
