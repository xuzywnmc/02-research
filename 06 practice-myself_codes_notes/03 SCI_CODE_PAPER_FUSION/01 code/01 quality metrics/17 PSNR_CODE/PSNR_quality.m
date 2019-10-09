%计算RMSE
%img1是源图像A
%img2是源图像B
%result是融合图像
% % % % % % % % % % % % % %  
clc;clear
    img1 =double(imread('./clock/clock1.tif'));
    img2= double(imread('./clock/clock2.tif'));
    result= double(imread('./clock/result.jpg'));
    y1=my_PSNR_rms(img1 ,result);
    y2=my_PSNR_rms(img2 ,result);
    PSNR=max(y1,y2);
    function psnr_rms = my_PSNR_rms(ideal_img, compress_img)
    [row col] = size(ideal_img);
    ideal_img = double(ideal_img);
    compress_img = double(compress_img);
    fenzi = 0;    %分子项
    fenmu = 0;    %分母项
    fenzi = row*col;
    fenmu = sum(sum((compress_img-ideal_img).^2))/(row*col);
    snr_rms = fenzi/fenmu;
    psnr_rms = 10*log10(snr_rms);
    end