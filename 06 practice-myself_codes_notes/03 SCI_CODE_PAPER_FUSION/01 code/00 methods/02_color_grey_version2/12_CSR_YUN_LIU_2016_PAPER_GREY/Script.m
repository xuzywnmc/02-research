close all;
clear all;
clc;

% Load dictionary
load('dict.mat');  

% Load images
A=imread('sourceimages/010_MR-T2.tif');
B=imread('sourceimages/010_SPECT-Tc.tif');
figure,imshow(A)
figure,imshow(B)

%key parameters
lambda=0.01; 
flag=1; % 1 for multi-focus image fusion and otherwise for multi-modal image fusion

%CSR-based fusion
tic;
F=CSR_Fusion(A,B,D,lambda,flag);
toc;

figure,imshow(F);
imwrite(F,'results/s01_csr.tif');