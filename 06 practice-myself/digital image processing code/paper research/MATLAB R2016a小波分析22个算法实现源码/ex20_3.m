% 现在的扩展模式为零扩展
% 装入图像，X包含装入的图像
load tire;
% 用默认的shannon熵，分解图像
t=wpdec2(X,2,'db1');
plot(t);% 画四叉树结构图
