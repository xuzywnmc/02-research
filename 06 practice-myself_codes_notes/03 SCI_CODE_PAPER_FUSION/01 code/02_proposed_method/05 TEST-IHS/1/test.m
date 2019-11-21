close all
clc;clear;
I1=double(imread('test1002.JPGfig.jpg'));
imshow(uint8(I1),[]);
[med] = PAL(I1);
output=zeros(size(I1,1),size(I1,2),3);
for channel=1:3
    output(:,:,channel)=med(1:size(med,1),(size(I1,2)*(channel-1))+1:(size(I1,2)*channel))
end
figure;
imshow(uint8(output),[]);