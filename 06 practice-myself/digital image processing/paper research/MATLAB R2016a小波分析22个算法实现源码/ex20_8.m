% 装入信号
load noisdopp;
x=noisdopp
% 用db2小波包对信号x分解到第二层，用shannon熵作为熵标准
t=wpdec(x,2,'db1','shannon');
% 计算小波包分解树的结点
nodes=allnodes(t);
% 读取初始小波包分解数据结构中各结点的熵值
disp('初始各结点的熵值：');
ent=read(t,'ent',nodes)
% 不改变树结构和数据结构，选用'threshold'熵标准（阈值为0.5），更新结点的熵值
d=entrupd(t,'threshold',0.5);
% 读取更新后小波包分解数据结构中各结点的熵值
disp('更新后各结点的熵值：');
nent=read(t,'ent')
