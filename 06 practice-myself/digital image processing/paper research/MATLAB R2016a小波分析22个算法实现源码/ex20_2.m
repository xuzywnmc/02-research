% 装入信号
load noisdopp;
x=noisdopp(1:1000);
figure(1);
subplot(211);
plot(x);
title('原始信号');
% 用db1小波包分解信号x到第三层
% 采用shannon熵的标准
t=wpdec(x,3,'db1','shannon');
plot(t);% 画小波包树结构的图形
recx=wprec(t);% 重构小波包分解结构T
figure(1);
subplot(212);plot(recx);
title('重构后的信号');
