clear all;
close all;
clc;

MS=imread('images/clock1.tif');    
P=imread('images/clock2.tif'); 

tic;
imgf=dwtsr_pansharpening(MS,P);
toc;

F=uint8(imgf);                     %for uint8 data
imshow(F,[])

imwrite(F,'result.tif');



