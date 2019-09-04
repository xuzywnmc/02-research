N=100;dt=1;   %���ݸ�����������
n = 0:N-1;t=n*dt;   %ʱ������ֵ
x = cos(pi*t/2);    %�����ź�
k = 0:N-1; f =k/(N*dt);        %Ƶ������ֵ 
X = dfs(x,N);    %  ��������źŵ�Fourier�任
realX=real(X);    %ȡX��ʵ��
imagX=imag(X);    %ȡX���鲿
Xrealshft=cirshftt(realX,10,N);  %��X��ʵ���ź���λ10
Ximagshft=cirshftt(imagX,10,N); %��X���鲿�ź���λ10
Y=idfs(Xrealshft+j*Ximagshft,N); %����λ���źŽ��Ϊ����������任
subplot(2,2,1),plot(t,real(Y));ylim([-1 1])  %Y��ʵ��
xlabel('ʱ��/s')
title('��λ���ź�Ƶ�����ʵ��')
subplot(2,2,2),plot(t,imag(Y));   %���Y���鲿
xlabel('ʱ��/s')
title('��λ���ź�Ƶ������鲿')
subplot(2,2,3),plot(t,x.*real(exp(j*2*pi*n*10/N))); %��x(n) ��ʵ��
xlabel('ʱ��/s')
title('x*exp(j*2*pi*n*10/N)��Fourier�任��ʵ��')
subplot(2,2,4),plot(t,x.*imag(exp(j*2*pi*n*10/N)));%��x(n) ���鲿
xlabel('ʱ��/s')
title(' x*exp(j*2*pi*n*10/N) ��Fourier�任���鲿')

