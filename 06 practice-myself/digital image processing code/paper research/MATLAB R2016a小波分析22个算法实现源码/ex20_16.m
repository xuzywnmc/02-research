%读信号
load noisbump
x = noisbump;
%3层小波包分解
t = wpdec(x,3,'db2');
%显示小波包树结构
fig = plot(t);
