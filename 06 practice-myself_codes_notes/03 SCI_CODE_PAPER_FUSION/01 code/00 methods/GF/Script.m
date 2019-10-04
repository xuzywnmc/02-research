clc,clear
%%%% gray image fusion
% I = load_images( '.\sourceimages\grayset',1); 
% F = GFF(I);
% imshow(F);
%%%% color image fusion
I = load_images( '.\Sourceimages\coke',1); 
F = GFF(I);
figure,imshow(F);
imwrite(F,'.\result\coke.jpg')