%阀值处理函数
close all; clear all; clc; 
f=imread('./image/g4.tif');
subplot(2,2,1);
imshow(f,[]);
title('Subplot 1: 原图');
T=graythresh(f);
T=T*255;
f1=f>=T
subplot(2,2,2);
imshow(f1,[]);
title('Subplot 2: 白底黑字');
f1=~(f>=T);
subplot(2,2,3);
imshow(f1,[]);
title('Subplot 3: 黑底白字');


%局部阀值处理
%全局阀值处理函数在背景照明不均匀的时候有可能无效 
%一种常用处理方法针对照明问题做预处理以补偿处理

