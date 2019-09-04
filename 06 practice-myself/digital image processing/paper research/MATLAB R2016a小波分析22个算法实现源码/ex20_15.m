% 装入信号
load noisdopp;
x=noisdopp(1:1000);
figure(1);
subplot(121);
plot(x);
title('原始信号');
% 用db1小波包分解信号x到第三层
t=wpdec(x,3,'db1','shannon');
plot(t);% 画树结构的图形
% 重构小波包的结点（2，1）
rcfs=wprcoef(t,[2,1]);
figure(1);
subplot(122);
plot(rcfs);
title('重构的小波包结点（2，1）');
