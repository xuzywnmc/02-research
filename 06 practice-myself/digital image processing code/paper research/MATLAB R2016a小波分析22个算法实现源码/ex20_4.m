% 装入图像，X包含装入的图像
load tire;
figure(1);
subplot(221);
image(X);
colormap(map);
title('原始图像');
axis square;
% 用默认的shannon熵，分解图像
t=wpdec2(X,2,'db1');
plot(t);% 画四叉树结构图
% 对分解结构[t,d]进行重构
rectire=wprec2(t);
% 画出重构后的图像
figure(1);
subplot(222);
image(rectire);
colormap(map);
title('重构后的图像');
axis square;
