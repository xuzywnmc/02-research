close all;
clear all;
clc;

% [imagename1, imagepath1]=uigetfile('sourceimages\*.jpg;*.bmp;*.png;*.tif;*.tiff;*.pgm;*.gif','Please choose the first input image');
% A=imread(strcat(imagepath1,imagename1));    
% [imagename2, imagepath2]=uigetfile('sourceimages\*.jpg;*.bmp;*.png;*.tif;*.tiff;*.pgm;*.gif','Please choose the second input image');
% B=imread(strcat(imagepath2,imagename2));  
[B ,A ,result]=oral(1,'DSIFT')
if size(A)~=size(B)
    error('two images are not the same size.');
end

figure,imshow(uint8(A));figure,imshow(uint8(B));

%key parameters
scale=48;
blocksize=8;
matching=1;

tic;
F=DSIFT_Fusion(A,B,scale,blocksize,matching);
toc;

figure,imshow(uint8(F));
   imwrite(uint8(F),result)
% imwrite(F,'results\fused_dsift.tif');