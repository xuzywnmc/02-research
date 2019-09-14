%装载并显示原始图像
load trees;
subplot(2,2,1);
image(X);
colormap(map);
title('原始图像');
axis square;

%生成含噪图像
init=2055615866;
randn('seed',init);
X1=X+20*randn(size(X));
subplot(2,2,2);
image(X1);
colormap(map);
title('含噪图像');
axis square; 

%用小波sym2对图像X1进行一层小波包分解
T=wpdec2(X1,1,'sym2');

%设置阈值
thr=8.342;

%对图像的小波包分解系数进行软阈值量化
NT=wpthcoef(T,0,'s',thr);

%仅对低频系数进行重构
X2=wprcoef(NT,1);

%画出消噪后的图像
subplot(2,2,3);
image(X2);
colormap(map);
title('消噪后的图像');
axis square;
