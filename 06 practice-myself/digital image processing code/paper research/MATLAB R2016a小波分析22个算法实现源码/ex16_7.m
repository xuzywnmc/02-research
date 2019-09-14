% 当前延拓模式是补零
% 装载一维原始信号
load sumsin;s=sumsin
subplot(211);plot(s)'
title('原始信号');
% 使用db1进行3层分解
[c,l]=wavedec(s,3,'db1');
subplot(212);plot(c);title('小波分解结构');
Xlabel('低频系数和第3,2,1层的高频系数');
