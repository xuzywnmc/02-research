
%% A script for running saliency computation
clear all;
close all;
%% load parameters and images
% % % % 
file_names{1} = 'D23-006.jpg';
MOV = saliency(file_names);
MOV{1}.Irgb = imresize(MOV{1}.Irgb, [256,256]);
MOV{1}.Irgb =im2double( MOV{1}.Irgb);
MOV{1}.SaliencyMap = imresize(MOV{1}.SaliencyMap,[256,256]);
%% display results
 R(:,:,1) = MOV{1}.Irgb(:,:,1).*MOV{1}.SaliencyMap;
 R(:,:,2) = MOV{1}.Irgb(:,:,2).*MOV{1}.SaliencyMap;
 R(:,:,3) = MOV{1}.Irgb(:,:,3).*MOV{1}.SaliencyMap;
 figure,imshow(R);
 imwrite(R,'R23-006.jpg');
 % % % % 
 % % % % 
file_names{1} = 'D22-006.jpg';
MOV = saliency(file_names);
MOV{1}.Irgb = imresize(MOV{1}.Irgb, [256,256]);
MOV{1}.Irgb =im2double( MOV{1}.Irgb);
MOV{1}.SaliencyMap = imresize(MOV{1}.SaliencyMap,[256,256]);
%% display results
 R(:,:,1) = MOV{1}.Irgb(:,:,1).*MOV{1}.SaliencyMap;
 R(:,:,2) = MOV{1}.Irgb(:,:,2).*MOV{1}.SaliencyMap;
 R(:,:,3) = MOV{1}.Irgb(:,:,3).*MOV{1}.SaliencyMap;
 figure,imshow(R);
 imwrite(R,'R22-006.jpg');
 % % % % 
 
file_names{1} = 'D21-006.jpg';
MOV = saliency(file_names);
MOV{1}.Irgb = imresize(MOV{1}.Irgb, [256,256]);
MOV{1}.Irgb =im2double( MOV{1}.Irgb);
MOV{1}.SaliencyMap = imresize(MOV{1}.SaliencyMap,[256,256]);
%% display results
 R(:,:,1) = MOV{1}.Irgb(:,:,1).*MOV{1}.SaliencyMap;
 R(:,:,2) = MOV{1}.Irgb(:,:,2).*MOV{1}.SaliencyMap;
 R(:,:,3) = MOV{1}.Irgb(:,:,3).*MOV{1}.SaliencyMap;
 figure,imshow(R);
 imwrite(R,'R21-006.jpg');
 % % % % 
 % % % % 
file_names{1} = 'D23-007.jpg';
MOV = saliency(file_names);
MOV{1}.Irgb = imresize(MOV{1}.Irgb, [256,256]);
MOV{1}.Irgb =im2double( MOV{1}.Irgb);
MOV{1}.SaliencyMap = imresize(MOV{1}.SaliencyMap,[256,256]);
%% display results
 R(:,:,1) = MOV{1}.Irgb(:,:,1).*MOV{1}.SaliencyMap;
 R(:,:,2) = MOV{1}.Irgb(:,:,2).*MOV{1}.SaliencyMap;
 R(:,:,3) = MOV{1}.Irgb(:,:,3).*MOV{1}.SaliencyMap;
 figure,imshow(R);
 imwrite(R,'R23-007.jpg');
 % % % % 
 
 % % % % 
file_names{1} = 'D22-007.jpg';
MOV = saliency(file_names);
MOV{1}.Irgb = imresize(MOV{1}.Irgb, [256,256]);
MOV{1}.Irgb =im2double( MOV{1}.Irgb);
MOV{1}.SaliencyMap = imresize(MOV{1}.SaliencyMap,[256,256]);
%% display results
 R(:,:,1) = MOV{1}.Irgb(:,:,1).*MOV{1}.SaliencyMap;
 R(:,:,2) = MOV{1}.Irgb(:,:,2).*MOV{1}.SaliencyMap;
 R(:,:,3) = MOV{1}.Irgb(:,:,3).*MOV{1}.SaliencyMap;
 figure,imshow(R);
 imwrite(R,'R22-007.jpg');
 % % % % 
 
 
 % % % % 
file_names{1} = 'D21-007.jpg';
MOV = saliency(file_names);
MOV{1}.Irgb = imresize(MOV{1}.Irgb, [256,256]);
MOV{1}.Irgb =im2double( MOV{1}.Irgb);
MOV{1}.SaliencyMap = imresize(MOV{1}.SaliencyMap,[256,256]);
%% display results
 R(:,:,1) = MOV{1}.Irgb(:,:,1).*MOV{1}.SaliencyMap;
 R(:,:,2) = MOV{1}.Irgb(:,:,2).*MOV{1}.SaliencyMap;
 R(:,:,3) = MOV{1}.Irgb(:,:,3).*MOV{1}.SaliencyMap;
 figure,imshow(R);
 imwrite(R,'R21-007.jpg');
 % % % % 
 % % % % 
