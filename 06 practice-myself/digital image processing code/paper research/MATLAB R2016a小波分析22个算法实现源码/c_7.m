clf
N=128;dt=1;   %���ݳ��ȺͲ������
n=0:N-1; t=n*dt;  %ʱ������
xn1=cos(0.14*pi*t);   %ԭʼ�ź�
subplot(3,2,1),plot(t,xn1);title('ԭʼ�ź�');   %����ԭʼ�ź�
xn2=cirshftt(xn1,20,N);     %ѭ��λ��20��ʱ�䵥λ
subplot(3,2,2),plot(t,xn2);  % ���ѭ����λ����ź�
title('ʱ��20����λ���ź�')
Xk1=dfs(xn1,N);   %��ԭ�źŽ���Fourier�任
magXk1=abs(Xk1);phaXk1=angle(Xk1);  %�õ�ԭ�źŵ��������λ
k=0:length(magXk1)-1;
subplot(3,2,3),
plot(k/(N*dt),magXk1*2/N);   %����ԭ�źŵ������
ylabel('���');        
title('ԭʼ�źŵ������');
subplot(3,2,4),plot(k/(N*dt),unwrap(phaXk1)),ylabel('��λ��/rad')  
%����ԭ�źŵ���λ��,unwrapΪ���źŽ���ƣ�������λ��չ��
title('ԭʼ�źŵ���λ��')
Xk2=dfs(xn2,N);   %������λ���źŵ������
Xk2=Xk2./exp(-2*j*pi*k*20/N);  %����λ���Fourier�任�����
%���û�д���䣬�ó�����λ�׻ᷢ���仯
magXk2=abs(Xk2);phaXk2=angle(Xk2);
k=0:length(magXk2)-1;
subplot(3,2,5),
plot(k/(N*dt),magXk2*2/N);
xlabel('Ƶ��/Hz');ylabel('���');
title('��λ����exp(-j*2*pi*k*20/N)��˵������');
subplot(3,2,6),plot(k/(N*dt),unwrap(phaXk2)),ylabel('��λ��/rad')
xlabel('Ƶ��/Hz')
title('��λ����exp(-j*2*pi*k*20/N)��˵���λ��')
