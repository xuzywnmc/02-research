close all;
clear all;
clc;

% Load dictionary
load('dict.mat');  

% Load images
% B=imread('sourceimages/010_SPECT-Tc.tif');
% A=imread('sourceimages/010_MR-T2.tif');
[A ,B,result]=oral(1,'CSMCA');
figure,imshow(uint8(A))
figure,imshow(uint8(B))

%key parameters
lambda=0.01; 
flag=2; % 1 for multi-focus image fusion and otherwise for multi-modal image fusion

%CSR-based fusion
tic;
F=CSR_Fusion(A,B,D,lambda,flag);
toc;

figure,imshow(F);
    imwrite(uint8(y),result)
% imwrite(F,'results/s01_csr.tif');