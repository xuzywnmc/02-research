clear 
close all 
clc

% Input greyscale MRI image
input=imread('MRI-015.jpg'); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
smooth_input = imread('smooth-MRI-015.jpg');  
%the website:
%http://demo.ipol.im/demo/blmv_nonlinear_cartoon_texture_decomposition/,
% demo (scale=3.0), input:anatomcial image in grayscale, such as MRI-015.jpg
% output:smooth-MRI-015.jpg
[IA1, IA2] = MRI_decompose(input, smooth_input);
% % % % % input: input MRI image, smooth_input:% % smooth version of MRI
% image, 
% % % IA1-reflectance image, IA2:illumination image


% Input pseudo-color PET image

input =imread('PET-015.jpg');
[IB1, IB2] = PET_decompose(input);
% input:input pseudo-color PET image,
% IB1-reflectance image, IB2:illumination image
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% % % 
F = fuserule(IA1, IA2, IB1, IB2);
% F:the final fused image using IIC 

figure, imshow(F);