clf
N=128;dt=1;   %数据长度和采样间隔
n=0:N-1; t=n*dt;  %时间序列
xn1=cos(0.14*pi*t);   %原始信号
subplot(3,2,1),plot(t,xn1);title('原始信号');   %绘制原始信号
xn2=cirshftt(xn1,20,N);     %循环位移20个时间单位
subplot(3,2,2),plot(t,xn2);  % 绘出循环移位后的信号
title('时移20个单位的信号')
Xk1=dfs(xn1,N);   %将原信号进行Fourier变换
magXk1=abs(Xk1);phaXk1=angle(Xk1);  %得到原信号的振幅和相位
k=0:length(magXk1)-1;
subplot(3,2,3),
plot(k/(N*dt),magXk1*2/N);   %绘制原信号的振幅谱
ylabel('振幅');        
title('原始信号的振幅谱');
subplot(3,2,4),plot(k/(N*dt),unwrap(phaXk1)),ylabel('相位角/rad')  
%绘制原信号的相位谱,unwrap为将信号解卷绕，即将相位角展开
title('原始信号的相位谱')
Xk2=dfs(xn2,N);   %绘制移位后信号的振幅谱
Xk2=Xk2./exp(-2*j*pi*k*20/N);  %将移位后的Fourier变换与相乘
%如果没有此语句，得出的相位谱会发生变化
magXk2=abs(Xk2);phaXk2=angle(Xk2);
k=0:length(magXk2)-1;
subplot(3,2,5),
plot(k/(N*dt),magXk2*2/N);
xlabel('频率/Hz');ylabel('振幅');
title('移位后与exp(-j*2*pi*k*20/N)相乘的振幅谱');
subplot(3,2,6),plot(k/(N*dt),unwrap(phaXk2)),ylabel('相位角/rad')
xlabel('频率/Hz')
title('移位后与exp(-j*2*pi*k*20/N)相乘的相位谱')
