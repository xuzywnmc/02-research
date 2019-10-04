clear all
img1=imread('D:\学习\医学超声\Project\pic0.jpg');
figure(1),imshow(img1);
title('原图');

img1_cut=imcrop(img1);
figure(2);
subplot(121),imshow(img1_cut);
title('裁剪图');

grayImage=rgb2gray(img1_cut)
subplot(122),imshow(grayImage);
title('灰度图');

%归一化处理
originalMinValue = double(min(min(grayImage)));
originalMaxValue = double(max(max(grayImage)));
originalRange = originalMaxValue - originalMinValue;
desiredMin = 0;
desiredMax = 1;
desiredRange = desiredMax - desiredMin;
img_norm = desiredRange * (double(grayImage) - originalMinValue) / originalRange + desiredMin;
figure(3);
subplot(121),imshow(img_norm);
title('归一化处理图');

%转化为一维数组
%[height,width,d]=size(img_norm);
%subplot(1,2,1);
%len=height*width;
%buf=uint8(zeros(1,len));
%r=1;
%for i=1:1:height
%  for j=1:1:width
%  buf(r)=img_norm(i,j);
%  r=r+1;
%  end
%end
%img_array=uint8(zeros(height,width));
%r=1;
%for i=1:1:height
%  for j=1:1:width
%  img_array(i,j)=buf(r);
%  r=r+1;
%  end
% end
%subplot(1,2,2);
%imshow(img_array) 
A = 0:1/255:1;
[height,width,d]=size(img_norm);  %height：59,width：62,d：1 size显示大小分别返回三位行列式
len=height*width;  %len=3658
x=width;
y=height;
buf=double(zeros(1,len));  %buf为一行3658列的零矩阵
r=1;
for i=1:1:height
    for j=1:1:width
    buf(r)=img_norm(i,j); %一维数组
    r=r+1;
    end
end
%统计直方图
subplot(122),hist(buf);
title('统计直方图')

x=0:1/128:2;
[x_hist,y_hist]=hist(buf,x);
hist(buf,x)

hold on;
z_ray=mle(buf,'distribution','rayleigh') %极大似然估计 a为均值点  b为标准差 瑞利分布估计
for(i=1:length(buf))
   if buf(i)==0
        buf(i)=buf(i)+0.000001;
    end
end
z_ric=mle(buf,'distribution','rician') %极大似然估计 a为均值点  b为标准差 莱斯分布估计
%x=0:0.5:256;
y_ray=x/z_ray.^2.*exp(-x.^2./(2*z_ray.^2));
y_ric=x/z_ric(1).^2.*exp(-(x.^2+z_ric(2).^2)./(2*z_ric(1).^2));
y_ray=y_ray*max(x_hist)/max(y_ray);
y_ric=y_ric*max(x_hist)/max(y_ric);%  调节放大比列
hold on
plot(x,y_ray,'r')
plot(x,y_ric,'g')
legend({'直方图','瑞利分布', '莱斯分布'})
%hold offz_ray=mle(buf,'distribution','rayleigh') %极大似然估计 a为均值点  b为标准差 瑞利分布估计
for(i=1:length(buf))
   if buf(i)==0
        buf(i)=buf(i)+0.000001;
    end
end
z_ric=mle(buf,'distribution','rician') %极大似然估计 a为均值点  b为标准差 莱斯分布估计
%x=0:0.5:256;
y_ray=x/z_ray.^2.*exp(-x.^2./(2*z_ray.^2));
y_ric=x/z_ric(1).^2.*exp(-(x.^2+z_ric(2).^2)./(2*z_ric(1).^2));
y_ray=y_ray*max(x_hist)/max(y_ray);
y_ric=y_ric*max(x_hist)/max(y_ric);%  调节放大比列
hold on
plot(x,y_ray,'r')
plot(x,y_ric,'g')
legend({'直方图','瑞利分布', '莱斯分布'})
%hold off