% 装入信号
load noisdopp;
x=noisdopp
figure(1);
subplot(121);
plot(x);
title('原始信号');
% 用db1小波包对信号x分解到第三层
wpt=wpdec(x,3,'db1');
plot(wpt);% 画小波包树结构的图形
% 重组小波包（1，1）或第2个结点，并返回更新后的小波包分解结构
% 参数c是结点2的小波包分解系数
[wpt,c]=wpjoin(wpt,2);% 2是指结点2，也可以用[1，1]表示
plot(wpt);% 画小波包树结构的图形
% 以图形的方式显示分解系数的大小
figure(1);
subplot(122);
plot(c);
title('结点2的小波包分解系数');
