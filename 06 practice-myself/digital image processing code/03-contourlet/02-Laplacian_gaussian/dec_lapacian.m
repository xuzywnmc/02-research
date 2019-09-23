%摘自博客
%https://www.cnblogs.com/tiandsp/archive/2013/06/07/3123755.html
clear all; close all; clc;
img=double(imread('lena512.bmp'));
% i=dec_lapacian(img);
% function I=dec_lapacian(img)
[m n]=size(img);
w=1/256*[1  4  6  4 1;      %拉普拉斯滤波器
         4 16 24 16 4;
         6 24 36 24 6;
         4 16 24 16 4;
         1  4  6  4 1];

imgn{1}=img;
figure('name','滤波下采样');
for i=2:5                   %滤波，下采样
   imgn{i}=imfilter(imgn{i-1},w,'replicate');
   subplot(2,2,i-1)
    imshow(imgn{i},[]);
   imgn{i}=imgn{i}(1:2:size(imgn{i},1)-1,1:2:size(imgn{i},2)-1); %i-1级近似
end
figure('name','各级近似');
 for i=2:5
        title('i-1级近似');
   subplot(2,2,i-1)
    imshow(imgn{i},[]);
 end
figure('name','调整图像大小');
for i=5:-1:2        %调整图像大小
   imgn{i-1}=imgn{i-1}(1:2*size(imgn{i},1),1:2*size(imgn{i},2)); 
   subplot(2,2,i-1)
    imshow(imgn{i},[]);
end
figure('name','残差图像');
 for i=1:4          %获得残差图像，i级预测残差
    imgn{i}=imgn{i}-expand(imgn{i+1},w);
    subplot(2,2,i)
    imshow(imgn{i},[]);
 end
figure('name','残差图像重构图像');
for i=4:-1:1        %残差图像重构原图像
    imgn{i}=imgn{i}+expand(imgn{i+1},w);
    subplot(2,2,i)
    imshow(imgn{i},[]);
end

