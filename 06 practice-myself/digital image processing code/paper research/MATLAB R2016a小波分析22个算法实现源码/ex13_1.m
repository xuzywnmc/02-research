%装载采集的信号leleccum.mat
load leleccum;
%将信号中第2200到第3600个采样点赋给s
index=2200:3600;
s=leleccum(index);
%画出原始信号
figure;
plot(index,s);
title('(a)电力负载信号波形');
%用db3小波进行5层分解
[c,l]=wavedec(s,5,'db3');
%重构第1-5层细节系数
d5 = wrcoef('d',c,l,'db3',5);
d4 = wrcoef('d',c,l,'db3',4);
d3 = wrcoef('d',c,l,'db3',3);
d2 = wrcoef('d',c,l,'db3',2);
d1 = wrcoef('d',c,l,'db3',1);
%显示细节系数
figure;
plot(index,d3,'LineWidth',2);
title('(b)细节信号波形d3');
figure;
plot(index,d2,'LineWidth',2);
title('(c)细节信号波形d2');
figure;
plot(index,d1,'LineWidth',2);
title('(d)细节信号波形d1');
