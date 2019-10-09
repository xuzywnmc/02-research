clear
g_R=0;                                        %r清晰度描述
g_G=0;                                        %g清晰度描述
g_B=0;                                        %b清晰度描述
h_R=0;                                        %熵的描述 
h_G=0;
h_B=0;
u1=zeros(3,1);
u2=zeros(3,1);
v11=zeros(3,1);               %高分辨率RGB值
v12=zeros(3,1);               %低分辨率RGB值
AA=zeros(3,3);
BB=zeros(3,3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AA=[1/sqrt(3),1/sqrt(3),1/sqrt(3);       
    1/sqrt(6),1/sqrt(6),-2/sqrt(6);                    %RGB－>IHS正变换矩阵
    1/sqrt(2),-1/sqrt(2),0];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
BB=[1/sqrt(3),1/sqrt(6),1/sqrt(2);
    1/sqrt(3),1/sqrt(6),-1/sqrt(2);                    %IHS->RGB逆变换矩阵
    1/sqrt(3),-2/sqrt(6),0];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
RGB_up=imread('SPECT-010.jpg');         %读图像
RGB_low=imread('MRI-010.jpg');         
figure(1)
imshow(RGB_up);   
title('IHS-RGB表示的高分辨率图像');
figure(2)                              
imshow(RGB_low); 
title('IHS-RGB表示的低分辨率图像');

[M,N,color]=size(RGB_up);

R_up=RGB_up(:,:,1);
G_up=RGB_up(:,:,2);
B_up=RGB_up(:,:,3);
[hang,lie,color]=size(RGB_up);
for i=1:hang
    for j=1:lie
       v11(1)=double(RGB_up(i,j,1));             %把函数类型unit8为double型
       v11(2)=double(RGB_up(i,j,2));
       v11(3)=double(RGB_up(i,j,3));  
       v12(1)=double(RGB_low(i,j,1));            %把函数类型unit8为double型
       v12(2)=double(RGB_low(i,j,2));
       v12(3)=double(RGB_low(i,j,3)); 
       u1=AA*v11;                               %正变换
       u2=AA*v12;
       u2 =pca_function(u1, u2);                             %交换空间明度
                   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%空间信息明度定义????????
       v12=BB*u2;
       RGB(i,j,1)=v12(1);                       %逆变换
       RGB(i,j,2)=v12(2);
       RGB(i,j,3)=v12(3);   
   end
end
%subplot(2,3,5);
r=RGB(:,:,1);
g=RGB(:,:,2);
b=RGB(:,:,3);
RGB=uint8(round(RGB)); 
figure(3)
imshow(RGB);
title('IHS-RGB表示的转化图像');


