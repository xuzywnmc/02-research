% 装入信号
load noisdopp;
x=noisdopp
% 用db1小波包对信号x分解到第三层
wpt=wpdec(x,3,'db1');
% 用默认的（shannon)熵分解小波包[3，0]
wpt=wpsplt(wpt,[3,0]);
% 画小波包树的结构wpt的图形
plot(wpt);
% 计算最佳层次的树
blt=bestlevt(wpt);
% 画出最佳层次的树结构blt的图形
plot(blt);
