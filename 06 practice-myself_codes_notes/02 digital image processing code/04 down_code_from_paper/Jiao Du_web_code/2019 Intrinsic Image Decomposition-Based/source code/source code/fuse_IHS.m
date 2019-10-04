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

ill_IA1 = (IA1(:,:,1) + IA1(:,:,2) + IA1(:,:,3))./3;
% intensity of IA1
F1 = GIHSfusion(IB1,ill_IA1);
ill_IA2 = (IA2(:,:,1) + IA2(:,:,2) + IA2(:,:,3))./3;
% intensity of IA2
F2 = GIHSfusion(IB2,ill_IA2);
% % % % % % % % % % % % % % % % 

% % 
F = F1 + F2;
% F1:fused reflectance image, F2: fused illumination image, 
% F: the final fused image
figure, imshow(F);







