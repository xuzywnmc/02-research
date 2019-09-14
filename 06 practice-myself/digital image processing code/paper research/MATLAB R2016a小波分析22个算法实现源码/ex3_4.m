%装载源信号
load noisbump;
s=noisbump(1:1000);
figure(1);
subplot(2,1,1);
plot(s);
xlabel('样本序号 n');
ylabel('幅值 A');
title('原始信号');
%采用默认阈值，以小波包函数wpdencmp对s进行压缩处理
[thr,sorh,keepapp,crit]=ddencmp('cmp','wp',s);
[sc,treed,perf0,perfl2]= wpdencmp(s,sorh,3,'db2',crit,thr,keepapp);
subplot(2,1,2);
plot(sc);
xlabel('样本序号 n');
ylabel('幅值 A');
title('压缩后的信号');
