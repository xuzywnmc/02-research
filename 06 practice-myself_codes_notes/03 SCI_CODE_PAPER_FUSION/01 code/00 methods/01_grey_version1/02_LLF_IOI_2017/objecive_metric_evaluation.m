% % % % the main algorithm for objective metric evaluation of the fused
% image
clc;
clear;
addpath('objective_metrics');
% % % % % % % % % % % % % % % % % % % % % % 
img=imread('F.jpg');f = double(img); f =imresize(f,[256,256]);
% % the fused image
img=imread('I1.jpg');img1 = double(img); img1 =imresize(img1,[256,256]);
% % the input image 1
img=imread('I2.jpg');img2 = double(img); img2 =imresize(img2,[256,256]);
% % the input image 2


% % % % % % % % % % % % % % % 

[SF, EI, MI, TMQI] = evaluation1(img1, img2, f);
 fprintf('\n\n   the fused image in terms of SF metric is  :%.4f\n'  ,SF);
 fprintf('\n\n   the fused image in terms of EI metric is  :%.4f\n'  ,EI);
 fprintf('\n\n   the fused image in terms of MI metric is  :%.4f\n'  ,MI);
 fprintf('\n\n   the fused image in terms of TMQI metric is  :%.4f\n'  ,TMQI);


% % % % 
