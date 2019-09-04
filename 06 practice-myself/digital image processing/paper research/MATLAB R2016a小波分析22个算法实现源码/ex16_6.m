% 对于一维信号
s=2^10;
w='db1';
% 计算小波分解的最大尺度，规则时最大尺度至少一个系数正确
l1=wmaxlev(s,w)
% 改变小波
w='db7';
% 计算最大分解尺度
l2=wmaxlev(s,w)
% 对于二维信号
s=[2^9 2^7];
w='db1';
% 计算最大分解尺度
l3=wmaxlev(s,w)
% 它和下面这个函数一样
l4=wmaxlev(min(s),w)
% 改变小波
w='db7';
% 计算最大分解尺度
l5=wmaxlev(s,w)
