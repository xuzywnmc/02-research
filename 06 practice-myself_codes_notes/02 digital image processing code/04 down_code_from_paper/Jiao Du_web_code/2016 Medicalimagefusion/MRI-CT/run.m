clear all; 
close all;
clc

sym x;  
%定义一个变量x

x=['1MRI.jpg',' ', '1CT.jpg'];
% the first input image: 1MRI.jpg, the second input image: 1CT.jpg
cmd=['scale.exe' ' ' x];
[y] = system(cmd,'-echo');

% The final fused image is F-001.jpg