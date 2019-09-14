f=imread('./image/g1.tif');
subplot(2,2,1);
imshow(f,[]);
title('Subplot 1: 原图');

h=imhist(f)
h1=h(1:10:256);
horz=1:10:256;
bar(horz,h1);
axis([0 255 0 15000]);%表示水平轴和垂直轴的最大和最小值
subplot(2,2,2);
imshow(h,[]);
title('Subplot 1: 原图');