 I = imread('2MRI.jpg');  % ����ͼ��  
 I = im2double(I);
I=rgb2gray(I);               % ת��Ϊ��ɫͼ��  
imshow(I);title('ԭͼ')  
BW1 = edge(I);  % ����canny����  
% figure,imshow(BW1);     % ��ʾ�ָ���ͼ�񣬼��ݶ�ͼ��  
% title('matlab canny')
M1 = I;
M2 = BW1;
mm = M1 > M2;
  	Y  = (mm.*M1) + ((~mm).*M2);
F = Y;
figure,imshow(F);