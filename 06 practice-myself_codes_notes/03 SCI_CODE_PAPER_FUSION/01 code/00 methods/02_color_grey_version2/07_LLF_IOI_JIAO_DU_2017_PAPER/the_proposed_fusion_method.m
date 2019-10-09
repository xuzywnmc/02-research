clc;clear
% [imagename1 imagepath1]=uigetfile('source_images\*.jpg;*.bmp;*.png;*.tif;*.tiff;*.pgm;*.gif','Please choose the first input image');
% image_input1=imread(strcat(imagepath1,imagename1));    
% [imagename2 imagepath2]=uigetfile('source_images\*.jpg;*.bmp;*.png;*.tif;*.tiff;*.pgm;*.gif','Please choose the second input image');
% image_input2=imread(strcat(imagepath2,imagename2));     
[image_input1 ,image_input2 ,result]=oral(2,'LLF_IOI');
% figure;imshow(uint(image_input1));
% figure;imshow(uint8(image_input2));

if size(image_input1)~=size(image_input2)
    error('two images are not the same size.');
end

% read input image 1
I1=double(image_input1)/255;
I1 = min(1,max(0, imresize(I1,1) ));  % downscale, Matlab version is slow

% % read input image 2
I2=double(image_input2)/255;
I2 = min(1,max(0, imresize(I2,1) ));  % downscale, Matlab version is slow

%% example: detail manipulation
sigma_r = 0.4;
alpha = 0.25;
beta = 1;
colorRemapping = 'rgb';
domain = 'lin';
level = 3;
% output the fused image
R = lapfilter(I1,I2,sigma_r,alpha,beta,colorRemapping,domain,level);
figure; clf; imshow(R);
% write the fused image
 imwrite(R,result)
% % % % % % % % % % %  
% % % preserve the input images and the fused image in the folder
% objective_metric
%  imwrite(I1,'objective_metrics\I1.jpg');
%  imwrite(I2,'objective_metrics\I2.jpg');
%  imwrite(R,'objective_metrics\F.jpg');
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% % % % % % % % % % % % % % % 





