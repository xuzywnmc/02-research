close all;clear all;clc;

% [imagename1, imagepath1]=uigetfile('Data\*.jpg;*.bmp;*.png;*.tif;*.tiff;*.pgm;*.gif','Please choose the first input image');
image_input1=imread('./Data/children_1.tif');    
% [imagename2, imagepath2]=uigetfile('Data\*.jpg;*.bmp;*.png;*.tif;*.tiff;*.pgm;*.gif','Please choose the second input image');
image_input2=imread('./Data/children_2.tif');   
% [image_input1 ,image_input2 ,result]=oral(3,'ASR')
figure;imshow(uint8(image_input1));
figure;imshow(uint8(image_input2));

if size(image_input1)~=size(image_input2)
    error('two images are not the same size.');
end
%%
%根本就不会进入
sigma = 0; %standard deviation of added noise, sigma<=0 means images are not corrupted by noise
% if sigma>0
%     v=sigma*sigma/(255*255);
%     image_input1=imnoise(image_input1,'gaussian',0, v );
%     image_input2=imnoise(image_input2,'gaussian',0, v );
%     figure;imshow(image_input1);
%     figure;imshow(image_input2);
% end
%%
img1=double(image_input1);
img2=double(image_input2);

addpath(genpath('ksvdbox'));
dic_size=256; % 256 or 128
load(['Dictionary/D_100000_' num2str(dic_size) '_8_0.mat']); %the first sub-dictionary 'D'
load(['Dictionary/D_100000_' num2str(dic_size) '_8_6.mat']); %other sub-dictionaries 'Dn' and the number is 'dic_number'
overlap = 7;                   
epsilon = 0.1; 
C = 1.15;

tic;
if size(img1,3)==1   %for gray images
    imgf=asr_fuse(img1,img2,D,Dn,dic_number,overlap,8*C*sigma+epsilon);
else                 %for color images
    imgf=zeros(size(img1));  
    for i=1:3
        imgf(:,:,i)=asr_fuse(img1(:,:,i),img2(:,:,i),D,Dn,dic_number,overlap,8*C*sigma+epsilon);
    end
end
toc;

image_fusion=uint8(imgf);
figure;imshow(image_fusion);
%    imwrite(uint8(imgf),result)
% imwrite(image_fusion,['Results\fused_asr_d' num2str(dic_size) '_n' num2str(sigma) '.tif']);