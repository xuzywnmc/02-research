clf
N=100; dt=1;   %���ݳ���Ϊ100���������Ϊ1s
n=0:N-1;t=n*dt;  %����ʱ������
xn1=cos(2*pi*0.24*t);   %��һ����
xn2=cos(2*pi*0.12*t);   %�ڶ�����
Xk1=dfs(xn1,N);    %��һ���񶯵�Fourier�任
Xk2=dfs(xn2,N);    %�ڶ����񶯵�Fourier�任
magXk1=abs(Xk1);phaXk1=angle(Xk1);  %��һ���񶯵��������λ
magXk2=abs(Xk2);phaXk2=angle(Xk2); %�ڶ����񶯵��������λ
k=0:length(magXk1)-1;
subplot(3,1,1),plot(k/(N*dt),magXk1*2/N);  %���Ƶ�һ���񶯵������
ylabel('���');
title('��һ���񶯵�Fourier�任');
k=0:length(magXk2)-1;
subplot(3,1,2),plot(k/(N*dt),magXk2*2/N);
ylabel('���');
title('�ڶ����񶯵�Fourier�任');
Xk=dfs(xn1+xn2,N);  %�����񶯺ϳɵ�Fourier�任
magXk=abs(Xk);phaXk=angle(Xk);   %�ϳ��񶯵��������λ
k=0:length(magXk)-1;
subplot(3,1,3),plot(k/(N*dt),magXk*2/N);  %���ƺϳ��񶯵��������λ
xlabel('Ƶ��/Hz');ylabel('���');
title('�ϳ��񶯵�Fourier�任');
