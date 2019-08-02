f=imread('./image/g1.tif');
w=[-1 -1  -1;-1 8 -1;-1 -1  -1];
g=abs(imfilter(double(f),w));
a=g(:);
T=max(g(:));%可以看出的是g(:)是将矩阵换成一行
g=g>=T;
imshow(g);
title('Subplot 1:亮点图')