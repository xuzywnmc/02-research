
%% A script for running saliency computation
clear all;
close all;

%% load parameters and images

% % % % 
file_names{1} = 'C21.jpg';


MOV = saliency(file_names);

MOV{1}.Irgb = imresize(MOV{1}.Irgb, [256,256]);
MOV{1}.Irgb =im2double( MOV{1}.Irgb);
MOV{1}.SaliencyMap = imresize(MOV{1}.SaliencyMap,[256,256]);
%% display results
 R = MOV{1}.SaliencyMap;
%  figure,imshow(R);
 imwrite(R,'R21.jpg');
 
% % % % 
file_names{1} = 'C22.jpg';


MOV = saliency(file_names);

MOV{1}.Irgb = imresize(MOV{1}.Irgb, [256,256]);
MOV{1}.Irgb =im2double( MOV{1}.Irgb);
MOV{1}.SaliencyMap = imresize(MOV{1}.SaliencyMap,[256,256]);
%% display results
 R = MOV{1}.SaliencyMap;
%  figure,imshow(R);
 imwrite(R,'R22.jpg');
 
% % % % 
file_names{1} = 'C23.jpg';


MOV = saliency(file_names);

MOV{1}.Irgb = imresize(MOV{1}.Irgb, [256,256]);
MOV{1}.Irgb =im2double( MOV{1}.Irgb);
MOV{1}.SaliencyMap = imresize(MOV{1}.SaliencyMap,[256,256]);
%% display results
 R = MOV{1}.SaliencyMap;
%  figure,imshow(R);
 imwrite(R,'R23.jpg');
 % % % % 

    