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

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

F1(:,:,1) = fuse_rule_pca(IA1(:,:,1), IB1(:,:,1));
F1(:,:,2) = fuse_rule_pca(IA1(:,:,2), IB1(:,:,2));
F1(:,:,3) = fuse_rule_pca(IA1(:,:,3), IB1(:,:,3));
% % % F1:the fused reflectance image using PCA
F2(:,:,1) = fuse_rule_pca(IA2(:,:,1), IB2(:,:,1));
F2(:,:,2) = fuse_rule_pca(IA2(:,:,2), IB2(:,:,2));
F2(:,:,3) = fuse_rule_pca(IA2(:,:,3), IB2(:,:,3));
% % % % % F2: the fused illumination image using PCA

F = F1 + F2;
% % % % F: the final fused image
figure, imshow(uint8(F));
