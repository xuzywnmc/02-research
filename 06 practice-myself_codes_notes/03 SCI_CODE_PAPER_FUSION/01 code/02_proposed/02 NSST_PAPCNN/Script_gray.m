clear all;
close all;
clc;
%% NSST tool box
addpath(genpath('shearlet'));
%% 灰度必须是二维
% A=imread('sourceimages/s01_CT.tif');
% B=imread('sourceimages/s01_MRT2.tif');
[A ,B ,result]=oral(1,'NSST+PAPCNN');
A=A(:,:,2);
B=B(:,:,2);
%  A=rgb2gray(A);
%   B=rgb2gray(B);
figure;imshow(uint8(A));
figure;imshow(uint8(B));
% 
img1 = double(A)/255;
img2 = double(B)/255;

% image fusion with NSST-PAPCNN 
imgf=fuse_NSST_PAPCNN(img1,img2); 

F=uint8(imgf*255);
figure,imshow(F);
      imwrite(uint8(F),result)
% imwrite(F,'results/fused.tif');