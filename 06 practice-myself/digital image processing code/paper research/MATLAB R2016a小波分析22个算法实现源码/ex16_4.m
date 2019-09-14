% 采用补零的扩展模式
% 装载一维尺度信号
load leleccum;
s=leleccum(1:3920);
subplot(211);plot(s);
title('原始信号');
% 使用db1在第3层进行分解
[c,l]=wavedec(s,3,'db1');
% 由小波分解框架[c,l],提取第3层系数近似值
ca3=appcoef(c,l,'db1',3);
subplot(2,1,2);plot(ca3);
