close all
clc;clear;
I1=double(imread('jiaquan28.jpg'));
% [med] = PAL(I1);
figure;
% imwrite(uint8(output),'jiaquan28_mohumath.jpg');
imshow(uint8(I1),[]);
output=zeros(size(I1,1),size(I1,2),3);
for channel=1:3
    im_e = Homom_filter(I1(:,:,channel));
    output(:,:,channel)=im_e;
end
figure;
% imwrite(uint8(output),'jiaquan28_mohumath.jpg');
imshow(uint8(output),[]);
% [H,S,V]=RGB2HBV(Fusion_image);
%  [max_cntMat_mean_S_value,b1]=max(max(V));
%   [min_cntMat_mean_S_value,b6]=min(min(V));