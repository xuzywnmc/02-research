% 装载一原始的一维信号
load leleccum;s=leleccum(1:3920);
ls=length(s);
% 画出原始波形图
figure(1);
subplot(511);plot(s);
ylabel('s');
title('原始信号s及单尺度分解的低频系数ca1和高频系数cd1');
% 用小波db1进行单尺度一维分解
[ca1,cd1]=dwt(s,'db1');
% 画出分解后的低频系数ca1和高频系数cd1
subplot(523);plot(ca1);
ylabel('ca1');
subplot(524);plot(cd1);
ylabel('cd1');
% 分别对低频系数ca1和高频系数cd1进行重构
a1=upcoef('a',ca1,'db1',1,ls);
d1=upcoef('d',cd1,'db1',1,ls);
% 分别画出重构后低频部分和高频部分的波形图
figure(2);
subplot(511);plot(a1);
ylabel('a1');
title('单尺分解的低频重构信号、高频重构信号及合成重构信号')
subplot(512);plot(d1);
ylabel('d1')
% 画出a1+d1波形图，即对s的分解系数直接进行重构
a0=idwt(ca1,cd1,'db1',ls);
subplot(513);plot(a0);
ylabel('a1+d1');
% 用db1小波对信号进行三层分解
[c,l]=wavedec(s,3,'db1');
% 从小波分解结构[c,l]中提取低频系数
ca3=appcoef(c,l,'db1',3);
% 从小波分解结构[c,l]中提取第1，2，3层的高频系数
cd3=detcoef(c,l,3);
cd2=detcoef(c,l,2);
cd1=detcoef(c,l,1);
% 分别画出原始信号、低频系数和高频系数的波形
figure(3);
subplot(511);plot(s);
ylabel('s');
title('原始信号及三层分解的各层分解系数');
subplot(589);plot(ca3);
ylabel('ca3');
subplot(5,8,17);plot(cd3);
ylabel('cd3');
subplot(5,4,13);plot(cd2);
ylabel('cd2');
subplot(5,2,9);plot(cd1);
ylabel('cd1');
% 对第3层的低频系数进行重构
a3=wrcoef('a',c,l,'db1',3);
% 从小波分解结构[c,l]中提取第1，2，3层的高频系数进行重构
d3=wrcoef('d',c,l,'db1',3);
d2=wrcoef('d',c,l,'db1',2);
d1=wrcoef('d',c,l,'db1',1);
% 画出各层系数重构后的波形图
figure(4);
subplot(511);plot(ca3);
ylabel('ca3');
title('各层分解系数的重构图及合成重构图a0');
subplot(512);plot(cd3);
ylabel('cd3');
subplot(513);plot(cd2);
ylabel('cd2');
subplot(514);plot(cd1);
ylabel('cd1');
% 对小波分解结构[c,l]进行重构
a0=waverec(c,l,'db1');
subplot(515);plot(a0);
ylabel('a0');
