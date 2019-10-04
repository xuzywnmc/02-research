close all
load c818312b.dat;   %加载观测数据
dt=1;   %采样间隔为分钟
x=c818312b;N=length(x);t=[0:N-1]*dt;
figure(1)  %绘出记录数据随时间的变化
plot(t/(24*60),x);
%以天为单位给出原始记录，1天为24*60分钟
xlabel('时间/天');
title('地倾斜数据');
ylabel('振幅');
figure(2)
x=detrend(x);   %去掉长期趋势（这里为渐增的趋势）
y=fft(x);   %对该数据进行频谱分析
plot([0:N-1]/(N*dt),abs(y)*2/N); %绘出振幅谱
xlabel('频率/分钟^-^1');
title('地倾斜数据的振幅谱');
ylabel('振幅');
xlim([0 1/(4*60)]);  %只绘出周期大于4小时（240分钟）的振幅
hold on;plot([1/(26*60) 1/(26*60)],ylim, 'k:');
plot([1/(22*60) 1/(22*60)],ylim, 'k:');
plot([1/(13*60) 1/(13*60)],ylim, 'k:');
plot([1/(11*60) 1/(11*60)],ylim, 'k:');
plot([1/(8.5*60) 1/(8.5*60)],ylim, 'k:');
plot([1/(7.5*60) 1/(7.5*60)],ylim, 'k:');
text(1/(24*60), 2, '日潮', 'rotation',90)
text(1/(12*60), 2, '半日潮', 'rotation',90)
text(1/(8*60), 2, '三分之一潮', 'rotation',90);
hold off
