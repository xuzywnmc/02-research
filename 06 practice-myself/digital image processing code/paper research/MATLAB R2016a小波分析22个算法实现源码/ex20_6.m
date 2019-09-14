% 装入信号
load noisdopp;
x=noisdopp
% 用db1小波包对信号x分解到第三层
wpt=wpdec(x,3,'db1');
% 用默认的（shannon）熵分解小波包[3，0]
wpt=wpsplt(wpt,[3,0]);
% 画小波包树的结构wpt
plot(wpt);
% 计算最佳树
[bt,e,n]=besttree(wpt);
% 画出最佳树的结构bt
plot(bt);
disp('表示初始树的各个结点的熵值向量e为：')
e
disp('表示初始树的各个结点索引序号向量n为：')
n
