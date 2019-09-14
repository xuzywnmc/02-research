clear all;
load scddvbrk;
s=scddvbrk;
figure;
subplot(211);plot(s);
title('原始信号');
ylabel('s');
%计算小波分解自相似指数
subplot(212);f=cwt(s,[1:2:128],'db4','plot');
title('小波分解自相似指数');
xlabel('时间');
ylabel('尺度变换');
