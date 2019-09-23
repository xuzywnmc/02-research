% function I=dec_gaussian(img)
clear all; close all; clc;
img=double(imread('lena512.bmp'));
% % This function is used to process gaussian decomposion of input image.
% % editor : denghaibo
% % date   : 2009-4-8
% % DEFINITION OF VARIABLES:
% %     VARIABLE       MEANING
% %     level         decompose level 分解层
% %     img           input image   输入图像
% %     G_LOWER       extracted image //提取的图像
% %     DECIM         convolved image   //卷积图像
% %     GDEC_level    save the decomposed image in each level // 保存分解的图像
% %     GDEC_level is a 3-D matrix   //3维矩阵
% %     size(GDEC_level)=[row,col,level]; 【行，列，层级】

level=3; % % 分解次数
img1=img;
G0=double(img1);
% % modify data class
                               % % G0 is the 0th decomposition level
[row,col]=size(G0);

plate=[1,4,6,4,1;4,16,24,16,4;6,24,36,24,6;4,16,24,16,4;1,4,6,4,1];
W=plate/256;                   % %    这个不管

G_LOWER=G0;

GDEC=zeros(level,row,col); % % save the Gaussian decomposition image 
GDEC=GDEC-1;         % % the reason to subtract 1 is used to judge the edge of the extracted image;

for(flag=1:level)  
 G_LOWER=G_LOWER(1:2:end,1:2:end); % % 隔行隔列取点,也就是金字塔分解，这个是重点~！！！！

DECIM=conv2(G_LOWER,W,'same');
[decrow,deccol]=size(DECIM);

GDEC(flag,1:decrow,1:deccol)=DECIM; % % save the decomposed image
I=GDEC;
figure
imshow(uint8(DECIM));
end
save GDEC;
% figure
% imshow(uint8(DECIM));
% end                            % % end of function 
