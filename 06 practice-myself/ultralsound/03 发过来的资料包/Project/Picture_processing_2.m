clear all
img1=imread('C:\ѧϰ\ҽѧ����\Project\pic0.jpg');
figure,imshow(img1);
title('ͼƬһ');

img1_cut=imcrop(img1);
figure,imshow(img1_cut);
title('ͼƬһ�ü�');

grayImage=rgb2gray(img1_cut)
figure,imshow(grayImage);
title('�Ҷ�ͼ');

%��һ������
originalMinValue = double(min(min(grayImage)));
originalMaxValue = double(max(max(grayImage)));
originalRange = originalMaxValue - originalMinValue;
desiredMin = 0;
desiredMax = 1;
desiredRange = desiredMax - desiredMin;
img_norm = desiredRange * (double(grayImage) - originalMinValue) / originalRange + desiredMin;
figure,imshow(img_norm);
title('��һ������ͼ');

%ת��Ϊһά����
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

%ͳ��ֱ��ͼ
hist(buf);

hold on;

%�����ֲ�
phat=mle(buf);

%������Ȼ����
phat=mle(buf);


