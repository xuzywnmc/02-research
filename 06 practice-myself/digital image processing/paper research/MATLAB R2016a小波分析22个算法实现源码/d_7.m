clear all   %����ڴ����б���
close all    %�ر����д򿪵�ͼ�δ���
N=200;dt=4/N; %���ݵ����Ͳ������
for n=1:N    %�õ������ź�
    if (n*dt>=2)
        x(n)=0.8;
    else
        x(n)=-0.8;
    end
end
figure(1)   %�򿪵�һ��ͼ�δ��ڣ�����ԭʼ�źż���Fourier����ϵ��
subplot(2,1,1),plot((1:N)*dt,x),hold on;
plot((1:N)*dt,zeros(1,N),'k'),xlabel('ʱ��/s')
title('ԭʼ�ź�')
a=zeros(1,N);b=zeros(1,N);
nn=floor(N/2)+1;
for k=0:nn-1
    a(k+1)=0;
    b(k+1)=0;
    for ii=0:N-1
        a(k+1)=a(k+1)+2/N*x(ii+1)*cos(2*pi*k*ii/N);  %���Fourierϵ��
        b(k+1)=b(k+1)+2/N*x(ii+1)*sin(2*pi*k*ii/N);
    end
    c(k+1)=sqrt(a(k+1).^2+b(k+1).^2);
end
subplot(2,1,2),plot((0:nn-1)/(N*dt),c);title('Fourier�任')
xlabel('Ƶ��/Hz'),ylabel('���') %���������
m=input('����г��������?');   %�������kֵ
if(m>(floor(N/2)+1))  %������kֵ����NyquistƵ�ʶ�Ӧ�ĵ���������ʾ������Ϣ
    error('г������������С��NyquistƵ�ʶ�Ӧ�Ľ���.')
end
if(mod(N,2)~=1)a(nn)=a(nn)/2; end   %��ʱb(nn)Ϊ�㣬a(nn)����
for ii=0:N-1    %�ϳ��ź�
    xx(ii+1)=a(1)/2;
    for k=1:m
        xx(ii+1)=xx(ii+1)+a(k+1)*cos(2*pi*k*ii/N)+b(k+1)*sin(2*pi*k*ii/N);
    end
end
figure(2)    %�򿪵ڶ���ͼ�δ��ڣ����ƺϳ��ź�ͼ
plot((1:N)*dt,xx,(0:N-1)*dt,x)    %���ƺϳ��źźͷ���ͼ�α��ڱȽ�
hold on
plot((1:N)*dt,zeros(1,N),'k'),xlabel('ʱ��/s')   %�������
title('�ϳ��ź�')
