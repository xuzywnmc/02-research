% 装入信号
load noisdopp;
x=noisdopp;
% 用db1小波包分解信号x到第三层
% 采用shannon熵的标准
t=wpdec(x,3,'db1','shannon');
plot(t);% 画树结构的图形
