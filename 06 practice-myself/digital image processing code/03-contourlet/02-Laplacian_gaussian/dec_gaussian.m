% function I=dec_gaussian(img)
clear all; close all; clc;
img=double(imread('lena512.bmp'));
% % This function is used to process gaussian decomposion of input image.
% % editor : denghaibo
% % date   : 2009-4-8
% % DEFINITION OF VARIABLES:
% %     VARIABLE       MEANING
% %     level         decompose level �ֽ��
% %     img           input image   ����ͼ��
% %     G_LOWER       extracted image //��ȡ��ͼ��
% %     DECIM         convolved image   //���ͼ��
% %     GDEC_level    save the decomposed image in each level // ����ֽ��ͼ��
% %     GDEC_level is a 3-D matrix   //3ά����
% %     size(GDEC_level)=[row,col,level]; ���У��У��㼶��

level=3; % % �ֽ����
img1=img;
G0=double(img1);
% % modify data class
                               % % G0 is the 0th decomposition level
[row,col]=size(G0);

plate=[1,4,6,4,1;4,16,24,16,4;6,24,36,24,6;4,16,24,16,4;1,4,6,4,1];
W=plate/256;                   % %    �������

G_LOWER=G0;

GDEC=zeros(level,row,col); % % save the Gaussian decomposition image 
GDEC=GDEC-1;         % % the reason to subtract 1 is used to judge the edge of the extracted image;

for(flag=1:level)  
 G_LOWER=G_LOWER(1:2:end,1:2:end); % % ���и���ȡ��,Ҳ���ǽ������ֽ⣬������ص�~��������

DECIM=conv2(G_LOWER,W,'same');
[decrow,deccol]=size(DECIM);

GDEC(flag,1:decrow,1:deccol)=DECIM; % % save the decomposed image
I=GDEC;
figure
imshow(uint8(DECIM));
end
save GDEC;
% figure
% imshow(uint8(DECIM));
% end                            % % end of function 
