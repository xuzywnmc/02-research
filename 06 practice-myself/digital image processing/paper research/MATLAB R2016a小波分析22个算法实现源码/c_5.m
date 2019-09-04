clf
N=100; dt=1;   %数据长度为100，采样间隔为1s
n=0:N-1;t=n*dt;  %给出时间序列
xn1=cos(2*pi*0.24*t);   %第一个振动
xn2=cos(2*pi*0.12*t);   %第二个振动
Xk1=dfs(xn1,N);    %第一个振动的Fourier变换
Xk2=dfs(xn2,N);    %第二个振动的Fourier变换
magXk1=abs(Xk1);phaXk1=angle(Xk1);  %第一个振动的振幅、相位
magXk2=abs(Xk2);phaXk2=angle(Xk2); %第二个振动的振幅、相位
k=0:length(magXk1)-1;
subplot(3,1,1),plot(k/(N*dt),magXk1*2/N);  %绘制第一个振动的振幅谱
ylabel('振幅');
title('第一个振动的Fourier变换');
k=0:length(magXk2)-1;
subplot(3,1,2),plot(k/(N*dt),magXk2*2/N);
ylabel('振幅');
title('第二个振动的Fourier变换');
Xk=dfs(xn1+xn2,N);  %两个振动合成的Fourier变换
magXk=abs(Xk);phaXk=angle(Xk);   %合成振动的振幅和相位
k=0:length(magXk)-1;
subplot(3,1,3),plot(k/(N*dt),magXk*2/N);  %绘制合成振动的振幅和相位
xlabel('频率/Hz');ylabel('振幅');
title('合成振动的Fourier变换');
