clear all
picname = 'photo_11.1\1.fig';
open(picname);
obj = get(gca,'children');%获取子对象的句柄

% imshow(pic)
title('原始图像')
pic=get(obj,'cdata');%显示真彩色的

%选取分析区域
h=imrect;%鼠标变成十字，用来选取感兴趣区域
pos=getPosition(h);

%拷贝选取图片
imCp = imcrop( pic, pos );%imcrop 裁剪图像
figure(2) %控制窗口的数量
imshow(imCp);%显示图像
title('选取的区域')%title给选取的图像取名字

% 绘制灰度图
grayImage = imCp;
figure(3);
imshow(grayImage);
title('灰度图');

%归一化
originalMinValue = double(min(min(grayImage)'));%min求最小 double将数据变为双精度 
originalMaxValue = double(max(max(grayImage)')); 
originalRange = originalMaxValue - originalMinValue;
desiredMin = 0;
desiredMax = 1;
desiredRange = desiredMax - desiredMin;
dblImageS1 = desiredRange * (double(grayImage) - originalMinValue) / originalRange + desiredMin;
figure;
imshow(dblImageS1);
title('归一化')

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

%直方图
A = 0:1/255:1;   
[x_hist,y_hist]=hist(buf,A);%函数格式为 [a,b]=hist(x,n) 其中x是一维向量，函数功能是将x中的最小和最大值之间的区间等分n份，横坐标是x值，纵坐标是该值的个数。返回的a是落在该区间内的个数，b是该区间的中心线位置坐标
hist(buf,A);   %绘制选取区域图像的RGB值的归一化后的直方图
axis([0,1,0,10]);%设置当前坐标轴的限制范围 xmin xmax ymin ymax
hold on%启动图形保持

%求出瑞利分布模型(主要求方差)
z_ray=mle(buf,'distribution','rayleigh'); %极大似然估计
y_ray=A/z_ray.^2.*exp(-A.^2./(2*z_ray.^2));
y_ray=y_ray*max(x_hist)/max(y_ray);  %调节放大比列
plot(A,y_ray,'r')
hold on

%莱斯
%A = 0:1/255:1;   
%z_ric=mle(A,'distribution','rician');
%y_ric=A/z_ric(1).^2.*exp(-(A.^2+z_ric(2).^2)./(2*z_ric(1).^2));
%y_ric=y_ric*max(x_hist)/max(y_ric);  % 调节放大比列
%plot(A,y_ric,'y')
z_ric=mle(buf,'distribution','rician'); %极大似然估计
y_ric=A/z_ric(1).^2.*exp(-(A.^2+z_ric(2).^2)./(2*z_ric(1).^2));
y_ric=y_z_ric*max(x_hist)/max(y_z_ric);  %调节放大比列
plot(A,y_ric,'r')
hold on
