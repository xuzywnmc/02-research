 I = imread('2MRI.jpg');  % 读入图像  
 I = im2double(I);
I=rgb2gray(I);               % 转化为灰色图像  
imshow(I);title('原图')  
BW1 = edge(I);  % 调用canny函数  
% figure,imshow(BW1);     % 显示分割后的图像，即梯度图像  
% title('matlab canny')
M1 = I;
M2 = BW1;
mm = M1 > M2;
  	Y  = (mm.*M1) + ((~mm).*M2);
F = Y;
figure,imshow(F);