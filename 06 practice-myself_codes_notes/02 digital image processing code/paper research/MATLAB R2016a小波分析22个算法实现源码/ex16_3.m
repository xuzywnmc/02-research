% 采用补零的扩展模式
% 装载一维尺度信号
load leleccum;
s=leleccum(1:3920);
% 使用db1在第3层进行分解
[c,l]=wavedec(s,3,'db1');
subplot(411);plot(s);
title('原始信号');
% 从小波分解结构中提取1、2及3层的细节系数
[cd1,cd2,cd3]=detcoef(c,l,[1 2 3]);
% 绘图命令
subplot(412);plot(cd3);Ylabel('cd3');
subplot(413);plot(cd2);Ylabel('cd2');
subplot(414);plot(cd1);Ylabel('cd1');
