clear
g_R=0;                                        %r����������
g_G=0;                                        %g����������
g_B=0;                                        %b����������
h_R=0;                                        %�ص����� 
h_G=0;
h_B=0;
u1=zeros(3,1);
u2=zeros(3,1);
v11=zeros(3,1);               %�߷ֱ���RGBֵ
v12=zeros(3,1);               %�ͷֱ���RGBֵ
AA=zeros(3,3);
BB=zeros(3,3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AA=[1/sqrt(3),1/sqrt(3),1/sqrt(3);       
    1/sqrt(6),1/sqrt(6),-2/sqrt(6);                    %RGB��>IHS���任����
    1/sqrt(2),-1/sqrt(2),0];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
BB=[1/sqrt(3),1/sqrt(6),1/sqrt(2);
    1/sqrt(3),1/sqrt(6),-1/sqrt(2);                    %IHS->RGB��任����
    1/sqrt(3),-2/sqrt(6),0];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
RGB_up=imread('SPECT-010.jpg');         %��ͼ��
RGB_low=imread('MRI-010.jpg');         
figure(1)
imshow(RGB_up);   
title('IHS-RGB��ʾ�ĸ߷ֱ���ͼ��');
figure(2)                              
imshow(RGB_low); 
title('IHS-RGB��ʾ�ĵͷֱ���ͼ��');

[M,N,color]=size(RGB_up);

R_up=RGB_up(:,:,1);
G_up=RGB_up(:,:,2);
B_up=RGB_up(:,:,3);
[hang,lie,color]=size(RGB_up);
for i=1:hang
    for j=1:lie
       v11(1)=double(RGB_up(i,j,1));             %�Ѻ�������unit8Ϊdouble��
       v11(2)=double(RGB_up(i,j,2));
       v11(3)=double(RGB_up(i,j,3));  
       v12(1)=double(RGB_low(i,j,1));            %�Ѻ�������unit8Ϊdouble��
       v12(2)=double(RGB_low(i,j,2));
       v12(3)=double(RGB_low(i,j,3)); 
       u1=AA*v11;                               %���任
       u2=AA*v12;
       u2 =pca_function(u1, u2);                             %�����ռ�����
                   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%�ռ���Ϣ���ȶ���????????
       v12=BB*u2;
       RGB(i,j,1)=v12(1);                       %��任
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
title('IHS-RGB��ʾ��ת��ͼ��');


