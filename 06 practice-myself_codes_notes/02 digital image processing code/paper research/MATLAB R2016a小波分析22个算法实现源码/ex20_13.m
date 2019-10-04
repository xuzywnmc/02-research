% 装入信号
load noisdopp;
x=noisdopp
% 用db1小波包对信号x分解到第三层
wpt=wpdec(x,3,'db1');
plot(wpt);% 画小波包树结构的图形
% 在第二层剪切小波包树
[nwpt,rn]=wpcutree(wpt,2);% 2是指第二层
plot(nwpt);% 画小波包树结构（nwpt）的图形
disp('初始树中经过重组结点的索引序号：')
rn
