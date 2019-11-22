% close all
% clc;clear;
% I1=double(imread('test1001.JPGfig.jpg'));
% [med] = PAL(I1);
% output=zeros(size(I1,1),size(I1,2),3);
% for channel=1:3
%     output(:,:,channel)=med(1:size(med,1),(size(I1,2)*(channel-1))+1:(size(I1,2)*channel))
% end
% figure;
% imshow(uint8(output),[]);
function [med] = PAL(x)
%UNTITLED2 此处显示有关此函数的摘要 模糊数学 王博发
%x=rgb2gray(x);
[M,N]=size(x);
x1=double(x);
%基本参数
Fe=0.8;
%FE=-1*Fe;
Fd=128;
Xmax=255;
K=8;
%模糊特征平面
for i=1:M
    for j=1:N
        P(i,j)=(1+(Xmax-x1(i,j))/Fd)^(-Fe);
        %P(i,j)=cos(pi/2*(1-(x1(i,j)/Xmax)));
    end
end
%T=(graythresh(x1))/255;
%模糊增强
times=1;
for k=1:times
    for i=1:M
        for j=1:N
            if P(i,j)<=0.500
               P1(i,j)=2*P(i,j)^2;
            else
                P1(i,j)=1-2*(1-P(i,j))^2;
           end
          % P1(i,j)=sin((pi/2)*P(i,j))^K;
        end
    end
    P=P1;
end
%反模糊化
for i=1:M
    for j=1:N
        I(i,j)=Xmax+Fd*((1-(P(i,j))^(-1/Fe)));
    end
end
med=uint8(I);

%imwrite(X,'D:/fuzzied_image.jpg');
%imwrite(X,'D:/LII.jpg');
end

