clear all;
close all;
clc;
%% NSST tool box
addpath(genpath('shearlet'));
%% ע��B����ά
% A=imread('sourceimages/s02_MR.tif');  %anatomical image
% B=imread('sourceimages/s02_PET.tif'); %functional image
% [A ,B ,result]=oral(3,'NSST+PAPCNN');
B=imread('MRI-0092.jpg');
A=imread('PET-0093.jpg');
temp=A;
A=B(:,:,2);
B=temp;
figure;imshow(uint8(A));
figure;imshow(uint8(B));

img1 = double(A)/255;
img2 = double(B)/255;
img2_YUV=ConvertRGBtoYUV(img2);
img2_Y=img2_YUV(:,:,1);
[hei, wid] = size(img1);

% image fusion with NSST-PAPCNN 
imgf_Y=fuse_NSST_PAPCNN(img1,img2_Y); 

imgf_YUV=zeros(hei,wid,3);
imgf_YUV(:,:,1)=imgf_Y;
imgf_YUV(:,:,2)=img2_YUV(:,:,2);
imgf_YUV(:,:,3)=img2_YUV(:,:,3);
imgf=ConvertYUVtoRGB(imgf_YUV);

F=uint8(imgf*255);

imwrite(uint8(F),'result.jpg')
figure,imshow(F);
% imwrite(F,'results/fused.tif');

