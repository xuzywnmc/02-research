
%% A script for running saliency computation
clear all;
close all;
%% load parameters and images
% % % % 
% file_names{1} = 'D21-010.jpg';
% MOV = saliency(file_names);
% MOV{1}.Irgb = imresize(MOV{1}.Irgb, [256,256]);
% MOV{1}.Irgb =im2double( MOV{1}.Irgb);
% MOV{1}.SaliencyMap = imresize(MOV{1}.SaliencyMap,[256,256]);
% %% display results
%  R(:,:,1) = MOV{1}.Irgb(:,:,1).*MOV{1}.SaliencyMap;
%  R(:,:,2) = MOV{1}.Irgb(:,:,2).*MOV{1}.SaliencyMap;
%  R(:,:,3) = MOV{1}.Irgb(:,:,3).*MOV{1}.SaliencyMap;
%  figure,imshow(R);
%  imwrite(R,'R21-010.jpg');
%  % % % % 
%  % % % % 
% file_names{1} = 'D21-011.jpg';
% MOV = saliency(file_names);
% MOV{1}.Irgb = imresize(MOV{1}.Irgb, [256,256]);
% MOV{1}.Irgb =im2double( MOV{1}.Irgb);
% MOV{1}.SaliencyMap = imresize(MOV{1}.SaliencyMap,[256,256]);
% %% display results
%  R(:,:,1) = MOV{1}.Irgb(:,:,1).*MOV{1}.SaliencyMap;
%  R(:,:,2) = MOV{1}.Irgb(:,:,2).*MOV{1}.SaliencyMap;
%  R(:,:,3) = MOV{1}.Irgb(:,:,3).*MOV{1}.SaliencyMap;
%  figure,imshow(R);
%  imwrite(R,'R21-011.jpg');
%  % % % % 
%  
%  % % % % 
% file_names{1} = 'D21-012.jpg';
% MOV = saliency(file_names);
% MOV{1}.Irgb = imresize(MOV{1}.Irgb, [256,256]);
% MOV{1}.Irgb =im2double( MOV{1}.Irgb);
% MOV{1}.SaliencyMap = imresize(MOV{1}.SaliencyMap,[256,256]);
% %% display results
%  R(:,:,1) = MOV{1}.Irgb(:,:,1).*MOV{1}.SaliencyMap;
%  R(:,:,2) = MOV{1}.Irgb(:,:,2).*MOV{1}.SaliencyMap;
%  R(:,:,3) = MOV{1}.Irgb(:,:,3).*MOV{1}.SaliencyMap;
%  figure,imshow(R);
%  imwrite(R,'R21-012.jpg');
%  % % % % 
%  
%  
%  % % % % 
% file_names{1} = 'D21-013.jpg';
% MOV = saliency(file_names);
% MOV{1}.Irgb = imresize(MOV{1}.Irgb, [256,256]);
% MOV{1}.Irgb =im2double( MOV{1}.Irgb);
% MOV{1}.SaliencyMap = imresize(MOV{1}.SaliencyMap,[256,256]);
% %% display results
%  R(:,:,1) = MOV{1}.Irgb(:,:,1).*MOV{1}.SaliencyMap;
%  R(:,:,2) = MOV{1}.Irgb(:,:,2).*MOV{1}.SaliencyMap;
%  R(:,:,3) = MOV{1}.Irgb(:,:,3).*MOV{1}.SaliencyMap;
%  figure,imshow(R);
%  imwrite(R,'R21-013.jpg');
%  % % % % 
%  % % % % 
% file_names{1} = 'D21-014.jpg';
% MOV = saliency(file_names);
% MOV{1}.Irgb = imresize(MOV{1}.Irgb, [256,256]);
% MOV{1}.Irgb =im2double( MOV{1}.Irgb);
% MOV{1}.SaliencyMap = imresize(MOV{1}.SaliencyMap,[256,256]);
% %% display results
%  R(:,:,1) = MOV{1}.Irgb(:,:,1).*MOV{1}.SaliencyMap;
%  R(:,:,2) = MOV{1}.Irgb(:,:,2).*MOV{1}.SaliencyMap;
%  R(:,:,3) = MOV{1}.Irgb(:,:,3).*MOV{1}.SaliencyMap;
%  figure,imshow(R);
%  imwrite(R,'R21-014.jpg');
%  % % % % 
%  
%   % % % % 
% file_names{1} = 'D21-015.jpg';
% MOV = saliency(file_names);
% MOV{1}.Irgb = imresize(MOV{1}.Irgb, [256,256]);
% MOV{1}.Irgb =im2double( MOV{1}.Irgb);
% MOV{1}.SaliencyMap = imresize(MOV{1}.SaliencyMap,[256,256]);
% %% display results
%  R(:,:,1) = MOV{1}.Irgb(:,:,1).*MOV{1}.SaliencyMap;
%  R(:,:,2) = MOV{1}.Irgb(:,:,2).*MOV{1}.SaliencyMap;
%  R(:,:,3) = MOV{1}.Irgb(:,:,3).*MOV{1}.SaliencyMap;
%  figure,imshow(R);
%  imwrite(R,'R21-015.jpg');
%  % % % % 
 
  % % % % 
file_names{1} = 'D21-016.jpg';
MOV = saliency(file_names);
MOV{1}.Irgb = imresize(MOV{1}.Irgb, [256,256]);
MOV{1}.Irgb =im2double( MOV{1}.Irgb);
MOV{1}.SaliencyMap = imresize(MOV{1}.SaliencyMap,[256,256]);
%% display results
 R(:,:,1) = MOV{1}.Irgb(:,:,1).*MOV{1}.SaliencyMap;
 R(:,:,2) = MOV{1}.Irgb(:,:,2).*MOV{1}.SaliencyMap;
 R(:,:,3) = MOV{1}.Irgb(:,:,3).*MOV{1}.SaliencyMap;
 figure,imshow(R);
 imwrite(R,'R21-016.jpg');
 % % % % 
 
  % % % % 
file_names{1} = 'D21-017.jpg';
MOV = saliency(file_names);
MOV{1}.Irgb = imresize(MOV{1}.Irgb, [256,256]);
MOV{1}.Irgb =im2double( MOV{1}.Irgb);
MOV{1}.SaliencyMap = imresize(MOV{1}.SaliencyMap,[256,256]);
%% display results
 R(:,:,1) = MOV{1}.Irgb(:,:,1).*MOV{1}.SaliencyMap;
 R(:,:,2) = MOV{1}.Irgb(:,:,2).*MOV{1}.SaliencyMap;
 R(:,:,3) = MOV{1}.Irgb(:,:,3).*MOV{1}.SaliencyMap;
 figure,imshow(R);
 imwrite(R,'R21-017.jpg');
 % % % % 
 
  % % % % 
file_names{1} = 'D21-018.jpg';
MOV = saliency(file_names);
MOV{1}.Irgb = imresize(MOV{1}.Irgb, [256,256]);
MOV{1}.Irgb =im2double( MOV{1}.Irgb);
MOV{1}.SaliencyMap = imresize(MOV{1}.SaliencyMap,[256,256]);
%% display results
 R(:,:,1) = MOV{1}.Irgb(:,:,1).*MOV{1}.SaliencyMap;
 R(:,:,2) = MOV{1}.Irgb(:,:,2).*MOV{1}.SaliencyMap;
 R(:,:,3) = MOV{1}.Irgb(:,:,3).*MOV{1}.SaliencyMap;
 figure,imshow(R);
 imwrite(R,'R21-018.jpg');
 % % % % 
 
  
  % % % % 
file_names{1} = 'D21-019.jpg';
MOV = saliency(file_names);
MOV{1}.Irgb = imresize(MOV{1}.Irgb, [256,256]);
MOV{1}.Irgb =im2double( MOV{1}.Irgb);
MOV{1}.SaliencyMap = imresize(MOV{1}.SaliencyMap,[256,256]);
%% display results
 R(:,:,1) = MOV{1}.Irgb(:,:,1).*MOV{1}.SaliencyMap;
 R(:,:,2) = MOV{1}.Irgb(:,:,2).*MOV{1}.SaliencyMap;
 R(:,:,3) = MOV{1}.Irgb(:,:,3).*MOV{1}.SaliencyMap;
 figure,imshow(R);
 imwrite(R,'R21-019.jpg');
 % % % % 
  % % % % 
% file_names{1} = 'D21-067.jpg';
% MOV = saliency(file_names);
% MOV{1}.Irgb = imresize(MOV{1}.Irgb, [256,256]);
% MOV{1}.Irgb =im2double( MOV{1}.Irgb);
% MOV{1}.SaliencyMap = imresize(MOV{1}.SaliencyMap,[256,256]);
% %% display results
%  R(:,:,1) = MOV{1}.Irgb(:,:,1).*MOV{1}.SaliencyMap;
%  R(:,:,2) = MOV{1}.Irgb(:,:,2).*MOV{1}.SaliencyMap;
%  R(:,:,3) = MOV{1}.Irgb(:,:,3).*MOV{1}.SaliencyMap;
%  figure,imshow(R);
%  imwrite(R,'R21-067.jpg');
%  % % % % 
% file_names{1} = 'D21.jpg';
% MOV = saliency(file_names);
% MOV{1}.Irgb = imresize(MOV{1}.Irgb, [256,256]);
% MOV{1}.Irgb =im2double( MOV{1}.Irgb);
% MOV{1}.SaliencyMap = imresize(MOV{1}.SaliencyMap,[256,256]);
% %% display results
%  R(:,:,1) = MOV{1}.Irgb(:,:,1).*MOV{1}.SaliencyMap;
%  R(:,:,2) = MOV{1}.Irgb(:,:,2).*MOV{1}.SaliencyMap;
%  R(:,:,3) = MOV{1}.Irgb(:,:,3).*MOV{1}.SaliencyMap;
%  figure,imshow(R);
%  imwrite(R,'R21.jpg');
%  % % % % 
% file_names{1} = 'D21.jpg';
% MOV = saliency(file_names);
% MOV{1}.Irgb = imresize(MOV{1}.Irgb, [256,256]);
% MOV{1}.Irgb =im2double( MOV{1}.Irgb);
% MOV{1}.SaliencyMap = imresize(MOV{1}.SaliencyMap,[256,256]);
% %% display results
%  R(:,:,1) = MOV{1}.Irgb(:,:,1).*MOV{1}.SaliencyMap;
%  R(:,:,2) = MOV{1}.Irgb(:,:,2).*MOV{1}.SaliencyMap;
%  R(:,:,3) = MOV{1}.Irgb(:,:,3).*MOV{1}.SaliencyMap;
%  figure,imshow(R);
%  imwrite(R,'R21.jpg');
%    
% 
%     
    
    