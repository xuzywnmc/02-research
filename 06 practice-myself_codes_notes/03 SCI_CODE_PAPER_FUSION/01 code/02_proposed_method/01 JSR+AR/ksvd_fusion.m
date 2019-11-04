function [y,SSIM,RMSE,MI,PSNR,SF, G, P, C QE] = ksvd_fusion(y1, y2)

image = imresize(y1, [256,256]);
image1 = imresize(y2, [256,256]);
% % % % % % % % % 
input = image(:,:,1);
output = dictionary(input);
% % % % % % % % % % 
input1 = image1(:,:,1);
output1 = dictionary(input1);
% % % % % fuse

% Y(:,:,1)  = 0.5.*(output + output1);
Y(:,:,1)  = 0.6*output + 0.4*output1;
% % % % % % % % % % % % 
% % % % % % % % % 
input = image(:,:,2);
output = dictionary(input);
% % % % % % % % % % 
input1 = image1(:,:,2);
output1 = dictionary(input1);
% % % % % fuse

% Y(:,:,2)  = 0.5.*(output + output1);
Y(:,:,2)  = 0.6*output + 0.4*output1;
% % % % % % % % % % % % 
% % % % % % % % % 
input = image(:,:,3);
output = dictionary(input);
% % % % % % % % % % 
input1 = image1(:,:,3);
output1 = dictionary(input1);
% % % % % fuse

% Y(:,:,3)  = 0.5.*(output + output1);
Y(:,:,3)  = 0.6*output + 0.4*output1;
% % % % % % % % % % % % 
out =Y;
[SSIM,RMSE,MI,PSNR,SF] =quality(image,image1,out);
[GI,P,C,QE]=measures(image,image1,out);
G = [GI(:,:,1)+GI(:,:,2)+GI(:,:,3)]/3;

y = out;
% figure, imshow(y, []);