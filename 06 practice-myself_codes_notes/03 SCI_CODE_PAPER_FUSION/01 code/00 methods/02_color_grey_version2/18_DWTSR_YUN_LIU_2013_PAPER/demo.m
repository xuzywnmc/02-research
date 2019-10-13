clear all;
close all;
clc;

MS=imread('images/ms.tif');    
P=imread('images/pan.tif'); 
% [P ,MS ,result]=oral(2,'DWTSR')
tic;
imgf=dwtsr_pansharpening(MS,P);
toc;

F=uint8(imgf);                     %for uint8 data
imshow(F)
% imwrite(F,'result.tif');



