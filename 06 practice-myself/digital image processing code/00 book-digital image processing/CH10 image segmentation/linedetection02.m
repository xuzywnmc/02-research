%
% line detection program
%
% 注：之所以书上说掩模对单像素的直线更敏感是因为掩模线条突出部分是单像素
f=imread('./image/g2.tif');
w=[2 -1  -1;-1 2 -1;-1 -1  2];%使用掩模选择上 
%之所以检测-45°线用的是这样的掩模是因为对于斜线 则2的值存在相当于就是
%放大斜线作用
g=imfilter(double(f),w);
subplot(2,2,1);
imshow(g,[]);
title('Subplot 1: 掩模处理图')


gtop=g(1:120,1:120);%%放大右上角函数
gtop=pixeldup(gtop,4);
subplot(2,2,2);
imshow(gtop,[]);
title('Subplot 2: 右上角放大图')
% figure,imshow(gtop,[]);如果是这样写 就会导致产生新图像 不会放在同一张图里
gbot = g(end-119:end, end-119:end);
gbot = pixeldup(gbot, 4);
subplot(2,2,3)
imshow(gbot,[]);
title('Subplot 3: 左下角放大图')

g = abs(g);
T = max(g(:));
g = g >= T;
subplot(2,2,4)
imshow(g,[]);
title('Subplot 4: 掩模处理图所有亮点图')