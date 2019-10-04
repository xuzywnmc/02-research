% 装入信号
load noisdopp;
x=noisdopp
% 用db1小波包对信号x分解到第三层
wpt=wpdec(x,3,'db1');
% 画小波包树的结构wpt的图形
plot(wpt);
% 计算小波包树
wt=wp2wtree(wpt);
% 画小波包树的结构wt的图形
plot(wt);
