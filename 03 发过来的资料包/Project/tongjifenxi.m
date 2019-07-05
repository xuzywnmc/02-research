clear all
%pic = 'image\1.fig';
%open(pic);
%title('原始图');

%a=imrect;
%pos=getPosition(a);
%h=imrect(a,position);
%caijian=imcrop(h,pos);
caijian=imread('f1.jpg');
hh=imcrop(caijian);
%imshow(caijian);
%title('原始图');

%imshow('hh')
figure(2);
%inshow('caijian');
title('裁剪图');

% 绘制灰度图
%grayImage = hh;
grayImage = rgb2gray(hh);
figure(3);
imshow(grayImage);
title('灰度图');

%归一化
gg=ctranspose(grayImage);
originalMinValue = double(min(min(grayImage)));%min求最小 double将数据变为双精度 
originalMaxValue = double(max(max(grayImage))); 
originalRange = originalMaxValue - originalMinValue;
desiredMin = 0;
desiredMax = 255;
desiredRange = desiredMax - desiredMin;
dblImageS1 = desiredRange * (double(grayImage) - originalMinValue) / originalRange + desiredMin;
figure(4);
imshow(dblImageS1);
title('归一化');

%转化为一维数组                                
[height,width,d]=size(dblImageS1);  %height：59,width：62,d：1 size显示大小分别返回三位行列式
len=height*width;  %len=3658
buf=double(zeros(1,len));  %buf为一行3658列的零矩阵
r=1;
for i=1:1:height
    for j=1:1:width
    buf(r)=dblImageS1(i,j); %一维数组
    r=r+1;
    end
end
%统计直方图
hist(buf);

hold on;

%瑞利分布
phat=mle(buf);

%极大似然估计
phat=mle(buf);













