clf     %���ͼ�ο������
N=100;dt=1;   %����������
n=0:N-1; t=n*dt;   %����ʱ������
xn=cos(2*pi*0.24*t)+cos(2*pi*0.26*t);  %����ԭʼ�źŵ�ֵ����
Xk=dfs(xn,N);      %��ԭʼ�źŽ���Fourier�任
magXk=abs(Xk);phaXk=angle(Xk);   %���Fourier�任���������λ
subplot(2,2,1),plot(t,xn); xlabel('ʱ��/s')  %���ԭʼ�ź�
title('ԭʼ�ź�(N=100)');
xx=idfs(Xk,N);      %Fourier��任
x=real(xx);         %ȡ�任���ʵ��������ʵ�������֤���鲿Ϊ��
subplot(2,2,2),plot(t,x),xlabel('ʱ��/s'),title('����Fourier��任�õ��ĺϳ��ź�')
k=0:length(magXk)-1;
subplot(2,1,2),plot(k/(N*dt),magXk*2/N); %���Fourier�任�������
%������ʵ�����ͼ
xlabel('Ƶ��/Hz');ylabel('���');
title(' X(k)���(N=100)');
