%装载原始信号并图示之
load noismima;
s=noismima(1:1000);
figure(1);
subplot(2,2,1);
plot(s);
xlabel('样本序号 n');
ylabel('幅值 A');
title('原始信号');

%采用默认阈值、用wdencmp函数进行消噪处理
[thr,sorh,keepapp,crit]=ddencmp('den','wp',s);

%用全局阈值选项进行消噪处理
[c,treed,perf0,perfl2]= wpdencmp(s,sorh,3,'db2',crit,thr,keepapp);
subplot(2,2,3);
plot(c);
xlabel('样本序号 n');
ylabel('幅值 A');
title('默认阈值消噪信号');

%根据前面的消噪效果，调节阈值大小进行消噪
thr=thr+15;
[c1,treed,perf0,perfl2]= wpdencmp(s,sorh,3,'db2',crit,thr,keepapp);
subplot(2,2,4);
plot(c1);
xlabel('样本序号 n');
ylabel('幅值 A');
title('调节阈值后的消噪信号');
