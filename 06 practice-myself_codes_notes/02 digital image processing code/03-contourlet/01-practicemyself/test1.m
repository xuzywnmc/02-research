% ����÷���;�����ز�������
I=imread('test.tif')
[M L] = size(I);
I(1,3)=77;
tt=max([M L]);
% % m=3*M
result=zeros();
figure(1);
imshow(I);
title('ԭͼ')
for i=1:M%��ѭ����M
   for j=1:L %��ѭ����
%        k1=i-j+512;
%        k2=i+j+512;
            disp('i');
            disp(i);
            disp('j');
            disp(j);
         result(i-j+tt,i+j+tt)=I(i,j);
         if result(i-j+tt,i+j+tt)==77
                tab1=i-j+tt;
                tabe=i+j+tt;
         end
   end
end
figure;
imshow(result);
% shape=[1 -1,1 1];
% temp=shape*I;
% p=randperm(row*column);
% %�������Ҫ��N�������sample��
% sample=I(p(1:N)); 