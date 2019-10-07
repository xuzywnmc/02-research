% 现在用PCA方法进行融合,用高分辨率图片的第一主成分代替低分辨率图片的第一主成分，再进行反PCA变换
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function [y,SSIM,RMSE,MI,PSNR,SF, G, P, C QE]= ihs_fusion(input1, input2 )
    dir1 = ['./clock/clock1.tif'];
    dir2 = ['./clock/clock2.tif'];
    img1 =double(imread(dir1));
    img2=double(imread(dir2));
% %读入待融合的两幅医学图像，格式为jpg
% img1 = input1;
% img2 = input2;

x1=imresize(img1,[256,256]);
x2=imresize(img2,[256,256]);
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % RGB-HSI
        
g_R=0;                                        %r清晰度描述
g_G=0;                                        %g清晰度描述
g_B=0;                                        %b清晰度描述
h_R=0;                                        %熵的描述 
h_G=0;
h_B=0;
% u1=zeros(3,1);
% u2=zeros(3,1);
% v11=zeros(3,1);               %高分辨率RGB值
% v12=zeros(3,1);               %低分辨率RGB值
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
RGB_up=x2;         %读图像
RGB_low=x1;         
% figure(1)
% imshow(RGB_up);   
% title('IHS-RGB表示的高分辨率图像');
% figure(2)                              
% imshow(RGB_low); 
% title('IHS-RGB表示的低分辨率图像');

% [M,N,color]=size(RGB_up);
[M,N]=size(RGB_up);
% R_up=RGB_up(:,:,1);
% G_up=RGB_up(:,:,2);
% B_up=RGB_up(:,:,3);
% [hang,lie,color]=size(RGB_up);
[hang,lie]=size(RGB_up);
for i=1:hang
    for j=1:lie
%        v11(1)=RGB_up(i,j,1);             %把函数类型unit8为double型
%        v11(2)=RGB_up(i,j,2);
%        v11(3)=RGB_up(i,j,3);  
       v11=RGB_up(i,j);             %把函数类型unit8为double型
%        v12(1)=RGB_low(i,j,1);            %把函数类型unit8为double型
%        v12(2)=RGB_low(i,j,2);
%        v12(3)=RGB_low(i,j,3); 
       v12=RGB_low(i,j); 
%        u1=AA*v11;                               %正变换
%        u2=AA*v12;
       u2 =pca_function(v11,v12);                             %交换空间明度
                   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%空间信息明度定义????????
%        v12=BB*u2;
        RGB1(i,j)=u2;
%        RGB(i,j,1)=v12(1);                       %逆变换
%        RGB(i,j,2)=v12(2);
%        RGB(i,j,3)=v12(3);   
   end
end
%subplot(2,3,5);
% r=RGB(:,:,1);
% g=RGB(:,:,2);
% b=RGB(:,:,3);
% RGB1=cat(3,r,g,b)
% figure(3)
% imshow(RGB1);
% title('IHS-RGB表示的转化图像');
% % % % % % % % % % % 
[SSIM,RMSE,MI,PSNR,SF] =quality(x1,x2, RGB1);
[GI,P,C,QE]=measures(x1,x2, RGB1);
G = [GI(:,:,1)+GI(:,:,2)+GI(:,:,3)]/3;
y = RGB1;









