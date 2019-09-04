% 装入信号
load noisdopp;
x=noisdopp;
figure(1);
subplot(221);
plot(x);
title('原始信号');
% 用db1小波包分解信号x到第三层
t=wpdec(x,3,'db1','shannon');
plot(t);% 画树结构图形
% 读取小波包（2，1）的系数
cfs=wpcoef(t,[2,1]);
figure(1);
subplot(222);
plot(cfs);
title('小波包（2，1）的系数');
