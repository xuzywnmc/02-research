clc,clear
%%%% gray image fusion
% I = load_images( '.\sourceimages\grayset',1); 
% F = GFF(I);
% imshow(F);
%%%% color image fusion
I = load_images( '.\SOUCEIMAGES\cc\s\',1); 
F = GFF(I);
imwrite(uint8(F),'.\SOUCEIMAGES\result\result.tif');
figure,imshow(F);