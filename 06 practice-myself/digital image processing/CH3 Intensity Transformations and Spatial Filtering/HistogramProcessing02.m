f=imread('./image/g1.tif');
subplot(2,2,1);
imshow(f,[]);
title('Subplot 1: ԭͼ');

h=imhist(f)
h1=h(1:10:256);
horz=1:10:256;
bar(horz,h1);
axis([0 255 0 15000]);%��ʾˮƽ��ʹ�ֱ���������Сֵ
subplot(2,2,2);
imshow(h,[]);
title('Subplot 1: ԭͼ');