%ժ�Բ���
%https://www.cnblogs.com/tiandsp/archive/2013/06/07/3123755.html
clear all; close all; clc;
img=double(imread('lena512.bmp'));
% i=dec_lapacian(img);
% function I=dec_lapacian(img)
[m n]=size(img);
w=1/256*[1  4  6  4 1;      %������˹�˲���
         4 16 24 16 4;
         6 24 36 24 6;
         4 16 24 16 4;
         1  4  6  4 1];

imgn{1}=img;
figure('name','�˲��²���');
for i=2:5                   %�˲����²���
   imgn{i}=imfilter(imgn{i-1},w,'replicate');
   subplot(2,2,i-1)
    imshow(imgn{i},[]);
   imgn{i}=imgn{i}(1:2:size(imgn{i},1)-1,1:2:size(imgn{i},2)-1); %i-1������
end
figure('name','��������');
 for i=2:5
        title('i-1������');
   subplot(2,2,i-1)
    imshow(imgn{i},[]);
 end
figure('name','����ͼ���С');
for i=5:-1:2        %����ͼ���С
   imgn{i-1}=imgn{i-1}(1:2*size(imgn{i},1),1:2*size(imgn{i},2)); 
   subplot(2,2,i-1)
    imshow(imgn{i},[]);
end
figure('name','�в�ͼ��');
 for i=1:4          %��òв�ͼ��i��Ԥ��в�
    imgn{i}=imgn{i}-expand(imgn{i+1},w);
    subplot(2,2,i)
    imshow(imgn{i},[]);
 end
figure('name','�в�ͼ���ع�ͼ��');
for i=4:-1:1        %�в�ͼ���ع�ԭͼ��
    imgn{i}=imgn{i}+expand(imgn{i+1},w);
    subplot(2,2,i)
    imshow(imgn{i},[]);
end

