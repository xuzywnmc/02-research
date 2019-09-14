load noisdopp;
x=noisdopp(1:1000);
% 用db1小波包分解信号x到第三层
% 采用shannon熵的标准
t=wpdec(x,3,'db1','shannon');
plot(t);% 画出小波包树结构的图形
% 重新分解小波包结点（3，0）或第七个结点
wpt=wpsplt(t,[3,0]);
% 或等价于wpt=wpsplt(t,7);
plot(wpt);% 画出小波包树结构的图形
