clear all
close all
clc

addpath(genpath('SparseCode'));
addpath(genpath('Util'));

load('dictionary/Dc_8_8_32.mat')
load('dictionary/Dt_8_8_32.mat')

% img1=imread('./sourceimages/source1.tif');
% img2=imread('./sourceimages/source2.tif');
[img1 ,img2,result]=oral(1,'CSMCA');
img2=img2(:,:,2);
img1=img1(:,:,2);
figure,imshow(uint8(img1));
figure,imshow(uint8(img2));

imgf=CSMCA_Fusion(img1,img2,Dc,Dt);

figure;imshow(imgf);
% imwrite(imgf,'Results/fused_csmca.tif');

 imwrite(imgf,result)


