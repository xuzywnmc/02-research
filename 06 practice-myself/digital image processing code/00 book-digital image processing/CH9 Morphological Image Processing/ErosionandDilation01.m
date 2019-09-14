%膨胀和腐蚀
f=imread('./image/g1.tif');
subplot(2,2,1);
imshow(f,[]);
title('Subplot 1: 原图')

w=[0 1  0;1 1 1;0 1  0];%使用掩模选择上 
A2=imdilate(f,w);%膨胀函数
subplot(2,2,2);
imshow(A2,[]);
title('Subplot 2: 膨胀图')

%腐蚀函数
f1=imread('./image/g2.tif');
subplot(2,2,3);
imshow(f1,[]);
title('Subplot 3: 原图')

se=strel('disk',10);
%创建一个平坦圆盘形结构元素 半径为R
%strel函数再数字图像处理273页
A2=imerode(f1,se);
subplot(2,2,4);
imshow(A2,[]);
title('Subplot 4: 圆盘腐蚀后图像')
