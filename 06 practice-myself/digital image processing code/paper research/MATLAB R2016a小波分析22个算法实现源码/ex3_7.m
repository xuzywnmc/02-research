%装载并显示原始图像
load vcosig;
%加入含噪
init=2055615866;
randn('seed',init);
X1=X+20*randn(size(X));
figure(1);
image(X1);
colormap(map);
title('原始图像');
axis square;
%用小波db4对图像X进行一层小波包分解
T=wpdec2(X1,1,'db4');
%重构图像近似部分
figure(2);
A=wprcoef(T,[1 0]);
image(A);
title('图像的近似部分');
axis square;
%边缘检测
figure(3);
%%原图像的边缘检测
BW1 = edge(X1,'prewitt');
imshow(BW1);
title('原图像的边缘');
axis square;
%%图像近似部分的边缘检测
figure(4);
BW2= edge(A,'prewitt');
imshow(BW2);
title('图像近似部分的边缘');
axis square;
