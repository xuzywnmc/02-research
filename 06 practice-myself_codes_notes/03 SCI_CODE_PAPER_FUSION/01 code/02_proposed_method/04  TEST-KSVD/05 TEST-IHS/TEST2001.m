close all
clc;clear;
image_input1=double(imread('./2.jpg'));
 figure;
 imshow(uint8(image_input1),[]);
image_input2=double(imread('./3.jpg'));
 figure;
 imshow(uint8(image_input2),[]);
Fusion_image=double(imread('jiaquan28.jpg'));
 figure;
 imshow(uint8(Fusion_image),[]);
 [OUTPUT,FORRI,AA,BB]=RGB2IHS(Fusion_image)
%  OUTPUT(:,:,2)= OUTPUT(:,:,2)*1.6;
%   OUTPUT(:,:,1)= OUTPUT(:,:,1)*2;
  OUTPUT(:,:,3)= OUTPUT(:,:,3)*1.3;
%   figure;
%  imshow(uint8(OUTPUT(:,:,2)),[]);
%  for channel=1:3
%  OUTPUT(:,:,channel)=OUTPUT(:,:,channel)+10;
%  end
 OUTPUT1=IHS2RGB(OUTPUT);
 figure;
 imshow(uint8(OUTPUT1),[]);
set (gcf,'position',[0,0,256,256])%画图时，用来设置图像的大小，
%分别代表x轴长度，y轴长度，图像长度，图像高度
str=['f' num2str(0) '.jpg'];
saveas(gcf,str);%创建条形图并将其另存为 JPG 文件
Fusion_image=double(imread('jiaquan28.jpg'));
 figure;
 imshow(uint8(Fusion_image),[]);
R_image=Fusion_image(:,:,1);
G_image=Fusion_image(:,:,2);
B_image=Fusion_image(:,:,3);
R_image_input1=image_input1(:,:,1);
G_image_input1=image_input1(:,:,2);
B_image_input1=image_input1(:,:,3);
R_image_input2=image_input2(:,:,1);
G_image_input2=image_input2(:,:,2);
B_image_input2=image_input2(:,:,3);
for channel=1:3
      temp_image_input1=image_input1(:,:,channel);
      temp_image_input2=image_input2(:,:,channel);
     temp_Fusion_image=Fusion_image(:,:,channel);
 
     for k_1=1:256
         for k_2=1:256
                 MSE1=0;
                 MSE2=0;
                 temp_MSE1=0;
                 temp_MSE2=0;
                 for tongdao=1:3
                     temp_MSE1=(image_input1(k_1,k_2,tongdao)-Fusion_image(k_1,k_2,tongdao))^2;
                     MSE1=MSE1+temp_MSE1;
                     temp_MSE2=(image_input2(k_1,k_2,tongdao)-Fusion_image(k_1,k_2,tongdao))^2;
                     MSE2=MSE2+temp_MSE2;
                 end
            if (MSE1)<(MSE2)%说明为灰度
                temp_Fusion_image(k_1,k_2)=temp_image_input1(k_1,k_2);
            else
                temp_Fusion_image(k_1,k_2)=temp_image_input2(k_1,k_2);
            end
         end
     end
     Fusion_image(:,:,channel)=temp_Fusion_image;
end
 figure;
 imshow(uint8(Fusion_image),[]);
