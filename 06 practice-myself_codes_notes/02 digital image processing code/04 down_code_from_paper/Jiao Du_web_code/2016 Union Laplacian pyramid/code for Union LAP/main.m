clear all; close all;clc;


% check inputs 
MX= double(imread('MRI-015.jpg'));
MY= double(imread('PET-015.jpg'));

MX=imresize(MX,[256,256]);
MY=imresize(MY,[256,256]);
zt=3; 
% zt is the level length
% % % % % % % % % % % % % % % % red channel
M1=MX(:,:,1);
M2=MY(:,:,1);
Y(:,:,1) = laplas( M1,M2,zt);
% % % % % % % % % % % % % % % % green channel
M1=MX(:,:,2);
M2=MY(:,:,2);
Y(:,:,2) = laplas( M1,M2,zt);
% % % % % % % % % % % % % % % % blue channel
M1=MX(:,:,3);
M2=MY(:,:,3);
Y(:,:,3) = laplas( M1,M2,zt);
% % % % % % % % % % % % % % 
% y=quality(MX,MY,Y);

figure,imshow(uint8(Y));