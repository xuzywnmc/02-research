%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Demo: Multi-modal medical image fusion based on by nonsubsampled
%                      contourlet transform (NSCT).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This function takes two images of different modalities and fuses them to
% obtain a more complete and accurate description in a single image.
%
%
%
% Reference:
%    Gaurav Bhatnagar, Q.M. Jonathan Wu and Zheng Liu, "Directive Contrast
%    based Multimodal Medical Image Fusion in NSCT domain, IEEE Transactions
%    on Multimedia, 2012 (In Press)
%
%
% Copyright (c) 2012 Gaurav Bhatnagar
% University of Windsor, ON, Canada.
% Email: goravb(at)uwindsor.ca
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This software uses Nonsubsampled Contourlet Toolbox provided by Arthur
% Cunha and can be downloaded from following link:
%
%       http://www.mathworks.com/matlabcentral/fileexchange/10049
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
clc
tic

%%% Reading the Images
% disp('Reading the input images...');
% a=imread('.\SOUCEIMAGES\gg\s\1.jpg');
% a=double(a);
% figure
% imshow(uint8(a),[])
% 
% b=imread('.\SOUCEIMAGES\gg\s\1.jpg');
% b=double(b);
% figure
% imshow(uint8(b),[])
[b,a ,result]=oral(1,'NSCT-PCDC')
% a=a(:,:,2);
% b=b(:,:,2);
%%% Fusing the Images
disp('Checking for basic requirements...');
if size(a)==size(b)
    disp('Fusing the images...');
    f = Final_Code_MedFus(a,b);
    disp('Displaying Fused Image');
    figure
    imshow(uint8(f))
       imwrite(uint8(f),result)
else
    disp('Error: The input images are of same sizes.');
end

toc

%%%%%%