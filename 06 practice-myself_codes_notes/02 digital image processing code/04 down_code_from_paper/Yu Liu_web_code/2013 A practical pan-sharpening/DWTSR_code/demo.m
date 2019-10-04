clear all;
close all;
clc;

MS=imread('images/ms.tif');    
P=imread('images/pan.tif'); 

tic;
imgf=dwtsr_pansharpening(MS,P);
toc;

F=uint8(imgf);                     %for uint8 data

imwrite(F,'result.tif');



