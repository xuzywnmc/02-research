%����RMSE
%img1��Դͼ��A
%img2��Դͼ��B
%result���ں�ͼ��
% % % % % % % % % % % % % %  
clc;clear
    img1 =double(imread('clock1.tif'));
    img2= double(imread('clock2.tif'));
    reslut= double(imread('reslut.jpg'));
    y1=rmse(img1,reslut);
    y2=rmse(img2,reslut);
    RMSE=max(y1,y2);
    
    function rmse1 = rmse(imgfusion,imgstandard) 
    % ��������
    [m n]=size(imgfusion);
    temp=sqrt(sum(sum((imgfusion-imgstandard).^2)));
    rmse1=temp/(m*n);
    end