%计算RMSE
%img1是源图像A
%img2是源图像B
%result是融合图像
% % % % % % % % % % % % % %  
clc;clear
    img1 =double(imread('clock1.tif'));
    img2= double(imread('clock2.tif'));
    reslut= double(imread('reslut.jpg'));
    y1=rmse(img1,reslut);
    y2=rmse(img2,reslut);
    RMSE=max(y1,y2);
    
    function rmse1 = rmse(imgfusion,imgstandard) 
    % 两个参数
    [m n]=size(imgfusion);
    temp=sqrt(sum(sum((imgfusion-imgstandard).^2)));
    rmse1=temp/(m*n);
    end