N=100; dt=0.01;   %���ݵ����Ͳ������
n=0:N-1; t=n*dt;   %ʱ������
f=n/(N*dt);     %Ƶ������
h=[1 zeros(1,N-1)];  %�����źŵ�һ��ֵΪ1������Ϊ��
fo=2;f1=10;          % Ƶ�ʽ������������źŴ�2Hz���ӵ�10Hz
x=chirp(t,fo,1,f1);    %��ʱ������t�ϲ���Ƶ�ʽ����źš������ź�
xh=conv(x,h);    %�������źź������źŽ��о�����ο�������÷�
XH=dfs(xh(1:N),N);  %���ھ�������ݱ䳤������ֻѡȡ��ԭ���ݳ�����ȵ����ݸ���
subplot(2,2,1),plot(f,real(XH)*2/N); %��������Fourier�任��ʵ��
xlabel('Ƶ��/Hz');title('�źž����Fourier�任XH��ʵ��');
subplot(2,2,2),plot(f,imag(XH)*2/N); %��������Fourier�任���鲿
xlabel('Ƶ��/Hz');title('�źž����Fourier�任XH���鲿');
X=dfs(x,N);  %��chirp�źŽ���Fourier�任
H=dfs(h,N);   %�������źŽ���Fourier�任
XH1=X.*H;   %�������źź������źŵ�Fourier�任���
subplot(2,2,3),plot(f,real(XH1)*2/N); %���Fourier�任��˻���ʵ��
xlabel('Ƶ��/Hz');title(' Ƶ����˻�XH1��ʵ��')
subplot(2,2,4),plot(f,imag(XH1)*2/N); %���Fourier�任��˻����鲿
xlabel('Ƶ��/Hz');title(' Ƶ����˻�XH1���鲿');
