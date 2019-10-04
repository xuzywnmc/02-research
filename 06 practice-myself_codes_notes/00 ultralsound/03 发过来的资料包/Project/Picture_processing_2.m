clear all
img1=imread('C:\学习\医学超声\Project\pic0.jpg');
figure,imshow(img1);
title('图片一');

img1_cut=imcrop(img1);
figure,imshow(img1_cut);
title('图片一裁剪');

grayImage=rgb2gray(img1_cut)
figure,imshow(grayImage);
title('灰度图');

%归一化处理
originalMinValue = double(min(min(grayImage)));
originalMaxValue = double(max(max(grayImage)));
originalRange = originalMaxValue - originalMinValue;
desiredMin = 0;
desiredMax = 1;
desiredRange = desiredMax - desiredMin;
img_norm = desiredRange * (double(grayImage) - originalMinValue) / originalRange + desiredMin;
figure,imshow(img_norm);
title('归一化处理图');

%转化为一维数组
[height,width,d]=size(img_norm);
subplot(1,2,1);
len=height*width;
buf=uint8(zeros(1,len));
r=1;
for i=1:1:height
  for j=1:1:width
  buf(r)=img_norm(i,j);
  r=r+1;
  end
end
img_array=uint8(zeros(height,width));
r=1;
for i=1:1:height
  for j=1:1:width
  img_array(i,j)=buf(r);
  r=r+1;
  end
 end
subplot(1,2,2);
imshow(img_array) 

%统计直方图
hist(buf);

hold on;

%瑞利分布
phat=mle(buf);

%极大似然估计
phat=mle(buf);


