% 采用补零的扩展模式
% 装载一维尺度信号
load sumsin;s=sumsin;
% 使用db1在第3层小波分解
[c,l]=wavedec(s,3,'db1');
subplot(311);plot(s);
title('原始信号s.');
subplot(312);plot(c);
title('3层小波分解结构');
xlabel(['第3层的低频系数以及第3、2和1层的高频系数'])
% 对3层的小波分解结构进行重构
% 因此新的结构[nc,nl]是2层小波分解结构
[nc,nl]=upwlev(c,l,'db1');
subplot(313);plot(nc);
title('2层小波分解结构')
xlabel(['第2层的低频系数及第1和2层的高频系数'])

