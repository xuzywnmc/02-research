%开运算和闭运算
f=imread('./image/g3.tif');
subplot(2,3,1);
imshow(f,[]);
title('Subplot 1: 原图1')

se=strel('square',20);
f0=imopen(f,se);
%开运算
subplot(2,3,2);
imshow(f0,[]);
title('Subplot 2: 原图1开运算')


f0=imclose(f,se);
%开运算
subplot(2,3,3);
imshow(f0,[]);
title('Subplot 3: 原图1闭运算')

clear;

f1=imread('./image/g4.tif');
subplot(2,3,4);
imshow(f1,[]);
title('Subplot 1: 原图2')


se=strel('square',3);
f0=imopen(f1,se);
%开运算
subplot(2,3,5);
imshow(f0,[]);
title('Subplot 2: 原图2开运算')


f0=imclose(f1,se);
%闭运算
subplot(2,3,6);
imshow(f0,[]);
title('Subplot 3: 原图2闭运算')
